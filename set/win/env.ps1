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
Write-Output ("C:/_/u/set/ch_env.ps1")
exit
