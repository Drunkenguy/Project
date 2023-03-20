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
                while true; do
                    # Show a form with three options: Change Fonts, Change Colors, and Placeholder
                    settings=$(yad --form --title="Settings" \
                        --text="Choose an option:" \
                        --field="Change Fonts:CHK" \
                        --field="Change Colors:CHK" \
                        --field="Placeholder:CHK" \
                        --button="OK:0" --button="Cancel:1")
                        
                        

        # Check which option the user selected and execute the appropriate action
        if [ $? -if [ $? -eq 0 ]; then
        # Extract settings from input string
            IFS=':' read -r fonts colors placeholder <<< "$settings"
            if [ "$fonts" = "TRUE" ]; then
    # Show a dialog to select a font and change the font in the yad window
    selected_font=$(yad --font \
        --title="Select a Font" \
        --fontname="Monospace 12")
    yad --form --title="Settings" \
        --text="Choose an option:" \
        --field="Change Fonts:CHK" \
        --field="Change Colors:CHK" \
        --field="Placeholder:CHK" \
        --font="$selected_font" \
        --button="OK:0" --button="Cancel:1"
      
      
      
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
                    --forecolor
                    ="$window_color" \
                    --button="OK:0" --button="Cancel:1"
elif [ "$placeholder" = "TRUE" ]; then
# Placeholder for future feature
yad --title="Settings"
--text="This feature is not yet available."
else
# Show an error message if no option is selected
yad --title="Settings"
--text="Please select an option."
fi
fi
;;
*)
yad --title="Error"
--text="Invalid command: $user_command"
;;
esac
# Prompt the user to enter a new command

yad --title="Terminal"
--text="Enter a command:"
--entry-text=""
--entry
--width="500"
--height="100"
--button="Execute:0" --button="Cancel:1" --default-button=0
# Store the user's command

user_command=$?
# If the user did not click the "Cancel" button, execute the command

if [ $user_command -eq 0 ]; then
# Execute the command
case "$user_command_text" in
update)
exec xterm -e "sudo pacman -Syyu"
;;
firefox)
exec firefox
;;
settings)
# If the user types "settings" again, do nothing
;;
*)
yad --title="Error"
--text="Invalid command: $user_command_text"
;;
esac
fi# Show a color selection dialog and change the colors in the yad window
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
yad --title="Settings"
--text="This feature is not yet available."
else
# Show an error message if no option is selected
yad --title="Settings"
--text="Please select an option."
fi
fi
;;
*)
yad --title="Error"
--text="Invalid command: $user_command"
;;
esac
# Prompt the user to enter a new command

yad --title="Terminal"
--text="Enter a command:"
--entry-text=""
--entry
--width="500"
--height="100"
--button="Execute:0" --button="Cancel:1" --default-button=0
# Store the user's command

user_command=$?
# If the user did not click the "Cancel" button, execute the command

if [ $user_command -eq 0 ]; then
# Execute the command
case "$user_command_text" in
update)
exec xterm -e "sudo pacman -Syyu"
;;
firefox)
exec firefox
;;
settings)
# If the user types "settings" again, do nothing
;;
*)
yad --title="Error"
--text="Invalid command: $user_command_text"
;;
esac
fi

 History button
