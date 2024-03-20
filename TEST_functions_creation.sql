-- Fonction qui v�rifie la pr�cense de la clef dans une table passer en parametre (pour v�rifier les d�pendance avant insert)
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
            RAISE_APPLICATION_ERROR(-200030,'Une erreur s''est produite lors de l''ex�cution de la fonction check_primary_key_value : ' || SQLERRM);
        END IF;
        RETURN FALSE;
END;
/

-- Recupere la primary pour une colonne unique donn�e en parametre d'une table donn�e en parametre
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
    