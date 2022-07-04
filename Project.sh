#!/bin/bash

echo -n "Enter what you need:" read something

if [ $something = 'update' ]; then

	exec "terminal sudo pacman -Syyu"
	
elif [ $something = 'qq' ]; then

	exit
	
elif [ $something = 'firefox' ]; then

	exec "firefox"
else
	echo "Try again"; then 
	
	echo -n "Enter what you need:" read something
fi

echo "You Entered: $something" then when it ends/or not go to line 3


#Ideas
$something= 'create directory at home'
(create; directory; at * = cd /*;)
#open a webpage

#add a elif line by typing add command 




#if $something is different than (needs a list I think) then echo "Try again" loop line 3

#add a button with all the commands probably?

#history

#if condition then statement

#figure how to create a window to input $something
https://github.com/v1cont/yad/

#figure how to make it look cool

#ok button

#exit buttons
