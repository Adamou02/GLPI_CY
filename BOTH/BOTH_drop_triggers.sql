-- Supprimer le trigger pour la table REF_priority dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_ref_priority;

-- Supprimer le trigger pour la table REF_priority dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_ref_priority;

-- Supprimer le trigger pour la table REF_status dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_ref_status;

-- Supprimer le trigger pour la table REF_status dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_ref_status;

-- Supprimer le trigger pour la table REF_category dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_ref_category;

-- Supprimer le trigger pour la table REF_category dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_ref_category;

-- Supprimer le trigger pour la table REF_type dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_ref_type;

-- Supprimer le trigger pour la table REF_type dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_ref_type;

-- Supprimer le trigger pour la table REF_role dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_ref_role;

-- Supprimer le trigger pour la table REF_role dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_ref_role;

-- Supprimer le trigger pour la table REF_group dans GLPI_CERGY
DROP TRIGGER GLPI_CERGY.trg_upsert_ref_group;

-- Supprimer le trigger pour la table REF_group dans GLPI_PAU
DROP TRIGGER GLPI_PAU.trg_upsert_ref_group;

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
