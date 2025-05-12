# Set Execution Policy to allow script to run
Set-ExecutionPolicy Bypass -Scope Process -Force
# Allow Ping
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" -enabled True
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv6-In)" -enabled True
# Allow RDP
Set-NetFirewallRule -DisplayName "Remote Desktop - User Mode (TCP-In)" -enabled True    
Set-NetFirewallRule -DisplayName "Remote Desktop - User Mode (UDP-In)" -enabled True
# Install apps
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install notepadplusplus -y
choco install adobereader -y
choco install microsoft-teams.install -y
