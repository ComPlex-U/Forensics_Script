::script Made by ComPlexU
@echo off

::Gpedit.msc -> Computer Configuration -> Administrative Templates->Windows Component -> Windows Updates -> :Enable functions 
::Enable functions 
::disable automatic restart for updates out of activity 
::Do not connect to any internet location of Windows update 
::no automatic restart with users in session for scheduled automatic update installations 
::disable the following 
::allow updates to be downloaded automatically over connections with limited traffic
::always restart automatically at scheduled time configure automatic updates
::specify deadlines for automatic restarts and updates
::allow frequency for immediate detection of automatic updates
::allow immediate installation of automatic updates
::schedule installations of automatic software updates

::Gpedit.msc -> Computer Configuration -> Administrative Templates-> System -> Removable Storage Access
::enable removable disks deny write access

::control panel -> Hardware and Sound -> AutoPlay -> Uncheck the option "Use AutoPlay for all devices and media

echo Configurando as opções do Windows Update...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAutoRebootWithLoggedOnUsers' -Value 1"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'DoNotConnectToWindowsUpdateInternetLocations' -Value 1"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'NoAutoRebootWithLoggedOnUsers' -Value 1"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name 'UseWUServer' -Value 0"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'DisableOSUpgrade' -Value 1"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'SetAutoRestartNotification' -Value 0"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'SpecifyIntranetMicrosoftUpdateServiceLocation' -Value 0"
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' -Name 'NoAutoUpdate' -Value 1"

echo Configurando o acesso ao armazenamento amovível...
powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices' -Name 'Deny_Write_Access' -Value 1"

echo Configurando a opção de Reprodução Automática...
powershell -Command "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers' -Name 'DisableAutoplay' -Value 1"

echo Configuração concluída.

