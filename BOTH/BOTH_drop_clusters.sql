ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- Suppression des clusters de CERGY
DROP CLUSTER  GLPI_CERGY.user_cluster;
DROP CLUSTER GLPI_CERGY.ticket_cluster;

-- Suppression des clusters de PAU
DROP CLUSTER  GLPI_PAU.user_cluster;
DROP CLUSTER GLPI_PAU.ticket_cluster;

COMMIT;
EXIT;
