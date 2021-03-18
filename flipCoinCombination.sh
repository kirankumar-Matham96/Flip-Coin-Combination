#!/bin/bash -x
Heads=0
Tails=1
result=$((RANDOM%2))
if [ $result -eq $Heads ]
then
	echo "winner: Heads"
else
	echo "winner: Tails"
fi
