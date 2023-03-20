#!/bin/bash

# Create the yad window
command=$(yad --form --title="Run Command" \
    --text="Enter a command:" \
    --field="Command:" \
    --button="OK:0" --button="Exit:1")

# Check if the user clicked the OK button or not
if [ $? -eq 0 ]; then
    # Get the command entered by the user
    user_command=$(echo "$command" | awk -F':' '{print $NF}')

    # Check the command entered by the user and execute the appropriate action
    case "$user_command" in
        update)
            exec xterm -e "sudo pacman -Syyu"
            ;;
        firefox)
            exec firefox
            ;;
        *)
            # Show a suggestion for the command based on the user's input
            suggestion=$(echo "$user_command" | grep -oP '^\w+' | sed -n 's/^/echo -n "/p; s/ /"; then "/; s/$/"; fi"/')
            eval "$suggestion"

            # Ask the user to confirm the suggestion or enter a new command
            confirm=$(yad --title="Confirm Command" \
                --text="Did you mean to run this command?" \
                --image="dialog-question" \
                --button="Yes:0" --button="No:1")
            if [ $? -eq 0 ]; then
                # Execute the suggested command
                exec xterm -e "$suggestion"
            else
                # Ask the user to enter a new command
                exec $0
            fi
            ;;
    esac
fi
