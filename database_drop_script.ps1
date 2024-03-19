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

# Définir les informations de connexion pour chaque préfixe de fichier
$CredentialMapping = @{
    "BOTH" = @{
        "Username" = "system"
        "Password" = "dbadmin"
    }
    "PROD" = @{
        "Username" = "GLPI_PROD"
        "Password" = "GLPI_PROD_PASSWORD"
    }
    "TEST" = @{
        "Username" = "GLPI_TEST"
        "Password" = "GLPI_TEST_PASSWORD"
    }
}

# Définir l'ordre des fichiers de suppression (drop) à exécuter
$DropFileOrder = @(
    "BOTH_drop_tables.sql",
    "BOTH_drop_seq_and_id_triggers.sql",
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
