-- Supprimer la séquence pour REF_priority
DROP SEQUENCE GLPI_PROD.seq_id_ref_priority;

-- Supprimer la séquence pour REF_status
DROP SEQUENCE GLPI_PROD.seq_id_ref_status;

-- Supprimer la séquence pour REF_category
DROP SEQUENCE GLPI_PROD.seq_id_ref_category;

-- Supprimer la séquence pour REF_type
DROP SEQUENCE GLPI_PROD.seq_id_ref_type;

-- Supprimer la séquence pour REF_role
DROP SEQUENCE GLPI_PROD.seq_id_ref_role;

-- Supprimer la séquence pour REF_group
DROP SEQUENCE GLPI_PROD.seq_id_ref_group;

-- Supprimer la séquence pour HARDWARES
DROP SEQUENCE GLPI_PROD.seq_id_hardwares;

-- Supprimer la séquence pour LOCATIONS
DROP SEQUENCE GLPI_PROD.seq_id_locations;

-- Supprimer la séquence pour USERS
DROP SEQUENCE GLPI_PROD.seq_id_users;

-- Supprimer la séquence pour TICKETS
DROP SEQUENCE GLPI_PROD.seq_id_tickets;

-- Supprimer la séquence pour COMMENTS
DROP SEQUENCE GLPI_PROD.seq_id_comments;

-- Supprimer la séquence pour RESSOURCES
DROP SEQUENCE GLPI_PROD.seq_id_ressources;

COMMIT;
EXIT;
