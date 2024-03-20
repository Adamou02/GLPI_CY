-- Supprimer le trigger pour la table REF_priority dans GLPI_PROD
DROP TRIGGER GLPI_PROD.trg_upsert_ref_priority;

-- Supprimer le trigger pour la table REF_priority dans GLPI_TEST
DROP TRIGGER GLPI_TEST.trg_upsert_ref_priority;

-- Supprimer le trigger pour la table REF_status dans GLPI_PROD
DROP TRIGGER GLPI_PROD.trg_upsert_ref_status;

-- Supprimer le trigger pour la table REF_status dans GLPI_TEST
DROP TRIGGER GLPI_TEST.trg_upsert_ref_status;

-- Supprimer le trigger pour la table REF_category dans GLPI_PROD
DROP TRIGGER GLPI_PROD.trg_upsert_ref_category;

-- Supprimer le trigger pour la table REF_category dans GLPI_TEST
DROP TRIGGER GLPI_TEST.trg_upsert_ref_category;

-- Supprimer le trigger pour la table REF_type dans GLPI_PROD
DROP TRIGGER GLPI_PROD.trg_upsert_ref_type;

-- Supprimer le trigger pour la table REF_type dans GLPI_TEST
DROP TRIGGER GLPI_TEST.trg_upsert_ref_type;

-- Supprimer le trigger pour la table REF_role dans GLPI_PROD
DROP TRIGGER GLPI_PROD.trg_upsert_ref_role;

-- Supprimer le trigger pour la table REF_role dans GLPI_TEST
DROP TRIGGER GLPI_TEST.trg_upsert_ref_role;

-- Supprimer le trigger pour la table REF_group dans GLPI_PROD
DROP TRIGGER GLPI_PROD.trg_upsert_ref_group;

-- Supprimer le trigger pour la table REF_group dans GLPI_TEST
DROP TRIGGER GLPI_TEST.trg_upsert_ref_group;

-- Supprimer le trigger pour la table LOCATIONS dans GLPI_PROD
DROP TRIGGER GLPI_PROD.trg_upsert_locations;

-- Supprimer le trigger pour la table LOCATIONS dans GLPI_TEST
DROP TRIGGER GLPI_TEST.trg_upsert_locations;

-- Supprimer le trigger pour la table HARDWARES dans GLPI_PROD
DROP TRIGGER GLPI_PROD.trg_upsert_hardwares;

-- Supprimer le trigger pour la table HARDWARES dans GLPI_TEST
DROP TRIGGER GLPI_TEST.trg_upsert_hardwares;

-- Supprimer le trigger pour la table USERS dans GLPI_PROD
DROP TRIGGER GLPI_PROD.trg_upsert_users;

-- Supprimer le trigger pour la table USERS dans GLPI_TEST
DROP TRIGGER GLPI_TEST.trg_upsert_users;

-- Supprimer le trigger pour la table TICKETS dans GLPI_PROD
DROP TRIGGER GLPI_PROD.trg_upsert_tickets;

-- Supprimer le trigger pour la table TICKETS dans GLPI_TEST
DROP TRIGGER GLPI_TEST.trg_upsert_tickets;

-- Supprimer le trigger pour la table COMMENTS dans GLPI_PROD
DROP TRIGGER GLPI_PROD.trg_upsert_comments;

-- Supprimer le trigger pour la table COMMENTS dans GLPI_TEST
DROP TRIGGER GLPI_TEST.trg_upsert_comments;

-- Supprimer le trigger pour la table RESSOURCES dans GLPI_PROD
DROP TRIGGER GLPI_PROD.trg_upsert_ressources;

-- Supprimer le trigger pour la table RESSOURCES dans GLPI_TEST
DROP TRIGGER GLPI_TEST.trg_upsert_ressources;

COMMIT;
EXIT;
