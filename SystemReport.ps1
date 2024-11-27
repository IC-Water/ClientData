$WNZClientInfo = "${Env:ComputerName}"
$folderPathMain = "C:\WNZClientFiles"
$folderPathScripts = "C:\WNZClientFiles\Scripts"
$folderPathReports = "C:\WNZClientFiles\Reports"
$WNZUserName = "${Env:Username}"


Clear

Write-Host "
 +-+-+-+-+-+-+-+-+-+-+-+-+-+
 |W|N|Z|C|o|n|s|u|l|t|i|n|g|
 +-+-+-+-+-+-+-+-+-+-+-+-+-+
 System information collection script.
 version 2.0
"


Write-Host "Hello $WNZUserName, This script takes about 5 minutes to complete."

# Get host name and last boot time 

"Computer information" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
systeminfo | Select-String "Host Name","System Boot Time" | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
systeminfo | find /i "logon server" | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
systeminfo | findstr /i '"System Manufacturer"' | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
systeminfo | findstr /i '"OS"' | find '"OS Version"' | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
systeminfo | findstr /i '"OS"' | find '"OS Configuration"' | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8


 Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
  Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
   Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8


# Get IP Stack info
"IP Info" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
ipconfig /all | find /i '"IPv4 address"' | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
ipconfig /all  | find /i '"gateway"' | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
ipconfig /all  | find /i '"DNS"' | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
ipconfig /all  | find /i '"DHCP Server"' | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
 
 Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
  Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
   Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
 
 
# Get Anti-Virus software
"Installed Anti-Virus software" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

 Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
  Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
   Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

# Get all local users
"List of local users" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Get-LocalGroupMember -name users | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

# Get members of administrator group
"List of users in the Administrator Group" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
net localgroup administrators | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

# List all drives
"List of connected drives and mapped drives" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
gdr -PSProvider 'FileSystem' | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8



# See if Shadow Copy is enabled
"Shadow Copy Status" | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
vssadmin list shadows | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

 Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
  Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

# Get list of all shared folders
"List of all shared folders" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
get-smbshare | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8



Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
 Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
  Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8


#
# Changed this to GetTCPConnections resolving domains.
# Get list of all Open Ports
"List of all Open Ports" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
# netstat -at | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

#Updated from the NetStat above.
Get-NetTCPConnection -State Established |Select-Object -Property LocalAddress, LocalPort,@{name='RemoteHostName';expression={(Resolve-DnsName $_.RemoteAddress).NameHost}},RemoteAddress, RemotePort, State,@{name='ProcessName';expression={(Get-Process -Id $_.OwningProcess). Path}},OffloadState,CreationTime |ft | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
 Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
  Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8



#Get all SSID and passwords


"List of all Wi-Fi" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
$wifi = $(netsh.exe wlan show profiles)

if ($wifi -match "There is no wireless interface on the system."){
    Write-Output $wifi
    exit 
}

$ListOfSSID = ($wifi | Select-string -pattern "\w*All User Profile.*: (.*)" -allmatches).Matches | ForEach-Object {$_.Groups[1].Value}
$NumberOfWifi = $ListOfSSID.count
# Write-Warning "[$(Get-Date)] I've found $NumberOfWifi Wi-Fi Connection settings stored in your system $($env:computername) : "
foreach ($SSID in $ListOfSSID){
    try {
        $passphrase = ($(netsh.exe wlan show profiles name=`"$SSID`" key=clear) |
                    Select-String -pattern ".*Key Content.*:(.*)" -allmatches).Matches |
                        ForEach-Object {$_.Groups[1].Value}
    }
    catch {
        $passphrase = "N/A"
    }

   
 
    Write-Output "$SSID : $passphrase" | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
}

 Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
  Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
   Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

# Get all installed apps.
"Installed Programs" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
winget list | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

 Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
  Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
   Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

# Get all Windows Enabled Featured.
"List of all Windows Enabled Featured" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Get-WindowsOptionalFeature -Online | where {$_.State -eq "Enabled"} | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

# List of startup apps
"Startup APPS" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Get-CimInstance -ClassName Win32_StartupCommand | Select-Object -Property Description, User | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

# Get all running Services 
"List of running services" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Get-Service | Where-Object {$_.Status -EQ "Running"} | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

# Show all applied GPO's
"List of applied GPO's" | out-file -filepath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
gpresult /Scope User /v | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8

 Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
  Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
   Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8


# Show all scheduled tasks
"List of Scheduled Tasks" | Out-File -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding utf8
Write-Output " " | out-file -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding UTF8
get-scheduledtask | where state -eq 'Ready' | Out-File -FilePath $folderPathReports\$WNZClientInfo.txt -Append -Encoding utf8

write-host "Completed"
Start-Sleep -Seconds 8

clear
