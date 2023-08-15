#!/usr/bin/env bash

#===============================================================================
#  Functions
#===============================================================================


printHeading() {
    printf "\n\n\n\e[0;36m$1\e[0m \n"
}

printDivider() {
    printf %"$COLUMNS"s |tr " " "-"
    printf "\n"
}

printError() {
    printf "\n\e[1;31m"
    printf %"$COLUMNS"s |tr " " "-"
    if [ -z "$1" ]      # Is parameter #1 zero length?
    then
        printf "     There was an error ... somewhere\n"  # no parameter passed.
    else
        printf "\n     Error Installing $1\n" # parameter passed.
    fi
    printf %"$COLUMNS"s |tr " " "-"
    printf " \e[0m\n"
}

printStep() {
    printf %"$COLUMNS"s |tr " " "-"
    printf "\nInstalling $1...\n";
    $2 || printError "$1"
}

# The first parameter to `askToRun` is the command (remember to quote it), and if the optional second parameter is `y` or `-y`,
# then the command is run unconditionally. Otherwise, the user is asked if they wish to run the command?
askToRun() {
	if [ "$2" == "y" -o "$2" == "-y" ]
	then
		eval "$1"
	else
        printf "\nWould you like to run this command? $1 [Y/n]\n"
        read ANSWER
        if [ "$ANSWER" == "Y" -o "$ANSWER" == "y" -o -z "$ANSWER" ]
        then
            eval "$1"
        fi
    fi

	
}

# shellcheck disable=SC2154
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e
