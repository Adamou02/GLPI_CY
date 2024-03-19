-- Cr�ation de la s�quence pour REF_priority
CREATE SEQUENCE GLPI_TEST.seq_id_ref_priority
  START WITH 1
  INCREMENT BY 1;

-- Cr�ation du d�clencheur pour REF_priority
CREATE OR REPLACE TRIGGER GLPI_TEST.trg_next_id_ref_priority
BEFORE INSERT ON GLPI_TEST.REF_priority
FOR EACH ROW
BEGIN
  SELECT GLPI_TEST.seq_id_ref_priority.nextval INTO :new.priority_id FROM dual;
END;
/

-- Cr�ation de la s�quence pour REF_status
CREATE SEQUENCE GLPI_TEST.seq_id_ref_status
  START WITH 1
  INCREMENT BY 1;

-- Cr�ation du d�clencheur pour REF_status
CREATE OR REPLACE TRIGGER GLPI_TEST.trg_next_id_ref_status
BEFORE INSERT ON GLPI_TEST.REF_status
FOR EACH ROW
BEGIN
  SELECT GLPI_TEST.seq_id_ref_status.nextval INTO :new.status_id FROM dual;
END;
/


-- Cr�ation de la s�quence pour REF_category
CREATE SEQUENCE GLPI_TEST.seq_id_ref_category
  START WITH 1
  INCREMENT BY 1;

-- Cr�ation du d�clencheur pour REF_category
CREATE OR REPLACE TRIGGER GLPI_TEST.trg_next_id_ref_category
BEFORE INSERT ON GLPI_TEST.REF_category
FOR EACH ROW
BEGIN
  SELECT GLPI_TEST.seq_id_ref_category.nextval INTO :new.category_id FROM dual;
END;
/


-- Cr�ation de la s�quence pour REF_type
CREATE SEQUENCE GLPI_TEST.seq_id_ref_type
  START WITH 1
  INCREMENT BY 1;

-- Cr�ation du d�clencheur pour REF_type
CREATE OR REPLACE TRIGGER GLPI_TEST.trg_next_id_ref_type
BEFORE INSERT ON GLPI_TEST.REF_type
FOR EACH ROW
BEGIN
  SELECT GLPI_TEST.seq_id_ref_type.nextval INTO :new.type_id FROM dual;
END;
/


-- Cr�ation de la s�quence pour REF_role
CREATE SEQUENCE GLPI_TEST.seq_id_ref_role
  START WITH 1
  INCREMENT BY 1;

-- Cr�ation du d�clencheur pour REF_role
CREATE OR REPLACE TRIGGER GLPI_TEST.trg_next_id_ref_role
BEFORE INSERT ON GLPI_TEST.REF_role
FOR EACH ROW
BEGIN
  SELECT GLPI_TEST.seq_id_ref_role.nextval INTO :new.role_id FROM dual;
END;
/

-- Cr�ation de la s�quence pour REF_group
CREATE SEQUENCE GLPI_TEST.seq_id_ref_group
  START WITH 1
  INCREMENT BY 1;

-- Cr�ation du d�clencheur pour REF_group
CREATE OR REPLACE TRIGGER GLPI_TEST.trg_next_id_ref_group
BEFORE INSERT ON GLPI_TEST.REF_group
FOR EACH ROW
BEGIN
  SELECT GLPI_TEST.seq_id_ref_group.nextval INTO :new.group_id FROM dual;
END;
/


-- Cr�ation de la s�quence pour LOCATIONS
CREATE SEQUENCE GLPI_TEST.seq_id_locations
  START WITH 1
  INCREMENT BY 1;

-- Cr�ation du d�clencheur pour LOCATIONS
CREATE OR REPLACE TRIGGER GLPI_TEST.trg_next_id_locations
BEFORE INSERT ON GLPI_TEST.LOCATIONS
FOR EACH ROW
BEGIN
  SELECT GLPI_TEST.seq_id_locations.nextval INTO :new.location_id FROM dual;
END;
/


-- Cr�ation de la s�quence pour HARDWARES
CREATE SEQUENCE GLPI_TEST.seq_id_hardwares
  START WITH 1
  INCREMENT BY 1;

-- Cr�ation du d�clencheur pour HARDWARES
CREATE OR REPLACE TRIGGER GLPI_TEST.trg_next_id_hardwares
BEFORE INSERT ON GLPI_TEST.HARDWARES
FOR EACH ROW
BEGIN
  SELECT GLPI_TEST.seq_id_hardwares.nextval INTO :new.hardware_id FROM dual;
END;
/


-- Cr�ation de la s�quence pour USERS
CREATE SEQUENCE GLPI_TEST.seq_id_users
  START WITH 1
  INCREMENT BY 1;

-- Cr�ation du d�clencheur pour USERS
CREATE OR REPLACE TRIGGER GLPI_TEST.trg_next_id_users
BEFORE INSERT ON GLPI_TEST.USERS
FOR EACH ROW
BEGIN
  SELECT GLPI_TEST.seq_id_users.nextval INTO :new.user_id FROM dual;
END;
/


-- Cr�ation de la s�quence pour TICKETS
CREATE SEQUENCE GLPI_TEST.seq_id_tickets
  START WITH 1
  INCREMENT BY 1;

-- Cr�ation du d�clencheur pour TICKETS
CREATE OR REPLACE TRIGGER GLPI_TEST.trg_next_id_tickets
BEFORE INSERT ON GLPI_TEST.TICKETS
FOR EACH ROW
BEGIN
  SELECT GLPI_TEST.seq_id_tickets.nextval INTO :new.ticket_id FROM dual;
END;
/


-- Cr�ation de la s�quence pour COMMENTS
CREATE SEQUENCE GLPI_TEST.seq_id_comments
  START WITH 1
  INCREMENT BY 1;

-- Cr�ation du d�clencheur pour COMMENTS
CREATE OR REPLACE TRIGGER GLPI_TEST.trg_next_id_comments
BEFORE INSERT ON GLPI_TEST.COMMENTS
FOR EACH ROW
BEGIN
  SELECT GLPI_TEST.seq_id_comments.nextval INTO :new.comment_id FROM dual;
END;
/


-- Cr�ation de la s�quence pour RESSOURCES
CREATE SEQUENCE GLPI_TEST.seq_id_ressources
  START WITH 1
  INCREMENT BY 1;

-- Cr�ation du d�clencheur pour RESSOURCES
CREATE OR REPLACE TRIGGER GLPI_TEST.trg_next_id_ressources
BEFORE INSERT ON GLPI_TEST.RESSOURCES
FOR EACH ROW
BEGIN
  SELECT GLPI_TEST.seq_id_ressources.nextval INTO :new.ressource_id FROM dual;
END;
/

COMMIT;
exit;