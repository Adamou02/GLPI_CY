ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-------------------------
-- GLPI_PAU_OBSERVER --
-------------------------
CREATE ROLE GLPI_PAU_OBSERVER;

--Droit en select sur toutes les vues
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT view_name FROM all_views WHERE owner = 'GLPI_TEST') LOOP
    v_sql := 'GRANT SELECT ON GLPI_TEST.' || v.view_name || ' TO GLPI_PAU_OBSERVER';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

------------------------
-- GLPI_PAU_ANALYST --
------------------------
CREATE ROLE GLPI_PAU_ANALYST;
GRANT GLPI_PAU_OBSERVER TO GLPI_PAU_ANALYST;

--Droit en select sur toutes les tables
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR tbl IN (SELECT table_name FROM all_tables WHERE owner = 'GLPI_TEST') LOOP
    v_sql := 'GRANT SELECT ON GLPI_TEST.' || tbl.table_name || ' TO GLPI_PAU_ANALYST';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

-- Attribution droits sur table pour analyst
GRANT UPDATE ON GLPI_TEST.TICKETS TO GLPI_PAU_ANALYST;
GRANT UPDATE ON GLPI_TEST.COMMENTS TO GLPI_PAU_ANALYST;

--------------------
-- GLPI_PAU_DEV --
--------------------
CREATE ROLE GLPI_PAU_DEV;
GRANT GLPI_PAU_ANALYST TO GLPI_PAU_DEV;

-- Attribution de tous les droits sur les tables pour le dev
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT view_name FROM all_views WHERE owner = 'GLPI_TEST') LOOP
    v_sql := 'GRANT ALL PRIVILEGES ON GLPI_TEST.' || v.view_name || ' TO GLPI_PAU_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

-- Tous les droits sur toutes les vues
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT view_name FROM all_views WHERE owner = 'GLPI_TEST') LOOP
    v_sql := 'GRANT ALL PRIVILEGES ON GLPI_TEST.' || v.view_name || ' TO GLPI_PAU_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/



-- GLPI_PAU_ADMIN
CREATE ROLE GLPI_PAU_ADMIN;

GRANT GLPI_PAU_DEV TO GLPI_PAU_ADMIN
GRANT ALL PRIVILEGES ON SCHEMA GLPI_TEST TO GLPI_PAU_ADMIN;

GRANT CONNECT, CREATE SESSION TO GLPI_PAU_OBSERVER;
GRANT CONNECT, CREATE SESSION TO GLPI_PAU_ANALYST;
GRANT CONNECT, CREATE SESSION TO GLPI_PAU_DEV;
GRANT CONNECT, CREATE SESSION TO GLPI_PAU_ADMIN;


COMMIT;
exit;


