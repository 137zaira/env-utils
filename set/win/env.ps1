# C:\_\u\set\w\env.ps1

[Environment]::SetEnvironmentVariable('r_', ". /c/_/u/t/brc", [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('user', "zaira", [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('_b', "/c/_/b", [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('_u', "/c/_/u", [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('_t', "/c/_/u/t", [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('_s', "/c/_/u/s", [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('_set', "/c/_/u/set", [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('sys', "win", [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('_d', "/c/_", [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('_h', "/C/Users/zaira", [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('ten', "/C/Users/zaira/ten", [System.EnvironmentVariableTarget]::Machine)

Write-Output "after opening new terminal recheck:"
Write-Output ("r_: '" + [Environment]::GetEnvironmentVariable('r_') + "'")
Write-Output ("user: '" + [Environment]::GetEnvironmentVariable('user') + "'")
Write-Output ("_b: '" + [Environment]::GetEnvironmentVariable('_b') + "'")
Write-Output ("_u: '" + [Environment]::GetEnvironmentVariable('_u') + "'")
Write-Output ("_t: '" + [Environment]::GetEnvironmentVariable('_t') + "'")
Write-Output ("_s: '" + [Environment]::GetEnvironmentVariable('_s') + "'")
Write-Output ("_set: '" + [Environment]::GetEnvironmentVariable('_set') + "'")
Write-Output ("sys: '" + [Environment]::GetEnvironmentVariable('sys') + "'")
Write-Output ("_d: '" + [Environment]::GetEnvironmentVariable('_d') + "'")
Write-Output ("_h: '" + [Environment]::GetEnvironmentVariable('_h') + "'")
Write-Output ("ten: '" + [Environment]::GetEnvironmentVariable('ten') + "'")

exit
