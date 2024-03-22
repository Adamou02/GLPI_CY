-- Fonction qui vï¿½rifie la prï¿½cense de la clef dans une table passer en parametre (pour vï¿½rifier les dï¿½pendance avant insert)
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
            RAISE_APPLICATION_ERROR(-20030,'Une erreur s''est CERGYuite lors de l''exécution de la fonction CHECK_VALUE_EXIST : ' || SQLERRM);
        END IF;
        RETURN FALSE;
END;
/

-- Recupere la primary pour une colonne unique donnï¿½e en parametre d'une table donnï¿½e en parametre
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



-- Fonction qui select un ticket selon le ticket_id passï¿½ en parametre
CREATE OR REPLACE PROCEDURE GLPI_PAU.GET_TICKET(
    p_ticket_id IN INT
)
IS
    v_global_ticket GLPI_PAU.GLOBAL_Ticket%ROWTYPE;
BEGIN
    SELECT *
    INTO v_global_ticket
    FROM GLPI_PAU.GLOBAL_Ticket
    WHERE ticket_id = p_ticket_id;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Le ticket avec l''ID ' || p_ticket_id || ' n''existe pas.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur lors de l''execution de la procedure GET_TICKET : ' || SQLERRM);
END;
/


-- Fonction qui select tous les tickets grace ï¿½ la procedure GET_TICKET selon le user_id passï¿½ en parametre
-- CREATE OR REPLACE PROCEDURE GLPI_PAU.GET_USER_TICKETS(
--     p_user_id IN INT
-- )
-- IS
--     v_ticket_id INT;
-- BEGIN
--     -- Selectionne tous les tickets attribuï¿½s a l'utilisateur passï¿½ en parametre
--     FOR ticket_rec IN (
--         SELECT ticket_id
--         FROM GLPI_PAU.Tickets_Assigned_To_Users
--         WHERE assigned_user = p_user_id
--     )
--     LOOP
--         -- Appele la procï¿½dure GET_TICKET pour chaque ticket de la boucle
--         BEGIN
--             GLPI_PAU.GET_TICKET(ticket_rec.ticket_id);
--         EXCEPTION
--             WHEN OTHERS THEN
--                 DBMS_OUTPUT.PUT_LINE('Erreur lors du traitement du ticket ' || ticket_rec.ticket_id || ' : ' || SQLERRM);
--         END;
--     END LOOP;
-- END;
-- /

COMMIT;
exit;

