-- Fonction qui v�rifie la pr�cense de la clef dans une table passer en parametre (pour v�rifier les d�pendance avant insert)
CREATE OR REPLACE FUNCTION GLPI_PAU.CHECK_VALUE_EXIST(p_value IN VARCHAR2, p_column_name IN VARCHAR2, p_table_name IN VARCHAR2)
RETURN BOOLEAN
IS v_count NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM GLPI_PAU.' || p_table_name || ' WHERE '|| p_column_name ||' = :1' 
        INTO v_count USING p_value;     
    IF v_count = 1 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
EXCEPTION
     WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('La table GLPI_PAU.' || p_table_name || ' n''existe pas.');
        RETURN FALSE;
    WHEN OTHERS THEN
        IF SQLCODE = -904 THEN
            DBMS_OUTPUT.PUT_LINE('La colonne ' || p_column_name || ' n''existe pas dans la table ' || p_table_name || '.');
        ELSE
            RAISE_APPLICATION_ERROR(-20030,'Une erreur s''est CERGYuite lors de l''ex�cution de la fonction CHECK_VALUE_EXIST : ' || SQLERRM);
        END IF;
        RETURN FALSE;
END;
/

-- Recupere la primary pour une colonne unique donn�e en parametre d'une table donn�e en parametre
CREATE OR REPLACE FUNCTION GLPI_PAU.GET_ID_WHERE(
    p_value IN VARCHAR2, 
    p_column_name IN VARCHAR2, 
    p_table_name IN VARCHAR2
)
RETURN INT
IS
    v_id INT;
    v_count INT;
BEGIN
    -- V�rifier si la valeur est unique dans la colonne sp�cifi�e
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || p_table_name || ' WHERE ' || p_column_name || ' = :1' INTO v_count USING p_value;
    
    IF v_count <> 1 THEN
        RAISE_APPLICATION_ERROR(-20031, 'La valeur "' || p_value || '" n''est pas unique dans la colonne "' || p_column_name || '" de la table "' || p_table_name || '".');
    END IF;
    
    -- R�cup�rer le nom de la colonne de cl� primaire
    DECLARE
        v_pk_column VARCHAR2(100);
    BEGIN
        -- R�cup�rer le nom de la colonne de cl� primaire
        SELECT column_name INTO v_pk_column
        FROM user_cons_columns
        WHERE constraint_name = (
            SELECT constraint_name
            FROM user_constraints
            WHERE table_name = p_table_name AND constraint_type = 'P'
        );

        -- Ex�cuter la requ�te pour r�cup�rer l'ID
        EXECUTE IMMEDIATE 'SELECT ' || v_pk_column || ' FROM ' || p_table_name || ' WHERE ' || p_column_name || ' = :1' INTO v_id USING p_value;

        RETURN v_id;
    END;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20032, 'Erreur lors de l''ex�cution de la fonction GET_ID_WHERE : ' || SQLERRM);
END;
/



-- Procedure qui select un ticket selon le ticket_id passé en parametre
CREATE OR REPLACE FUNCTION GLPI_PAU.GET_TICKET(
    p_ticket_id IN INT
) RETURN GLPI_PAU.GLOBAL_Ticket%ROWTYPE
IS
    v_global_ticket GLPI_PAU.GLOBAL_Ticket%ROWTYPE;
BEGIN
    SELECT *
    INTO v_global_ticket
    FROM GLPI_PAU.GLOBAL_Ticket
    WHERE ticket_id = p_ticket_id;
    
    RETURN v_global_ticket;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Le ticket avec l''ID ' || p_ticket_id || ' n''existe pas.');
        RETURN NULL; -- Ou une valeur par défaut, selon le besoin
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur lors de l''exécution de la fonction GET_TICKET : ' || SQLERRM);
        RETURN NULL; -- Ou une valeur par défaut, selon le besoin
END;
/


-- Procedure qui select tous les tickets grace à la procedure GET_TICKET selon le user_id passé en parametre
CREATE OR REPLACE PROCEDURE GLPI_PAU.GET_USER_TICKETS(
    p_user_id IN INT
)
IS
    v_ticket GLPI_PAU.GLOBAL_Ticket%ROWTYPE; -- D�clarer une variable pour stocker les informations du ticket
BEGIN
    -- S�lectionne tous les tickets attribu�s � l'utilisateur pass� en param�tre
    FOR ticket_rec IN (
        SELECT ticket_id
        FROM GLPI_PAU.GLOBAL_Ticket
        WHERE created_by_user_email = (
            SELECT email
            FROM GLPI_PAU.USERS
            WHERE user_id = p_user_id
        )
    )
    LOOP
        -- Appelle la fonction GET_TICKET pour chaque ticket de la boucle
        v_ticket := GLPI_PAU.GET_TICKET(ticket_rec.ticket_id);
        
        -- V�rifie si le ticket existe
        IF v_ticket.ticket_id IS NOT NULL THEN
            -- Affiche les informations du ticket
            DBMS_OUTPUT.PUT_LINE('Ticket ID: ' || v_ticket.ticket_id);
            DBMS_OUTPUT.PUT_LINE('Created By: ' || v_ticket.created_by);
            -- Afficher d'autres champs si n�cessaire
        ELSE
            DBMS_OUTPUT.PUT_LINE('Erreur lors du traitement du ticket ' || ticket_rec.ticket_id || ' : Ticket introuvable');
        END IF;
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur lors de la r�cup�ration des tickets de l''utilisateur avec l''ID ' || p_user_id || ' : ' || SQLERRM);
END;
/




-- Procedure qui recupere tous les commentaires d'un ticket
CREATE OR REPLACE PROCEDURE GLPI_PAU.GET_TICKET_COMMENTS(
    p_ticket_id IN INT
)
IS
    TYPE comment_list IS TABLE OF GLPI_PAU.COMMENTS%ROWTYPE INDEX BY PLS_INTEGER;
    v_comments comment_list;
BEGIN
    -- S�lectionner tous les commentaires associ�s au ticket pass� en param�tre
    SELECT *
    BULK COLLECT INTO v_comments
    FROM GLPI_PAU.COMMENTS
    WHERE FK_TICKET = p_ticket_id;
END;
/



-- Affecte le status passé en parametre pour le ticket dont l'id est passé en paramètre
CREATE OR REPLACE PROCEDURE GLPI_PAU.SET_TICKET_STATUS(
    p_ticket_id IN INT,
    p_status_name IN VARCHAR2
)
IS
    v_status_id INT;
BEGIN
    -- Vérifier si le statut passé en paramètre existe dans la table REF_Status
    IF NOT GLPI_PAU.CHECK_VALUE_EXIST(p_status_name, 'status', 'REF_Status') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le statut spécifié n''existe pas dans la table REF_Status.');
    END IF;

    -- Vérifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_PAU.CHECK_VALUE_EXIST(p_ticket_id, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20002, 'Le ticket spécifié n''existe pas dans la table TICKETS.');
    END IF;

    -- Récupérer l'ID du statut correspondant au nom de statut passé en paramètre
    SELECT status_id INTO v_status_id
    FROM REF_Status
    WHERE status = p_status_name;

    -- Mettre à jour le ticket avec le nouveau statut et la date de dernière modification
    UPDATE TICKETS
    SET fk_status = v_status_id,
        last_modification_datetime = CURRENT_TIMESTAMP
    WHERE ticket_id = p_ticket_id;

    DBMS_OUTPUT.PUT_LINE('Statut du ticket avec l''ID ' || p_ticket_id || ' mis à jour avec succès.');
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erreur lors de la mise à jour du statut du ticket : ' || SQLERRM);
END;
/


-- Fait passer un ticket en solved selon l'id du ticket passé en parametre et sa note de resolution
CREATE OR REPLACE PROCEDURE GLPI_PAU.SOLVE_TICKET(
    p_ticket_id IN INT,
    p_resolution_note IN VARCHAR2
)
IS
BEGIN
    -- Vérifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_PAU.CHECK_VALUE_EXIST(p_ticket_id, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le ticket spécifié n''existe pas dans la table TICKETS.');
    END IF;

    -- Exécuter SET_TICKET_STATUS pour marquer le ticket comme résolu
    GLPI_PAU.SET_TICKET_STATUS(p_ticket_id, 'Done');

    -- Mettre à jour le ticket avec la note de résolution et la date de résolution
    UPDATE TICKETS
    SET resolution_note = p_resolution_note,
        resolution_datetime = CURRENT_TIMESTAMP
    WHERE ticket_id = p_ticket_id;

    DBMS_OUTPUT.PUT_LINE('Ticket avec l''ID ' || p_ticket_id || ' résolu avec succès.');
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erreur lors de la résolution du ticket : ' || SQLERRM);
END;
/


-- Ferme le ticket dont l'id est passé en paramètre
CREATE OR REPLACE PROCEDURE GLPI_PAU.CLOSE_TICKET(
    p_ticket_id IN INT
)
IS
BEGIN
    -- Vérifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_PAU.CHECK_VALUE_EXIST(p_ticket_id, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le ticket spécifié n''existe pas dans la table TICKETS.');
    END IF;

    -- Mettre à jour le ticket avec la date de fermeture et la date de dernière modification
    UPDATE TICKETS
    SET closing_datetime = CURRENT_TIMESTAMP,
        last_modification_datetime = CURRENT_TIMESTAMP
    WHERE ticket_id = p_ticket_id;

    DBMS_OUTPUT.PUT_LINE('Ticket avec l''ID ' || p_ticket_id || ' fermé avec succès.');
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Erreur lors de la fermeture du ticket : ' || SQLERRM);
END;
/


-- Assigne un ticket à un utilisateur
CREATE OR REPLACE PROCEDURE GLPI_PAU.ASSIGN_TICKET_TO_USER(
    p_ticket_id IN INT,
    p_user_id IN INT
)
IS
    v_count INT;
BEGIN
    -- V�rifier si la relation existe d�j�
    SELECT COUNT(*)
    INTO v_count
    FROM ASSIGNED_TO
    WHERE fk_ticket = p_ticket_id
    AND fk_user = p_user_id;

    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('La relation entre le ticket et l''utilisateur existe d�j�.');
    ELSE
        -- Ins�rer la relation entre le ticket et l'utilisateur dans la table ASSIGN_TO
        INSERT INTO ASSIGNED_TO (fk_ticket, fk_user)
        VALUES (p_ticket_id, p_user_id);

        DBMS_OUTPUT.PUT_LINE('Ticket avec l''ID ' || p_ticket_id || ' attribu� avec succ�s � l''utilisateur avec l''ID ' || p_user_id);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erreur lors de l''attribution du ticket � l''utilisateur : ' || SQLERRM);
END;
/



-- Procedure qui cree ou supprime l'observer d'un ticket
CREATE OR REPLACE PROCEDURE GLPI_PAU.ADD_REMOVE_OBSERVER_OF_TICKET(
    p_ticket_id IN INT,
    p_user_id IN INT
)
IS
    v_observer_count INT;
BEGIN
    -- Verifier si le ticket existe dans la table TICKETS
    IF NOT GLPI_PAU.CHECK_VALUE_EXIST(p_ticket_id, 'ticket_id', 'TICKETS') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Le ticket sp�cifi� n''existe pas dans la table TICKETS.');
    END IF;

    -- Verifie si l'utilisateur existe dans la table USERS
    IF NOT GLPI_PAU.CHECK_VALUE_EXIST(p_user_id, 'user_id', 'USERS') THEN
        RAISE_APPLICATION_ERROR(-20002, 'L''utilisateur sp�cifi� n''existe pas dans la table USERS.');
    END IF;

    -- Verifie si la ligne observer existe deja
    SELECT COUNT(*)
    INTO v_observer_count
    FROM GLPI_PAU.OBSERVERS
    WHERE fk_ticket = p_ticket_id AND fk_user = p_user_id;

    IF v_observer_count > 0 THEN
        -- Supprime la ligne observer
        DELETE FROM GLPI_PAU.OBSERVERS
        WHERE fk_ticket = p_ticket_id AND fk_user = p_user_id;
        DBMS_OUTPUT.PUT_LINE('Utilisateur avec l''ID ' || p_user_id || ' supprim� de la liste des observateurs du ticket avec l''ID ' || p_ticket_id);
    ELSE
        -- Ajoute la ligne observer
        INSERT INTO GLPI_PAU.OBSERVERS (fk_ticket, fk_user)
        VALUES (p_ticket_id, p_user_id);
        DBMS_OUTPUT.PUT_LINE('Utilisateur avec l''ID ' || p_user_id || ' ajout� � la liste des observateurs du ticket avec l''ID ' || p_ticket_id);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erreur lors de l''ajout/suppression de l''observateur du ticket : ' || SQLERRM);
END;
/




--Procédure qui met à jour une vue
CREATE OR REPLACE PROCEDURE GLPI_PAU.REFRESH_MATERIALIZED_VIEW(
    p_view_name IN VARCHAR2
)
IS
BEGIN
    DBMS_MVIEW.REFRESH(p_view_name);
END REFRESH_MATERIALIZED_VIEW;
/


COMMIT;
exit;