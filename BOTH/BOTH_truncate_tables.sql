-- Vidage des données de la table de liaison entre les tickets et les utilisateurs (observateurs)
TRUNCATE TABLE GLPI_PAU.OBSERVERS;

-- Vidage des données de la table de liaison entre les tickets et les utilisateurs (responsables)
TRUNCATE TABLE GLPI_PAU.ASSIGNED_TO;

-- Vidage des données de la table de liaison entre les commentaires et les ressources
TRUNCATE TABLE GLPI_PAU.COMMENT_RESSOURCES;

-- Vidage des données de la table de liaison entre les tickets et les ressources
TRUNCATE TABLE GLPI_PAU.TICKET_RESSOURCES;

-- Vidage des données de la table qui stocke les ressources disponibles
TRUNCATE TABLE GLPI_PAU.RESSOURCES;

-- Vidage des données de la table qui stocke les commentaires associés à chaque ticket
TRUNCATE TABLE GLPI_PAU.COMMENTS;

-- Vidage des données de la table principale qui contient les détails de chaque ticket de support
TRUNCATE TABLE GLPI_PAU.TICKETS;

-- Vidage des données de la table qui stocke les informations sur les utilisateurs de l'outil de ticketing
TRUNCATE TABLE GLPI_PAU.USERS;

-- Vidage des données de la table qui stocke les détails sur le matériel concerné par les tickets
TRUNCATE TABLE GLPI_PAU.HARDWARES;

-- Vidage des données de la table qui stocke les détails sur les emplacements physiques associés aux tickets
TRUNCATE TABLE GLPI_PAU.LOCATIONS;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de groupes pour les tickets
TRUNCATE TABLE GLPI_PAU.REF_GROUP;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de rôles pour les tickets
TRUNCATE TABLE GLPI_PAU.REF_ROLE;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de types pour les tickets
TRUNCATE TABLE GLPI_PAU.REF_TYPE;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de catégories pour les tickets
TRUNCATE TABLE GLPI_PAU.REF_CATEGORY;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de statuts pour les tickets
TRUNCATE TABLE GLPI_PAU.REF_STATUS;

-- Vidage des données de la table de référence contient une liste prédéfinie de valeurs pour les priorités des commentaires
TRUNCATE TABLE GLPI_PAU.REF_PRIORITY;

-- Vidage des données de la table de liaison entre les tickets et les utilisateurs (observateurs)
TRUNCATE TABLE GLPI_CERGY.OBSERVERS;

-- Vidage des données de la table de liaison entre les tickets et les utilisateurs (responsables)
TRUNCATE TABLE GLPI_CERGY.ASSIGNED_TO;

-- Vidage des données de la table de liaison entre les commentaires et les ressources
TRUNCATE TABLE GLPI_CERGY.COMMENT_RESSOURCES;

-- Vidage des données de la table de liaison entre les tickets et les ressources
TRUNCATE TABLE GLPI_CERGY.TICKET_RESSOURCES;

-- Vidage des données de la table qui stocke les ressources disponibles
TRUNCATE TABLE GLPI_CERGY.RESSOURCES;

-- Vidage des données de la table qui stocke les commentaires associés à chaque ticket
TRUNCATE TABLE GLPI_CERGY.COMMENTS;

-- Vidage des données de la table principale qui contient les détails de chaque ticket de support
TRUNCATE TABLE GLPI_CERGY.TICKETS;

-- Vidage des données de la table qui stocke les informations sur les utilisateurs de l'outil de ticketing
TRUNCATE TABLE GLPI_CERGY.USERS;

-- Vidage des données de la table qui stocke les détails sur le matériel concerné par les tickets
TRUNCATE TABLE GLPI_CERGY.HARDWARES;

-- Vidage des données de la table qui stocke les détails sur les emplacements physiques associés aux tickets
TRUNCATE TABLE GLPI_CERGY.LOCATIONS;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de groupes pour les tickets
TRUNCATE TABLE GLPI_CERGY.REF_GROUP;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de rôles pour les tickets
TRUNCATE TABLE GLPI_CERGY.REF_ROLE;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de types pour les tickets
TRUNCATE TABLE GLPI_CERGY.REF_TYPE;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de catégories pour les tickets
TRUNCATE TABLE GLPI_CERGY.REF_CATEGORY;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de statuts pour les tickets
TRUNCATE TABLE GLPI_CERGY.REF_STATUS;

-- Vidage des données de la table de référence contient une liste prédéfinie de valeurs pour les priorités des commentaires
TRUNCATE TABLE GLPI_CERGY.REF_PRIORITY;

COMMIT;
EXIT;
