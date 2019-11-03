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
# . "C:\Scripts\Functions\Logging_Functions.ps1"

#----------------------------------------------------------[Declarations]----------------------------------------------------------

# I didn't make paths for LocalLow because I can't think of any setting I have taken ever from that directory

$user = $env:UserName
$userLocal = $env:LOCALAPPDATA + "\"
$userRoaming = $env:APPDATA + "\"

# Local Directories
$localDirectories = "FileZilla Pro", "KeePass", "keepassxc", "Minion", "Mozilla", "Thunderbird"
$localDirectoriesCount = $localDirectories.Count

# Roaming Directories
$roamingDirectories = ".minecraft", "Elgato", "FileZila", "foobar2000", "Guild Wars 2", "HexChat", "JumplistExtender", "MediaMonkey", "Mozilla", "Notepad++", "obs-studio", "steelseries-engine-3-client", "Thunderbird"
$roamingDirectoriesCount = $roamingDirectories.Count

# New location to move folder too
$notOSDrivePath = "E:\Users\" + $user + "\AppData\"