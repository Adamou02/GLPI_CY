<#    
  
     .NOTES
   =========================================================================== 
       Created on             : 2024/03
       Created by             : C.CASSIET
       Last modification by   : C.CASSIET 
       Last modification date : 2024/03
       Version                : SCRIPT_CERGY.ps1
   =========================================================================== 

      .DESCRIPTION
             Execute SQL File for Database creation

#>

# Chemin vers SQL*Plus
$SqlplusPath = (Get-Command sqlplus.exe).Source
$ScriptDir  = $(if ($psISE) {Split-Path -Path $psISE.CurrentFile.FullPath} else {$(if ($global:PSScriptRoot.Length -gt 0) {$global:PSScriptRoot} else {$global:pwd.Path})})
$LogFileDirectory = "$($ScriptDir)\LOG\CREATION"

$TAD_PATH = "C:\TAD\"
$GLPI_DB_CERGY_PATH = "C:\TAD\GLPI_DB_CERGY"
$GLPI_DB_PAU_PATH = "C:\TAD\GLPI_DB_PAU"
$GLPI_ROLES_PATH = "C:\TAD\GLPI_ROLES"

# Vérifie et crée les dossiers s'ils n'existent pas déjà
$folders = @($TAD_PATH, $GLPI_DB_CERGY_PATH, $GLPI_DB_PAU_PATH, $GLPI_ROLES_PATH)

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
    "CERGY" = @{
        "Username" = $config.CERGY.Username
        "Password" = $config.CERGY.Password
    }
    "PAU" = @{
        "Username" = $config.PAU.Username
        "Password" = $config.PAU.Password
    }
}

# Définir l'ordre des fichiers à exécuter
$FileOrder = @(
    "BOTH\BOTH_databases_creation.sql",
    "BOTH\BOTH_database_link_creation",
    "BOTH\BOTH_clusters_creation",
    "CERGY\CERGY_tables_creation.sql",
	"CERGY\CERGY_index_creation.sql",
    "CERGY\CERGY_sequences_creation.sql",
	"CERGY\CERGY_functions_creation.sql",
	"CERGY\CERGY_triggers_creation.sql",
    "CERGY\CERGY_insert_in_tables.sql",
    "CERGY\CERGY_views_creation.sql",
    "PAU\PAU_tables_creation.sql",
	"PAU\PAU_index_creation.sql",
    "PAU\PAU_sequences_creation.sql",
	"PAU\PAU_functions_creation.sql",
	"PAU\PAU_triggers_creation.sql",
    "PAU\PAU_insert_in_tables.sql",
    "PAU\PAU_views_creation.sql",
    "BOTH\BOTH_roles_creation.sql",
    "PAU\PAU_users_creation.sql",
    "CERGY\CERGY_users_creation.sql",
    "BOTH\BOTH_full_global_ticket_creation"
    
)

# Parcourir et exécuter chaque fichier SQL dans l'ordre spécifié
foreach ($SqlFileName in $FileOrder) {
    $SqlFile = Join-Path -Path $ScriptDir -ChildPath $SqlFileName
    $Timestamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $Prefix = ($SqlFileName -split "\\")[0]
    $Credential = $CredentialMapping[$Prefix]
    $LogFile = "$LogFileDirectory\$($SqlFileName.Split("\")[-1].Replace(".sql",".log"))"

    if ($Credential) {
        $Username = $Credential.Username
        $Password = $Credential.Password

        Add-Content -Path $LogFile -Value "$Timestamp [$level] - Executing SQL file: $SqlFileName"
        Start-Process -FilePath $SqlplusPath -ArgumentList "$Username/$Password @$SqlFile" -Wait  -NoNewWindow
        Add-Content -Path $LogFile -Value "$Timestamp [$level] - Execution of $SqlFileName completed."
    } else {
        Add-Content -Path $LogFile -Value "$Timestamp [$level] - No credentials defined for prefix $Prefix. Skipping $SqlFileName."
        Add-Content -Path $LogFile -Value "---------------------------------------------------------------------------------------"
    }
}
