This initial init is a WIP migration of my bash env to be pushed to git  
The following must be set in the environment  
Example with this repo at /_u update to /c/_/u/or_whatever/...

```
_d="/_"
_u="/_/u"
_t="/_/t"
_s="/_/s"
_set="/_/set"
user="user_dir_name"
```

I will be creating env setup functions soon  
Note this is not polished  
[command]_ means sudo command  
if you use a [command]_ be sure you know what you are doing i.e.  
`to` creates a file (touch) as user  
`to_` creates a file (touch) as root owned  
`rf` is dangerous because it is rm -rf (force+recursive)  
`rf_` is even worse as sudo can remove sys files if used accidentally

sqlite3 must be on path to use ./t/sql functions

Please note the sha archival utils under s/arc are only tested for linux
archive functions in s/arc can be run by copying s/arc/run_samples to a script and updating per needs. See s/arc/notes.txt for some details.
