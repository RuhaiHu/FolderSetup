#Requires -version 5.1
<#
.SYNOPSIS
    Create the variables for FolderLink.ps1 and FolderRelocate.ps1

.DESCRIPTION
    Just the Shared variables of the Folder Link and Relocate scripts

.PARAMETER <Parameter_Name>
    <Brief description of parameter input required. Repeat this attribute if required>

.INPUTS
    The Variables below

.OUTPUTS
    None

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

#----------------------------------------------------------[Declarations]----------------------------------------------------------

# I didn't make paths for LocalLow because I can't think of any setting I have taken ever from that directory

$user = $env:UserName
$userLocal = $env:LOCALAPPDATA + "\"
$userRoaming = $env:APPDATA + "\"

# Local Directories
$localDirectories = "FileZilla Pro", "KeePass", "keepassxc", "Minion", "Mozilla", "Thunderbird"

# Roaming Directories
$roamingDirectories = ".minecraft", "Code", "Elgato", "FileZilla", "foobar2000", "Guild Wars 2", "HexChat", "JumplistExtender", "MediaMonkey", "Mozilla", "Notepad++", "obs-studio", "steelseries-engine-3-client", "Thunderbird"

# New location to move folder too
$notOSDrivePathLocal = "E:\Users\" + $user + "\AppData\Local\"
$notOSDrivePathRoaming = "E:\Users\" + $user + "\AppData\Roaming\"

# Set this variable to True to enable test mode
# Set this variable to False to disable test mode
$testModeRelocate = $false
$testModeLink = $false