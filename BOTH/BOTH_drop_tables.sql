-- Suppression de la table de liaison entre les tickets et les utilisateurs (observateurs)
DROP TABLE GLPI_TEST.OBSERVERS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les tickets et les utilisateurs (responsables)
DROP TABLE GLPI_TEST.ASSIGNED_TO CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les commentaires et les ressources
DROP TABLE GLPI_TEST.COMMENT_RESSOURCES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les tickets et les ressources
DROP TABLE GLPI_TEST.TICKET_RESSOURCES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les ressources disponibles
DROP TABLE GLPI_TEST.RESSOURCES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les commentaires associ�s � chaque ticket
DROP TABLE GLPI_TEST.COMMENTS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table principale qui contient les d�tails de chaque ticket de support
DROP TABLE GLPI_TEST.TICKETS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les informations sur les utilisateurs de l�outil de ticketing
DROP TABLE GLPI_TEST.USERS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les d�tails sur le mat�riel concern� par les tickets
DROP TABLE GLPI_TEST.HARDWARES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les d�tails sur les emplacements physiques associ�s aux tickets
DROP TABLE GLPI_TEST.LOCATIONS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de groupes pour les tickets
DROP TABLE GLPI_TEST.REF_group CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de r�les pour les tickets
DROP TABLE GLPI_TEST.REF_role CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de types pour les tickets
DROP TABLE GLPI_TEST.REF_type CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de cat�gories pour les tickets
DROP TABLE GLPI_TEST.REF_category CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de statuts pour les tickets
DROP TABLE GLPI_TEST.REF_status CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence contient une liste pr�d�finie de valeurs pour les priorit�s des commentaires
DROP TABLE GLPI_TEST.REF_priority CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les tickets et les utilisateurs (observateurs)
DROP TABLE GLPI_PROD.OBSERVERS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les tickets et les utilisateurs (responsables)
DROP TABLE GLPI_PROD.ASSIGNED_TO CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les commentaires et les ressources
DROP TABLE GLPI_PROD.COMMENT_RESSOURCES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les tickets et les ressources
DROP TABLE GLPI_PROD.TICKET_RESSOURCES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les ressources disponibles
DROP TABLE GLPI_PROD.RESSOURCES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les commentaires associ�s � chaque ticket
DROP TABLE GLPI_PROD.COMMENTS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table principale qui contient les d�tails de chaque ticket de support
DROP TABLE GLPI_PROD.TICKETS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les informations sur les utilisateurs de l�outil de ticketing
DROP TABLE GLPI_PROD.USERS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les d�tails sur le mat�riel concern� par les tickets
DROP TABLE GLPI_PROD.HARDWARES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les d�tails sur les emplacements physiques associ�s aux tickets
DROP TABLE GLPI_PROD.LOCATIONS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de groupes pour les tickets
DROP TABLE GLPI_PROD.REF_group CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de r�les pour les tickets
DROP TABLE GLPI_PROD.REF_role CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de types pour les tickets
DROP TABLE GLPI_PROD.REF_type CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de cat�gories pour les tickets
DROP TABLE GLPI_PROD.REF_category CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de statuts pour les tickets
DROP TABLE GLPI_PROD.REF_status CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence contient une liste pr�d�finie de valeurs pour les priorit�s des commentaires
DROP TABLE GLPI_PROD.REF_priority CASCADE CONSTRAINTS PURGE;
COMMIT;
exit;