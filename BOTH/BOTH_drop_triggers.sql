-- Supprimer le trigger pour la table.REF_PRIORITY dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert.REF_PRIORITY;

-- Supprimer le trigger pour la table.REF_PRIORITY dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert.REF_PRIORITY;

-- Supprimer le trigger pour la table.REF_STATUS dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert.REF_STATUS;

-- Supprimer le trigger pour la table.REF_STATUS dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert.REF_STATUS;

-- Supprimer le trigger pour la table.REF_CATEGORY dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert.REF_CATEGORY;

-- Supprimer le trigger pour la table.REF_CATEGORY dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert.REF_CATEGORY;

-- Supprimer le trigger pour la table.REF_TYPE dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert.REF_TYPE;

-- Supprimer le trigger pour la table.REF_TYPE dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert.REF_TYPE;

-- Supprimer le trigger pour la table.REF_ROLE dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert.REF_ROLE;

-- Supprimer le trigger pour la table.REF_ROLE dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert.REF_ROLE;

-- Supprimer le trigger pour la table.REF_GROUP dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert.REF_GROUP;

-- Supprimer le trigger pour la table.REF_GROUP dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert.REF_GROUP;

-- Supprimer le trigger pour la table LOCATIONS dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_locations;

-- Supprimer le trigger pour la table LOCATIONS dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_locations;

-- Supprimer le trigger pour la table HARDWARES dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_hardwares;

-- Supprimer le trigger pour la table HARDWARES dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_hardwares;

-- Supprimer le trigger pour la table USERS dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_users;

-- Supprimer le trigger pour la table USERS dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_users;

-- Supprimer le trigger pour la table TICKETS dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_tickets;

-- Supprimer le trigger pour la table TICKETS dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_tickets;

-- Supprimer le trigger pour la table COMMENTS dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_comments;

-- Supprimer le trigger pour la table COMMENTS dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_comments;

-- Supprimer le trigger pour la table RESSOURCES dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_ressources;

-- Supprimer le trigger pour la table RESSOURCES dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_ressources;

-- Supprimer le trigger pour la table COMMENT_RESSOURCES dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_comment_ressources;

-- Supprimer le trigger pour la table COMMENT_RESSOURCES dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_comment_ressources;

-- Supprimer le trigger pour la table OBSERVERS dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_observers;

-- Supprimer le trigger pour la table OBSERVERS dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_observers;

-- Supprimer le trigger pour la table ASSIGNED_TO dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_assigned_to;

-- Supprimer le trigger pour la table ASSIGNED_TO dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_assigned_to;

COMMIT;
EXIT;
