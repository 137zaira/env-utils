#!/bin/bash

# digit/space
printf '%03d' $i
# pad right string
printf "%-15s" "$arg"
# zero pad to int
num="${file%\.*}"

# first match (.*)
echo "${BASH_REMATCH[1]}"

# to upper, to lower
token="${token^^}"
token="${token,,}"

# zero pad to int
echo $num | awk '{printf("%0.0f\n", $1)}'
# 2 decimal
echo $num | awk '{printf("%0.2f\n", $1)}'
# decimal 8 total digit, 2 decimal
echo $num | awk '{printf("%08.2f\n", $1)}'
# num*5
echo $num | awk '$0*=5'

# (1 1st elem)
echo "1 2 3" | awk '{print $1;}'

##########################################
# After  last  _ | a_b_c => c"
echo "${test_str##*_}"
# After  first _ | a_b_c => b_c"
echo "${test_str#*_}"

# Before last  _ | a_b_c => a_b"
echo "${test_str%_*}"
# Before first _ |a_b_c => a"
echo "${test_str%%_*}"

# Before last whitespace ( {)
header=${line%\ \{*\}}
# strip trailing /
sub_path="${@%/}"
##########################################
# c|C => C:
sed -E "s/^[cC]/C:/g"
# / to \
sed -E "s/\//\\\\/g"
##########################################
# is all numerical
[[ $line =~ ^[0-9]$ ]] && {
       echo "$line"
}
# [[:digit:]][ -_0-9a-aA-Z]
##########################################
exit
echo "
string
       ${!name[@]}
       ${!name[*]}
              List  of  array  keys.   If  name  is an array variable, expands to the list of array indices
              (keys) assigned in name.  If name is not an array, expands to 0 if name is set and null  oth‐
              erwise.  When @ is used and the expansion appears within double quotes, each key expands to a
              separate word.


       ${parameter#word}
       ${parameter##word}
              Remove matching prefix pattern.  The word is expanded to produce a pattern just as  in  path‐
              name expansion, and matched against the expanded value of parameter using the rules described
              under Pattern Matching below.  If the pattern matches the beginning of the value  of  parame‐
              ter,  then  the  result of the expansion is the expanded value of parameter with the shortest
              matching pattern (the $()#'' case) or the longest matching pattern (the $()##'' case)  deleted.
              If parameter is @ or *, the pattern removal operation is applied to each positional parameter
              in turn, and the expansion is the resultant list.  If parameter is  an  array  variable  sub‐
              scripted with @ or *, the pattern removal operation is applied to each member of the array in
              turn, and the expansion is the resultant list.


       ${parameter%word}
       ${parameter%%word}
              Remove matching suffix pattern.  The word is expanded to produce a pattern just as  in  path‐
              name expansion, and matched against the expanded value of parameter using the rules described
              under Pattern Matching below.  If the pattern matches a  trailing  portion  of  the  expanded
              value  of parameter, then the result of the expansion is the expanded value of parameter with
              the shortest matching pattern (the $()%'' case) or the longest matching  pattern  (the  $()%%''
              case)  deleted.  If parameter is @ or *, the pattern removal operation is applied to each po‐
              sitional parameter in turn, and the expansion is the resultant list.  If parameter is an  ar‐
              ray variable subscripted with @ or *, the pattern removal operation is applied to each member
              of the array in turn, and the expansion is the resultant list.

       ${parameter/pattern/string}
              Pattern substitution.  The pattern is expanded to produce a pattern just as in  pathname  ex‐
              pansion, Parameter is expanded and the longest match of pattern against its value is replaced
              with string.  The match is performed using the rules described under Pattern Matching  below.
              If pattern begins with /, all matches of pattern are replaced with string.  Normally only the
              first match is replaced.  If pattern begins with #, it must match at the beginning of the ex‐
              panded  value  of  parameter.   If pattern begins with %, it must match at the end of the ex‐
              panded value of parameter.  If string is null, matches of pattern are deleted and the /  fol‐
              lowing pattern may be omitted.  If the nocasematch shell option is enabled, the match is per‐
              formed without regard to the case of alphabetic characters.  If parameter is @ or *, the sub‐
              stitution operation is applied to each positional parameter in turn, and the expansion is the
              resultant list.  If parameter is an array variable subscripted with @ or *, the  substitution
              operation  is applied to each member of the array in turn, and the expansion is the resultant
              list.
"
