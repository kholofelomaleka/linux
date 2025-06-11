#!/bin/bash

DATE=$(date +%F)
i=0

read -p "Please enter your name: " USER
read -p "How many folders are we archiving today? " NUMBER_OF_DIRS

while i < $NUMBER_OF_DIRS; do
       read -p "Please enter the location of $USER folder to archive: " LOCATION
       echo "User: $USER will be archiving ${LOCATION}_${$NUMBER_OF_DIRS}"
       echo "${LOCATION}" >> temp_file.txt
       i=$(i + 1)
done

for i in $(cat temp_file.txt); do
	echo "Starting archive of $i ..."
	tar cvf $i.tar.gz_${DATE} $i
	echo "Finished archive of $i ..."
done

echo "Thank you for using this script $USER, Goodbye!"
