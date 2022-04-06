#!/bin/bash

num1=$(<num1.txt)
num2=$(<num2.txt)

if [ $# -gt 0 ]; then
	echo "...run calculater..."
	if [ $1 == "add" ]; then
		result=$(($num1+$num2))
	elif [ $1 == "sub" ]; then
		result=$(($num1-$num2))
	elif [ $1 == "div" ]; then
		result=$(($num1/$num2))
	elif [ $1 == "mul" ]; then
		result=$(($num1*$num2))

	fi
	echo
	echo "num1:$num1"
	echo "num2:$num2"
	echo "op:$1"
	echo "result:$result"
	
else
	echo "...none operator parameter..."

	PS3='select munu:'
	select var in add sub div mul
	do
        	break
	done

	if [ $var == "add" ]; then
		result=$(($num1+$num2))
	elif [ $var == "sub" ]; then
		result=$(($num1-$num2))
	elif [ $var == "div" ]; then
		result=$(($num1/$num2))
	elif [ $var == "mul" ]; then
		result=$(($num1*$num2))
	fi
	echo
	echo "num1:$num1"
	echo "num2:$num2"
	echo "op:$var"
	echo "result:$result"

fi

