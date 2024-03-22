-- Vidage des données de la table de liaison entre les tickets et les utilisateurs (observateurs)
TRUNCATE TABLE GLPI_TEST.OBSERVERS;

-- Vidage des données de la table de liaison entre les tickets et les utilisateurs (responsables)
TRUNCATE TABLE GLPI_TEST.ASSIGNED_TO;

-- Vidage des données de la table de liaison entre les commentaires et les ressources
TRUNCATE TABLE GLPI_TEST.COMMENT_RESSOURCES;

-- Vidage des données de la table de liaison entre les tickets et les ressources
TRUNCATE TABLE GLPI_TEST.TICKET_RESSOURCES;

-- Vidage des données de la table qui stocke les ressources disponibles
TRUNCATE TABLE GLPI_TEST.RESSOURCES;

-- Vidage des données de la table qui stocke les commentaires associés à chaque ticket
TRUNCATE TABLE GLPI_TEST.COMMENTS;

-- Vidage des données de la table principale qui contient les détails de chaque ticket de support
TRUNCATE TABLE GLPI_TEST.TICKETS;

-- Vidage des données de la table qui stocke les informations sur les utilisateurs de l'outil de ticketing
TRUNCATE TABLE GLPI_TEST.USERS;

-- Vidage des données de la table qui stocke les détails sur le matériel concerné par les tickets
TRUNCATE TABLE GLPI_TEST.HARDWARES;

-- Vidage des données de la table qui stocke les détails sur les emplacements physiques associés aux tickets
TRUNCATE TABLE GLPI_TEST.LOCATIONS;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de groupes pour les tickets
TRUNCATE TABLE GLPI_TEST.REF_group;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de rôles pour les tickets
TRUNCATE TABLE GLPI_TEST.REF_role;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de types pour les tickets
TRUNCATE TABLE GLPI_TEST.REF_type;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de catégories pour les tickets
TRUNCATE TABLE GLPI_TEST.REF_category;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de statuts pour les tickets
TRUNCATE TABLE GLPI_TEST.REF_status;

-- Vidage des données de la table de référence contient une liste prédéfinie de valeurs pour les priorités des commentaires
TRUNCATE TABLE GLPI_TEST.REF_priority;

-- Vidage des données de la table de liaison entre les tickets et les utilisateurs (observateurs)
TRUNCATE TABLE GLPI_PROD.OBSERVERS;

-- Vidage des données de la table de liaison entre les tickets et les utilisateurs (responsables)
TRUNCATE TABLE GLPI_PROD.ASSIGNED_TO;

-- Vidage des données de la table de liaison entre les commentaires et les ressources
TRUNCATE TABLE GLPI_PROD.COMMENT_RESSOURCES;

-- Vidage des données de la table de liaison entre les tickets et les ressources
TRUNCATE TABLE GLPI_PROD.TICKET_RESSOURCES;

-- Vidage des données de la table qui stocke les ressources disponibles
TRUNCATE TABLE GLPI_PROD.RESSOURCES;

-- Vidage des données de la table qui stocke les commentaires associés à chaque ticket
TRUNCATE TABLE GLPI_PROD.COMMENTS;

-- Vidage des données de la table principale qui contient les détails de chaque ticket de support
TRUNCATE TABLE GLPI_PROD.TICKETS;

-- Vidage des données de la table qui stocke les informations sur les utilisateurs de l'outil de ticketing
TRUNCATE TABLE GLPI_PROD.USERS;

-- Vidage des données de la table qui stocke les détails sur le matériel concerné par les tickets
TRUNCATE TABLE GLPI_PROD.HARDWARES;

-- Vidage des données de la table qui stocke les détails sur les emplacements physiques associés aux tickets
TRUNCATE TABLE GLPI_PROD.LOCATIONS;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de groupes pour les tickets
TRUNCATE TABLE GLPI_PROD.REF_group;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de rôles pour les tickets
TRUNCATE TABLE GLPI_PROD.REF_role;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de types pour les tickets
TRUNCATE TABLE GLPI_PROD.REF_type;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de catégories pour les tickets
TRUNCATE TABLE GLPI_PROD.REF_category;

-- Vidage des données de la table de référence qui permet de définir une liste prédéfinie de statuts pour les tickets
TRUNCATE TABLE GLPI_PROD.REF_status;

-- Vidage des données de la table de référence contient une liste prédéfinie de valeurs pour les priorités des commentaires
TRUNCATE TABLE GLPI_PROD.REF_priority;

COMMIT;
EXIT;
