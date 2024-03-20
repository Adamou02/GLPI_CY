-- CREATION DES TABLES
-- Les colonnes qui sont entre guillemets, le sont pour qu’Oracle ne la confonde pas avec des mots potentiellement réservées


-- Table de référence contient une liste prédéfinie de valeurs pour les priorités des commentaires. Elle garantit la cohérence dans le niveau de priorité attribué à un commentaire. 
CREATE TABLE GLPI_PROD.REF_priority (
    priority_id INT PRIMARY KEY,  -- Identifiant unique de la priorité
    "priority" VARCHAR2(10) NOT NULL UNIQUE  -- Valeur de la priorité, unique et non nullable
);

-- Table de référence qui permet de définir une liste prédéfinie de valeurs pour les statuts du ticket.
CREATE TABLE GLPI_PROD.REF_status (
    status_id INT PRIMARY KEY,  -- Identifiant unique du statut
    status VARCHAR2(50) NOT NULL UNIQUE  -- Valeur du statut, unique et non nullable
);

-- Table de référence qui permet de définir une liste prédéfinie de catégories pour les tickets.
CREATE TABLE GLPI_PROD.REF_category (
    category_id INT PRIMARY KEY,  -- Identifiant unique de la catégorie
    "category" VARCHAR2(50) NOT NULL UNIQUE  -- Valeur de la catégorie, unique et non nullable
);

-- Table de référence qui permet de définir une liste prédéfinie de types pour les tickets. 
CREATE TABLE GLPI_PROD.REF_type (
    type_id INT PRIMARY KEY,  -- Identifiant unique du type
    "type" VARCHAR2(50) NOT NULL UNIQUE  -- Valeur du type, unique et non nullable
);

-- Table de référence qui permet de définir une liste prédéfinie de rôles pour les tickets. 
CREATE TABLE GLPI_PROD.REF_role (
    role_id INT PRIMARY KEY,  -- Identifiant unique du rôle
    "role" VARCHAR2(50) NOT NULL UNIQUE  -- Valeur du rôle, unique et non nullable
);

-- Table qui stocke les détails sur les emplacements physiques associés aux tickets.
CREATE TABLE GLPI_PROD.LOCATIONS (
    location_id INT PRIMARY KEY,  -- Identifiant unique de l'emplacement
    city VARCHAR2(50),  -- Ville de l'emplacement
    "site" VARCHAR2(50),  -- Site de l'emplacement
    "location" VARCHAR2(103) UNIQUE  -- Concaténation de city + site, unique
);

-- Table de référence qui permet de définir une liste prédéfinie de groupes pour les tickets. 
CREATE TABLE GLPI_PROD.REF_group (
    "group_id" INT PRIMARY KEY,  -- Identifiant unique du groupe
    "group" VARCHAR2(50)  -- Nom du groupe, entre guillemets pour éviter les conflits de nom
);

--  Table qui stocke les détails sur le matériel concerné par les tickets.
CREATE TABLE GLPI_PROD.HARDWARES (
    hardware_id INT PRIMARY KEY,  -- Identifiant unique du matériel
    "name" VARCHAR2(50) UNIQUE,  -- Nom du matériel, unique
    "model" VARCHAR2(50),  -- Modèle du matériel
    brand VARCHAR2(50),  -- Marque du matériel
    purchase_date TIMESTAMP  -- Date d'achat du matériel
);

-- Table qui stocke les informations sur les utilisateurs de l’outil de ticketing
CREATE TABLE GLPI_PROD.USERS (
    user_id INT PRIMARY KEY,  -- Identifiant unique de l'utilisateur
    fk_role INT,  -- Clé étrangère vers le role de l'utilisateur
    fk_group INT,  -- Clé étrangère vers le groupe de l'utilisateur
    "password" VARCHAR2(255) NOT NULL -- Mot de passe de l'utilisateur, contraintes appliquées
    CHECK ( 
        LENGTH("password") >= 14
        AND REGEXP_LIKE("password", '[0-9]')
        AND REGEXP_LIKE("password", '[A-Z]')
        AND REGEXP_LIKE("password", '[a-z]')
        AND REGEXP_LIKE("password", '[[:punct:]]')
    ),
    email VARCHAR2(50) NOT NULL UNIQUE -- Adresse email de l'utilisateur, contraintes appliquées
        CHECK(REGEXP_LIKE(email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')),
    last_name VARCHAR2(50),  -- Nom de famille de l'utilisateur
    first_name VARCHAR2(50),  -- Prénom de l'utilisateur
    company VARCHAR2(50),  -- Nom de l'entreprise de l'utilisateur
    fk_location INT,  -- Clé étrangère vers l'emplacement de l'utilisateur
    FOREIGN KEY (fk_role) REFERENCES GLPI_PROD.REF_role(role_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_group) REFERENCES GLPI_PROD.REF_group("group_id"),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_location) REFERENCES GLPI_PROD.LOCATIONS(location_id)  -- Contrainte de clé étrangère
);

-- C'est la table principale qui contient les détails de chaque ticket de support.
CREATE TABLE GLPI_PROD.TICKETS (
    ticket_id INT PRIMARY KEY,  -- Identifiant unique du ticket
    fk_created_by INT,  -- Clé étrangère vers l'utilisateur qui a creé le ticket
    fk_type INT,  -- Clé étrangère vers le type de ticket
    fk_priority INT,  -- Clé étrangère vers la priorité du ticket
    title VARCHAR2(100),  -- Titre du ticket
    "description" VARCHAR2(2000),  -- Description du ticket
    fk_location INT,  -- Clé étrangère vers l'emplacement du ticket
    creation_datetime TIMESTAMP,  -- Date et heure de création du ticket
    last_modification_datetime TIMESTAMP,  -- Date et heure de derniére modification du ticket
    resolution_datetime TIMESTAMP,  -- Date et heure de résolution du ticket
    resolution_note VARCHAR2(2000),  -- Note de résolution du ticket
    closing_datetime TIMESTAMP,  -- Date et heure de clôture du ticket
    fk_assigned_group INT,  -- Clé étrangère vers le groupe assigné au ticket
    fk_status INT, -- Clé étrangère vers le statut du ticket
    fk_category INT,  -- Clé étrangère vers la catégorie du ticket
    fk_hardwares INT NULL,  -- Clé étrangère vers le matériel associé au ticket (peut être NULL)
    FOREIGN KEY (fk_user) REFERENCES GLPI_PROD.USERS(user_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_type) REFERENCES GLPI_PROD.REF_type(type_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_priority) REFERENCES GLPI_PROD.REF_priority(priority_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_location) REFERENCES GLPI_PROD.LOCATIONS(location_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_assigned_group) REFERENCES GLPI_PROD.REF_group("group_id"),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_status) REFERENCES GLPI_PROD.REF_status(status_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_category) REFERENCES GLPI_PROD.REF_category(category_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_hardwares) REFERENCES GLPI_PROD.HARDWARES(hardware_id)  -- Contrainte de clé étrangère
);
-- CLOB (Character Large Object) permet de stocker des string de plus de 4000 caractères. Cela est nécessaire pour nos images stockées en base64.

-- Table stocke les commentaires associés à chaque ticket.
CREATE TABLE GLPI_PROD.COMMENTS (
    comment_id INT PRIMARY KEY,  -- Identifiant unique du commentaire
    fk_answer_to INT,  -- Clé étrangère vers le commentaire auquel il répond (peut être NULL)
    fk_ticket INT,  -- Clé étrangère vers le ticket associé au commentaire
    fk_user INT,  -- Clé étrangère vers l'utilisateur ayant posté le commentaire
    creation_datetime TIMESTAMP,  -- Date et heure de création du commentaire
    task VARCHAR2(255),  -- Tâche liée au commentaire
    "content" CLOB,  -- Contenu du commentaire
    FOREIGN KEY (fk_answer_to) REFERENCES GLPI_PROD.COMMENTS(comment_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_PROD.TICKETS(ticket_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_user) REFERENCES GLPI_PROD.USERS(user_id)  -- Contrainte de clé étrangère
);

-- Table qui stocke les ressources disponibles.Les ressources peuvent être des fichiers, des liens, ou d'autres types de documents qui peuvent être associés à des tickets ou des commentaires.
CREATE TABLE GLPI_PROD.RESSOURCES (
    ressource_id INT PRIMARY KEY,  -- Identifiant unique de la ressource
    fk_ticket INT,  -- Clé étrangère vers le ticket associé é la ressource
    ressource CLOB,  -- Contenu de la ressource
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_PROD.TICKETS(ticket_id)  -- Contrainte de clé étrangère
);

-- Table de liaison entre les tickets et les ressources. Elle permet de gérer la relation 1-n entre les tickets et les ressources.
CREATE TABLE GLPI_PROD.TICKET_RESSOURCES (
    fk_ressource INT,  -- Clé étrangère vers la ressource
    fk_ticket INT,  -- Clé étrangère vers le ticket
    PRIMARY KEY (fk_ressource, fk_ticket),  -- Clé primaire composée
    FOREIGN KEY (fk_ressource) REFERENCES GLPI_PROD.RESSOURCES(ressource_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_PROD.TICKETS(ticket_id)  -- Contrainte de clé étrangère
);

-- Table de liaison entre les commentaireset les ressources. Elle permet de gérer la relation 1-n entre les commentaires et les ressources.
CREATE TABLE GLPI_PROD.COMMENT_RESSOURCES (
    fk_ressource INT,  -- Clé étrangère vers la ressource
    fk_comment INT,  -- Clé étrangère vers le commentaire
    PRIMARY KEY (fk_ressource, fk_comment),  -- Clé primaire composée
    FOREIGN KEY (fk_ressource) REFERENCES GLPI_PROD.RESSOURCES(ressource_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_comment) REFERENCES GLPI_PROD.COMMENTS(comment_id)  -- Contrainte de clé étrangère
);

-- Table de liaison entre les tickets et les users. Elle permet de gérer la relation n-n des observateurs des tickets.a
CREATE TABLE GLPI_PROD.OBSERVERS (
    fk_ticket INT,  -- Clé étrangère vers le ticket
    fk_user INT,  -- Clé étrangère vers l'utilisateur (observateur)
    PRIMARY KEY (fk_ticket, fk_user),  -- Clé primaire composée
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_PROD.TICKETS(ticket_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_user) REFERENCES GLPI_PROD.USERS(user_id)  -- Contrainte de clé étrangère
);

-- Table de liaison entre les tickets et les users. Elle permet de gérer la relation n-n des responsables des tickets.
CREATE TABLE GLPI_PROD.ASSIGNED_TO (
    fk_ticket INT,  -- Clé étrangère vers le ticket
    fk_user INT,  -- Clé étrangère vers l'utilisateur (responsable)
    PRIMARY KEY (fk_ticket, fk_user),  -- Clé primaire composée
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_PROD.TICKETS(ticket_id),  -- Contrainte de clé étrangère
    FOREIGN KEY (fk_user) REFERENCES GLPI_PROD.USERS(user_id)  -- Contrainte de clé étrangère
);

COMMIT;
EXIT;
