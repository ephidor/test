=======
# Set Execution Policy to allow script to run
Set-ExecutionPolicy Bypass -Scope Process -Force
# Allow Ping
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" -enabled True
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv6-In)" -enabled True
# Allow RDP
Set-NetFirewallRule -DisplayName "Remote Desktop - User Mode (TCP-In)" -enabled True    
Set-NetFirewallRule -DisplayName "Remote Desktop - User Mode (UDP-In)" -enabled True
# Install IIS
Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools
# Replace IIS Page with Server Name for Identification Purposes
>>>>>>> 9370654a603a567d2996168a5ef2682c3d71f71a:vmsetup.ps1
iex hostname | out-file -filepath c:\inetpub\wwwroot\iisstart.htm -Force
#install ADDS
Install-windowsfeature AD-domain-services
Import-Module ADDSDeployment

Install-ADDSForest
 -CreateDnsDelegation:$false `
 -DatabasePath "C:\Windows\NTDS" `
 -DomainMode "Win2016" `
 -DomainName "mps.com" `
 -DomainNetbiosName "mps" `
 -ForestMode "Win2019" `
 -InstallDns:$true `
 -LogPath "C:\Windows\NTDS" `
 -NoRebootOnCompletion:$false `
 -SysvolPath "C:\Windows\SYSVOL" `
 -Force:$true