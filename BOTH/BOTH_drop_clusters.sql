ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- Suppression des clusters de GLPI_CERGY et de leur index
DROP INDEX GLPI_CERGY.idx_user_cluster;
DROP INDEX GLPI_CERGY.idx_ticket_cluster;
DROP CLUSTER  GLPI_CERGY.user_cluster;
DROP CLUSTER GLPI_CERGY.ticket_cluster;

-- Suppression des clusters de GLPI_PAU et de leur index
DROP INDEX GLPI_PAU.idx_user_cluster;
DROP INDEX GLPI_PAU.idx_ticket_cluster;
DROP CLUSTER  GLPI_PAU.user_cluster;
DROP CLUSTER GLPI_PAU.ticket_cluster;

COMMIT;
EXIT;
