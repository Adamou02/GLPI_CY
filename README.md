# Projet TAD GLPI - Gestion du parc informatique de CY Tech

Ce projet vise à améliorer la performance du parc informatique de CY Tech en repensant la base de données GLPI. Il a été réalisé dans le cadre du cours de Traitement des Bases de Données Avancées pour l'année universitaire 2023-2024, sous la supervision de M. Redouane Bouhamoum.

## Objectif

L'objectif principal est d'optimiser la gestion des tickets, du matériel informatique, des utilisateurs et des problèmes rencontrés en mettant en place une nouvelle structure de base de données plus efficace.

## Contributeurs

- Adam Bouhrara
- Clément Cassiet
- Jordan Gautier
- Joan Legrand

## Architecture du Projet

L'organisation des fichiers est la suivante :

GLPI_collaborate-main/
│
├── BOTH/
│ ├── BOTH_clusters_creation.sql # Crée les clusters pour la base de données.
│ ├── BOTH_databases_creation.sql # Crée les bases de données.
│ ├── BOTH_database_link_creation.sql # Crée les liens entre les bases de données.
│ ├── BOTH_database_link_drop.sql # Supprime les liens entre les bases de données.
│ ├── BOTH_drop_clusters.sql # Supprime les clusters.
│ ├── BOTH_drop_databases.sql # Supprime les bases de données.
│ ├── BOTH_drop_functions.sql # Supprime les fonctions et procédures.
│ ├── BOTH_drop_index.sql # Supprime les index.
│ ├── BOTH_drop_roles.sql # Supprime les rôles.
│ ├── BOTH_drop_sequences.sql # Supprime les séquences.
│ ├── BOTH_drop_tables.sql # Supprime les tables.
│ ├── BOTH_drop_triggers.sql # Supprime les déclencheurs.
│ ├── BOTH_drop_views.sql # Supprime les vues.
│ ├── BOTH_full_global_ticket_creation.sql # Crée des tickets globaux.
│ ├── BOTH_roles_creation.sql # Crée les rôles.
│ ├── BOTH_truncate_tables.sql # Vide les tables.
│
├── CERGY/
│ ├── CERGY_drop_users.sql # Supprime les utilisateurs.
│ ├── CERGY_functions_creation.sql # Crée des fonctions et procédures spécifiques pour CERGY.
│ ├── CERGY_functions_usage.sql # Utilisation des fonctions et procédures spécifiques pour CERGY.
│ ├── CERGY_index_creation.sql # Crée les index pour CERGY.
│ ├── CERGY_insert_in_tables.sql # Insère des données dans les tables pour CERGY.
│ ├── CERGY_sequences_creation.sql # Crée les séquences pour CERGY.
│ ├── CERGY_tables_creation.sql # Crée les tables pour CERGY.
│ ├── CERGY_triggers_creation.sql # Crée les déclencheurs pour CERGY.
│ ├── CERGY_users_creation.sql # Crée les utilisateurs pour CERGY.
│ ├── CERGY_views_creation.sql # Crée les vues pour CERGY.
│
├── PAU/
│ ├── PAU_drop_users.sql # Supprime les utilisateurs.
│ ├── PAU_functions_creation.sql # Crée des fonctions et procédures spécifiques pour PAU.
│ ├── PAU_functions_usage.sql # Utilisation des fonctions et procédures spécifiques pour PAU.
│ ├── PAU_index_creation.sql # Crée les index pour PAU.
│ ├── PAU_insert_in_tables.sql # Insère des données dans les tables pour PAU.
│ ├── PAU_sequences_creation.sql # Crée les séquences pour PAU.
│ ├── PAU_tables_creation.sql # Crée les tables pour PAU.
│ ├── PAU_triggers_creation.sql # Crée les déclencheurs pour PAU.
│ ├── PAU_users_creation.sql # Crée les utilisateurs pour PAU.
│ ├── PAU_views_creation.sql # Crée les vues pour PAU.
│
├── doc/
│ └── MCD.pdf # Modèle Conceptuel de Données.
│ └── MCD_BOTH.pdf # Modèle Conceptuel de Données pour les 2 schémas de base de données.
│ └── MCD_final.pdf # Modèle Conceptuel de Données final.
│ └── rapport.pdf # Rapport final du projet
│
└── LOG/
│ ├──  DROP/ # fichiers de log relatifs à la suppression de la base de données avec le ps1
│ ├──  CREATION/ # fichiers de log relatifs à la création de la base de données avec le ps1
└── database_creation_script.ps1 # Script PowerShell pour la création de la base de données.
└── database_drop_script.ps1 # Script PowerShell pour la suppression de la base de données.
└── config.json # Fichier config avec nom/mot de passes des connexions


### Installation

Pour créer la base de données, exécutez les scripts situés dans les dossiers `BOTH`, `CERGY` et `PAU`. Assurez-vous d'avoir les droits nécessaires pour exécuter les scripts.

### Documentation

Consultez la documentation fournie dans le dossier `doc` pour plus d'informations sur le modèle conceptuel des données (MCD).

### Remarque

Ce projet est une simulation et peut nécessiter des ajustements supplémentaires pour une utilisation réelle.



