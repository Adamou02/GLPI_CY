-- Fonction qui vï¿½rifie la prï¿½cense de la clef dans une table passer en parametre (pour vï¿½rifier les dï¿½pendance avant insert)
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
            RAISE_APPLICATION_ERROR(-20030,'Une erreur s''est CERGYuite lors de l''exécution de la fonction CHECK_VALUE_EXIST : ' || SQLERRM);
        END IF;
        RETURN FALSE;
END;
/

-- Recupere la primary pour une colonne unique donnï¿½e en parametre d'une table donnï¿½e en parametre
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
    -- Vï¿½rifier si la valeur est unique dans la colonne spï¿½cifiï¿½e
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || p_table_name || ' WHERE ' || p_column_name || ' = :1' INTO v_count USING p_value;
    
    IF v_count <> 1 THEN
        RAISE_APPLICATION_ERROR(-20031, 'La valeur "' || p_value || '" n''est pas unique dans la colonne "' || p_column_name || '" de la table "' || p_table_name || '".');
    END IF;
    
    -- Rï¿½cupï¿½rer le nom de la colonne de clï¿½ primaire
    DECLARE
        v_pk_column VARCHAR2(100);
    BEGIN
        -- Rï¿½cupï¿½rer le nom de la colonne de clï¿½ primaire
        SELECT column_name INTO v_pk_column
        FROM user_cons_columns
        WHERE constraint_name = (
            SELECT constraint_name
            FROM user_constraints
            WHERE table_name = p_table_name AND constraint_type = 'P'
        );

        -- Exï¿½cuter la requï¿½te pour rï¿½cupï¿½rer l'ID
        EXECUTE IMMEDIATE 'SELECT ' || v_pk_column || ' FROM ' || p_table_name || ' WHERE ' || p_column_name || ' = :1' INTO v_id USING p_value;

        RETURN v_id;
    END;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20032, 'Erreur lors de l''exï¿½cution de la fonction GET_ID_WHERE : ' || SQLERRM);
END;
/



-- Procedure qui select un ticket selon le ticket_id passÃ© en parametre
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
        RETURN NULL; -- Ou une valeur par dÃ©faut, selon le besoin
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur lors de l''exÃ©cution de la fonction GET_TICKET : ' || SQLERRM);
        RETURN NULL; -- Ou une valeur par dÃ©faut, selon le besoin
END;
/


-- Procedure qui select tous les tickets grace Ã  la procedure GET_TICKET selon le user_id passÃ© en parametre
CREATE OR REPLACE PROCEDURE GLPI_CERGY.GET_USER_TICKETS(
    p_user_id IN INT
)
IS
BEGIN
    -- SÃ©lectionne tous les tickets attribuÃ©s Ã  l'utilisateur passÃ© en paramÃ¨tre
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
        -- Appelle la procÃ©dure GET_TICKET pour chaque ticket de la boucle
        BEGIN
            GLPI_CERGY.GET_TICKET(ticket_rec.ticket_id);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Aucun ticket trouvÃ© pour l''utilisateur avec l''ID ' || p_user_id);
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
    -- SÃ©lectionne tous les commentaires associÃ©s au ticket passÃ© en paramÃ¨tre
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
                DBMS_OUTPUT.PUT_LINE('Aucun commentaire trouvÃ© pour le ticket avec l''ID ' || p_ticket_id);
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Erreur lors du traitement du commentaire ' || comment_rec.comment_id || ' pour le ticket avec l''ID ' || p_ticket_id || ' : ' || SQLERRM);
        END;
    END LOOP;
END;
/


-- Affecte le status passÃ© en parametre pour le ticket dont l'id est passÃ© en paramÃ¨tre
CREATE OR REPLACE PROCEDURE GLPI_CERGY.SET_TICKET_STATUS(
    p_ticket_id IN INT,
    p_status_name IN VARCHAR2
)
IS
    v_status_id INT;
BEGIN
    -- VÃ©rifier si le statut passÃ© en paramÃ¨tre existe dans la table REF_Status
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_status_name, 'status', 'REF_Status') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le statut spÃ©cifiÃ© n''existe pas dans la table REF_Status.');
    END IF;

    -- VÃ©rifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_ticket_id, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20002, 'Le ticket spÃ©cifiÃ© n''existe pas dans la table TICKETS.');
    END IF;

    -- RÃ©cupÃ©rer l'ID du statut correspondant au nom de statut passÃ© en paramÃ¨tre
    SELECT status_id INTO v_status_id
    FROM REF_Status
    WHERE status = p_status_name;

    -- Mettre Ã  jour le ticket avec le nouveau statut et la date de derniÃ¨re modification
    UPDATE TICKETS
    SET fk_status = v_status_id,
        last_modification_datetime = CURRENT_TIMESTAMP
    WHERE ticket_id = p_ticket_id;

    DBMS_OUTPUT.PUT_LINE('Statut du ticket avec l''ID ' || p_ticket_id || ' mis Ã  jour avec succÃ¨s.');
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erreur lors de la mise Ã  jour du statut du ticket : ' || SQLERRM);
END;
/


-- Fait passer un ticket en solved selon l'id du ticket passÃ© en parametre et sa note de resolution
CREATE OR REPLACE PROCEDURE GLPI_CERGY.SOLVE_TICKET(
    p_ticket_id IN INT,
    p_resolution_note IN VARCHAR2
)
IS
BEGIN
    -- VÃ©rifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_ticket_id, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le ticket spÃ©cifiÃ© n''existe pas dans la table TICKETS.');
    END IF;

    -- ExÃ©cuter SET_TICKET_STATUS pour marquer le ticket comme rÃ©solu
    GLPI_CERGY.SET_TICKET_STATUS(p_ticket_id, 'Done');

    -- Mettre Ã  jour le ticket avec la note de rÃ©solution et la date de rÃ©solution
    UPDATE TICKETS
    SET resolution_note = p_resolution_note,
        resolution_datetime = CURRENT_TIMESTAMP
    WHERE ticket_id = p_ticket_id;

    DBMS_OUTPUT.PUT_LINE('Ticket avec l''ID ' || p_ticket_id || ' rÃ©solu avec succÃ¨s.');
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erreur lors de la rÃ©solution du ticket : ' || SQLERRM);
END;
/


-- Ferme le ticket dont l'id est passÃ© en paramÃ¨tre
CREATE OR REPLACE PROCEDURE GLPI_CERGY.CLOSE_TICKET(
    p_ticket_id IN INT
)
IS
BEGIN
    -- VÃ©rifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_ticket_id, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le ticket spÃ©cifiÃ© n''existe pas dans la table TICKETS.');
    END IF;

    -- Mettre Ã  jour le ticket avec la date de fermeture et la date de derniÃ¨re modification
    UPDATE TICKETS
    SET closing_datetime = CURRENT_TIMESTAMP,
        last_modification_datetime = CURRENT_TIMESTAMP
    WHERE ticket_id = p_ticket_id;

    DBMS_OUTPUT.PUT_LINE('Ticket avec l''ID ' || p_ticket_id || ' fermÃ© avec succÃ¨s.');
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
    -- VÃ©rifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_ticket_id, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le ticket spÃ©cifiÃ© n''existe pas dans la table TICKETS.');
    END IF;

    -- VÃ©rifier si l'utilisateur existe dans la table USERS
    IF NOT GLPI_CERGY.CHECK_VALUE_EXIST(p_user_id, 'user_id', 'USERS') THEN
        RAISE_APPLICATION_ERROR(-20002, 'L''utilisateur spÃ©cifiÃ© n''existe pas dans la table USERS.');
    END IF;

    -- InsÃ©rer la relation entre le ticket et l'utilisateur dans la table ASSIGN_TO
    INSERT INTO ASSIGNED_TO (fk_ticket, fk_user)
    VALUES (p_ticket_id, p_user_id);

    DBMS_OUTPUT.PUT_LINE('Ticket avec l''ID ' || p_ticket_id || ' attribuÃ© avec succÃ¨s Ã  l''utilisateur avec l''ID ' || p_user_id);
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erreur lors de l''attribution du ticket Ã  l''utilisateur : ' || SQLERRM);
END;
/


--ProcÃ©dure qui met Ã  jour une vue
CREATE OR REPLACE PROCEDURE GLPI_CERGY.REFRESH_MATERIALIZED_VIEW(
    p_view_name IN VARCHAR2
)
IS
BEGIN
    DBMS_MVIEW.REFRESH(p_view_name);
END REFRESH_VIEW;
/

COMMIT;
exit;