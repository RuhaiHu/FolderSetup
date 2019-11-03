#Requires -version 5.1
#Requires -RunAsAdministrator
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
Write-Host "'n"
Write-Host "Roaming Directories: (Path: $userRoaming) "
Write-Host $roamingDirectories
Write-Host "'n"

Write-Warning "DO NOT HAVE ANY OF THE ABOVE PROGRAMS RUNNING IN BACKGROUND!!!"
Write-Warning "DO NOT HAVE ANY OF THE ABOVE PROGRAMS RUNNING IN BACKGROUND!!!"


# Check to see if Local directories exist
foreach ($folder in $localDirectories) {

    # Combining current directory
    $directory = $userLocal + $folder

    # Combining new directory
    $newDirectory = $notOSDrivePathLocal + $folder

    if (Test-Path $newDirectory) {
        Write-Host " "
        Write-Host "The Folder '$newDirectory' for the link exists!"
        Write-Host "Checking for folder in linking location..."
        Write-Host " "

        if (Test-Path $directory) {
            Write-Host "The Folder '$folder' exists!"
            Write-Warning "Move Folder before Linking!!"
            Write-Warning "Not Linking folder because it exist in the appdata directory."
            Write-Host " "
        }else{
            Write-Host "The folder '$folder' does Not exist!"
            Write-Host "Proceeding to Link!"
            Write-Host " "
            
            if ($testModeLink) {
                # Create the folder Junction from $directory to $newDirecotry
                New-Item -ItemType Junction -Path $directory -Target $newDirectory -WhatIf
            } else {
                # Create the folder Junction from $directory to $newDirecotry
                New-Item -ItemType Junction -Path $directory -Target $newDirectory
            }
        }
    } else {
        Write-Warning "No directory to link to please move files before trying again."
    }
}

# Check to see if Roaming directories exist
foreach ($folder in $roamingDirectories) {

    # Combining current directory
    $directory = $userRoaming + $folder

    # Combining new directory
    $newDirectory = $notOSDrivePathRoaming + $folder

    if (Test-Path $newDirectory) {
        Write-Host " "
        Write-Host "The Folder '$newDirectory' for the link exists!"
        Write-Host "Checking for folder in linking location..."
        Write-Host " "

        if (Test-Path $directory) {
            Write-Host "The Folder '$folder' exists!"
            Write-Host "Move Folder before Linking!!"
            Write-Host "Not Linking folder because it exist in the appdata directory."
        }else{
            Write-Host "The folder '$folder' does Not exist!"
            Write-Host "Proceeding to Link!"
            
            if ($testModeLink) {
                # Create the folder Junction from $directory to $newDirecotry
                New-Item -ItemType Junction -Path $directory -Target $newDirectory -WhatIf
            } else {
                # Create the folder Junction from $directory to $newDirecotry
                New-Item -ItemType Junction -Path $directory -Target $newDirectory
            }
        }
    } else {
        Write-Warning "No directory to link to please move files before trying again."
    }
}
