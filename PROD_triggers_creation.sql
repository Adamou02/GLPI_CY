-- Creation de triggers qui :
-- Gere lors des insert les id (INSERT uniquement)
-- Si elle possède des dépendances (foreign keys) :
-- Vérifie la présence des values des colonnes possédant des dépendances et gère l'erreur (INSERT et UPDATE)

-- Trigger pour REF_priority
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_ref_priority
BEFORE INSERT OR UPDATE ON GLPI_PROD.REF_priority
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        SELECT GLPI_PROD.seq_id_ref_priority.nextval INTO :NEW.priority_id FROM dual;
    END IF;
    
    IF (CHECK_DEPENDENCY(:NEW.priority, 'priority', 'REF_PRIORITY')) THEN 
        RAISE_APPLICATION_ERROR(-20001, 'Priority ' || :NEW.priority || ' already exists in table GLPI_PROD.REF_PRIORITY');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/


-- Trigger pour REF_status
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_ref_status
BEFORE INSERT ON GLPI_PROD.REF_status
FOR EACH ROW
BEGIN
    SELECT GLPI_PROD.seq_id_ref_status.nextval INTO :NEW.status_id FROM dual;
    
    IF (CHECK_DEPENDENCY(:NEW.status, 'status', 'REF_STATUS')) THEN 
        RAISE_APPLICATION_ERROR(-20002, 'Status ' || :NEW.status || ' already exists in table GLPI_PROD.REF_STATUS');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Trigger pour REF_category
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_ref_category
BEFORE INSERT ON GLPI_PROD.REF_category
FOR EACH ROW
BEGIN
    SELECT GLPI_PROD.seq_id_ref_category.nextval INTO :NEW.category_id FROM dual;
    
    IF (CHECK_DEPENDENCY(:NEW.category, 'category', 'REF_CATEGORY')) THEN 
        RAISE_APPLICATION_ERROR(-20003, 'Category ' || :NEW.category || ' already exists in table GLPI_PROD.REF_CATEGORY');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Trigger pour REF_type
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_ref_type
BEFORE INSERT ON GLPI_PROD.REF_type
FOR EACH ROW
BEGIN
    SELECT GLPI_PROD.seq_id_ref_type.nextval INTO :NEW.type_id FROM dual;
    
    IF (CHECK_DEPENDENCY(:NEW.type, 'type', 'REF_TYPE')) THEN 
        RAISE_APPLICATION_ERROR(-20004, 'Type ' || :NEW.type || ' already exists in table GLPI_PROD.REF_TYPE');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Trigger pour REF_role
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_ref_role
BEFORE INSERT ON GLPI_PROD.REF_role
FOR EACH ROW
BEGIN
    SELECT GLPI_PROD.seq_id_ref_role.nextval INTO :NEW.role_id FROM dual;
    
    IF (CHECK_DEPENDENCY(:NEW.role, 'role', 'REF_ROLE')) THEN 
        RAISE_APPLICATION_ERROR(-20005, 'Role ' || :NEW.role || ' already exists in table GLPI_PROD.REF_ROLE');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Trigger pour REF_group
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_ref_group
BEFORE INSERT ON GLPI_PROD.REF_group
FOR EACH ROW
BEGIN
    SELECT GLPI_PROD.seq_id_ref_group.nextval INTO :NEW.group_id FROM dual;
    
    IF (CHECK_DEPENDENCY(:NEW.group, 'group', 'REF_GROUP')) THEN 
        RAISE_APPLICATION_ERROR(-20006, 'Group ' || :NEW.group || ' already exists in table GLPI_PROD.REF_GROUP');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Création du trigger pour LOCATIONS
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_locations
BEFORE INSERT OR UPDATE ON GLPI_PROD.LOCATIONS
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        SELECT GLPI_PROD.seq_id_locations.nextval INTO :NEW.location_id FROM dual;
    END IF;
    --mise en capitales 1ere lettre et les autres en minimuscule
    :NEW.city := INIT_CAP(:NEW.city);
    :NEW.site := INIT_CAP(:NEW.site);
    --Creation de la location
    :NEW.location := :NEW.city ||' - '|| :NEW.site;
    IF (CHECK_DEPENDENCY(:NEW.location, 'location', 'LOCATION')) THEN 
        RAISE_APPLICATION_ERROR(-20008, 'Location ' || :NEW.location || ' already exists in table GLPI_PROD.LOCATIONS');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Création du trigger pour HARDWARES
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_hardwares
BEFORE INSERT OR UPDATE ON GLPI_PROD.HARDWARES
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        SELECT GLPI_PROD.seq_id_hardwares.nextval INTO :NEW.hardware_id FROM dual;
    END IF;
    --mise en capitales 1ere lettre et les autres en minimuscule
    :NEW.model := INIT_CAP(:NEW.model);
    :NEW.name := INIT_CAP(:NEW.name);
    :NEW.brand := INIT_CAP(:NEW.brand);   
    --vérification de la coherence de la purchase_date
    IF(:NEW.purchase_date > CURRENT_TIMESTAMP OR :NEW.purchase_date < ADD_MONTHS(CURRENT_TIMESTAMP, -1200))
    THEN 
        RAISE_APPLICATION_ERROR(-20007,'Invalid purchase_date, too old or has not yet passed.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Création du trigger pour USERS
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_users
BEFORE INSERT OR UPDATE ON GLPI_PROD.USERS
FOR EACH ROW
BEGIN
    IF INSERTING THEN
      SELECT GLPI_PROD.seq_id_users.nextval INTO :NEW.user_id FROM dual;
    END IF;
    IF (CHECK_DEPENDENCY(:NEW.email, 'email', 'USERS')) THEN 
        RAISE_APPLICATION_ERROR(-20009, 'Email ' || :NEW.email || ' already exists in table GLPI_PROD.LOCATIONS');
    END IF;
    
     -- Vérifier si la valeur de fk_location existe dans la table LOCATIONS
    IF NOT CHECK_DEPENDENCY(:NEW.fk_location, 'location_id', 'LOCATIONS') THEN 
        RAISE_APPLICATION_ERROR(-20010, 'Location with ID ' || :NEW.fk_location || ' does not exist in table GLPI_PROD.LOCATIONS');
    END IF;
    
    :NEW.last_name := INIT_CAP(:NEW.last_name);
    :NEW.first_name := INIT_CAP(:NEW.first_name);
    :NEW.company := INIT_CAP(:NEW.company);
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Création du trigger pour TICKETS
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_tickets
BEFORE INSERT ON GLPI_PROD.TICKETS
FOR EACH ROW
BEGIN
    SELECT GLPI_PROD.seq_id_tickets.nextval INTO :NEW.ticket_id FROM dual;
    
    -- Vérifier si la valeur de fk_created_by existe dans la table USERS
    IF NOT CHECK_DEPENDENCY(:NEW.fk_created_by, 'user_id', 'USERS') THEN 
        RAISE_APPLICATION_ERROR(-20011, 'User with ID ' || :NEW.fk_created_by || ' does not exist in table GLPI_PROD.USERS');
    END IF;
    
    -- Vérifier si la valeur de fk_type existe dans la table REF_type
    IF NOT CHECK_DEPENDENCY(:NEW.fk_type, 'type_id', 'REF_type') THEN 
        RAISE_APPLICATION_ERROR(-20012, 'Type with ID ' || :NEW.fk_type || ' does not exist in table GLPI_PROD.REF_type');
    END IF;
    
    -- Vérifier si la valeur de fk_priority existe dans la table REF_priority
    IF NOT CHECK_DEPENDENCY(:NEW.fk_priority, 'priority_id', 'REF_priority') THEN 
        RAISE_APPLICATION_ERROR(-20013, 'Priority with ID ' || :NEW.fk_priority || ' does not exist in table GLPI_PROD.REF_priority');
    END IF;
    
    -- Vérifier si la valeur de fk_location existe dans la table LOCATIONS
    IF NOT CHECK_DEPENDENCY(:NEW.fk_location, 'location_id', 'LOCATIONS') THEN 
        RAISE_APPLICATION_ERROR(-20014, 'Location with ID ' || :NEW.fk_location || ' does not exist in table GLPI_PROD.LOCATIONS');
    END IF;
    
    -- Vérifier si la valeur de fk_assigned_group existe dans la table REF_group
    IF NOT CHECK_DEPENDENCY(:NEW.fk_assigned_group, '"group_id"', 'REF_group') THEN 
        RAISE_APPLICATION_ERROR(-20015, 'Group with ID ' || :NEW.fk_assigned_group || ' does not exist in table GLPI_PROD.REF_group');
    END IF;
    
    -- Vérifier si la valeur de fk_status existe dans la table REF_status
    IF NOT CHECK_DEPENDENCY(:NEW.fk_status, 'status_id', 'REF_status') THEN 
        RAISE_APPLICATION_ERROR(-20016, 'Status with ID ' || :NEW.fk_status || ' does not exist in table GLPI_PROD.REF_status');
    END IF;
    
    -- Vérifier si la valeur de fk_category existe dans la table REF_category
    IF NOT CHECK_DEPENDENCY(:NEW.fk_category, 'category_id', 'REF_category') THEN 
        RAISE_APPLICATION_ERROR(-20017, 'Category with ID ' || :NEW.fk_category || ' does not exist in table GLPI_PROD.REF_category');
    END IF;
    
    -- Vérifier si la valeur de fk_hardwares existe dans la table
    IF NOT CHECK_DEPENDENCY(:NEW.fk_hardwares, 'hardware_id', 'HARDWARES') THEN 
        RAISE_APPLICATION_ERROR(-20018, 'Hardware with ID ' || :NEW.fk_hardwares || ' does not exist in table GLPI_PROD.HARDWARES');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Création du trigger pour COMMENTS
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_comments
BEFORE INSERT ON GLPI_PROD.COMMENTS
FOR EACH ROW
BEGIN
    SELECT GLPI_PROD.seq_id_comments.nextval INTO :NEW.comment_id FROM dual;
    
    -- Vérifier si la valeur de fk_ticket existe dans la table TICKETS
    IF NOT CHECK_DEPENDENCY(:NEW.fk_ticket, 'ticket_id', 'TICKETS') THEN 
        RAISE_APPLICATION_ERROR(-20019, 'Ticket with ID ' || :NEW.fk_ticket || ' does not exist in table GLPI_PROD.TICKETS');
    END IF;
    
    -- Vérifier si la valeur de fk_user existe dans la table USERS
    IF NOT CHECK_DEPENDENCY(:NEW.fk_user, 'user_id', 'USERS') THEN 
        RAISE_APPLICATION_ERROR(-20020, 'User with ID ' || :NEW.fk_user || ' does not exist in table GLPI_PROD.USERS');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Création du trigger pour RESSOURCES
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_ressources
BEFORE INSERT ON GLPI_PROD.RESSOURCES
FOR EACH ROW
BEGIN
    SELECT GLPI_PROD.seq_id_ressources.nextval INTO :NEW.ressource_id FROM dual;
    
    -- Vérifier si la valeur de fk_ticket existe dans la table TICKETS
    IF NOT CHECK_DEPENDENCY(:NEW.fk_ticket, 'ticket_id', 'TICKETS') THEN 
        RAISE_APPLICATION_ERROR(-20021, 'Ticket with ID ' || :NEW.fk_ticket || ' does not exist in table GLPI_PROD.TICKETS');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Création du trigger pour TICKET_RESSOURCES
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_ticket_ressources
BEFORE INSERT ON GLPI_PROD.TICKET_RESSOURCES
FOR EACH ROW
BEGIN
    -- Vérifier si la valeur de fk_ressource existe dans la table RESSOURCES
    IF NOT CHECK_DEPENDENCY(:NEW.fk_ressource, 'ressource_id', 'RESSOURCES') THEN 
        RAISE_APPLICATION_ERROR(-20022, 'Ressource with ID ' || :NEW.fk_ressource || ' does not exist in table GLPI_PROD.RESSOURCES');
    END IF;
    
    -- Vérifier si la valeur de fk_ticket existe dans la table TICKETS
    IF NOT CHECK_DEPENDENCY(:NEW.fk_ticket, 'ticket_id', 'TICKETS') THEN 
        RAISE_APPLICATION_ERROR(-20023, 'Ticket with ID ' || :NEW.fk_ticket || ' does not exist in table GLPI_PROD.TICKETS');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Création du trigger pour COMMENT_RESSOURCES
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_comment_ressources
BEFORE INSERT ON GLPI_PROD.COMMENT_RESSOURCES
FOR EACH ROW
BEGIN
    -- Vérifier si la valeur de fk_ressource existe dans la table RESSOURCES
    IF NOT CHECK_DEPENDENCY(:NEW.fk_ressource, 'ressource_id', 'RESSOURCES') THEN 
        RAISE_APPLICATION_ERROR(-20024, 'Ressource with ID ' || :NEW.fk_ressource || ' does not exist in table GLPI_PROD.RESSOURCES');
    END IF;
    
    -- Vérifier si la valeur de fk_comment existe dans la table COMMENTS
    IF NOT CHECK_DEPENDENCY(:NEW.fk_comment, 'comment_id', 'COMMENTS') THEN 
        RAISE_APPLICATION_ERROR(-20025, 'Comment with ID ' || :NEW.fk_comment || ' does not exist in table GLPI_PROD.COMMENTS');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Création du trigger pour OBSERVERS
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_observers
BEFORE INSERT ON GLPI_PROD.OBSERVERS
FOR EACH ROW
BEGIN
    -- Vérifier si la valeur de fk_ticket existe dans la table TICKETS
    IF NOT CHECK_DEPENDENCY(:NEW.fk_ticket, 'ticket_id', 'TICKETS') THEN 
        RAISE_APPLICATION_ERROR(-20026, 'Ticket with ID ' || :NEW.fk_ticket || ' does not exist in table GLPI_PROD.TICKETS');
    END IF;
    
    -- Vérifier si la valeur de fk_user existe dans la table USERS
    IF NOT CHECK_DEPENDENCY(:NEW.fk_user, 'user_id', 'USERS') THEN 
        RAISE_APPLICATION_ERROR(-20027, 'User with ID ' || :NEW.fk_user || ' does not exist in table GLPI_PROD.USERS');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

-- Création du trigger pour ASSIGNED_TO
CREATE OR REPLACE TRIGGER GLPI_PROD.trg_next_id_assigned_to
BEFORE INSERT ON GLPI_PROD.ASSIGNED_TO
FOR EACH ROW
BEGIN
    -- Vérifier si la valeur de fk_ticket existe dans la table TICKETS
    IF NOT CHECK_DEPENDENCY(:NEW.fk_ticket, 'ticket_id', 'TICKETS') THEN 
        RAISE_APPLICATION_ERROR(-20028, 'Ticket with ID ' || :NEW.fk_ticket || ' does not exist in table GLPI_PROD.TICKETS');
    END IF;
    
    -- Vérifier si la valeur de fk_user existe dans la table USERS
    IF NOT CHECK_DEPENDENCY(:NEW.fk_user, 'user_id', 'USERS') THEN 
        RAISE_APPLICATION_ERROR(-20029, 'User with ID ' || :NEW.fk_user || ' does not exist in table GLPI_PROD.USERS');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;
/

    