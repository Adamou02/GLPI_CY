--Creation des sequences pour gerer les id des tables  
-- Création de la sequence pour REF_priority
CREATE SEQUENCE GLPI_PROD.seq_id_ref_priority
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour REF_status
CREATE SEQUENCE GLPI_PROD.seq_id_ref_status
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour REF_category
CREATE SEQUENCE GLPI_PROD.seq_id_ref_category
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour REF_type
CREATE SEQUENCE GLPI_PROD.seq_id_ref_type
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour REF_role
CREATE SEQUENCE GLPI_PROD.seq_id_ref_role
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour REF_group
CREATE SEQUENCE GLPI_PROD.seq_id_ref_group
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour HARDWARES
CREATE SEQUENCE GLPI_PROD.seq_id_hardwares
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour LOCATIONS
CREATE SEQUENCE GLPI_PROD.seq_id_locations
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour USERS
CREATE SEQUENCE GLPI_PROD.seq_id_users
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour TICKETS
CREATE SEQUENCE GLPI_PROD.seq_id_tickets
  START WITH 1
  INCREMENT BY 1;
  
-- Création de la sequence pour COMMENTS
CREATE SEQUENCE GLPI_PROD.seq_id_comments
  START WITH 1
  INCREMENT BY 1;
  
-- Création de la sequence pour RESSOURCES
CREATE SEQUENCE GLPI_PROD.seq_id_ressources
  START WITH 1
  INCREMENT BY 1;

COMMIT;
EXIT;
