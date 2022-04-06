#!/bin/bash

mkdir temp
echo "...create temp directiory..."

cp num1.txt temp/
cp num2.txt temp/
cp cal.sh temp/
echo "...copy files to temp directory..."

#menu select

PS3='select munu:'

select var in add sub div mul
do
	echo "...$var selected..."
	break
done

bash cal.sh $var
