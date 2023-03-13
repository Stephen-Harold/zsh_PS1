#!/bin/bash
setopt prompt_subst
export EDITOR=nano

# Re-define 'command_not_found_handler' event handler to add console beep.
function command_not_found_handler() {
        osascript -e beep&echo "zsh: command not found: $1"&
        return 127;
}

# Define 'precmd' function to catch the command line 'enter-event'.
precmd() {
    rtnval=$?
    export PS1=$(~/.pre_cmd $rtnval)
}

