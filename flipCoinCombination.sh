#!/bin/bash -x
Heads=0
Tails=1
head_HeadCount=0 # HH
tail_TailCount=0 # TT
head_TailCount=0 # HT
tail_HeadCount=0 # TH
iterations=0

declare -A storage

while [ $iterations -lt 10 ]
do
	coin_1=$((RANDOM%2))
	coin_2=$((RANDOM%2))
	if [[ $coin_1 -eq $Heads && $coin_2 -eq $Heads ]]
	then
		((head_HeadCount++))
	elif [[ $coin_1 -eq $Tails && $coin_2 -eq $Tails ]]
	then
		((tail_TailCount++))
	elif [[ $coin_1 -eq $Heads && $coin_2 -eq $Tails ]]
	then
		((head_TailCount++))
	else
		((tail_HeadCount++))
	fi
	((iterations++))
done

storage[HH]=$head_HeadCount
storage[TT]=$tail_TailCount
storage[HT]=$head_TailCount
storage[TH]=$tail_HeadCount

echo ${storage[@]}

percentageOfHead_HeadCombo=`echo "${storage[HH]}*100/$iterations" | bc`
percentageOfTail_TailCombo=`echo "${storage[TT]}*100/$iterations" | bc`
percentageOfHead_TailCombo=`echo "${storage[HT]}*100/$iterations" | bc`
percentageOfTail_HeadCombo=`echo "${storage[TH]}*100/$iterations" | bc`

