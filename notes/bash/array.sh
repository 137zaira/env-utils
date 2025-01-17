#!/bin/bash

declare -A ass_arr
ass_arr[$key]="value"
# length
${#ass_arr[@]}
# list all keys
echo "${!ass_arr[@]}"
# keys to array
keys=(${!ass_arr[@]})
# first key
echo "${keys[0]}"
# delete
unset ass_arr

# https://stackoverflow.com/questions/1527049/how-can-i-join-elements-of-an-array-in-bash
join_by() {
    local d=${1-} f=${2-}
    if shift 2; then
        printf %s "$f" "${@/#/$d}"
    fi
}

is_key_in_array() {
    arr_name="$1"
    find_string="$2"
    declare -n the_arr="$arr_name"
    for item_in_arr in ${the_arr[@]}; do
        # echo "item_in_arr: $item_in_arr"
        if [[ $item_in_arr = $find_string ]]; then
            echo 1
            return
        fi
    done
    echo 0
}
