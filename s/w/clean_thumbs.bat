
cd "C:\Users\z\AppData\Local\Microsoft\Windows\Explorer"

taskkill /f /im explorer.exe

del iconcache*
del thumbcache_*.db

# clear hidden,readonly,sysattr,apply-dirs
# attrib -h -r -s -d .\*.*
# din work


explorer.exe