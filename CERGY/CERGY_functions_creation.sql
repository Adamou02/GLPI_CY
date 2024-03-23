-- Fonction qui verifie la prescense de la clef dans une table passer en parametre (pour verifier les dependance avant insert)
CREATE OR REPLACE FUNCTION GLPI_CERGY.CHECK_VALUE_EXIST(p_value IN VARCHAR2, p_column_name IN VARCHAR2, p_table_name IN VARCHAR2)
RETURN BOOLEAN
IS v_count NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM GLPI_CERGY.' || p_table_name || ' WHERE '|| p_column_name ||' = :1' 
        INTO v_count USING p_value;     
    IF v_count = 1 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
EXCEPTION
     WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('La table GLPI_CERGY.' || p_table_name || ' n''existe pas.');
        RETURN FALSE;
    WHEN OTHERS THEN
        IF SQLCODE = -904 THEN
            DBMS_OUTPUT.PUT_LINE('La colonne ' || p_column_name || ' n''existe pas dans la table ' || p_table_name || '.');
        ELSE
            RAISE_APPLICATION_ERROR(-20030,'Une erreur s''est produite lors de l''execution de la fonction CHECK_VALUE_EXIST : ' || SQLERRM);
        END IF;
        RETURN FALSE;
END;
/

-- Recupere la primary pour une colonne unique donnee en parametre d'une table donnee en parametre
CREATE OR REPLACE FUNCTION GLPI_CERGY.GET_ID_WHERE(
    p_value IN VARCHAR2, 
    p_column_name IN VARCHAR2, 
    p_table_name IN VARCHAR2
)
RETURN INT
IS
    v_id INT;
    v_count INT;
BEGIN
    -- Verifier si la valeur est unique dans la colonne specifiee
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || p_table_name || ' WHERE ' || p_column_name || ' = :1' INTO v_count USING p_value;
    
    IF v_count <> 1 THEN
        RAISE_APPLICATION_ERROR(-20031, 'La valeur "' || p_value || '" n''est pas unique dans la colonne "' || p_column_name || '" de la table "' || p_table_name || '".');
    END IF;
    
    -- Recuperer le nom de la colonne de cle primaire
    DECLARE
        v_pk_column VARCHAR2(100);
    BEGIN
        -- Recuperer le nom de la colonne de cle primaire
        SELECT column_name INTO v_pk_column
        FROM user_cons_columns
        WHERE constraint_name = (
            SELECT constraint_name
            FROM user_constraints
            WHERE table_name = p_table_name AND constraint_type = 'P'
        );

        -- Executer la requete pour recuperer l'ID
        EXECUTE IMMEDIATE 'SELECT ' || v_pk_column || ' FROM ' || p_table_name || ' WHERE ' || p_column_name || ' = :1' INTO v_id USING p_value;

        RETURN v_id;
    END;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20032, 'Erreur lors de l''execution de la fonction GET_ID_WHERE : ' || SQLERRM);
END;
/



-- Procedure qui select un ticket selon le ticket_id passe en parametre
CREATE OR REPLACE FUNCTION GLPI_CERGY.GET_TICKET(
    p_ticket_id IN INT
) RETURN GLPI_CERGY.GLOBAL_Ticket%ROWTYPE
IS
    v_global_ticket GLPI_CERGY.GLOBAL_Ticket%ROWTYPE;
BEGIN
    SELECT *
    INTO v_global_ticket
    FROM GLPI_CERGY.GLOBAL_Ticket
    WHERE ticket_id = p_ticket_id;
    
    RETURN v_global_ticket;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Le ticket avec l''ID ' || p_ticket_id || ' n''existe pas.');
        RETURN NULL; -- Ou une valeur par defaut, selon le besoin
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur lors de l''execution de la fonction GET_TICKET : ' || SQLERRM);
        RETURN NULL; -- Ou une valeur par defaut, selon le besoin
END;
/


-- Procedure qui select tous les tickets grace Ã  la procedure GET_TICKET selon le user_id passe en parametre
CREATE OR REPLACE PROCEDURE GLPI_CERGY.GET_USER_TICKETS(
    p_user_id IN INT
)
IS
BEGIN
    -- Selectionne tous les tickets attribues Ã  l'utilisateur passe en parametre
    FOR ticket_rec IN (
        SELECT ticket_id
        FROM GLPI_CERGY.GLOBAL_Ticket
        WHERE ticket_id IN (
            SELECT ticket_id
            FROM GLPI_CERGY.GLOBAL_Ticket
            WHERE created_by_user_email = (
                SELECT email
                FROM GLPI_CERGY.USERS
                WHERE user_id = p_user_id
            )
        )
    )
    LOOP
        -- Appelle la procedure GET_TICKET pour chaque ticket de la boucle
        BEGIN
            GLPI_CERGY.GET_TICKET(ticket_rec.ticket_id);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Aucun ticket trouve pour l''utilisateur avec l''ID ' || p_user_id);
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Erreur lors du traitement du ticket ' || ticket_rec.ticket_id || ' : ' || SQLERRM);
        END;
    END LOOP;
END;
/


-- Procedure qui recupere tous les commentaires d'un ticket
CREATE OR REPLACE PROCEDURE GLPI_CERGY.GET_TICKET_COMMENTS(
    p_ticket_id IN INT
)
IS
BEGIN
    -- Selectionne tous les commentaires associes au ticket passe en parametre
    FOR comment_rec IN (
        SELECT comment_id
        FROM GLPI_CERGY.Ticket_Comments
        WHERE ticket_id = p_ticket_id
    )
    LOOP
        -- Affiche ou traite chaque commentaire
        BEGIN
            -- Traitement du commentaire, ici je suppose une simple sortie de message
            DBMS_OUTPUT.PUT_LINE('Commentaire avec l''ID ' || comment_rec.comment_id || ' pour le ticket avec l''ID ' || p_ticket_id);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Aucun commentaire trouve pour le ticket avec l''ID ' || p_ticket_id);
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Erreur lors du traitement du commentaire ' || comment_rec.comment_id || ' pour le ticket avec l''ID ' || p_ticket_id || ' : ' || SQLERRM);
        END;
    END LOOP;
END;
/


-- Affecte le status passe en parametre pour le ticket dont l'id est passe en parametre
CREATE OR REPLACE PROCEDURE GLPI_CERGY.SET_TICKET_STATUS(
    p_ticket_id IN INT,
    p_status_name IN VARCHAR2
)
IS
    v_status_id INT;
BEGIN
    -- Verifier si le statut passe en parametre existe dans la table REF_Status
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_status_name, 'status', 'REF_Status') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le statut specifie n''existe pas dans la table REF_Status.');
    END IF;

    -- Verifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_ticket_id, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20002, 'Le ticket specifie n''existe pas dans la table TICKETS.');
    END IF;

    -- Recuperer l'ID du statut correspondant au nom de statut passe en parametre
    SELECT status_id INTO v_status_id
    FROM REF_Status
    WHERE status = p_status_name;

    -- Mettre Ã  jour le ticket avec le nouveau statut et la date de derniere modification
    UPDATE TICKETS
    SET fk_status = v_status_id,
        last_modification_datetime = CURRENT_TIMESTAMP
    WHERE ticket_id = p_ticket_id;

    DBMS_OUTPUT.PUT_LINE('Statut du ticket avec l''ID ' || p_ticket_id || ' mis Ã  jour avec succes.');
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erreur lors de la mise Ã  jour du statut du ticket : ' || SQLERRM);
END;
/


-- Fait passer un ticket en solved selon l'id du ticket passe en parametre et sa note de resolution
CREATE OR REPLACE PROCEDURE GLPI_CERGY.SOLVE_TICKET(
    p_ticket_id IN INT,
    p_resolution_note IN VARCHAR2
)
IS
BEGIN
    -- Verifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_ticket_id, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le ticket specifie n''existe pas dans la table TICKETS.');
    END IF;

    -- Executer SET_TICKET_STATUS pour marquer le ticket comme resolu
    GLPI_CERGY.SET_TICKET_STATUS(p_ticket_id, 'Done');

    -- Mettre Ã  jour le ticket avec la note de resolution et la date de resolution
    UPDATE TICKETS
    SET resolution_note = p_resolution_note,
        resolution_datetime = CURRENT_TIMESTAMP
    WHERE ticket_id = p_ticket_id;

    DBMS_OUTPUT.PUT_LINE('Ticket avec l''ID ' || p_ticket_id || ' resolu avec succes.');
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erreur lors de la resolution du ticket : ' || SQLERRM);
END;
/


-- Ferme le ticket dont l'id est passe en parametre
CREATE OR REPLACE PROCEDURE GLPI_CERGY.CLOSE_TICKET(
    p_ticket_id IN INT
)
IS
BEGIN
    -- Verifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_ticket_id, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le ticket specifie n''existe pas dans la table TICKETS.');
    END IF;

    -- Mettre Ã  jour le ticket avec la date de fermeture et la date de derniere modification
    UPDATE TICKETS
    SET closing_datetime = CURRENT_TIMESTAMP,
        last_modification_datetime = CURRENT_TIMESTAMP
    WHERE ticket_id = p_ticket_id;

    DBMS_OUTPUT.PUT_LINE('Ticket avec l''ID ' || p_ticket_id || ' ferme avec succes.');
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erreur lors de la fermeture du ticket : ' || SQLERRM);
END;
/


-- Assigne un ticket Ã  un utilisateur
CREATE OR REPLACE PROCEDURE GLPI_CERGY.ASSIGN_TICKET_TO_USER(
    p_ticket_id IN INT,
    p_user_id IN INT
)
IS
BEGIN
    -- Verifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_ticket_id, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le ticket specifie n''existe pas dans la table TICKETS.');
    END IF;

    -- Verifier si l'utilisateur existe dans la table USERS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_user_id, 'user_id', 'USERS') THEN
        RAISE_APPLICATION_ERROR(-20002, 'L''utilisateur specifie n''existe pas dans la table USERS.');
    END IF;

    -- Inserer la relation entre le ticket et l'utilisateur dans la table ASSIGN_TO
    INSERT INTO ASSIGNED_TO (fk_ticket, fk_user)
    VALUES (p_ticket_id, p_user_id);

    DBMS_OUTPUT.PUT_LINE('Ticket avec l''ID ' || p_ticket_id || ' attribue avec succes a� l''utilisateur avec l''ID ' || p_user_id);
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erreur lors de l''attribution du ticket a� l''utilisateur : ' || SQLERRM);
END;
/


--Procedure qui met a jour une vue
CREATE OR REPLACE PROCEDURE GLPI_CERGY.REFRESH_MATERIALIZED_VIEW(
    p_view_name IN VARCHAR2
)
IS
BEGIN
    DBMS_MVIEW.REFRESH(p_view_name);
END REFRESH_MATERIALIZED_VIEW;
/

-- Procedure pour creer un Ticket
CREATE OR REPLACE PROCEDURE GLPI_CERGY.NEW_TICKET(
    p_created_by IN INT, --id of the user that as created the ticket
    p_type IN VARCHAR2,
    p_priority IN VARCHAR2,
    p_category IN VARCHAR2,
    p_assigned_group IN INT, -- id of the group assigned to the ticket
    p_description IN VARCHAR2,
    p_title IN VARCHAR2,
    p_site IN VARCHAR2,
    p_hardware IN INT, -- id of the hardware the ticket refers to (set to NULL if no hardware)
    p_ressource IN INT  -- id of the hardware the ticket refers to (set to NULL if no hardware)
)
IS
    p_location VARCHAR2(200) := 'Cergy - '|| p_site;
    v_type_id INT;
    v_priority_id INT;
    v_category_id INT;
    v_location_id INT;
    v_ticket_id INT;
    v_status_id INT;
BEGIN
    
    -- Verifier si l'utilisateur existe dans la table USERS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_created_by, 'user_id', 'USERS') THEN
        RAISE_APPLICATION_ERROR(-20002, 'L''utilisateur specifier n''existe pas dans la table USERS.');
    END IF;
    -- Verifier si le hardware existe dans la table HARDWARES
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_hardware, 'hardaware_id', 'HARDWARES') AND p_hardware <> NULL THEN
        RAISE_APPLICATION_ERROR(-20002, 'Le hardware specifier n''existe pas dans la table HARDWARES.');
    END IF;
    -- Verifier si le assigne group existe dans la table GROUP
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_assigned_group, '"group_id"', 'REF_GROUP') THEN
        RAISE_APPLICATION_ERROR(-20002, 'Le group specifier n''existe pas dans la table REF_GROUP.');
    END IF;
    -- Verifier si le type passe en parametre existe dans la table REF_Type
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_type, '"type"', 'REF_type') THEN
        RAISE_APPLICATION_ERROR(-20003, 'Le type specifie n''existe pas dans la table REF_type.');
    END IF;
     -- Verifier si le priority passe en parametre existe dans la table REF_priority
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_priority, '"priority"', 'REF_priority') THEN
        RAISE_APPLICATION_ERROR(-20004, 'Le priority specifie n''existe pas dans la table REF_priority.');
    END IF;
     -- Verifier si le priority passe en parametre existe dans la table REF_category
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_category, '"category"', 'REF_category') THEN
        RAISE_APPLICATION_ERROR(-20005, 'Le category specifie n''existe pas dans la table REF_category.');
    END IF;
    -- Verifier que le site existe 
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_location, '"location"', 'LOCATIONS') THEN
        RAISE_APPLICATION_ERROR(-20006, 'Le site specifie n''existe pas dans la table LOCATIONS ou n''est pas associer a cette ville.');
    END IF;
   -- Verifier si la ressource existe dans la table HARDWARES
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_ressource, 'ressource_id', 'RESSOURCES') AND p_ressource <> NULL THEN
        RAISE_APPLICATION_ERROR(-20002, 'La ressource specifier n''existe pas dans la table RESSOURCES.');
    END IF;
    
    
    -- Recuperer les ID correspondant au valuer passes en parametre    
    SELECT type_id INTO v_type_id
    FROM GLPI_CERGY.REF_TYPE
    WHERE "type" = p_type;
    
    SELECT status_id INTO v_status_id
    FROM GLPI_CERGY.REF_STATUS
    WHERE UPPER(status) ='TO DO';
    
    SELECT priority_id INTO v_priority_id
    FROM GLPI_CERGY.REF_PRIORITY
    WHERE "priority" = p_priority;
    
    SELECT category_id INTO v_category_id
    FROM GLPI_CERGY.REF_CATEGORY
    WHERE "category" = p_category;
    
    SELECT location_id INTO v_location_id
    FROM GLPI_CERGY.LOCATIONS
    WHERE "location" = p_location;
    
    SELECT priority_id INTO v_priority_id
    FROM GLPI_CERGY.REF_PRIORITY
    WHERE "priority" = p_priority;
    
    --INSERT du TICKET
    INSERT INTO GLPI_CERGY.TICKETS 
    (ticket_id, fk_created_by, fk_type, fk_priority, title, "description", fk_location, creation_datetime, last_modification_datetime, resolution_datetime, resolution_note, closing_datetime, fk_assigned_group, fk_status, fk_category, fk_hardwares) 
    VALUES 
    (0, p_created_by, v_type_id, v_priority_id, p_title, p_description, v_location_id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL,p_assigned_group, v_status_id, v_category_id, p_hardware);
    
    --INSERT dans RESSOURCE_TICKET si non null
    IF(p_ressource IS NOT NULL) THEN 
        v_ticket_id := GLPI_CERGY.SEQ_ID_TICKETS.CURRVAL;
        INSERT INTO GLPI_CERGY.TICKET_RESSOURCES 
        (fk_ressource, fk_ticket) 
        VALUES 
        (p_ressource, v_ticket_id);
    END IF;
END;
/

-- Procedure pour creer un User
CREATE OR REPLACE PROCEDURE GLPI_CERGY.NEW_USER(
    p_role IN VARCHAR2,
    p_group IN INT, -- user's group id
    p_password IN VARCHAR2,
    p_email IN VARCHAR2,
    p_lastname IN VARCHAR2,
    p_firstname IN VARCHAR2,
    p_company IN VARCHAR2, 
    p_site IN VARCHAR2 
)
IS
    p_location VARCHAR2(200) := 'Cergy - '|| p_site;
    v_role_id INT;
    v_location_id INT;
BEGIN
    
    -- Verifier si l'utilisateur existe dans la table USERS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_role, '"role"', 'REF_ROLE') THEN
        RAISE_APPLICATION_ERROR(-20002, 'Le role specifier n''existe pas dans la table REF_ROLE.');
    END IF;
    -- Verifier si le group existe dans la table GROUP
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_group, '"group_id"', 'REF_GROUP') THEN
        RAISE_APPLICATION_ERROR(-20002, 'Le group specifier n''existe pas dans la table REF_GROUP.');
    END IF;
    -- Verifier que le site existe 
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_location, '"location"', 'LOCATIONS') THEN
        RAISE_APPLICATION_ERROR(-20006, 'Le site specifie n''existe pas dans la table LOCATIONS ou n''est pas associer a cette ville.');
    END IF;
    
    -- Recuperer les ID correspondant au valuer passes en parametre    
    SELECT role_id INTO v_role_id
    FROM GLPI_CERGY.REF_ROLE
    WHERE "role" = p_role;
    
    SELECT location_id INTO v_location_id
    FROM GLPI_CERGY.LOCATIONS
    WHERE "location" = p_location;
    
    --INSERT du USER
    INSERT INTO GLPI_CERGY.USERS 
    (user_id, fk_role, fk_group, "password", email ,last_name, first_name, company, fk_location) 
    VALUES 
    (0, v_role_id, p_group, p_password, p_email, p_lastname, p_firstname, p_company ,v_location_id);
END;
/


-- Procedure pour creer un Commentaire
CREATE OR REPLACE PROCEDURE GLPI_CERGY.NEW_COMMENT(
    p_user IN INT, --id of the user that as created the ticket
    p_answer_to IN INT, --id of the user that as created the ticket
    p_ticket IN INT, -- ticket id od which belong the comment
    p_task IN VARCHAR2,
    p_content IN VARCHAR2,
    p_ressource IN INT  -- id of the hardware the ticket refers to (set to NULL if no hardware)
)
IS
    v_comment_id INT;
BEGIN
    -- Verifier si l'utilisateur p_user existe dans la table USERS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_user, 'user_id', 'USERS') THEN
        RAISE_APPLICATION_ERROR(-20002, 'L''utilisateur p_user specifier n''existe pas dans la table USERS.');
    END IF;
    -- Verifier si l'utilisateur p_answer_to existe dans la table USERS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_answer_to, 'user_id', 'USERS') THEN
        RAISE_APPLICATION_ERROR(-20002, 'L''utilisateur p_answer_to specifier n''existe pas dans la table USERS.');
    END IF;
    -- Verifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_ticket, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20002, 'Le ticket specifier n''existe pas dans la table TICKETS.');
    END IF;
   -- Verifier si la ressource existe dans la table HARDWARES
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_ressource, 'ressource_id', 'RESSOURCES') AND p_ressource <> NULL THEN
        RAISE_APPLICATION_ERROR(-20002, 'La ressource specifier n''existe pas dans la table RESSOURCES.');
    END IF;    
    --INSERT du COMMENTS
    INSERT INTO GLPI_CERGY.COMMENTS 
    (comment_id, fk_answer_to, fk_ticket, fk_user, creation_datetime, task, "content") 
    VALUES 
    (0, p_answer_to, p_ticket, p_user, CURRENT_TIMESTAMP, p_task, p_content);

    --INSERT dans COMMENT_RESSOURCES si non null
    IF(p_ressource IS NOT NULL) THEN 
        v_comment_id := GLPI_CERGY.SEQ_ID_COMMENTS.CURRVAL;
        INSERT INTO GLPI_CERGY.COMMENT_RESSOURCES 
        (fk_ressource, fk_comment) 
        VALUES 
        (p_ressource, v_comment_id);
    END IF;
END;
/

COMMIT;
exit;