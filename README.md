# Recieve-input
#!/bin/bash

echo -n "Enter what you need:" read something

if [ $something = 'update' ]; then

	exec "terminal yay -Syyu"
	
elif [ $something = 'qq' ]; then

	exit
	
elif [ $something = 'firefox' ]; then

	exec "firefox"
	
else

	echo "Try again"; then 
	
fi

echo "You Entered: $something" then when it ends line 3



#if $something is different than (needs a list I think) then echo "Try again" loop line 3

#if condition then statement

#figure how to create a window to input $something

#figure how to make it look cool

#exit buttons
