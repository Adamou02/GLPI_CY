-- Inserts pour REF_priority
INSERT INTO GLPI_PROD.REF_priority (priority_id, priority)
VALUES (1, 'Very low');

INSERT INTO GLPI_PROD.REF_priority (priority_id, priority)
VALUES (2, 'Low');

INSERT INTO GLPI_PROD.REF_priority (priority_id, priority)
VALUES (3, 'Medium');

INSERT INTO GLPI_PROD.REF_priority (priority_id, priority)
VALUES (4, 'High');

INSERT INTO GLPI_PROD.REF_priority (priority_id, priority)
VALUES (5, 'Very high');


-- Inserts pour REF_status
INSERT INTO GLPI_PROD.REF_status (status_id, status)
VALUES (1, 'To do');

INSERT INTO GLPI_PROD.REF_status (status_id, status)
VALUES (2, 'In progress');

INSERT INTO GLPI_PROD.REF_status (status_id, status)
VALUES (3, 'Done');


-- Inserts pour REF_category
INSERT INTO GLPI_PROD.REF_category (category_id, category)
VALUES (1, 'Hardware');

INSERT INTO GLPI_PROD.REF_category (category_id, category)
VALUES (2, 'Administrative');

-- Inserts pour REF_type
INSERT INTO GLPI_PROD.REF_type (type_id, type)
VALUES (1, 'Defect');

INSERT INTO GLPI_PROD.REF_type (type_id, type)
VALUES (2, 'Request');


-- Inserts pour REF_role
INSERT INTO GLPI_PROD.REF_role (role_id, role)
VALUES (1, 'Support');

INSERT INTO GLPI_PROD.REF_role (role_id, role)
VALUES (2, 'IT');

INSERT INTO GLPI_PROD.REF_role (role_id, role)
VALUES (3, 'HR');

-- Inserts pour REF_group
INSERT INTO GLPI_PROD.REF_group (group_id, "group")
VALUES (1, 'IT Team');

INSERT INTO GLPI_PROD.REF_group (group_id, "group")
VALUES (2, 'Support Team');

INSERT INTO GLPI_PROD.REF_group (group_id, "group")
VALUES (3, 'HR Department');

-- Inserts pour LOCATIONS
INSERT INTO GLPI_PROD.LOCATIONS (location_id, location)
VALUES (1, 'Building A, Floor 1');

INSERT INTO GLPI_PROD.LOCATIONS (location_id, location)
VALUES (2, 'Building B, Basement');

-- Inserts pour HARDWARES
INSERT INTO GLPI_PROD.HARDWARES (hardware_id, name)
VALUES (1, 'Desktop Computer');

INSERT INTO GLPI_PROD.HARDWARES (hardware_id, name)
VALUES (2, 'Printer');

-- Inserts pour USERS
INSERT INTO GLPI_PROD.USERS (user_id, fk_role, fk_group, last_name, first_name, company, fk_location)
VALUES (1, 1, 2, 'Smith', 'John', 'ABC Company', 1);

INSERT INTO GLPI_PROD.USERS (user_id, fk_role, fk_group, last_name, first_name, company, fk_location)
VALUES (2, 2, 1, 'Doe', 'Jane', 'XYZ Corporation', 2);

-- Inserts pour TICKETS
INSERT INTO GLPI_PROD.TICKETS (
    ticket_id, 
    fk_user, 
    fk_type, 
    fk_priority, 
    title, 
    description, 
    fk_location, 
    creation_datetime, 
    last_modification_datetime, 
    resolution_datetime, 
    resolution_note, 
    closing_datetime, 
    fk_assigned_group, 
    fk_status, 
    fk_category, 
    fk_hardwares
)
VALUES (
    1, 
    1, 
    1, 
    3, 
    'Computer not booting', 
    'Computer is displaying a black screen when powered on.', 
    1, 
    CURRENT_TIMESTAMP, 
    CURRENT_TIMESTAMP, 
    NULL, 
    NULL, 
    NULL, 
    2, 
    1, 
    1, 
    1
);

-- Inserts pour COMMENTS
INSERT INTO GLPI_PROD.COMMENTS (
    comment_id, 
    fk_answer_to, 
    fk_ticket, 
    fk_user, 
    creation_datetime, 
    task, 
    content
)
VALUES (
    1, 
    NULL, 
    1, 
    1, 
    CURRENT_TIMESTAMP, 
    'Troubleshooting', 
    'I will check the power supply and hardware components.'
);

-- Inserts pour RESSOURCES
INSERT INTO GLPI_PROD.RESSOURCES (ressource_id, fk_ticket, ressource)
VALUES (1, 1, 'Base64EncodedImageStringHere==');

-- Inserts pour TICKET_RESSOURCES
INSERT INTO GLPI_PROD.TICKET_RESSOURCES (fk_ressource, fk_ticket)
VALUES (1, 1);

-- Inserts pour COMMENT_RESSOURCES
INSERT INTO GLPI_PROD.COMMENT_RESSOURCES (fk_ressource, fk_comment)
VALUES (1, 1);

-- Inserts pour OBSERVERS
INSERT INTO GLPI_PROD.OBSERVERS (fk_ticket, fk_user)
VALUES (1, 2);

-- Inserts pour ASSIGNED_TO
INSERT INTO GLPI_PROD.ASSIGNED_TO (fk_ticket, fk_user)
VALUES (1, 1);

-- Inserts pour un deuxi?me ticket
INSERT INTO GLPI_PROD.TICKETS (
    ticket_id, 
    fk_user, 
    fk_type, 
    fk_priority, 
    title, 
    description, 
    fk_location, 
    creation_datetime, 
    last_modification_datetime, 
    resolution_datetime, 
    resolution_note, 
    closing_datetime, 
    fk_assigned_group, 
    fk_status, 
    fk_category, 
    fk_hardwares
)
VALUES (
    2, 
    2, 
    2, 
    4, 
    'Request for Software Installation', 
    'Requesting installation of Adobe Photoshop on my workstation.', 
    2, 
    CURRENT_TIMESTAMP, 
    CURRENT_TIMESTAMP, 
    NULL, 
    NULL, 
    NULL, 
    1, 
    1, 
    2, 
    NULL
);

-- Inserts pour les commentaires associ?s au deuxi?me ticket
INSERT INTO GLPI_PROD.COMMENTS (
    comment_id, 
    fk_answer_to, 
    fk_ticket, 
    fk_user, 
    creation_datetime, 
    task, 
    content
)
VALUES (
    2, 
    NULL, 
    2, 
    2, 
    CURRENT_TIMESTAMP, 
    'Request Details', 
    'Please ensure that the latest version of Adobe Photoshop is installed.'
);

COMMIT;
exit;