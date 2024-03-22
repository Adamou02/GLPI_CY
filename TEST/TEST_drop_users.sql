ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- Suppression des utilisateurs
DROP USER glpi_test_pau_admin CASCADE;
DROP USER glpi_test_pau_dev CASCADE;
DROP USER glpi_test_pau_analyst CASCADE;
DROP USER glpi_test_pau_observer CASCADE;

COMMIT;
exit;