#requires -version 5.1
<#
.SYNOPSIS
    Create links to the various config folders in the current users appdata folders

.DESCRIPTION
    Checks to see if the Directories in the variables exist if not makes the link needed

.PARAMETER <Parameter_Name>
    <Brief description of parameter input required. Repeat this attribute if required>

.INPUTS
    The Variables below
.OUTPUTS
    Output to console

.NOTES
    Version:        1.0
    Author:         Ruhai Hu
    Creation Date:  2019.11.02
    Purpose/Change: Initial script development

    RUN THIS SCRIPT BEFORE INSTALLING APPS
    Best time is right after windows install or first boot on new system!

    Make sure to update the $notOSDrivePath !!!!!!!!!!!!!!!!!!!!!!!!


#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#Dot Source required Function Libraries
. "$PSScriptRoot\FolderVariables.ps1"

#-----------------------------------------------------------[Execution]------------------------------------------------------------

# 
Write-Host "Checking for the following %AppData% directories"
Write-Host "Current user: $env:USERNAME"
Write-Host "Local Directories: (Path: $userLocal) "
Write-Host $localDirectories
Write-Host " "
Write-Host "Roaming Directories: (Path: $userRoaming) "
Write-Host $roamingDirectories
Write-Host " "

# Check to see if Local directories exist
foreach ($folder in $localDirectories) {

    # Combining current directory
    $directory = $userLocal + $folder

    # Combining new directory
    $newDirectory = $notOSDrivePath + $folder

    if (Test-Path $directory) {
        Write-Host "The Folder '$folder' exists!"
        Write-Host "Move Folder before Linking!!"
    }else{
        Write-Host "The folder '$folder' does Not exist!"
        Write-Host "Proceeding to Link!"
        New-Item -ItemType Junction -Path $directory -Target $newDirectory
    }
}
Write-Host "There exist $count of $localDirectoriesCount the appdata local directories"


# Redirect the .minecraft folder to different drive where minecraft installs are going
New-Item -ItemType Junction -Path "C:\Users\Ruhai Hu\AppData\Roaming\.minecraft" -Target "E:\Program Files\Minecraft\.minecraft"
New-Item -ItemType Junction -Path "C:\Users\Ruhai Hu\AppData\Roaming\.minecraft" -Target "E:\Program Files\Minecraft\.minecraft"
New-Item -ItemType Junction -Path "C:\Users\Ruhai Hu\AppData\Roaming\.minecraft" -Target "E:\Program Files\Minecraft\.minecraft"
New-Item -ItemType Junction -Path "C:\Users\Ruhai Hu\AppData\Roaming\.minecraft" -Target "E:\Program Files\Minecraft\.minecraft"
