-- Supprimer la s�quence pour REF_priority
DROP SEQUENCE GLPI_PROD.seq_id_ref_priority;

-- Supprimer la s�quence pour REF_status
DROP SEQUENCE GLPI_PROD.seq_id_ref_status;

-- Supprimer la s�quence pour REF_category
DROP SEQUENCE GLPI_PROD.seq_id_ref_category;

-- Supprimer la s�quence pour REF_type
DROP SEQUENCE GLPI_PROD.seq_id_ref_type;

-- Supprimer la s�quence pour REF_role
DROP SEQUENCE GLPI_PROD.seq_id_ref_role;

-- Supprimer la s�quence pour REF_group
DROP SEQUENCE GLPI_PROD.seq_id_ref_group;

-- Supprimer la s�quence pour HARDWARES
DROP SEQUENCE GLPI_PROD.seq_id_hardwares;

-- Supprimer la s�quence pour LOCATIONS
DROP SEQUENCE GLPI_PROD.seq_id_locations;

-- Supprimer la s�quence pour USERS
DROP SEQUENCE GLPI_PROD.seq_id_users;

-- Supprimer la s�quence pour TICKETS
DROP SEQUENCE GLPI_PROD.seq_id_tickets;

-- Supprimer la s�quence pour COMMENTS
DROP SEQUENCE GLPI_PROD.seq_id_comments;

-- Supprimer la s�quence pour RESSOURCES
DROP SEQUENCE GLPI_PROD.seq_id_ressources;

COMMIT;
EXIT;
