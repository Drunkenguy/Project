#!/bin/bash

# Create the yad window
command=$(yad --form --title="Run Command" \
    --text="Enter a command:" \
    --field="Command:" \
    --button="OK:0" --button="Exit:1" --button="Minimize:2")
    
    
# Check if the user clicked the Minimize button or not
if [ $? -eq 2 ]; then
    # Minimize the yad window
    xdotool search --name "Run Command" windowminimize
else
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
    settings)
        # Show a dialog to change the settings
        selected_options=$(yad --form \
            --title="Settings" \
            --text="Choose an option:" \
            --field="Change Fonts:CHK" \
            --field="Change Colors:CHK" \
            --field="Placeholder:CHK")

        font=$(echo "$selected_options" | cut -d '|' -f 1)
        color=$(echo "$selected_options" | cut -d '|' -f 2)
        placeholder=$(echo "$selected_options" | cut -d '|' -f 3)

        if [ "$color" = "TRUE" ]; then
            # Show a color selection dialog and change the colors in the yad window
            selected_colors=$(yad --color-selection \
                --title="Select Colors")
            font_color=$(echo "$selected_colors" | awk -F':' '{print $1}')
            window_color=$(echo "$selected_colors" | awk -F':' '{print $2}')
            background_color=$(echo "$selected_colors" | awk -F':' '{print $3}')
            yad --form --title="Settings" \
                --text="Choose an option:" \
                --field="Change Fonts:CHK" \
                --field="Change Colors:CHK" \
                --field="Placeholder:CHK" \
                --fontcolor="$font_color" \
                --backcolor="$background_color" \
                --forecolor="$window_color" \
                --button="OK:0" --button="Cancel:1"
        elif [ "$placeholder" = "TRUE" ]; then
            # Placeholder for future feature
            yad --title="Settings" \
                --text="This feature is not yet available."
        else
            # Show an error message if no option is selected
            yad --title="Settings" \
                --text="Please select an option."
        fi
        ;;
    multiple)
        # Execute multiple commands at once
        exec xterm -e "sudo pacman -Syyu; firefox; ls -la"
        ;;
    appearance)
        # Customize the appearance of the terminal emulator
        selected_options=$(yad --form \
            --title="Appearance" \
            --text="Choose an option:" \
            --field="Change Font:CHK" \
            --field="Change Colors:CHK")

        font=$(echo "$selected_options" | cut -d '|' -f 1)
        color=$(echo "$selected_options" | cut -d '|' -f 2)

        if [ "$font" = "TRUE" ]; then
            # Show a font selection dialog and change the font in the yad window
            selected_font=$(yad --font \
                --title="Select a Font" \
                --fontname="Monospace 12")
            yad --form --title="Appearance" \
                --text="Choose an option:" \
                --field="Change Font:CHK" \
                --field="Change Colors:CHK" \
                --font="$selected_font" \
                --button="OK:0" --button="Cancel:1"
        elif [ "$color" = "TRUE" ]; then
            # Show a color selection dialog and change the colors in the yad window
            selected_colors=$(yad --color-selection \
                --title="Select Colors")
            font_color=$(echo "$selected_colors" | awk -F':' '{print $1}')
            window_color=$(echo "$selected_colors" | awk -F':' '{print $2}')
            background_color=$(echo "$selected_colors" | awk -F':' '{print $3}')
            yad --form --title="Appearance" \
                --text="Choose an option:" \
                --field="Change Font:CHK" \
                --field="Change Colors:CHK" \
                --fontcolor="$font_color" \
                --backcolor="$background_color" \
                --forecolor="$window_color" \
                --button="OK:0" --button="Cancel:1"
        else
            # Show an error message if no option is selected
            yad --title="Appearance" \
                --text="Please select an option."
        fi
        ;;
    privilege)
        # Execute commands with elevated privileges
        exec sudo "$user_command"
        ;;
    *)
        yad --title="Error" \
            --text="Invalid command: $user_command"
        ;;
esac

# Prompt the user to enter a command
user_command=$(yad --title="Terminal" \
    --text="Enter a command:" \
    --entry-text="" \
    --entry \
    --width="500" \
    --height="100" \
    --button="Execute:0" \
    --button="Cancel:1" \
    --default-button=0)

# If the user clicked the "Execute" button, process the command
if [ "$user_command" ]; then
    case "$user_command" in
        update)
            exec xterm -e "sudo pacman -Syyu"
            ;;
        firefox)
            exec firefox
            ;;
        settings)
            # Show a dialog to change the settings
            selected_options=$(yad --form \
                --title="Settings" \
                --text="Choose an option:" \
                --field="Change Fonts:CHK" \
                --field="Change Colors:CHK" \
                --field="Placeholder:CHK")

            font=$(echo "$selected_options" | cut -d '|' -f 1)
            color=$(echo "$selected_options" | cut -d '|' -f 2)
            placeholder=$(echo "$selected_options" | cut -d '|' -f 3)

            if [ "$color" = "TRUE" ]; then
                # Show a color selection dialog and change the colors in the yad window
                selected_colors=$(yad --color-selection \
                    --title="Select Colors")
                font_color=$(echo "$selected_colors" | awk -F':' '{print $1}')
                window_color=$(echo "$selected_colors" | awk -F':' '{print $2}')
                background_color=$(echo "$selected_colors" | awk -F':' '{print $3}')
                yad --form --title="Settings" \
                    --text="Choose an option:" \
                    --field="Change Fonts:CHK" \
                    --field="Change Colors:CHK" \
                    --field="Placeholder:CHK" \
                    --fontcolor="$font_color" \
                    --backcolor="$background_color" \
                    --forecolor="$window_color" \
                    --button="OK:0" --button="Cancel:1"
            elif [ "$placeholder" = "TRUE" ]; then
                # Placeholder for future feature
                yad --title="Settings" \
                    --text="This feature is not yet available."
            else
                # Show an error message if no option is selected
                yad --title="Settings" \
                    --text="Please select an option."
            fi
            ;;
        *)
            yad --title="Error" \
                --text="Invalid command: $user_command"
            ;;
    esac
fi

history button next?
