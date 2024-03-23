ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-------------------------
-- GLPI_CERGY_OBSERVER --
-------------------------
CREATE ROLE GLPI_CERGY_OBSERVER;

--Droit en select sur toutes les vues
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT view_name FROM all_views WHERE owner = 'GLPI_CERGY') LOOP
    v_sql := 'GRANT SELECT ON GLPI_CERGY.' || v.view_name || ' TO GLPI_CERGY_OBSERVER';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

------------------------
-- GLPI_CERGY_ANALYST --
------------------------
CREATE ROLE GLPI_CERGY_ANALYST;
GRANT GLPI_CERGY_OBSERVER TO GLPI_CERGY_ANALYST;

--Droit en select sur toutes les tables
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR tbl IN (SELECT table_name FROM all_tables WHERE owner = 'GLPI_CERGY') LOOP
    v_sql := 'GRANT SELECT ON GLPI_CERGY.' || tbl.table_name || ' TO GLPI_CERGY_ANALYST';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

-- Attribution droits sur table pour analyst
GRANT UPDATE ON GLPI_CERGY.TICKETS TO GLPI_CERGY_ANALYST;
GRANT UPDATE ON GLPI_CERGY.COMMENTS TO GLPI_CERGY_ANALYST;

--------------------
-- GLPI_CERGY_DEV --
--------------------
CREATE ROLE GLPI_CERGY_DEV;
GRANT GLPI_CERGY_ANALYST TO GLPI_CERGY_DEV;

-- Attribution de tous les droits sur les tables pour le dev
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR tbl IN (SELECT table_name FROM all_tables WHERE owner = 'GLPI_CERGY') LOOP
    v_sql := 'GRANT SELECT, INSERT, UPDATE, DELETE ON GLPI_CERGY.' || tbl.table_name || ' TO GLPI_CERGY_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

--Droit en select sur toutes les vues
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT view_name FROM all_views WHERE owner = 'GLPI_CERGY') LOOP
    v_sql := 'GRANT SELECT, INSERT, UPDATE, DELETE ON GLPI_CERGY.' || v.view_name || ' TO GLPI_CERGY_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/


-- Attribution de tous les droits sur les séquences pour le rôle
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT sequence_name FROM all_sequences WHERE sequence_owner = 'GLPI_CERGY') LOOP
    v_sql := 'GRANT SELECT, ALTER ON GLPI_CERGY.' || v.sequence_name || ' TO GLPI_CERGY_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

-- Attribution de tous les droits sur les déclencheurs pour le rôle
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT trigger_name FROM all_triggers WHERE owner = 'GLPI_CERGY') LOOP
    v_sql := 'GRANT SELECT, INSERT, UPDATE, DELETE ON GLPI_CERGY.' || v.trigger_name || ' TO GLPI_CERGY_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

-- Attribution de tous les droits sur les index pour le rôle
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT index_name FROM all_indexes WHERE table_owner = 'GLPI_CERGY') LOOP
    v_sql := 'GRANT SELECT, INSERT, UPDATE, DELETE ON GLPI_CERGY.' || v.index_name || ' TO GLPI_CERGY_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/


-- GLPI_CERGY_ADMIN
CREATE ROLE GLPI_CERGY_ADMIN;

GRANT GLPI_CERGY_DEV TO GLPI_CERGY_ADMIN;
GRANT CREATE DATABASE LINK TO GLPI_CERGY_ADMIN;
-- GRANT ALL PRIVILEGES ON SCHEMA GLPI_CERGY TO GLPI_CERGY_ADMIN;


GRANT CONNECT, CREATE SESSION TO GLPI_CERGY_OBSERVER;
GRANT CONNECT, CREATE SESSION TO GLPI_CERGY_ANALYST;
GRANT CONNECT, CREATE SESSION TO GLPI_CERGY_DEV;
GRANT CONNECT, CREATE SESSION TO GLPI_CERGY_ADMIN;

-------------------------
-- GLPI_PAU_OBSERVER --
-------------------------
CREATE ROLE GLPI_PAU_OBSERVER;

--Droit en select sur toutes les vues
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT view_name FROM all_views WHERE owner = 'GLPI_PAU') LOOP
    v_sql := 'GRANT SELECT ON GLPI_PAU.' || v.view_name || ' TO GLPI_PAU_OBSERVER';
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
  FOR tbl IN (SELECT table_name FROM all_tables WHERE owner = 'GLPI_PAU') LOOP
    v_sql := 'GRANT SELECT ON GLPI_PAU.' || tbl.table_name || ' TO GLPI_PAU_ANALYST';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

-- Attribution droits sur table pour analyst
GRANT UPDATE ON GLPI_PAU.TICKETS TO GLPI_PAU_ANALYST;
GRANT UPDATE ON GLPI_PAU.COMMENTS TO GLPI_PAU_ANALYST;

--------------------
-- GLPI_PAU_DEV --
--------------------
CREATE ROLE GLPI_PAU_DEV;
GRANT GLPI_PAU_ANALYST TO GLPI_PAU_DEV;

-- Attribution de tous les droits sur les tables pour le dev
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR tbl IN (SELECT table_name FROM all_tables WHERE owner = 'GLPI_PAU') LOOP
    v_sql := 'GRANT SELECT, INSERT, UPDATE, DELETE ON GLPI_PAU.' || tbl.table_name || ' TO GLPI_PAU_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

--Droit en select sur toutes les vues
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT view_name FROM all_views WHERE owner = 'GLPI_PAU') LOOP
    v_sql := 'GRANT SELECT, INSERT, UPDATE, DELETE ON GLPI_PAU.' || v.view_name || ' TO GLPI_PAU_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/


-- Attribution de tous les droits sur les séquences pour le rôle
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT sequence_name FROM all_sequences WHERE sequence_owner = 'GLPI_PAU') LOOP
    v_sql := 'GRANT SELECT, ALTER ON GLPI_PAU.' || v.sequence_name || ' TO GLPI_PAU_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

-- Attribution de tous les droits sur les déclencheurs pour le rôle
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT trigger_name FROM all_triggers WHERE owner = 'GLPI_PAU') LOOP
    v_sql := 'GRANT SELECT, INSERT, UPDATE, DELETE ON GLPI_PAU.' || v.trigger_name || ' TO GLPI_PAU_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

-- Attribution de tous les droits sur les index pour le rôle
DECLARE
  v_sql VARCHAR2(2000);
BEGIN
  FOR v IN (SELECT index_name FROM all_indexes WHERE table_owner = 'GLPI_PAU') LOOP
    v_sql := 'GRANT SELECT, INSERT, UPDATE, DELETE ON GLPI_PAU.' || v.index_name || ' TO GLPI_PAU_DEV';
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/

-- GLPI_PAU_ADMIN
CREATE ROLE GLPI_PAU_ADMIN;

GRANT GLPI_PAU_DEV TO GLPI_PAU_ADMIN;
GRANT CREATE DATABASE LINK TO GLPI_PAU_ADMIN;

--  GRANT ALL PRIVILEGES ON SCHEMA GLPI_PAU TO GLPI_PAU_ADMIN;

GRANT CONNECT, CREATE SESSION TO GLPI_PAU_OBSERVER;
GRANT CONNECT, CREATE SESSION TO GLPI_PAU_ANALYST;
GRANT CONNECT, CREATE SESSION TO GLPI_PAU_DEV;
GRANT CONNECT, CREATE SESSION TO GLPI_PAU_ADMIN;

-- ROLE full admin
CREATE ROLE GLPI_FULL_ADMIN;

GRANT GLPI_PAU_ADMIN TO GLPI_FULL_ADMIN;
GRANT GLPI_CERGY_ADMIN TO GLPI_FULL_ADMIN;
GRANT CONNECT, CREATE SESSION TO GLPI_FULL_ADMIN;


COMMIT;
exit;


