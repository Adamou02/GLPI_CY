-- Vidage des donn�es de la table de liaison entre les tickets et les utilisateurs (observateurs)
TRUNCATE TABLE GLPI_TEST.OBSERVERS;

-- Vidage des donn�es de la table de liaison entre les tickets et les utilisateurs (responsables)
TRUNCATE TABLE GLPI_TEST.ASSIGNED_TO;

-- Vidage des donn�es de la table de liaison entre les commentaires et les ressources
TRUNCATE TABLE GLPI_TEST.COMMENT_RESSOURCES;

-- Vidage des donn�es de la table de liaison entre les tickets et les ressources
TRUNCATE TABLE GLPI_TEST.TICKET_RESSOURCES;

-- Vidage des donn�es de la table qui stocke les ressources disponibles
TRUNCATE TABLE GLPI_TEST.RESSOURCES;

-- Vidage des donn�es de la table qui stocke les commentaires associ�s � chaque ticket
TRUNCATE TABLE GLPI_TEST.COMMENTS;

-- Vidage des donn�es de la table principale qui contient les d�tails de chaque ticket de support
TRUNCATE TABLE GLPI_TEST.TICKETS;

-- Vidage des donn�es de la table qui stocke les informations sur les utilisateurs de l'outil de ticketing
TRUNCATE TABLE GLPI_TEST.USERS;

-- Vidage des donn�es de la table qui stocke les d�tails sur le mat�riel concern� par les tickets
TRUNCATE TABLE GLPI_TEST.HARDWARES;

-- Vidage des donn�es de la table qui stocke les d�tails sur les emplacements physiques associ�s aux tickets
TRUNCATE TABLE GLPI_TEST.LOCATIONS;

-- Vidage des donn�es de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de groupes pour les tickets
TRUNCATE TABLE GLPI_TEST.REF_group;

-- Vidage des donn�es de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de r�les pour les tickets
TRUNCATE TABLE GLPI_TEST.REF_role;

-- Vidage des donn�es de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de types pour les tickets
TRUNCATE TABLE GLPI_TEST.REF_type;

-- Vidage des donn�es de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de cat�gories pour les tickets
TRUNCATE TABLE GLPI_TEST.REF_category;

-- Vidage des donn�es de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de statuts pour les tickets
TRUNCATE TABLE GLPI_TEST.REF_status;

-- Vidage des donn�es de la table de r�f�rence contient une liste pr�d�finie de valeurs pour les priorit�s des commentaires
TRUNCATE TABLE GLPI_TEST.REF_priority;

-- Vidage des donn�es de la table de liaison entre les tickets et les utilisateurs (observateurs)
TRUNCATE TABLE GLPI_PROD.OBSERVERS;

-- Vidage des donn�es de la table de liaison entre les tickets et les utilisateurs (responsables)
TRUNCATE TABLE GLPI_PROD.ASSIGNED_TO;

-- Vidage des donn�es de la table de liaison entre les commentaires et les ressources
TRUNCATE TABLE GLPI_PROD.COMMENT_RESSOURCES;

-- Vidage des donn�es de la table de liaison entre les tickets et les ressources
TRUNCATE TABLE GLPI_PROD.TICKET_RESSOURCES;

-- Vidage des donn�es de la table qui stocke les ressources disponibles
TRUNCATE TABLE GLPI_PROD.RESSOURCES;

-- Vidage des donn�es de la table qui stocke les commentaires associ�s � chaque ticket
TRUNCATE TABLE GLPI_PROD.COMMENTS;

-- Vidage des donn�es de la table principale qui contient les d�tails de chaque ticket de support
TRUNCATE TABLE GLPI_PROD.TICKETS;

-- Vidage des donn�es de la table qui stocke les informations sur les utilisateurs de l'outil de ticketing
TRUNCATE TABLE GLPI_PROD.USERS;

-- Vidage des donn�es de la table qui stocke les d�tails sur le mat�riel concern� par les tickets
TRUNCATE TABLE GLPI_PROD.HARDWARES;

-- Vidage des donn�es de la table qui stocke les d�tails sur les emplacements physiques associ�s aux tickets
TRUNCATE TABLE GLPI_PROD.LOCATIONS;

-- Vidage des donn�es de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de groupes pour les tickets
TRUNCATE TABLE GLPI_PROD.REF_group;

-- Vidage des donn�es de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de r�les pour les tickets
TRUNCATE TABLE GLPI_PROD.REF_role;

-- Vidage des donn�es de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de types pour les tickets
TRUNCATE TABLE GLPI_PROD.REF_type;

-- Vidage des donn�es de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de cat�gories pour les tickets
TRUNCATE TABLE GLPI_PROD.REF_category;

-- Vidage des donn�es de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de statuts pour les tickets
TRUNCATE TABLE GLPI_PROD.REF_status;

-- Vidage des donn�es de la table de r�f�rence contient une liste pr�d�finie de valeurs pour les priorit�s des commentaires
TRUNCATE TABLE GLPI_PROD.REF_priority;

COMMIT;
EXIT;
