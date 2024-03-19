ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
-- Cr�ation des utilisateurs

-- Suppression des utilisateurs GLPI_ADMIN
DROP USER admin_glpi_1 CASCADE;
DROP USER admin_glpi_2 CASCADE;

-- Suppression des utilisateurs GLPI_DEV
DROP USER dev_glpi_1 CASCADE;
DROP USER dev_glpi_2 CASCADE;

-- Suppression des utilisateurs GLPI_ANALYST
DROP USER analyst_glpi_1 CASCADE;
DROP USER analyst_glpi_2 CASCADE;

-- Suppression des utilisateurs GLPI_OBSERVER
DROP USER observer_glpi_1 CASCADE;
DROP USER observer_glpi_2 CASCADE;

COMMIT;
exit;