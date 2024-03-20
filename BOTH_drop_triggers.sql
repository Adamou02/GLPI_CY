-- Supprimer le trigger pour la table REF_priority
DROP TRIGGER GLPI_PROD.trg_upsert_ref_priority;

-- Supprimer le trigger pour la table REF_status
DROP TRIGGER GLPI_PROD.trg_upsert_ref_status;

-- Supprimer le trigger pour la table REF_category
DROP TRIGGER GLPI_PROD.trg_upsert_ref_category;

-- Supprimer le trigger pour la table REF_type
DROP TRIGGER GLPI_PROD.trg_upsert_ref_type;

-- Supprimer le trigger pour la table REF_role
DROP TRIGGER GLPI_PROD.trg_upsert_ref_role;

-- Supprimer le trigger pour la table REF_group
DROP TRIGGER GLPI_PROD.trg_upsert_ref_group;

-- Supprimer le trigger pour la table LOCATIONS
DROP TRIGGER GLPI_PROD.trg_upsert_locations;

-- Supprimer le trigger pour la table HARDWARES
DROP TRIGGER GLPI_PROD.trg_upsert_hardwares;

-- Supprimer le trigger pour la table USERS
DROP TRIGGER GLPI_PROD.trg_upsert_users;

-- Supprimer le trigger pour la table TICKETS
DROP TRIGGER GLPI_PROD.trg_upsert_tickets;

-- Supprimer le trigger pour la table COMMENTS
DROP TRIGGER GLPI_PROD.trg_upsert_comments;

-- Supprimer le trigger pour la table RESSOURCES
DROP TRIGGER GLPI_PROD.trg_upsert_ressources;

COMMIT;
EXIT;
