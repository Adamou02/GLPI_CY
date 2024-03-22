ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- Création de l'utilisateur admin
CREATE USER glpi_test_pau_admin IDENTIFIED BY your_password;
GRANT GLPI_PAU_ADMIN TO glpi_test_pau_admin;

-- Création de l'utilisateur dev
CREATE USER glpi_test_pau_dev IDENTIFIED BY your_password;
GRANT GLPI_PAU_DEV TO glpi_test_pau_dev;

-- Création de l'utilisateur analyst
CREATE USER glpi_test_pau_analyst IDENTIFIED BY your_password;
GRANT GLPI_PAU_ANALYST TO glpi_test_pau_analyst;

-- Création de l'utilisateur observer
CREATE USER glpi_test_pau_observer IDENTIFIED BY your_password;
GRANT GLPI_PAU_OBSERVER TO glpi_test_pau_observer;


COMMIT;
exit;