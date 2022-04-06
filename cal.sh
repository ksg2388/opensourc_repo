#!/bin/bash

 

num1=$(<num1.txt)

num2=$(<num2.txt)

arr=($num1 $num2)

 

if [ $# -gt 0 ]; then

	echo "...run calculater..."

	if [ $1 == "add" ]; then

		result=$((${arr[0]}+${arr[1]}))

	elif [ $1 == "sub" ]; then

		result=$((${arr[0]}-${arr[1]}))

	elif [ $1 == "div" ]; then

		result=$((${arr[0]}/${arr[1]}))

	elif [ $1 == "mul" ]; then

		result=$((${arr[0]}*${arr[1]}))

 

	fi

	echo

	echo "num1:${arr[0]}"

	echo "num2:${arr[1]}"

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

		result=$((${arr[0]}+${arr[1]}))

	elif [ $var == "sub" ]; then

		result=$((${arr[0]}-${arr[1]}))

	elif [ $var == "div" ]; then

		result=$((${arr[0]}/${arr[1]}))

	elif [ $var == "mul" ]; then

		result=$((${arr[0]}*${arr[1]}))

	fi

	echo

	echo "num1:${arr[0]}"

	echo "num2:${arr[1]}"

	echo "op:$var"

	echo "result:$result"

 

fi
