--DROP des Sequences et des triggers qui g�re les ID sur GLPI_PROD 

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_PROD.REF_priority
DROP TRIGGER GLPI_PROD.trg_next_id_ref_priority;
DROP SEQUENCE GLPI_PROD.seq_id_ref_priority;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_PROD.REF_status
DROP TRIGGER GLPI_PROD.trg_next_id_ref_status;
DROP SEQUENCE GLPI_PROD.seq_id_ref_status;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_PROD.REF_category
DROP TRIGGER GLPI_PROD.trg_next_id_ref_category;
DROP SEQUENCE GLPI_PROD.seq_id_ref_category;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_PROD.REF_type
DROP TRIGGER GLPI_PROD.trg_next_id_ref_type;
DROP SEQUENCE GLPI_PROD.seq_id_ref_type;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_PROD.REF_role
DROP TRIGGER GLPI_PROD.trg_next_id_ref_role;
DROP SEQUENCE GLPI_PROD.seq_id_ref_role;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_PROD.REF_group
DROP TRIGGER GLPI_PROD.trg_next_id_ref_group;
DROP SEQUENCE GLPI_PROD.seq_id_ref_group;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_PROD.LOCATIONS
DROP TRIGGER GLPI_PROD.trg_next_id_locations;
DROP SEQUENCE GLPI_PROD.seq_id_locations;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_PROD.HARDWARES
DROP TRIGGER GLPI_PROD.trg_next_id_hardwares;
DROP SEQUENCE GLPI_PROD.seq_id_hardwares;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_PROD.USERS
DROP TRIGGER GLPI_PROD.trg_next_id_users;
DROP SEQUENCE GLPI_PROD.seq_id_users;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_PROD.TICKETS
DROP TRIGGER GLPI_PROD.trg_next_id_tickets;
DROP SEQUENCE GLPI_PROD.seq_id_tickets;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_PROD.COMMENTS
DROP TRIGGER GLPI_PROD.trg_next_id_comments;
DROP SEQUENCE GLPI_PROD.seq_id_comments;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_PROD.RESSOURCES
DROP TRIGGER GLPI_PROD.trg_next_id_ressources;
DROP SEQUENCE GLPI_PROD.seq_id_ressources;

--DROP des Sequences et des triggers qui g�re les ID sur GLPI_TEST

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_TEST.REF_priority
DROP TRIGGER GLPI_TEST.trg_next_id_ref_priority;
DROP SEQUENCE GLPI_TEST.seq_id_ref_priority;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_TEST.REF_status
DROP TRIGGER GLPI_TEST.trg_next_id_ref_status;
DROP SEQUENCE GLPI_TEST.seq_id_ref_status;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_TEST.REF_category
DROP TRIGGER GLPI_TEST.trg_next_id_ref_category;
DROP SEQUENCE GLPI_TEST.seq_id_ref_category;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_TEST.REF_type
DROP TRIGGER GLPI_TEST.trg_next_id_ref_type;
DROP SEQUENCE GLPI_TEST.seq_id_ref_type;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_TEST.REF_role
DROP TRIGGER GLPI_TEST.trg_next_id_ref_role;
DROP SEQUENCE GLPI_TEST.seq_id_ref_role;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_TEST.REF_group
DROP TRIGGER GLPI_TEST.trg_next_id_ref_group;
DROP SEQUENCE GLPI_TEST.seq_id_ref_group;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_TEST.LOCATIONS
DROP TRIGGER GLPI_TEST.trg_next_id_locations;
DROP SEQUENCE GLPI_TEST.seq_id_locations;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_TEST.HARDWARES
DROP TRIGGER GLPI_TEST.trg_next_id_hardwares;
DROP SEQUENCE GLPI_TEST.seq_id_hardwares;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_TEST.USERS
DROP TRIGGER GLPI_TEST.trg_next_id_users;
DROP SEQUENCE GLPI_TEST.seq_id_users;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_TEST.TICKETS
DROP TRIGGER GLPI_TEST.trg_next_id_tickets;
DROP SEQUENCE GLPI_TEST.seq_id_tickets;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_TEST.COMMENTS
DROP TRIGGER GLPI_TEST.trg_next_id_comments;
DROP SEQUENCE GLPI_TEST.seq_id_comments;

-- Suppression de la s�quence et du trigger qui g�re les id de GLPI_TEST.RESSOURCES
DROP TRIGGER GLPI_TEST.trg_next_id_ressources;
DROP SEQUENCE GLPI_TEST.seq_id_ressources;
COMMIT;
exit;