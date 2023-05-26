::Made by ComPlexU
@echo off
cd /d "%~dp0"

set output_dir=%~dp0\output

::Creates the output directory if it does not exist
if not exist "%output_dir%" mkdir "%output_dir%"

::Gets the current date and time
echo the current time is: %date% - %time% >> "%output_dir%\time.txt"
::User and system information 
ver >> "%output_dir%\ver.txt"
set >> "%output_dir%\set.txt"
Net User >> "%output_dir%\netuser.txt"
net sessions >> "%output_dir%\netsessions.txt"
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName >> "%output_dir%\productname.txt"
:Encryption and bitlocker
manage-bde -status >> "%output_dir%\manage_bde.txt"
manage-bde -protectors -get C: >> "%output_dir%\bitlocker.txt"
::Processes and Applications
Tasklist /v >> "%output_dir%\tasklist.txt"
Wmic process get name,processid,priority,threadcount,privatepagecount >> "%output_dir%\process.txt"
::Scheduled tasks and events
schtasks >> "%output_dir%\schtasks.txt"
wevtutil el >> "%output_dir%\wevtutil.txt"
::Get the last ctrl c Clipboard	
powershell -command "Get-Clipboard" >> "%output_dir%\area_transferencia.txt"
::Network Information
ipconfig /all >> "%output_dir%\ipconfig_all.txt"
ipconfig /displaydns >> "%output_dir%\displaydns.txt"
Netstat -a >> "%output_dir%\netstat_a.txt"
Arp -a >> "%output_dir%\arp_a.txt"
Netsh int ipv6 show neigh >> "%output_dir%\ipv6_neigh.txt"
Netsh wlan show all >> "%output_dir%\wlan_all.txt"
Route print >> "%output_dir%\route_print.txt"
Netstat -c >> "%output_dir%\netstat_c.txt"
Netstat -s >> "%output_dir%\netstat_s.txt"
Rasdial >> "%output_dir%\rasdial.txt"
Net share >> "%output_dir%\net_share.txt"
Netsh wlan show profiles >> "%output_dir%\wlan_profiles.txt"
Nslookup -d >> "%output_dir%\nslookup.txt"
exit 0
