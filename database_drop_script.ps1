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
$LogFileDirectory = "$($ScriptDir)\log\drop\"

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

# Définir l'ordre des fichiers de suppression (drop) à exécuter
$DropFileOrder = @(
    "BOTH_drop_tables.sql",
    "BOTH_drop_triggers.sql",
	"BOTH_drop_sequences.sql",
	"BOTH_drop_functions.sql",
    "BOTH_drop_index.sql",
    "BOTH_drop_roles.sql",
    "BOTH_drop_views.sql",
    "BOTH_drop_users.sql"
)

# Parcourir et exécuter chaque fichier de suppression (drop) SQL dans l'ordre spécifié
foreach ($DropSqlFileName in $DropFileOrder) {
    $DropSqlFile = Join-Path -Path $ScriptDir -ChildPath $DropSqlFileName
    $Timestamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $Prefix = $DropSqlFileName.Split('_')[0]  # Obtenir le préfixe du nom de fichier
    $Credential = $CredentialMapping[$Prefix]
    $LogFile = "$LogFileDirectory\$($DropSqlFileName.Split('.')[0]).log"

   if ($Credential) {
        $Username = $Credential.Username
        $Password = $Credential.Password

        Add-Content -Path $LogFile -Value "$Timestamp [$level] - Executing SQL file: $DropSqlFileName"
        Start-Process -FilePath $SqlplusPath -ArgumentList "$Username/$Password @$DropSqlFile" -NoNewWindow -Wait
        Add-Content -Path $LogFile -Value "$Timestamp [$level] - Execution of $DropSqlFileName completed."
    } else {
        Add-Content -Path $LogFile -Value "$Timestamp [$level] - No credentials defined for prefix $Prefix. Skipping $DropSqlFileName."
    }
}
