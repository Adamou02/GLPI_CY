-- Table de r�f�rence contient une liste pr�d�finie de valeurs pour les priorit�s des commentaires. Elle garantit la coh�rence dans le niveau de priorit� attribu� � un commentaire. 

CREATE TABLE GLPI_TEST.REF_priority (
    priority_id INT PRIMARY KEY,
    priority VARCHAR2(10) CHECK (priority IN ('Very low', 'Low', 'Medium', 'High', 'Very high'))
);

-- Table de r�f�rence qui permet de d�finir une liste pr�d�finie de valeurs pour les statuts du ticket.
-- priority est une VARCHAR2(10). Le CHECK nous permet de conna�tre � l�avance les champs possible pour cette colonne, et donc d�allouer un espace de stockage optimis�.

CREATE TABLE GLPI_TEST.REF_status (
    status_id INT PRIMARY KEY,
    status VARCHAR2(50)
);

-- Table de r�f�rence qui permet de d�finir une liste pr�d�finie de cat�gories pour les tickets.
 
CREATE TABLE GLPI_TEST.REF_category (
    category_id INT PRIMARY KEY,
    category VARCHAR2(50)
);

-- Table de r�f�rence qui permet de d�finir une liste pr�d�finie de types pour les tickets. 

CREATE TABLE GLPI_TEST.REF_type (
    type_id INT PRIMARY KEY,
    type VARCHAR2(50)
);

-- Table de r�f�rence qui permet de d�finir une liste pr�d�finie de r�les pour les tickets. 

CREATE TABLE GLPI_TEST.REF_role (
    role_id INT PRIMARY KEY,
    role VARCHAR2(50)
);

-- Table de r�f�rence qui permet de d�finir une liste pr�d�finie de groupes pour les tickets. 

CREATE TABLE GLPI_TEST.REF_group (
    group_id INT PRIMARY KEY,
    "group" VARCHAR2(50)
);
-- La colonne �group� est entre guillemets pour qu�Oracle ne la confonde pas avec la commande sql GROUP



-- Table qui stocke les d�tails sur les emplacements physiques associ�s aux tickets.

CREATE TABLE GLPI_TEST.LOCATIONS (
    location_id INT PRIMARY KEY,
    location VARCHAR2(70)
);


--  Table qui stocke les d�tails sur le mat�riel concern� par les tickets.

CREATE TABLE GLPI_TEST.HARDWARES (
    hardware_id INT PRIMARY KEY,
    name VARCHAR2(50)
);


-- Table qui stocke les informations sur les utilisateurs de l�outil de ticketing

CREATE TABLE GLPI_TEST.USERS (
    user_id INT PRIMARY KEY,
    fk_role INT,
    fk_group INT,
    last_name VARCHAR2(50),
    first_name VARCHAR2(50),
    company VARCHAR2(50),
    fk_location INT,
    FOREIGN KEY (fk_role) REFERENCES GLPI_TEST.REF_role(role_id),
    FOREIGN KEY (fk_group) REFERENCES GLPI_TEST.REF_group(group_id),
    FOREIGN KEY (fk_location) REFERENCES GLPI_TEST.LOCATIONS(location_id)
);
-- les <fk_value> sont des INT et correspondent � la valeur de l�id de la table correspondante. Ce sont des cl�s �trang�res li�es � d'autres tables, assurant l'int�grit� r�f�rentielle entre les tables.



-- C'est la table principale qui contient les d�tails de chaque ticket de support.

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
-- title est un VARCHAR2(100) et permettent de titrer les tickets, nous avons r�duit la taille du VARCHAR2 pour optimiser l�espace de stockage. 100 caract�res nous semble �tre suffisant pour stocker un titre.
-- les <fk_value> sont des INT et correspondent � la valeur de l�id de la table correspondante. Ce sont des cl�s �trang�res li�es � d'autres tables, assurant l'int�grit� r�f�rentielle entre les tables.
-- ressources est un CLOB (Character Large Object). Cela permet de stocker des string de plus de 4000 caract�res. Cela est n�cessaire pour nos images stock�es en base64.
-- TIMESTAMP est un type qui permet de stocker une date et heure en SQL.


-- Table stocke les commentaires associ�s � chaque ticket.

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
-- les <fk_value> sont des INT et correspondent � la valeur de l�id de la table correspondante. Ce sont des cl�s �trang�res li�es � d'autres tables, assurant l'int�grit� r�f�rentielle entre les tables.
-- task est un VARCHAR2(255) et de d�crire la t�che li� � la r�solution d�un ticket. 255 caract�res nous semble �tre suffisant pour stocker cette information.



-- Table qui stocke les ressources disponibles.Les ressources peuvent �tre des fichiers, des liens, ou d'autres types de documents qui peuvent �tre associ�s � des tickets ou des commentaires.

CREATE TABLE GLPI_TEST.RESSOURCES (
    ressource_id INT PRIMARY KEY,
    fk_ticket INT,
    ressource CLOB,
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id)
);
-- ressources est un CLOB (Character Large Object). Cela permet de stocker des string de plus de 4000 caract�res. Cela est n�cessaire pour nos images stock�es en base64.



-- Table de liaison entre les tickets et les ressources. Elle permet de g�rer la relation 1-n entre les tickets et les ressources.

CREATE TABLE GLPI_TEST.TICKET_RESSOURCES (
    fk_ressource INT,
    fk_ticket INT,
    PRIMARY KEY (fk_ressource, fk_ticket),
    FOREIGN KEY (fk_ressource) REFERENCES GLPI_TEST.RESSOURCES(ressource_id), -- id de la ressouces correspondante dans la table 
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id)
);
-- les <fk_value> sont des INT et correspondent � la valeur de l�id de la table correspondante. Ce sont des cl�s �trang�res li�es � d'autres tables, assurant l'int�grit� r�f�rentielle entre les tables.


-- Table de liaison entre les commentaireset les ressources. Elle permet de g�rer la relation 1-n entre les commentaires et les ressources.

CREATE TABLE GLPI_TEST.COMMENT_RESSOURCES (
    fk_ressource INT,
    fk_comment INT,
    PRIMARY KEY (fk_ressource, fk_comment),
    FOREIGN KEY (fk_ressource) REFERENCES GLPI_TEST.RESSOURCES(ressource_id),
    FOREIGN KEY (fk_comment) REFERENCES GLPI_TEST.COMMENTS(comment_id)
);
-- les <fk_value> sont des INT et correspondent � la valeur de l�id de la table correspondante. Ce sont des cl�s �trang�res li�es � d'autres tables, assurant l'int�grit� r�f�rentielle entre les tables.


-- Table de liaison entre les tickets et les users. Elle permet de g�rer la relation n-n des observateurs des tickets.

CREATE TABLE GLPI_TEST.OBSERVERS (
    fk_ticket INT,
    fk_user INT,
    PRIMARY KEY (fk_ticket, fk_user),
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id),
    FOREIGN KEY (fk_user) REFERENCES GLPI_TEST.USERS(user_id)
);
-- les <fk_value> sont des INT et correspondent � la valeur de l�id de la table correspondante. Ce sont des cl�s �trang�res li�es � d'autres tables, assurant l'int�grit� r�f�rentielle entre les tables.


-- Table de liaison entre les tickets et les users. Elle permet de g�rer la relation n-n des responsables des tickets.

CREATE TABLE GLPI_TEST.ASSIGNED_TO (
    fk_ticket INT,
    fk_user INT,
    PRIMARY KEY (fk_ticket, fk_user),
    FOREIGN KEY (fk_ticket) REFERENCES GLPI_TEST.TICKETS(ticket_id),
    FOREIGN KEY (fk_user) REFERENCES GLPI_TEST.USERS(user_id)
);
-- les <fk_value> sont des INT et correspondent � la valeur de l�id de la table correspondante. Ce sont des cl�s �trang�res li�es � d'autres tables, assurant l'int�grit� r�f�rentielle entre les tables.
COMMIT;
exit;