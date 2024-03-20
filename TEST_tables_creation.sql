-- CREATION DES TABLES
-- Les colonnes qui sont entre guillemets, le sont pour qu�Oracle ne la confonde pas avec des mots potentiellement r�serv�es


-- Table de r�f�rence contient une liste pr�d�finie de valeurs pour les priorit�s des commentaires. Elle garantit la coh�rence dans le niveau de priorit� attribu� � un commentaire. 
CREATE TABLE GLPI_TEST.REF_priority (
    priority_id INT PRIMARY KEY,  -- Identifiant unique de la priorit�
    "priority" VARCHAR2(10) NOT NULL UNIQUE  -- Valeur de la priorit�, unique et non nullable
);

-- Table de r�f�rence qui permet de d�finir une liste pr�d�finie de valeurs pour les statuts du ticket.
CREATE TABLE GLPI_TEST.REF_status (
    status_id INT PRIMARY KEY,  -- Identifiant unique du statut
    status VARCHAR2(50) NOT NULL UNIQUE  -- Valeur du statut, unique et non nullable
);

-- Table de r�f�rence qui permet de d�finir une liste pr�d�finie de cat�gories pour les tickets.
CREATE TABLE GLPI_TEST.REF_category (
    category_id INT PRIMARY KEY,  -- Identifiant unique de la cat�gorie
    "category" VARCHAR2(50) NOT NULL UNIQUE  -- Valeur de la cat�gorie, unique et non nullable
);

-- Table de r�f�rence qui permet de d�finir une liste pr�d�finie de types pour les tickets. 
CREATE TABLE GLPI_TEST.REF_type (
    type_id INT PRIMARY KEY,  -- Identifiant unique du type
    "type" VARCHAR2(50) NOT NULL UNIQUE  -- Valeur du type, unique et non nullable
);

-- Table de r�f�rence qui permet de d�finir une liste pr�d�finie de r�les pour les tickets. 
CREATE TABLE GLPI_TEST.REF_role (
    role_id INT PRIMARY KEY,  -- Identifiant unique du r�le
    "role" VARCHAR2(50) NOT NULL UNIQUE  -- Valeur du r�le, unique et non nullable
);

-- Table qui stocke les d�tails sur les emplacements physiques associ�s aux tickets.
CREATE TABLE GLPI_TEST.LOCATIONS (
    location_id INT PRIMARY KEY,  -- Identifiant unique de l'emplacement
    city VARCHAR2(50),  -- Ville de l'emplacement
    "site" VARCHAR2(50),  -- Site de l'emplacement
    "location" VARCHAR2(103) UNIQUE  -- Concat�nation de city + site, unique
);

-- Table de r�f�rence qui permet de d�finir une liste pr�d�finie de groupes pour les tickets. 
CREATE TABLE GLPI_TEST.REF_group (
    "group_id" INT PRIMARY KEY,  -- Identifiant unique du groupe
    "group" VARCHAR2(50)  -- Nom du groupe, entre guillemets pour �viter les conflits de nom
);

--  Table qui stocke les d�tails sur le mat�riel concern� par les tickets.
CREATE TABLE GLPI_TEST.HARDWARES (
    hardware_id INT PRIMARY KEY,  -- Identifiant unique du mat�riel
    "name" VARCHAR2(50) UNIQUE,  -- Nom du mat�riel, unique
    "model" VARCHAR2(50),  -- Mod�le du mat�riel
    brand VARCHAR2(50),  -- Marque du mat�riel
    purchase_date TIMESTAMP  -- Date d'achat du mat�riel
);

-- Table qui stocke les informations sur les utilisateurs de l�outil de ticketing
CREATE TABLE GLPI_TEST.USERS (
    user_id INT PRIMARY KEY,  -- Identifiant unique de l'utilisateur
    fk_role INT,  -- Cl� �trang�re vers le role de l'utilisateur
    fk_group INT,  -- Cl� �trang�re vers le groupe de l'utilisateur
    "password" VARCHAR2(255) NOT NULL -- Mot de passe de l'utilisateur, contraintes appliqu�es
    CHECK ( 
        LENGTH("password") >= 14
        AND REGEXP_LIKE("password", '[0-9]')
        AND REGEXP_LIKE("password", '[A-Z]')
        AND REGEXP_LIKE("password", '[a-z]')
        AND REGEXP_LIKE("password", '[[:punct:]]')
    ),
    email VARCHAR2(50) NOT NULL UNIQUE -- Adresse email de l'utilisateur, contraintes appliqu�es
        CHECK(REGEXP_LIKE(email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')),
    last_name VARCHAR2(50),  -- Nom de famille de l'utilisateur
    first_name VARCHAR2(50),  -- Pr�nom de l'utilisateur
    company VARCHAR2(50),  -- Nom de l'entreprise de l'utilisateur
    fk_location INT,  -- Cl� �trang�re vers l'emplacement de l'utilisateur
    FOREIGN KEY (fk_role) REFERENCES GLPI_TEST.REF_role(role_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_group) REFERENCES GLPI_TEST.REF_group("group_id"),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_location) REFERENCES GLPI_TEST.LOCATIONS(location_id)  -- Contrainte de cl� �trang�re
);

-- C'est la table principale qui contient les d�tails de chaque ticket de support.
CREATE TABLE GLPI_TEST.TICKETS (
    ticket_id INT PRIMARY KEY,  -- Identifiant unique du ticket
    fk_created_by_user INT,  -- Cl� �trang�re vers l'utilisateur qui a cre� le ticket
    fk_type INT,  -- Cl� �trang�re vers le type de ticket
    fk_priority INT,  -- Cl� �trang�re vers la priorit� du ticket
    title VARCHAR2(100),  -- Titre du ticket
    "description" VARCHAR2(2000),  -- Description du ticket
    fk_location INT,  -- Cl� �trang�re vers l'emplacement du ticket
    creation_datetime TIMESTAMP,  -- Date et heure de cr�ation du ticket
    last_modification_datetime TIMESTAMP,  -- Date et heure de derni�re modification du ticket
    resolution_datetime TIMESTAMP,  -- Date et heure de r�solution du ticket
    resolution_note VARCHAR2(2000),  -- Note de r�solution du ticket
    closing_datetime TIMESTAMP,  -- Date et heure de cl�ture du ticket
    fk_assigned_group INT,  -- Cl� �trang�re vers le groupe assign� au ticket
    fk_status INT, -- Cl� �trang�re vers le statut du ticket
    fk_category INT,  -- Cl� �trang�re vers la cat�gorie du ticket
    fk_hardwares INT NULL,  -- Cl� �trang�re vers le mat�riel associ� au ticket (peut �tre NULL)
    FOREIGN KEY (fk_user) REFERENCES GLPI_TEST.USERS(user_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_type) REFERENCES GLPI_TEST.REF_type(type_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_priority) REFERENCES GLPI_TEST.REF_priority(priority_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_location) REFERENCES GLPI_TEST.LOCATIONS(location_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_assigned_group) REFERENCES GLPI_TEST.REF_group("group_id"),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_status) REFERENCES GLPI_TEST.REF_status(status_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_category) REFERENCES GLPI_TEST.REF_category(category_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_hardwares) REFERENCES GLPI_TEST.HARDWARES(hardware_id)  -- Contrainte de cl� �trang�re
);
-- CLOB (Character Large Object) permet de stocker des string de plus de 4000 caract�res. Cela est n�cessaire pour nos images stock�es en base64.

-- Table stocke les commentaires associ�s � chaque ticket.
CREATE TABLE GLPI_TEST.COMMENTS (
    comment_id INT PRIMARY KEY,  -- Identifiant unique du commentaire
    fk_answer_to INT,  -- Cl� �trang�re vers le commentaire auquel il r�pond (peut �tre NULL)
    fk_ticket INT,  -- Cl� �trang�re vers le ticket associ� au commentaire
    fk_user INT,  -- Cl� �trang�re vers l'utilisateur ayant post� le commentaire
    creation_datetime TIMESTAMP,  -- Date et heure de cr�ation du commentaire
    task VARCHAR2(255),  -- T�che li�e au commentaire
    "content" CLOB,  -- Contenu du commentaire
    FOREIGN KEY (fk_answer_to) REFERENCES GLPI_TEST.COMMENTS(comment_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_user) REFERENCES GLPI_TEST.USERS(user_id)  -- Contrainte de cl� �trang�re
);

-- Table qui stocke les ressources disponibles.Les ressources peuvent �tre des fichiers, des liens, ou d'autres types de documents qui peuvent �tre associ�s � des tickets ou des commentaires.
CREATE TABLE GLPI_TEST.RESSOURCES (
    ressource_id INT PRIMARY KEY,  -- Identifiant unique de la ressource
    fk_ticket INT,  -- Cl� �trang�re vers le ticket associ� � la ressource
    ressource CLOB,  -- Contenu de la ressource
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id)  -- Contrainte de cl� �trang�re
);

-- Table de liaison entre les tickets et les ressources. Elle permet de g�rer la relation 1-n entre les tickets et les ressources.
CREATE TABLE GLPI_TEST.TICKET_RESSOURCES (
    fk_ressource INT,  -- Cl� �trang�re vers la ressource
    fk_ticket INT,  -- Cl� �trang�re vers le ticket
    PRIMARY KEY (fk_ressource, fk_ticket),  -- Cl� primaire compos�e
    FOREIGN KEY (fk_ressource) REFERENCES GLPI_TEST.RESSOURCES(ressource_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id)  -- Contrainte de cl� �trang�re
);

-- Table de liaison entre les commentaireset les ressources. Elle permet de g�rer la relation 1-n entre les commentaires et les ressources.
CREATE TABLE GLPI_TEST.COMMENT_RESSOURCES (
    fk_ressource INT,  -- Cl� �trang�re vers la ressource
    fk_comment INT,  -- Cl� �trang�re vers le commentaire
    PRIMARY KEY (fk_ressource, fk_comment),  -- Cl� primaire compos�e
    FOREIGN KEY (fk_ressource) REFERENCES GLPI_TEST.RESSOURCES(ressource_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_comment) REFERENCES GLPI_TEST.COMMENTS(comment_id)  -- Contrainte de cl� �trang�re
);

-- Table de liaison entre les tickets et les users. Elle permet de g�rer la relation n-n des observateurs des tickets.a
CREATE TABLE GLPI_TEST.OBSERVERS (
    fk_ticket INT,  -- Cl� �trang�re vers le ticket
    fk_user INT,  -- Cl� �trang�re vers l'utilisateur (observateur)
    PRIMARY KEY (fk_ticket, fk_user),  -- Cl� primaire compos�e
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_user) REFERENCES GLPI_TEST.USERS(user_id)  -- Contrainte de cl� �trang�re
);

-- Table de liaison entre les tickets et les users. Elle permet de g�rer la relation n-n des responsables des tickets.
CREATE TABLE GLPI_TEST.ASSIGNED_TO (
    fk_ticket INT,  -- Cl� �trang�re vers le ticket
    fk_user INT,  -- Cl� �trang�re vers l'utilisateur (responsable)
    PRIMARY KEY (fk_ticket, fk_user),  -- Cl� primaire compos�e
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id),  -- Contrainte de cl� �trang�re
    FOREIGN KEY (fk_user) REFERENCES GLPI_TEST.USERS(user_id)  -- Contrainte de cl� �trang�re
);

COMMIT;
EXIT;