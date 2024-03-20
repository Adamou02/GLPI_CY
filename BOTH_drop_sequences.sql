-- Supprimer la séquence pour REF_priority dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ref_priority;

-- Supprimer la séquence pour REF_priority dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ref_priority;

-- Supprimer la séquence pour REF_status dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ref_status;

-- Supprimer la séquence pour REF_status dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ref_status;

-- Supprimer la séquence pour REF_category dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ref_category;

-- Supprimer la séquence pour REF_category dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ref_category;

-- Supprimer la séquence pour REF_type dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ref_type;

-- Supprimer la séquence pour REF_type dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ref_type;

-- Supprimer la séquence pour REF_role dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ref_role;

-- Supprimer la séquence pour REF_role dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ref_role;

-- Supprimer la séquence pour REF_group dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ref_group;

-- Supprimer la séquence pour REF_group dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ref_group;

-- Supprimer la séquence pour HARDWARES dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_hardwares;

-- Supprimer la séquence pour HARDWARES dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_hardwares;

-- Supprimer la séquence pour LOCATIONS dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_locations;

-- Supprimer la séquence pour LOCATIONS dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_locations;

-- Supprimer la séquence pour USERS dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_users;

-- Supprimer la séquence pour USERS dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_users;

-- Supprimer la séquence pour TICKETS dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_tickets;

-- Supprimer la séquence pour TICKETS dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_tickets;

-- Supprimer la séquence pour COMMENTS dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_comments;

-- Supprimer la séquence pour COMMENTS dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_comments;

-- Supprimer la séquence pour RESSOURCES dans GLPI_PROD
DROP SEQUENCE GLPI_PROD.seq_id_ressources;

-- Supprimer la séquence pour RESSOURCES dans GLPI_TEST
DROP SEQUENCE GLPI_TEST.seq_id_ressources;

COMMIT;
EXIT;