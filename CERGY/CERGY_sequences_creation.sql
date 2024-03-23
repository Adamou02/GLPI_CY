--Creation des sequences pour gerer les id des tables  
-- Création de la sequence pour.REF_PRIORITY
CREATE SEQUENCE GLPI_CERGY.seq_id.REF_PRIORITY
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour.REF_STATUS
CREATE SEQUENCE GLPI_CERGY.seq_id.REF_STATUS
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour.REF_CATEGORY
CREATE SEQUENCE GLPI_CERGY.seq_id.REF_CATEGORY
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour.REF_TYPE
CREATE SEQUENCE GLPI_CERGY.seq_id.REF_TYPE
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour.REF_ROLE
CREATE SEQUENCE GLPI_CERGY.seq_id.REF_ROLE
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour.REF_GROUP
CREATE SEQUENCE GLPI_CERGY.seq_id.REF_GROUP
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour HARDWARES
CREATE SEQUENCE GLPI_CERGY.seq_id_hardwares
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour LOCATIONS
CREATE SEQUENCE GLPI_CERGY.seq_id_locations
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour USERS
CREATE SEQUENCE GLPI_CERGY.seq_id_users
  START WITH 1
  INCREMENT BY 1;

-- Création de la sequence pour TICKETS
CREATE SEQUENCE GLPI_CERGY.seq_id_tickets
  START WITH 1
  INCREMENT BY 1;
  
-- Création de la sequence pour COMMENTS
CREATE SEQUENCE GLPI_CERGY.seq_id_comments
  START WITH 1
  INCREMENT BY 1;
  
-- Création de la sequence pour RESSOURCES
CREATE SEQUENCE GLPI_CERGY.seq_id_ressources
  START WITH 1
  INCREMENT BY 1;

COMMIT;
EXIT;
