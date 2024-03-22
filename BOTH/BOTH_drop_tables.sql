-- Suppression de la table de liaison entre les tickets et les utilisateurs (observateurs)
DROP TABLE GLPI_PAU.OBSERVERS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les tickets et les utilisateurs (responsables)
DROP TABLE GLPI_PAU.ASSIGNED_TO CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les commentaires et les ressources
DROP TABLE GLPI_PAU.COMMENT_RESSOURCES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les tickets et les ressources
DROP TABLE GLPI_PAU.TICKET_RESSOURCES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les ressources disponibles
DROP TABLE GLPI_PAU.RESSOURCES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les commentaires associ�s � chaque ticket
DROP TABLE GLPI_PAU.COMMENTS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table principale qui contient les d�tails de chaque ticket de support
DROP TABLE GLPI_PAU.TICKETS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les informations sur les utilisateurs de l�outil de ticketing
DROP TABLE GLPI_PAU.USERS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les d�tails sur le mat�riel concern� par les tickets
DROP TABLE GLPI_PAU.HARDWARES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les d�tails sur les emplacements physiques associ�s aux tickets
DROP TABLE GLPI_PAU.LOCATIONS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de groupes pour les tickets
DROP TABLE GLPI_PAU.REF_group CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de r�les pour les tickets
DROP TABLE GLPI_PAU.REF_role CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de types pour les tickets
DROP TABLE GLPI_PAU.REF_type CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de cat�gories pour les tickets
DROP TABLE GLPI_PAU.REF_category CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de statuts pour les tickets
DROP TABLE GLPI_PAU.REF_status CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence contient une liste pr�d�finie de valeurs pour les priorit�s des commentaires
DROP TABLE GLPI_PAU.REF_priority CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les tickets et les utilisateurs (observateurs)
DROP TABLE GLPI_CERGY.OBSERVERS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les tickets et les utilisateurs (responsables)
DROP TABLE GLPI_CERGY.ASSIGNED_TO CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les commentaires et les ressources
DROP TABLE GLPI_CERGY.COMMENT_RESSOURCES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de liaison entre les tickets et les ressources
DROP TABLE GLPI_CERGY.TICKET_RESSOURCES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les ressources disponibles
DROP TABLE GLPI_CERGY.RESSOURCES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les commentaires associ�s � chaque ticket
DROP TABLE GLPI_CERGY.COMMENTS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table principale qui contient les d�tails de chaque ticket de support
DROP TABLE GLPI_CERGY.TICKETS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les informations sur les utilisateurs de l�outil de ticketing
DROP TABLE GLPI_CERGY.USERS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les d�tails sur le mat�riel concern� par les tickets
DROP TABLE GLPI_CERGY.HARDWARES CASCADE CONSTRAINTS PURGE;

-- Suppression de la table qui stocke les d�tails sur les emplacements physiques associ�s aux tickets
DROP TABLE GLPI_CERGY.LOCATIONS CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de groupes pour les tickets
DROP TABLE GLPI_CERGY.REF_group CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de r�les pour les tickets
DROP TABLE GLPI_CERGY.REF_role CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de types pour les tickets
DROP TABLE GLPI_CERGY.REF_type CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de cat�gories pour les tickets
DROP TABLE GLPI_CERGY.REF_category CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence qui permet de d�finir une liste pr�d�finie de statuts pour les tickets
DROP TABLE GLPI_CERGY.REF_status CASCADE CONSTRAINTS PURGE;

-- Suppression de la table de r�f�rence contient une liste pr�d�finie de valeurs pour les priorit�s des commentaires
DROP TABLE GLPI_CERGY.REF_priority CASCADE CONSTRAINTS PURGE;
COMMIT;
exit;
