#Requires -version 5.1
#Requires -RunAsAdministrator
<#
.SYNOPSIS
    Moves the folders for linking if below

.DESCRIPTION
    Checks to see if the Directories in the variables exist
    If it exists in both locations 
        skips Folder if it does
        Because i dont want to over write something
    If it does not exist in the new location

.PARAMETER <Parameter_Name>
    <Brief description of parameter input required. Repeat this attribute if required>

.INPUTS
    <Inputs if any, otherwise state None>

.OUTPUTS Log File
    The script log file stored in C:\Windows\Temp\<name>.log

.NOTES
    Version:        1.0
    Author:         Ruhai Hu
    Creation Date:  2019.11.02
    Purpose/Change: Initial script development

.EXAMPLE
    <Example explanation goes here>

    <Example goes here. Repeat this attribute for more than one example>
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#Dot Source required Function Libraries
. "$PSScriptRoot\FolderVariables.ps1"

#-----------------------------------------------------------[Execution]------------------------------------------------------------

Write-Host "Checking for the following %AppData% directories"
Write-Host "Current user: $env:USERNAME"

Write-Host " "

Write-Host "Local Directories: (Path: $userLocal) "
Write-Host $localDirectories

Write-Host " "

Write-Host "Roaming Directories: (Path: $userRoaming) "
Write-Host $roamingDirectories

Write-Host " "
Write-Host " "

Write-Warning "DO NOT HAVE ANY OF THE ABOVE PROGRAMS RUNNING IN BACKGROUND!!!"
Write-Warning "DO NOT HAVE ANY OF THE ABOVE PROGRAMS RUNNING IN BACKGROUND!!!"

Write-Host " "

# Check to see if Local directories exist
foreach ($folder in $localDirectories) {

    # Combining current directory
    $directory = $userLocal + $folder

    # Combining new directory
    $newDirectory = $notOSDrivePathLocal + $folder

    if (Test-Path $directory) {
        Write-Host " "
        Write-Host "The Folder '$directory' exists!"
        Write-Host "Checking for folder in new location..."
        Write-Host " "

        if (Test-Path $newDirectory) {
            Write-Host "The Folder '$newDirectory' exists!"
            Write-Warning "Manually move folder!"
            Write-Warning "Not Moving folder because it exist in the appdata directory."
            Write-Host " "

        } else {
            Write-Host "The Folder '$newDirectory' does not exist in new location!"
            Write-Host "Moving folder( '$directory' ) to new location..."
            Write-Host " "
            
            if ($testMode) {
                # Create the folder Junction from $directory to $newDirecotry
                Move-Item -Path $directory -Destination $newDirectory -WhatIf
            } else {
                # Create the folder Junction from $directory to $newDirecotry
                Move-Item -Path $directory -Destination $newDirectory
            }
        }
    } else {
        Write-Host " "
        Write-Host "The Folder '$directory' does not exist"
        Write-Host " "
    }
}

# Check to see if Roaming directories exist
foreach ($folder in $roamingDirectories) {

    # Combining current directory
    $directory = $userRoaming + $folder

    # Combining new directory
    $newDirectory = $notOSDrivePathRoaming + $folder

    if (Test-Path $directory) {
        Write-Host " "
        Write-Host "The Folder '$directory' exists!"
        Write-Host "Checking for folder in new location..."
        Write-Host " "

        if (Test-Path $newDirectory) {
            Write-Host "The Folder '$newDirectory' exists!"
            Write-Warning "Manually move folder!"
            Write-Warning "Not Moving folder because it exist in the appdata directory."
            Write-Host " "

        } else {
            Write-Host "The Folder '$newDirectory' does not exist in new location!"
            Write-Host "Moving folder( '$directory' ) to new location..."
            Write-Host " "
            
            if ($testMode) {
                # Create the folder Junction from $directory to $newDirecotry
                Move-Item -Path $directory -Destination $newDirectory -WhatIf
            } else {
                # Create the folder Junction from $directory to $newDirecotry
                Move-Item -Path $directory -Destination $newDirectory
            }
        }
    } else {
        Write-Host " "
        Write-Host "The Folder '$directory' does not exist"
        Write-Host " "
    }
}
