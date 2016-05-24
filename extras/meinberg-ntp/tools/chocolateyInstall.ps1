# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f

$ErrorActionPreference = 'Stop'; # stop on all errors


$packageName= 'meinberg-ntp' # arbitrary name for the package, used in messages
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.meinbergglobal.com/download/ntp/windows/ntp-4.2.8p7-win32-setup.exe'
$fileLocation = Join-Path $toolsDir 'ntp-4.2.8p7-win32-setup.exe'
#$fileLocation = Join-Path $toolsDir 'SHARE_LOCATION_OF_INSTALLER_FILE'
$installini = Join-Path $toolsDir 'install.ini'
$fileType = 'EXE'
$silentArgs    = '/USE_FILE='+$installini
$validExitCodes= @(0, 2, 3010, 1641)

Install-ChocolateyPackage $packageName $fileType $silentArgs $fileLocation -validExitCodes $validExitCodes
