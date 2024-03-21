ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
-- GLPI_OBSERVER
CREATE ROLE GLPI_OBSERVER;

-- Base de donn�es de production (GLPI_PROD)
GRANT SELECT ON GLPI_PROD.TICKETS TO GLPI_OBSERVER;
GRANT SELECT ON GLPI_PROD.COMMENTS TO GLPI_OBSERVER;
GRANT SELECT ON GLPI_PROD.HARDWARES TO GLPI_OBSERVER;

-- GLPI_ANALYST
CREATE ROLE GLPI_ANALYST;

-- Attribution sur les vues (GLPI_PROD)
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT view_name FROM all_views WHERE owner = 'GLPI_PROD') LOOP
    v_sql := 'GRANT SELECT ON GLPI_PROD.' || v.view_name || ' TO GLPI_ANALYST';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/
-- Attribution droits sur table pour analyst
GRANT UPDATE ON GLPI_PROD.TICKETS TO GLPI_ANALYST;
GRANT UPDATE ON GLPI_PROD.COMMENTS TO GLPI_ANALYST;

-- Attribution du r�le GLPI_OBSERVER � GLPI_ANALYST
GRANT GLPI_OBSERVER TO GLPI_ANALYST;

-- GLPI_DEV
CREATE ROLE GLPI_DEV;

-- Attribution des privil�ges sur  les vues pour GLPI_DEV
-- Base de donn�es de test (GLPI_TEST)
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT view_name FROM all_views WHERE owner = 'GLPI_TEST') LOOP
    v_sql := 'GRANT SELECT, INSERT, UPDATE, DELETE ON GLPI_TEST.' || v.view_name || ' TO GLPI_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

-- Base de donn�es de production (GLPI_PROD)
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR tbl IN (SELECT table_name FROM all_tables WHERE owner = 'GLPI_PROD') LOOP
    v_sql := 'GRANT SELECT ON GLPI_PROD.' || tbl.table_name || ' TO GLPI_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

-- Attribution des roles sur les tables
-- Base de donn�es de test (GLPI_TEST)
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR tbl IN (SELECT table_name FROM all_tables WHERE owner = 'GLPI_TEST') LOOP
    v_sql := 'GRANT ALL PRIVILEGES ON GLPI_TEST.' || tbl.table_name || ' TO GLPI_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/
GRANT GLPI_ANALYST TO GLPI_DEV;

-- GLPI_ADMIN
CREATE ROLE GLPI_ADMIN;

-- Attribution des privil�ges sur  les vues pour GLPI_ADMIN
-- Base de donn�es de prod (GLPI_PROD)
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT view_name FROM all_views WHERE owner = 'GLPI_PROD') LOOP
    v_sql := 'GRANT INSERT, UPDATE, DELETE ON GLPI_PROD.' || v.view_name || ' TO GLPI_ADMIN';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

-- Base de donn�es de production (GLPI_PROD)
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR tbl IN (SELECT table_name FROM all_tables WHERE owner = 'GLPI_PROD') LOOP
    v_sql := 'GRANT ALL PRIVILEGES ON GLPI_PROD.' || tbl.table_name || ' TO GLPI_ADMIN';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

GRANT GLPI_DEV TO GLPI_ADMIN
COMMIT;
exit;


