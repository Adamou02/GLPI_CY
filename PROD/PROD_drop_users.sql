ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- Suppression des utilisateurs
DROP USER glpi_prod_cergy_admin CASCADE;
DROP USER glpi_prod_cergy_dev CASCADE;
DROP USER glpi_prod_cergy_analyst CASCADE;
DROP USER glpi_prod_cergy_observer CASCADE;

COMMIT;
exit;