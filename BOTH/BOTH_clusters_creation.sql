ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

CREATE CLUSTER GLPI_CERGY.user_cluster (user_id INT) TABLESPACE GLPI_CERGY_TABSPACE; 
CREATE CLUSTER GLPI_CERGY.ticket_cluster (ticket_id INT) TABLESPACE GLPI_CERGY_TABSPACE; 

CREATE CLUSTER GLPI_PAU.user_cluster (user_id INT) TABLESPACE GLPI_PAU_TABSPACE; 
CREATE CLUSTER GLPI_PAU.ticket_cluster (ticket_id INT) TABLESPACE GLPI_PAU_TABSPACE; 

-- Création d'index sur les clusters pour améliorer les performances globales des requêtes impliquant des opérations sur les données regroupées dans ces clusters.

-- Index sur le cluster des utilisateurs pour améliorer les performances des requêtes courantes impliquant des opérations sur les utilisateurs.
CREATE INDEX GLPI_PAU.idx_user_cluster ON CLUSTER GLPI_PAU.user_cluster;
CREATE INDEX GLPI_CERGY.idx_user_cluster ON CLUSTER GLPI_CERGY.user_cluster;

-- Index sur le cluster des tickets pour améliorer les performances des requêtes courantes impliquant des opérations sur les tickets
CREATE INDEX GLPI_PAU.idx_ticket_cluster ON CLUSTER GLPI_PAU.ticket_cluster;
CREATE INDEX GLPI_CERGY.idx_ticket_cluster ON CLUSTER GLPI_CERGY.ticket_cluster;


COMMIT;
EXIT;
