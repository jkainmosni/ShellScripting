#!/bin/bash

file=$1

echo "1. Type \"S\" to search for a name in the address book"
echo "2. Type \"A\" to add a new name"
echo "3. Type \"D\" to remove a name from the book"
i=0
read input
#1. Search
if [ $input = "S" ]
then

while [ $i -eq 0 ]
do

echo "Ender a name to search"
read inputName
	if grep -qi $inputName "$file";
	then
	echo "Name exists :)"
	else
	echo "Name does not exist :("
	fi
	echo "Search again? Y/N"
	read exitStatus
	if [ $exitStatus = "N" ]
	then
	i=1
	fi
done

#2. Add
elif [ $input = "A" ]
then

while [ $i -eq 0 ]
do

echo "Enter a new name to add"
read inputAdd
echo "$inputAdd" >> $file

done

#3. Delete
elif [ $input = "D" ]
then


while [ $i -eq 0 ]
do

echo "Enter a name to remove"
read inputRemove
	if grep -qi $inputRemove $file;
	then
	sed " /$inputRemove/ d" $file
	echo "Name removed. Exit Y/N"
		read exitStatus
		if [ $exitStatus = "Y" ]
		then
		i=1
		fi
	else
	echo "Name does not exist. Search again Y/N"
		read exitStatus
		if [ $exitStatus = "N" ]
		then
		i=1
		fi
	fi
done
fi
