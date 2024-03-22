<#    
  
     .NOTES
   =========================================================================== 
       Created on             : 2024/03
       Created by             : C.CASSIET
       Last modification by   : C.CASSIET 
       Last modification date : 2024/03
       Version                : SCRIPT_PROD.ps1
   =========================================================================== 

      .DESCRIPTION
             Execute SQL File for Database creation

#>

# Chemin vers SQL*Plus
$SqlplusPath = (Get-Command sqlplus.exe).Source
$ScriptDir  = $(if ($psISE) {Split-Path -Path $psISE.CurrentFile.FullPath} else {$(if ($global:PSScriptRoot.Length -gt 0) {$global:PSScriptRoot} else {$global:pwd.Path})})
$LogFileDirectory = "$($ScriptDir)\LOG\CREATION"

$TAD_PATH = "C:\TAD\"
$GLPI_DB_PROD_PATH = "C:\TAD\GLPI_DB_PROD"
$GLPI_DB_TEST_PATH = "C:\TAD\GLPI_DB_TEST"
$GLPI_ROLES_PATH = "C:\TAD\GLPI_ROLES"

# Vérifie et crée les dossiers s'ils n'existent pas déjà
$folders = @($TAD_PATH, $GLPI_DB_PROD_PATH, $GLPI_DB_TEST_PATH, $GLPI_ROLES_PATH)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -Path $folder -ItemType Directory -Force
    }
}



if(-not(Test-Path -Path $LogFileDirectory)) { New-Item -ItemType Directory -Path $LogFileDirectory }

# Charger les informations de configuration depuis le fichier
$config = Get-Content -Path "config.json" | ConvertFrom-Json

# Récupérer les informations des identifiants
$CredentialMapping = @{
    "BOTH" = @{
        "Username" = $config.Both.Username
        "Password" = $config.Both.Password
    }
    "PROD" = @{
        "Username" = $config.Prod.Username
        "Password" = $config.Prod.Password
    }
    "TEST" = @{
        "Username" = $config.Test.Username
        "Password" = $config.Test.Password
    }
}

# Définir l'ordre des fichiers à exécuter
$FileOrder = @(
    "BOTH\BOTH_databases_creation.sql",
    "PROD\PROD_tables_creation.sql",
	"PROD\PROD_index_creation.sql",
    "PROD\PROD_sequences_creation.sql",
	"PROD\PROD_functions_creation.sql",
	"PROD\PROD_triggers_creation.sql",
    "PROD\PROD_insert_in_tables.sql",
    "PROD\PROD_views_creation.sql",
    "PROD\PROD_roles_creation.sql",
    "PROD\PROD_users_creation.sql",
    "TEST\TEST_tables_creation.sql",
	"TEST\TEST_index_creation.sql",
    "TEST\TEST_sequences_creation.sql",
	"TEST\TEST_functions_creation.sql",
	"TEST\TEST_triggers_creation.sql",
    "TEST\TEST_insert_in_tables.sql",
    "TEST\TEST_views_creation.sql",
    "TEST\TEST_roles_creation.sql",
    "TEST\TEST_users_creation.sql"
    
)

# Parcourir et exécuter chaque fichier SQL dans l'ordre spécifié
foreach ($SqlFileName in $FileOrder) {
    $SqlFile = Join-Path -Path $ScriptDir -ChildPath $SqlFileName
    $Timestamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $Prefix = $SqlFileName.Substring(0, 4)
    $Credential = $CredentialMapping[$Prefix]
    $LogFile = "$LogFileDirectory\$($SqlFileName.SubString(5).Replace(".sql",".log"))"

    if ($Credential) {
        $Username = $Credential.Username
        $Password = $Credential.Password

        Add-Content -Path $LogFile -Value "$Timestamp [$level] - Executing SQL file: $SqlFileName"
        Start-Process -FilePath $SqlplusPath -ArgumentList "$Username/$Password @$SqlFile" -Wait  -NoNewWindow
        Add-Content -Path $LogFile -Value "$Timestamp [$level] - Execution of $SqlFileName completed."
    } else {
        Add-Content -Path $LogFile -Value "$Timestamp [$level] - No credentials defined for prefix $Prefix. Skipping $SqlFileName."
        Add-Content -Path $LogFile -Value "$Timestamp [$level] - No credentials defined for prefix $Prefix. Skipping $SqlFileName."
    }
}
