#!/bin/bash -x
Heads=0
Tails=1
headCount=0
tailCount=0
iterations=0

declare -A storage

while [ $iterations -lt 10 ]
do
	result=$((RANDOM%2))
	if [ $result -eq $Heads ]
	then
		((headCount++))
	else
		((tailCount++))
	fi
	((iterations++))
done

storage[heads]=$headCount
storage[tails]=$tailCount

echo ${storage[@]}

percentageOfSingletHeads=`echo "${storage[heads]}*100/$iterations" | bc`
percentageOfSingletTails=`echo "${storage[tails]}*100/$iterations" | bc`

