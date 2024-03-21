-- Fonction qui vérifie la précense de la clef dans une table passer en parametre (pour vérifier les dépendance avant insert)
CREATE OR REPLACE FUNCTION GLPI_TEST.CHECK_VALUE_EXIST(p_value IN VARCHAR2, p_column_name IN VARCHAR2, p_table_name IN VARCHAR2)
RETURN BOOLEAN
IS v_count NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM GLPI_TEST.' || p_table_name || ' WHERE '|| p_column_name ||' = :1' 
        INTO v_count USING p_value;     
    IF v_count = 1 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
EXCEPTION
     WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('La table GLPI_TEST.' || p_table_name || ' n''existe pas.');
        RETURN FALSE;
    WHEN OTHERS THEN
        IF SQLCODE = -904 THEN
            DBMS_OUTPUT.PUT_LINE('La colonne ' || p_column_name || ' n''existe pas dans la table ' || p_table_name || '.');
        ELSE
            RAISE_APPLICATION_ERROR(-200030,'Une erreur s''est produite lors de l''exécution de la fonction check_primary_key_value : ' || SQLERRM);
        END IF;
        RETURN FALSE;
END;
/

-- Recupere la primary pour une colonne unique donnée en parametre d'une table donnée en parametre
CREATE OR REPLACE FUNCTION GLPI_TEST.GET_ID_WHERE(
    p_value IN VARCHAR2, 
    p_column_name IN VARCHAR2, 
    p_table_name IN VARCHAR2
)
RETURN INT
IS
    v_id INT;
    v_count INT;
BEGIN
    -- Vérifier si la valeur est unique dans la colonne spécifiée
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || p_table_name || ' WHERE ' || p_column_name || ' = :1' INTO v_count USING p_value;
    
    IF v_count <> 1 THEN
        RAISE_APPLICATION_ERROR(-20031, 'La valeur "' || p_value || '" n''est pas unique dans la colonne "' || p_column_name || '" de la table "' || p_table_name || '".');
    END IF;
    
    -- Récupérer le nom de la colonne de clé primaire
    DECLARE
        v_pk_column VARCHAR2(100);
    BEGIN
        -- Récupérer le nom de la colonne de clé primaire
        SELECT column_name INTO v_pk_column
        FROM user_cons_columns
        WHERE constraint_name = (
            SELECT constraint_name
            FROM user_constraints
            WHERE table_name = p_table_name AND constraint_type = 'P'
        );

        -- Exécuter la requête pour récupérer l'ID
        EXECUTE IMMEDIATE 'SELECT ' || v_pk_column || ' FROM ' || p_table_name || ' WHERE ' || p_column_name || ' = :1' INTO v_id USING p_value;

        RETURN v_id;
    END;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20032, 'Erreur lors de l''exécution de la fonction GET_ID_WHERE : ' || SQLERRM);
END;
/



-- Procedure qui select un ticket selon le ticket_id passé en parametre
CREATE OR REPLACE PROCEDURE GLPI_TEST.GET_TICKET(
    p_ticket_id IN INT
)
IS
    v_global_ticket GLPI_TEST.GLOBAL_Ticket%ROWTYPE;
BEGIN
    SELECT *
    INTO v_global_ticket
    FROM GLPI_TEST.GLOBAL_Ticket
    WHERE ticket_id = p_ticket_id;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Le ticket avec l''ID ' || p_ticket_id || ' n''existe pas.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur lors de l''execution de la procedure GET_TICKET : ' || SQLERRM);
END;
/


-- Procedure qui select tous les tickets grace à la procedure GET_TICKET selon le user_id passé en parametre
CREATE OR REPLACE PROCEDURE GLPI_TEST.GET_USER_TICKETS(
    p_user_id IN INT
)
IS
BEGIN
    -- Sélectionne tous les tickets attribués à l'utilisateur passé en paramètre
    FOR ticket_rec IN (
        SELECT ticket_id
        FROM GLPI_TEST.GLOBAL_Ticket
        WHERE ticket_id IN (
            SELECT ticket_id
            FROM GLPI_TEST.GLOBAL_Ticket
            WHERE created_by_user_email = (
                SELECT email
                FROM GLPI_TEST.USERS
                WHERE user_id = p_user_id
            )
        )
    )
    LOOP
        -- Appelle la procédure GET_TICKET pour chaque ticket de la boucle
        BEGIN
            GLPI_TEST.GET_TICKET(ticket_rec.ticket_id);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Aucun ticket trouvé pour l''utilisateur avec l''ID ' || p_user_id);
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Erreur lors du traitement du ticket ' || ticket_rec.ticket_id || ' : ' || SQLERRM);
        END;
    END LOOP;
END;
/


-- Procedure qui resolve un ticket

CREATE OR REPLACE PROCEDURE GLPI_TEST.SOLVE_TICKET(
    p_ticket_id IN INT
)
IS
BEGIN
    -- Met à jour la colonne de résolution_datetime avec la date et l'heure actuelles
    UPDATE GLPI_TEST.GLOBAL_Ticket
    SET resolution_datetime = SYSTIMESTAMP,
        status = 'DONE'
    WHERE ticket_id = p_ticket_id;
    
    -- Affiche un message indiquant que le ticket a été résolu avec succès
    DBMS_OUTPUT.PUT_LINE('Le ticket avec l''ID ' || p_ticket_id || ' a été résolu avec succès.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Le ticket avec l''ID ' || p_ticket_id || ' n''existe pas.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur lors de la résolution du ticket ' || p_ticket_id || ' : ' || SQLERRM);
END;
/


-- Procedure qui recupere tous les commentaires d'un ticket

CREATE OR REPLACE PROCEDURE GLPI_TEST.GET_TICKET_COMMENTS(
    p_ticket_id IN INT
)
IS
BEGIN
    -- Sélectionne tous les commentaires associés au ticket passé en paramètre
    FOR comment_rec IN (
        SELECT comment_id
        FROM GLPI_TEST.Ticket_Comments
        WHERE ticket_id = p_ticket_id
    )
    LOOP
        -- Affiche ou traite chaque commentaire
        BEGIN
            -- Traitement du commentaire, ici je suppose une simple sortie de message
            DBMS_OUTPUT.PUT_LINE('Commentaire avec l''ID ' || comment_rec.comment_id || ' pour le ticket avec l''ID ' || p_ticket_id);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Aucun commentaire trouvé pour le ticket avec l''ID ' || p_ticket_id);
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Erreur lors du traitement du commentaire ' || comment_rec.comment_id || ' pour le ticket avec l''ID ' || p_ticket_id || ' : ' || SQLERRM);
        END;
    END LOOP;
END;
/

COMMIT;
exit;
