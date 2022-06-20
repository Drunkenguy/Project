# Recieve-input
#!/bin/bash

echo -n "Enter what you need:" read something

if [ $something = 'update' ]; then

	exec "terminal sudo pacman -Syyu"
	
elif [ $something = 'qq' ]; then

	exit
	
elif [ $something = 'firefox' ]; then

	exec "firefox"
else
	echo "Try again"; (ok button) then 
	
	echo -n "Enter what you need:" read something
fi

echo "You Entered: $something" then when it ends line 3


#Ideas
$something= 'create directory at home'

create

directory

at * = cd /*

open a webpage




#if $something is different than (needs a list I think) then echo "Try again" loop line 3

#if condition then statement

#figure how to create a window to input $something

#figure how to make it look cool

#ok button

#exit buttons


 
