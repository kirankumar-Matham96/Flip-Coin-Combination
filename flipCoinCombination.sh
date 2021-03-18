#!/bin/bash -x
Heads=0
Tails=1
HHH_Count=0 # HHH
HHT_Count=0 # HHT
HTH_Count=0 # HTH
THH_Count=0 # THH
TTT_Count=0 # TTT
TTH_Count=0 # TTH
THT_Count=0 # THT
HTT_Count=0 # HTT
iterations=0

declare -A storage

while [ $iterations -lt 10 ]
do
	coin_1=$((RANDOM%2))
	coin_2=$((RANDOM%2))
	coin_3=$((RANDOM%2))
	if [[ $coin_1 -eq $Heads && $coin_2 -eq $Heads && $coin_3 -eq $Heads ]]
	then
		((HHH_Count++))
	elif [[ $coin_1 -eq $Heads && $coin_2 -eq $Heads && $coin_3 -eq $Tails ]]
	then
		((HHT_Count++))

	elif [[ $coin_1 -eq $Heads && $coin_2 -eq $Tails && $coin_3 -eq $Heads ]]
	then
		((HTH_Count++))

	elif [[ $coin_1 -eq $Tails && $coin_2 -eq $Heads && $coin_3 -eq $Heads ]]
	then
		((THH_Count++))

	elif [[ $coin_1 -eq $Tails && $coin_2 -eq $Tails && $coin_3 -eq $Tails ]]
	then
		((TTT_Count++))

	elif [[ $coin_1 -eq $Tails && $coin_2 -eq $Tails && $coin_3 -eq $Heads ]]
	then
		((TTH_Count++))

	elif [[ $coin_1 -eq $Tails && $coin_2 -eq $Heads && $coin_3 -eq $Tails ]]
	then
		((THT_Count++))

	else
		((HTT_Count++))
	fi
	((iterations++))
done

storage[HHH]=$HHH_Count
storage[HHT]=$HHT_Count
storage[HTH]=$HTH_Count
storage[THH]=$THH_Count
storage[TTT]=$TTT_Count
storage[TTH]=$TTH_Count
storage[THT]=$THT_Count
storage[HTT]=$HTT_Count
echo ${storage[@]}

percentageOf_HHH_Combo=`echo "${storage[HHH]}*100/$iterations" | bc`
percentageOf_HHT_Combo=`echo "${storage[HHT]}*100/$iterations" | bc`
percentageOf_HTH_Combo=`echo "${storage[HTH]}*100/$iterations" | bc`
percentageOf_THH_Combo=`echo "${storage[THH]}*100/$iterations" | bc`
percentageOf_TTT_Combo=`echo "${storage[TTT]}*100/$iterations" | bc`
percentageOf_TTH_Combo=`echo "${storage[TTH]}*100/$iterations" | bc`
percentageOf_THT_Combo=`echo "${storage[THT]}*100/$iterations" | bc`
percentageOf_HTT_Combo=`echo "${storage[HTT]}*100/$iterations" | bc`

