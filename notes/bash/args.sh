#!/bin/bash

# last arg to function
"${@: -1}"
# remove last arg to function
set -- "${@:1:$(($# - 1))}"

# (1 1st elem)
echo "1 2 3" | awk '{print $1;}'

# remove second
set -- "$1" "${@:3}"

dry() {
    [[ 0 -eq 1 ]]
}
verbose() {
    [[ 0 -eq 1 ]]
}

# add if in function
local OPTIND
# function/subshell opts
while getopts 'nvf:' OPTION; do
    case "$OPTION" in
    n)
        dry() {
            [[ 1 -eq 1 ]]
        }
        ;;
    v)
        verbose() {
            [[ 1 -eq 1 ]]
        }
        ;;
    f)
        file="$OPTARG"
        ;;
    ?)
        echo "bad argument! arg: $OPTION"
        exit 1
        ;;
    esac
done
shift "$(($OPTIND - 1))"

verbose && {
    echo "opts: $(args_to_string dry verbose local_only branch)"
    [[ -n "$@" ]] && echo "\$@: $@"
}

# function example
wt_c() {
    local OPTIND o b
    while getopts 'lb:' o; do
        case "$o" in
        l)
            local_only=1
            ;;
        b)
            echo "b arg: $OPTARG"
            ;;
        esac
    done
    shift "$(($OPTIND - 1))"
    verbose && {
        echo "opts: $(args_to_string dry verbose local_only branch)"
        [[ -n "$@" ]] && echo "\$@: $@"
    }
}
