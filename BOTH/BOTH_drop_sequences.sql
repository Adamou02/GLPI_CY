-- Supprimer la séquence pour.REF_PRIORITY dans GLPI_CERGY
DROP SEQUENCE GLPI_CERGY.seq_id.REF_PRIORITY;

-- Supprimer la séquence pour.REF_PRIORITY dans GLPI_PAU
DROP SEQUENCE GLPI_PAU.seq_id.REF_PRIORITY;

-- Supprimer la séquence pour.REF_STATUS dans GLPI_CERGY
DROP SEQUENCE GLPI_CERGY.seq_id.REF_STATUS;

-- Supprimer la séquence pour.REF_STATUS dans GLPI_PAU
DROP SEQUENCE GLPI_PAU.seq_id.REF_STATUS;

-- Supprimer la séquence pour.REF_CATEGORY dans GLPI_CERGY
DROP SEQUENCE GLPI_CERGY.seq_id.REF_CATEGORY;

-- Supprimer la séquence pour.REF_CATEGORY dans GLPI_PAU
DROP SEQUENCE GLPI_PAU.seq_id.REF_CATEGORY;

-- Supprimer la séquence pour.REF_TYPE dans GLPI_CERGY
DROP SEQUENCE GLPI_CERGY.seq_id.REF_TYPE;

-- Supprimer la séquence pour.REF_TYPE dans GLPI_PAU
DROP SEQUENCE GLPI_PAU.seq_id.REF_TYPE;

-- Supprimer la séquence pour.REF_ROLE dans GLPI_CERGY
DROP SEQUENCE GLPI_CERGY.seq_id.REF_ROLE;

-- Supprimer la séquence pour.REF_ROLE dans GLPI_PAU
DROP SEQUENCE GLPI_PAU.seq_id.REF_ROLE;

-- Supprimer la séquence pour.REF_GROUP dans GLPI_CERGY
DROP SEQUENCE GLPI_CERGY.seq_id.REF_GROUP;

-- Supprimer la séquence pour.REF_GROUP dans GLPI_PAU
DROP SEQUENCE GLPI_PAU.seq_id.REF_GROUP;

-- Supprimer la séquence pour HARDWARES dans GLPI_CERGY
DROP SEQUENCE GLPI_CERGY.seq_id_hardwares;

-- Supprimer la séquence pour HARDWARES dans GLPI_PAU
DROP SEQUENCE GLPI_PAU.seq_id_hardwares;

-- Supprimer la séquence pour LOCATIONS dans GLPI_CERGY
DROP SEQUENCE GLPI_CERGY.seq_id_locations;

-- Supprimer la séquence pour LOCATIONS dans GLPI_PAU
DROP SEQUENCE GLPI_PAU.seq_id_locations;

-- Supprimer la séquence pour USERS dans GLPI_CERGY
DROP SEQUENCE GLPI_CERGY.seq_id_users;

-- Supprimer la séquence pour USERS dans GLPI_PAU
DROP SEQUENCE GLPI_PAU.seq_id_users;

-- Supprimer la séquence pour TICKETS dans GLPI_CERGY
DROP SEQUENCE GLPI_CERGY.seq_id_tickets;

-- Supprimer la séquence pour TICKETS dans GLPI_PAU
DROP SEQUENCE GLPI_PAU.seq_id_tickets;

-- Supprimer la séquence pour COMMENTS dans GLPI_CERGY
DROP SEQUENCE GLPI_CERGY.seq_id_comments;

-- Supprimer la séquence pour COMMENTS dans GLPI_PAU
DROP SEQUENCE GLPI_PAU.seq_id_comments;

-- Supprimer la séquence pour RESSOURCES dans GLPI_CERGY
DROP SEQUENCE GLPI_CERGY.seq_id_ressources;

-- Supprimer la séquence pour RESSOURCES dans GLPI_PAU
DROP SEQUENCE GLPI_PAU.seq_id_ressources;

COMMIT;
EXIT;
