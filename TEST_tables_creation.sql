-- Table de référence contient une liste prédéfinie de valeurs pour les priorités des commentaires. Elle garantit la cohérence dans le niveau de priorité attribué à un commentaire. 

CREATE TABLE GLPI_TEST.REF_priority (
    priority_id INT PRIMARY KEY,
    "priority" VARCHAR2(10) NOT NULL UNIQUE
);

-- Table de référence qui permet de définir une liste prédéfinie de valeurs pour les statuts du ticket.
-- priority est une VARCHAR2(10). Le CHECK nous permet de connaître à l’avance les champs possible pour cette colonne, et donc d’allouer un espace de stockage optimisé.

CREATE TABLE GLPI_TEST.REF_status (
    status_id INT PRIMARY KEY,
    "status" VARCHAR2(50) NOT NULL UNIQUE
);

-- Table de référence qui permet de définir une liste prédéfinie de catégories pour les tickets.
 
CREATE TABLE GLPI_TEST.REF_category (
    category_id INT PRIMARY KEY,
    "category" VARCHAR2(50) NOT NULL UNIQUE
);

-- Table de référence qui permet de définir une liste prédéfinie de types pour les tickets. 

CREATE TABLE GLPI_TEST.REF_type (
    type_id INT PRIMARY KEY,
    "type" VARCHAR2(50) NOT NULL UNIQUE
);

-- Table de référence qui permet de définir une liste prédéfinie de rôles pour les tickets. 

CREATE TABLE GLPI_TEST.REF_role (
    role_id INT PRIMARY KEY,
    "role" VARCHAR2(50) NOT NULL UNIQUE
);

-- Table qui stocke les détails sur les emplacements physiques associés aux tickets.

CREATE TABLE GLPI_TEST.LOCATIONS (
    location_id INT PRIMARY KEY,
    country VARCHAR2(50),
    city VARCHAR2(50),
    street VARCHAR2(50),
    address_number INT,
    address_complement VARCHAR2(50),
    "location" VARCHAR2(70)
);

-- Table de référence qui permet de définir une liste prédéfinie de groupes pour les tickets. 

CREATE TABLE GLPI_TEST.REF_group (
    group_id INT PRIMARY KEY,
    "group" VARCHAR2(50),
    fk_location INT,
    FOREIGN KEY (fk_location) REFERENCES GLPI_TEST.LOCATIONS(location_id)
);
-- La colonne “group” est entre guillemets pour qu’Oracle ne la confonde pas avec la commande sql GROUP

--  Table qui stocke les détails sur le matériel concerné par les tickets.

CREATE TABLE GLPI_TEST.HARDWARES (
    hardware_id INT PRIMARY KEY,
    "name" VARCHAR2(50),
    brand VARCHAR2(50),
    purchase_date TIMESTAMP
);


-- Table qui stocke les informations sur les utilisateurs de l’outil de ticketing

CREATE TABLE GLPI_TEST.USERS (
    user_id INT PRIMARY KEY,
    fk_role INT,
    fk_group INT,
    "password" VARCHAR2(255) NOT NULL
    CHECK ( 
        LENGTH("password") >= 14
        AND REGEXP_LIKE("password", '[0-9]')
        AND REGEXP_LIKE("password", '[A-Z]')
        AND REGEXP_LIKE("password", '[a-z]')
        AND REGEXP_LIKE("password", '[[:punct:]]')
    ),
    email VARCHAR2(50) NOT NULL UNIQUE
        CHECK(REGEXP_LIKE(email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')),
    last_name VARCHAR2(50),
    first_name VARCHAR2(50),
    company VARCHAR2(50),
    fk_location INT,
    FOREIGN KEY (fk_role) REFERENCES GLPI_TEST.REF_role(role_id),
    FOREIGN KEY (fk_group) REFERENCES GLPI_TEST.REF_group(group_id),
    FOREIGN KEY (fk_location) REFERENCES GLPI_TEST.LOCATIONS(location_id)
);
-- les <fk_value> sont des INT et correspondent à la valeur de l’id de la table correspondante. Ce sont des clés étrangères liées à d'autres tables, assurant l'intégrité référentielle entre les tables.



-- C'est la table principale qui contient les détails de chaque ticket de support.

CREATE TABLE GLPI_TEST.TICKETS (
    ticket_id INT PRIMARY KEY,
    fk_user INT,
    fk_type INT,
    fk_priority INT,
    title VARCHAR2(100),
    description VARCHAR2(2000),
    fk_location INT,
    creation_datetime TIMESTAMP,
    last_modification_datetime TIMESTAMP,
    resolution_datetime TIMESTAMP,
    resolution_note VARCHAR2(2000),
    closing_datetime TIMESTAMP,
    fk_assigned_group INT,
    fk_status INT,
    fk_category INT,
    fk_hardwares INT,
    FOREIGN KEY (fk_user) REFERENCES GLPI_TEST.USERS(user_id),
    FOREIGN KEY (fk_type) REFERENCES GLPI_TEST.REF_type(type_id),
    FOREIGN KEY (fk_priority) REFERENCES GLPI_TEST.REF_priority(priority_id),
    FOREIGN KEY (fk_location) REFERENCES GLPI_TEST.LOCATIONS(location_id),
    FOREIGN KEY (fk_assigned_group) REFERENCES GLPI_TEST.REF_group(group_id),
    FOREIGN KEY (fk_status) REFERENCES GLPI_TEST.REF_status(status_id),
    FOREIGN KEY (fk_category) REFERENCES GLPI_TEST.REF_category(category_id),
    FOREIGN KEY (fk_hardwares) REFERENCES GLPI_TEST.HARDWARES(hardware_id)
);
-- title est un VARCHAR2(100) et permettent de titrer les tickets, nous avons réduit la taille du VARCHAR2 pour optimiser l’espace de stockage. 100 caractères nous semble être suffisant pour stocker un titre.
-- les <fk_value> sont des INT et correspondent à la valeur de l’id de la table correspondante. Ce sont des clés étrangères liées à d'autres tables, assurant l'intégrité référentielle entre les tables.
-- ressources est un CLOB (Character Large Object). Cela permet de stocker des string de plus de 4000 caractères. Cela est nécessaire pour nos images stockées en base64.
-- TIMESTAMP est un type qui permet de stocker une date et heure en SQL.


-- Table stocke les commentaires associés à chaque ticket.

CREATE TABLE GLPI_TEST.COMMENTS (
    comment_id INT PRIMARY KEY,
    fk_answer_to INT,
    fk_ticket INT,
    fk_user INT,
    creation_datetime TIMESTAMP,
    task VARCHAR2(255),
    content CLOB,
    FOREIGN KEY (fk_answer_to) REFERENCES GLPI_TEST.COMMENTS(comment_id),
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id),
    FOREIGN KEY (fk_user) REFERENCES GLPI_TEST.USERS(user_id)
);
-- les <fk_value> sont des INT et correspondent à la valeur de l’id de la table correspondante. Ce sont des clés étrangères liées à d'autres tables, assurant l'intégrité référentielle entre les tables.
-- task est un VARCHAR2(255) et de décrire la tâche lié à la résolution d’un ticket. 255 caractères nous semble être suffisant pour stocker cette information.



-- Table qui stocke les ressources disponibles.Les ressources peuvent être des fichiers, des liens, ou d'autres types de documents qui peuvent être associés à des tickets ou des commentaires.

CREATE TABLE GLPI_TEST.RESSOURCES (
    ressource_id INT PRIMARY KEY,
    fk_ticket INT,
    ressource CLOB,
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id)
);
-- ressources est un CLOB (Character Large Object). Cela permet de stocker des string de plus de 4000 caractères. Cela est nécessaire pour nos images stockées en base64.



-- Table de liaison entre les tickets et les ressources. Elle permet de gérer la relation 1-n entre les tickets et les ressources.

CREATE TABLE GLPI_TEST.TICKET_RESSOURCES (
    fk_ressource INT,
    fk_ticket INT,
    PRIMARY KEY (fk_ressource, fk_ticket),
    FOREIGN KEY (fk_ressource) REFERENCES GLPI_TEST.RESSOURCES(ressource_id), -- id de la ressouces correspondante dans la table 
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id)
);
-- les <fk_value> sont des INT et correspondent à la valeur de l’id de la table correspondante. Ce sont des clés étrangères liées à d'autres tables, assurant l'intégrité référentielle entre les tables.


-- Table de liaison entre les commentaireset les ressources. Elle permet de gérer la relation 1-n entre les commentaires et les ressources.

CREATE TABLE GLPI_TEST.COMMENT_RESSOURCES (
    fk_ressource INT,
    fk_comment INT,
    PRIMARY KEY (fk_ressource, fk_comment),
    FOREIGN KEY (fk_ressource) REFERENCES GLPI_TEST.RESSOURCES(ressource_id),
    FOREIGN KEY (fk_comment) REFERENCES GLPI_TEST.COMMENTS(comment_id)
);
-- les <fk_value> sont des INT et correspondent à la valeur de l’id de la table correspondante. Ce sont des clés étrangères liées à d'autres tables, assurant l'intégrité référentielle entre les tables.


-- Table de liaison entre les tickets et les users. Elle permet de gérer la relation n-n des observateurs des tickets.

CREATE TABLE GLPI_TEST.OBSERVERS (
    fk_ticket INT,
    fk_user INT,
    PRIMARY KEY (fk_ticket, fk_user),
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id),
    FOREIGN KEY (fk_user) REFERENCES GLPI_TEST.USERS(user_id)
);
-- les <fk_value> sont des INT et correspondent à la valeur de l’id de la table correspondante. Ce sont des clés étrangères liées à d'autres tables, assurant l'intégrité référentielle entre les tables.


-- Table de liaison entre les tickets et les users. Elle permet de gérer la relation n-n des responsables des tickets.

CREATE TABLE GLPI_TEST.ASSIGNED_TO (
    fk_ticket INT,
    fk_user INT,
    PRIMARY KEY (fk_ticket, fk_user),
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id),
    FOREIGN KEY (fk_user) REFERENCES GLPI_TEST.USERS(user_id)
);
-- les <fk_value> sont des INT et correspondent à la valeur de l’id de la table correspondante. Ce sont des clés étrangères liées à d'autres tables, assurant l'intégrité référentielle entre les tables.

COMMIT;
EXIT;