# https://www.tomsguide.com/news/how-to-uninstall-cortana
# Task Manager, click the Startup column => cortana disable
# Start menu => Cortana => App Settings => Runs at Login = off
# as administrator
Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage

# PowerShell 7.3.0  The 'Get-AppxPackage' command was found in the module 'Appx', 
# but the module could not be loaded due to the following error:
# Operation is not supported on this platform.

