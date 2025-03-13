
# Get-Service -Name ssh-agent | Set-Service -StartupType Manual
Get-Service -Name ssh-agent | Set-Service -StartupType Auto
Start-Service ssh-agent