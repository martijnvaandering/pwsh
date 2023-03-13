clear 
@('Cegeka','Pizza sessie','PowerShell') | foreach { figlet -w $(tput cols) -c $_}
Write-Host "Press any key to continue..."
$x = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
clear
get-content /tmp/pwshlogo.txt
Write-Host "Press any key to continue..."
$x = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
clear
@('Shell','Terminal','CLI',"??") | foreach { figlet -w $(tput cols) -c $_}
cd /tmp
pwsh