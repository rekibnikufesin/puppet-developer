# Creating Your Own Chocolatey Package
In this folder, you will find the necessary scripts to generate a Chocolatey Package
that installs the Meinberg NTP agent on Windows, starts it as a service, and is
configurable via the puppet ntp module in this repo.

## Steps:
1. Download the latest version of the Meinberg NTP client from [https://www.meinbergglobal.com/english/sw/ntp.htm](https://www.meinbergglobal.com/english/sw/ntp.htm)
1. Place the downloaded file in the `tools` subdirectory
1. Update the name of the downloaded package on line 11 of chocolateyInstall.ps1
1. Change the version number on line 7 of meinberg-ntp.nuspec to reflect the version number you downloaded
1. Open Powershell and switch to this directory
1. Run the command `choco pack` to create the chocolatey package
1. Move the generated package to the `code/environments/production/modules/ntp/files` folder in this repo
1. Update `ntp/manifests/install.pp` and `ntp/spec/classes/install_spec.rb` to reflect the name of your chocolatey package if different.

## IF...
you have problems, feel free to hit me up via [twitter](https://twitter.com/wfbutton)
