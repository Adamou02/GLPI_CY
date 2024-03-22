-- Creation d'index B-tree pour les colonnes ï¿½ valeurs presque unique. Cela nous permet de faire des opï¿½rations d'ï¿½galitï¿½ sur ces tables 

-- Cet index peut amï¿½liorer les performances des requï¿½tes qui filtrent les tickets par utilisateur. 
-- Par exemple, lors de la recherche de tous les tickets attribuï¿½s ï¿½ un utilisateur spï¿½cifique.
CREATE INDEX GLPI_CERGY.idx_tickets_fk_created_by ON GLPI_CERGY.TICKETS(fk_created_by);

-- Cet index peut accï¿½lï¿½rer les requï¿½tes qui impliquent le tri ou le filtrage par date de crï¿½ation des tickets.
CREATE INDEX GLPI_CERGY.idx_tickets_creation_date ON GLPI_CERGY.TICKETS(creation_datetime);

-- De la mï¿½me maniï¿½re, cet index peut accï¿½lï¿½rer les requï¿½tes qui impliquent le tri ou le filtrage par date de modification des tickets.
CREATE INDEX GLPI_CERGY.idx_tickets_last_modification_date ON GLPI_CERGY.TICKETS(last_modification_datetime);

-- De la mï¿½me maniï¿½re, cet index peut accï¿½lï¿½rer les requï¿½tes qui impliquent le tri ou le filtrage par date de resolution des tickets.
CREATE INDEX GLPI_CERGY.idx_tickets_resolution_date ON GLPI_CERGY.TICKETS(resolution_datetime);

-- De la mï¿½me maniï¿½re, cet index peut accï¿½lï¿½rer les requï¿½tes qui impliquent le tri ou le filtrage par date de clï¿½ture des tickets.
CREATE INDEX GLPI_CERGY.idx_tickets_closing_date ON GLPI_CERGY.TICKETS(closing_datetime);

-- Cet index peut accï¿½lï¿½rer les requï¿½tes qui impliquent le tri ou le filtrage par prioritï¿½ de ticket, 
-- ce qui est une opï¿½ration courante dans les systï¿½mes de gestion des tickets.
CREATE INDEX GLPI_CERGY.idx_tickets_fk_priority ON GLPI_CERGY.TICKETS(fk_priority);

-- Cet index peut ï¿½tre utile pour les requï¿½tes qui impliquent la localisation physique des tickets, 
-- comme la recherche de tous les tickets associï¿½s ï¿½ une certaine localisation.
CREATE INDEX GLPI_CERGY.idx_tickets_fk_location ON GLPI_CERGY.TICKETS(fk_location);

-- Cet index peut accï¿½lï¿½rer les requï¿½tes qui impliquent le tri ou le filtrage par prioritï¿½ de ticket, 
-- ce qui est une opï¿½ration courante dans les systï¿½mes de gestion des tickets.
CREATE INDEX GLPI_CERGY.idx_comments_fk_ticket ON GLPI_CERGY.COMMENTS(fk_ticket);

-- Cet index peut ï¿½tre utilisï¿½ pour optimiser les requï¿½tes qui rï¿½cupï¿½rent tous les commentaires laissï¿½s par un utilisateur spï¿½cifique.
CREATE INDEX GLPI_CERGY.idx_comments_fk_user ON GLPI_CERGY.COMMENTS(fk_user);



-- Création d'index sur les clusters pour améliorer les performances globales des requêtes impliquant des opérations sur les données regroupées dans ces clusters.

-- Index sur le cluster des utilisateurs pour améliorer les performances des requêtes courantes impliquant des opérations sur les utilisateurs.
CREATE INDEX GLPI_CERGY.idx_user_cluster ON CLUSTER GLPI_CERGY.user_cluster;
-- Index sur le cluster des tickets pour améliorer les performances des requêtes courantes impliquant des opérations sur les tickets
CREATE INDEX GLPI_CERGY.idx_ticket_cluster ON CLUSTER GLPI_CERGY.ticket_cluster;


-- Creation d'index Bitmap pour les colonnes ï¿½ faible valeurs distinctes. Cela nous permet de faire des opï¿½rations de filtrage sur ces tables.

-- ï¿½tant donnï¿½ que le rï¿½le d'un utilisateur est souvent limitï¿½ ï¿½ un nombre restreint de valeurs (par exemple, "Support", "IT", "RH"), 
-- un index bitmap peut ï¿½tre efficace pour amï¿½liorer les performances des requï¿½tes qui filtrent ou agrï¿½gent les utilisateurs par rï¿½le.
CREATE BITMAP INDEX GLPI_CERGY.idx_users_fk_role ON GLPI_CERGY.USERS(fk_role);

-- De mï¿½me, comme les utilisateurs peuvent appartenir ï¿½ un groupe spï¿½cifique, 
-- un index bitmap peut ï¿½tre avantageux pour les requï¿½tes qui travaillent avec des groupes d'utilisateurs.
CREATE BITMAP INDEX GLPI_CERGY.idx_users_fk_group ON GLPI_CERGY.USERS(fk_group);

-- Cet index bitmap peut ï¿½tre utile pour les requï¿½tes qui impliquent la classification des tickets par type, 
-- par exemple, trouver tous les tickets de type "Dï¿½faut" ou "Demande".
CREATE BITMAP INDEX GLPI_CERGY.idx_tickets_fk_type ON GLPI_CERGY.TICKETS(fk_type);

-- Comme les ï¿½tats des tickets sont gï¿½nï¿½ralement limitï¿½s ï¿½ un petit ensemble de valeurs (par exemple, "ï¿½ faire", "En cours", "Terminï¿½"), 
-- un index bitmap peut accï¿½lï¿½rer les requï¿½tes qui filtrent ou agrï¿½gent les tickets par ï¿½tat.
CREATE BITMAP INDEX GLPI_CERGY.idx_tickets_fk_status ON GLPI_CERGY.TICKETS(fk_status);

-- Cet index bitmap peut ï¿½tre utile pour les requï¿½tes qui impliquent la classification des tickets par categorie. 
CREATE BITMAP INDEX GLPI_CERGY.idx_tickets_fk_category ON GLPI_CERGY.TICKETS(fk_category);

-- Cet index bitmap peut ï¿½tre bï¿½nï¿½fique pour les requï¿½tes qui filtrent ou agrï¿½gent les tickets par groupe assignï¿½.
CREATE BITMAP INDEX GLPI_CERGY.idx_tickets_fk_assigned_group ON GLPI_CERGY.TICKETS(fk_assigned_group);



-- Creation d'index composite pour amï¿½liorer les performances des requï¿½tes frï¿½quentes en prenant en compte plusieurs colonnes importantes pour les requï¿½tes

-- Index composite sur la table TICKETS pour amï¿½liorer les performances des requï¿½tes frï¿½quentes filtrant par ï¿½tat et prioritï¿½.
CREATE INDEX GLPI_CERGY.idx_tickets_status_priority ON GLPI_CERGY.TICKETS(fk_status, fk_priority);

-- Index composite sur la table COMMENTS pour accï¿½lï¿½rer les requï¿½tes filtrant par utilisateur et date de crï¿½ation.
CREATE INDEX GLPI_CERGY.idx_comments_user_creation_date ON GLPI_CERGY.COMMENTS(fk_user, creation_datetime);

-- Index composite sur la table USERS pour accï¿½lï¿½rer les requï¿½tes filtrant par rï¿½le et entreprise.
CREATE INDEX GLPI_CERGY.idx_users_role_company ON GLPI_CERGY.USERS(fk_role, company);

-- Index composite sur la table USERS pour optimiser les requï¿½tes filtrant par groupe et entreprise.
CREATE INDEX GLPI_CERGY.idx_users_group_company ON GLPI_CERGY.USERS(fk_group, company);

-- Index composite sur la table USERS pour optimiser les requï¿½tes filtrant par lieu et entreprise.
CREATE INDEX GLPI_CERGY.idx_users_location_company ON GLPI_CERGY.USERS(fk_location, company);



-- Nous avons limitï¿½ le nombre d'index car un surnombre d'index pourrait entrainer des surcouts de maintenance et de stockage. 
-- Nous nous limitons aux indexs les plus importants.
COMMIT;
exit;
