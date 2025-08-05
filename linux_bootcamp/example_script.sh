#!/bin/bash

## IF STATEMENTS

#IF-ELSE
if [ condition-is-true ]; then
	command
else
	command
fi

#IF-ELIF-ELSE
if [ condition-is-true ]; then
	command
elif [ condition-is-true ]; then
	command
else
	command
fi

## FOR LOOP

for VAR_NAME in ITEM_1 ITEM_2 ITEM_N; do
	command1
	command2
	commandN
done


## Positional Parameters

for i in $@; do
	echo "Archiving: $i"
	#Archiving
	tar cvf /archives/$i.tar.gz /home/$i
done

## THE READ COMMAND

read -p "Enter a name: " USER
echo "YOU ARE $USER"


