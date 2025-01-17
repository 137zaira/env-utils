#!/bin/bash

echo "
return values
ret_val=$?
sh -c help
help test
# -z STRING  True if string is empty.
# -n STRING  True if string is not empty.
# STRING1 = STRING2
#        the strings are equal
# STRING1 != STRING2
#        the strings are not equal

# file
# -r FILE
#        FILE exists and read permission is granted
# -d FILE
#        FILE exists and is a directory
# -h FILE
#        FILE exists and is a symbolic link (same as -L)
# -L FILE
#        FILE exists and is a symbolic link (same as -h)
# -k FILE
#        FILE exists and has its sticky bit set

An  omitted  EXPRESSION defaults to false.  Otherwise, EXPRESSION is true or false and sets exit
       status.  It is one of:

       ( EXPRESSION )
              EXPRESSION is true

       ! EXPRESSION
              EXPRESSION is false

       EXPRESSION1 -a EXPRESSION2
              both EXPRESSION1 and EXPRESSION2 are true

       EXPRESSION1 -o EXPRESSION2
              either EXPRESSION1 or EXPRESSION2 is true

"

# https://stackoverflow.com/questions/15668170/if-statement-and-calling-function-in-if-using-bash
check_log() {
    ! [ -f "/usr/apps/appcheck.log" ]
}
if [ check_log ]; then
    echo "..."
fi
