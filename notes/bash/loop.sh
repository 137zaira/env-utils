#!/bin/bash
array_wrapper() {
    for a_thing in ${ini[@]}; do
        echo "$thing"
    done
}

file_wrapper() {
    file_fpath="$1"
    file_dpath="${file_fpath%\/*}"
    file_fname="${file_fpath##*\/}"
    file_ext="${file_fname##*\.}"
    file_name="${file_fname%\.*}"
    while read -r line || [[ -n "$line" ]]; do
        echo "line: $line"
    done <"$file_fpath"
}

var_wrapper() {
    var="$1"
    while IFS= read -r line; do
        echo "$line"
    done <<<"$var"
}

# include hidden
shopt -s dotglob
# for each file in directory
dir_wrapper() {
    if [[ $# -gt 0 ]]; then
        pre="$1"
    else
        pre="."
    fi
    for a_path in "$pre"/*; do
        # only if filetype with extension
        if ! [[ -f "$a_path" && "$a_path" =~ .*\..* ]]; then
            continue
        fi
        # fullname="${a_path##*\/}"
        # ext="${fullname##*\.}"
        # fname="${fullname%\.*}"

        stat=$(stat -c %s "$a_path")
        [[ $stat -gt 40000 ]] && {
            echo "$stat $a_path"
            # mv "$a_path" "${a_path}.mp4"
        }
    done
}
shopt +s dotglob

# for each | divided item
some_string="tv|film"
while [[ $some_string =~ ^([^|]+)\|(.*)$ || $some_string =~ ^([^|]+)$ ]]; do
    segment="${BASH_REMATCH[1]}"
    some_string="${BASH_REMATCH[2]}"
    echo "segment: $segment"
done

# split around space
while [[ $line =~ ^([^[:space:]]+)[[:space:]]*([^[:space:]]*)$ ]]; do
    ip_add="${BASH_REMATCH[1]}"
    host_name="${BASH_REMATCH[2]}"
done
