ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- Création de l'utilisateur admin
CREATE USER glpi_CERGY_cergy_admin IDENTIFIED BY your_password;
GRANT GLPI_CERGY_ADMIN TO glpi_CERGY_cergy_admin;

-- Création de l'utilisateur dev
CREATE USER glpi_CERGY_cergy_dev IDENTIFIED BY your_password;
GRANT GLPI_CERGY_DEV TO glpi_CERGY_cergy_dev;

-- Création de l'utilisateur analyst
CREATE USER glpi_CERGY_cergy_analyst IDENTIFIED BY your_password;
GRANT GLPI_CERGY_ANALYST TO glpi_CERGY_cergy_analyst;

-- Création de l'utilisateur observer
CREATE USER glpi_CERGY_cergy_observer IDENTIFIED BY your_password;
GRANT GLPI_CERGY_OBSERVER TO glpi_CERGY_cergy_observer;


COMMIT;
exit;
