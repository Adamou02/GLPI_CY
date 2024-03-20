-- Supprimer la s�quence pour REF_priority dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ref_priority;

-- Supprimer la s�quence pour REF_priority dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ref_priority;

-- Supprimer la s�quence pour REF_status dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ref_status;

-- Supprimer la s�quence pour REF_status dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ref_status;

-- Supprimer la s�quence pour REF_category dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ref_category;

-- Supprimer la s�quence pour REF_category dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ref_category;

-- Supprimer la s�quence pour REF_type dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ref_type;

-- Supprimer la s�quence pour REF_type dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ref_type;

-- Supprimer la s�quence pour REF_role dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ref_role;

-- Supprimer la s�quence pour REF_role dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ref_role;

-- Supprimer la s�quence pour REF_group dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ref_group;

-- Supprimer la s�quence pour REF_group dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ref_group;

-- Supprimer la s�quence pour HARDWARES dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_hardwares;

-- Supprimer la s�quence pour HARDWARES dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_hardwares;

-- Supprimer la s�quence pour LOCATIONS dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_locations;

-- Supprimer la s�quence pour LOCATIONS dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_locations;

-- Supprimer la s�quence pour USERS dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_users;

-- Supprimer la s�quence pour USERS dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_users;

-- Supprimer la s�quence pour TICKETS dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_tickets;

-- Supprimer la s�quence pour TICKETS dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_tickets;

-- Supprimer la s�quence pour COMMENTS dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_comments;

-- Supprimer la s�quence pour COMMENTS dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_comments;

-- Supprimer la s�quence pour RESSOURCES dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ressources;

-- Supprimer la s�quence pour RESSOURCES dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ressources;

COMMIT;
EXIT;