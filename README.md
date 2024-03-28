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

GLPI_collaborate-main/<br>
│<br>
├── BOTH/<br>
│ ├── BOTH_clusters_creation.sql          # Crée les clusters pour la base de données.<br>
│ ├── BOTH_databases_creation.sql         # Crée les bases de données.<br>
│ ├── BOTH_database_link_creation.sql     # Crée les liens entre les bases de données.<br>
│ ├── BOTH_database_link_drop.sql         # Supprime les liens entre les bases de données.<br>
│ ├── BOTH_drop_clusters.sql              # Supprime les clusters.<br>
│ ├── BOTH_drop_databases.sql             # Supprime les bases de données.<br>
│ ├── BOTH_drop_functions.sql             # Supprime les fonctions et procédures.<br>
│ ├── BOTH_drop_index.sql                 # Supprime les index.<br>
│ ├── BOTH_drop_roles.sql                 # Supprime les rôles.<br>
│ ├── BOTH_drop_sequences.sql             # Supprime les séquences.<br>
│ ├── BOTH_drop_tables.sql                # Supprime les tables.<br>
│ ├── BOTH_drop_triggers.sql              # Supprime les déclencheurs.<br>
│ ├── BOTH_drop_views.sql                 # Supprime les vues.<br>
│ ├── BOTH_full_global_ticket_creation.sql# Crée des tickets globaux.<br>
│ ├── BOTH_roles_creation.sql             # Crée les rôles.<br>
│ ├── BOTH_truncate_tables.sql            # Vide les tables.<br>
│<br>
├── CERGY/<br>
│ ├── CERGY_drop_users.sql                # Supprime les utilisateurs.<br>
│ ├── CERGY_functions_creation.sql        # Crée des fonctions et procédures spécifiques pour CERGY.<br>
│ ├── CERGY_functions_usage.sql           # Utilisation des fonctions et procédures spécifiques pour CERGY.<br>
│ ├── CERGY_index_creation.sql            # Crée les index pour CERGY.<br>
│ ├── CERGY_insert_in_tables.sql          # Insère des données dans les tables pour CERGY.<br>
│ ├── CERGY_sequences_creation.sql        # Crée les séquences pour CERGY.<br>
│ ├── CERGY_tables_creation.sql           # Crée les tables pour CERGY.<br>
│ ├── CERGY_triggers_creation.sql         # Crée les déclencheurs pour CERGY.<br>
│ ├── CERGY_users_creation.sql            # Crée les utilisateurs pour CERGY.<br>
│ ├── CERGY_views_creation.sql            # Crée les vues pour CERGY.<br>
│<br>
├── PAU/<br>
│ ├── PAU_drop_users.sql                  # Supprime les utilisateurs.<br>
│ ├── PAU_functions_creation.sql          # Crée des fonctions et procédures spécifiques pour PAU.<br>
│ ├── PAU_functions_usage.sql             # Utilisation des fonctions et procédures spécifiques pour PAU.<br>
│ ├── PAU_index_creation.sql              # Crée les index pour PAU.<br>
│ ├── PAU_insert_in_tables.sql            # Insère des données dans les tables pour PAU.<br>
│ ├── PAU_sequences_creation.sql          # Crée les séquences pour PAU.<br>
│ ├── PAU_tables_creation.sql             # Crée les tables pour PAU.<br>
│ ├── PAU_triggers_creation.sql           # Crée les déclencheurs pour PAU.<br>
│ ├── PAU_users_creation.sql              # Crée les utilisateurs pour PAU.<br>
│ ├── PAU_views_creation.sql              # Crée les vues pour PAU.<br>
│<br>
├── doc/<br>
│ └── MCD.pdf                             # Modèle Conceptuel de Données.<br>
│ └── MCD_BOTH.pdf                        # Modèle Conceptuel de Données pour les 2 schémas de base de données.<br>
│ └── MCD_final.pdf                       # Modèle Conceptuel de Données final.<br>
│ └── rapport.pdf                         # Rapport final du projet<br>
│<br>
└── LOG/<br>
│ ├──  DROP/                               # fichiers de log relatifs à la suppression de la base de données avec le ps1<br>
│ ├──  CREATION/                           # fichiers de log relatifs à la création de la base de données avec le ps1<br>
└── database_creation_script.ps1           # Script PowerShell pour la création de la base de données.<br>
└── database_drop_script.ps1               # Script PowerShell pour la suppression de la base de données.<br>
└── config.json                            # Fichier config avec nom/mot de passes des connexions<br>



### Installation

Dans le config.json, changer le mot de passe de votre user system ORACLE. 
Pour créer la base de données, exécutez les scripts situés dans le dossier racine, database_creation_script.ps1 pour la création, et database_drop_script pour la supression.

Dans le fichier BOTH/BOTH_database_link_creation.sql, le port doit être changer si votre service ORACLE SQL n'est pas sur le port 1521

### Documentation

Consultez la documentation fournie dans le dossier `doc` pour plus d'informations sur le modèle conceptuel des données (MCD).

### Remarque

Ce projet est une simulation et peut nécessiter des ajustements supplémentaires pour une utilisation réelle.



