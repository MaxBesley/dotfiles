#!/bin/bash


# Follow cd by an ls
function cd {
    builtin cd "$@" && ls -A
}

# Navigate up directories
function up {
    cd $(eval printf '../'%.0s {1..$1})
}

# Create a new directory and enter it
function mkd {
    mkdir -p "$@" && cd "$_"
}

# Determine size of a file or total size of a directory
function fs {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* ./*;
    fi;
}

# Start a HTTP server from a directory (optionally specifying the port)
# Usage: `myserver <directory> <port>`
#        Where <directory> has your current working directory as
#        its default value and <port> has default value 8000.
#        Both arguments are optional and <directory> can
#        be either a relative or absolute path.
function myserver {
    if (( $# > 2 )); then
        echo "Error: cannot have more than 2 args"
        return 1
    fi
    local dir=${1:-$(pwd)}
    local port="${2:-8000}"
    echo "Try... http://localhost:"${port}"/"
    python3 -m http.server -d $dir $port
}
