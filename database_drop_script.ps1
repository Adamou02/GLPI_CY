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
$LogFileDirectory = "$($ScriptDir)\LOG\DROP"

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

# Définir l'ordre des fichiers de suppression (drop) à exécuter
$DropFileOrder = @(
    "BOTH\BOTH_drop_index.sql",
    "BOTH\BOTH_drop_tables.sql",
    "BOTH\BOTH_drop_clusters",
    "BOTH\BOTH_drop_triggers.sql",
	"BOTH\BOTH_drop_sequences.sql",
	"BOTH\BOTH_drop_functions.sql",
    "CERGY\CERGY_drop_users.sql",
    "PAU\PAU_drop_users.sql",
    "BOTH\BOTH_drop_roles.sql",
    "BOTH\BOTH_drop_views.sql",
    "BOTH\BOTH_drop_databases.sql"
)

# Parcourir et exécuter chaque fichier de suppression (drop) SQL dans l'ordre spécifié
foreach ($DropSqlFileName in $DropFileOrder) {
    $DropSqlFile = Join-Path -Path $ScriptDir -ChildPath $DropSqlFileName
    $Timestamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $Prefix = ($DropSqlFileName -split "\\")[0]
    $Credential = $CredentialMapping[$Prefix]
    $LogFile = "$LogFileDirectory\$($DropSqlFileName.Split("\")[-1].Replace(".sql",".log"))"


   if ($Credential) {
        $Username = $Credential.Username
        $Password = $Credential.Password

        Add-Content -Path $LogFile -Value "$Timestamp [$level] - Executing SQL file: $DropSqlFileName"
        Start-Process -FilePath $SqlplusPath -ArgumentList "$Username/$Password @$DropSqlFile"  -Wait -NoNewWindow
        Add-Content -Path $LogFile -Value "$Timestamp [$level] - Execution of $DropSqlFileName completed."
    } else {
        Add-Content -Path $LogFile -Value "$Timestamp [$level] - No credentials defined for prefix $Prefix. Skipping $DropSqlFileName."
    }
}

