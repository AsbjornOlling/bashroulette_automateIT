#!/bin/bash

while true; do
    cat ./gun
    read -n 1 -s -p "Would you like to play a game?"
    clear
    roll="$[RANDOM+1]"
    remainder="$[$roll%6]"
    
    number="$[RANDOM+1]"
    linemax="$(systemctl | wc -l)"
    line="$[number % linemax]"
    
    service="$(systemctl | grep '.service' | sed -n ${line}p | awk '{print $1;}')"
    echo $service > ~/.answer.txt
    wait
    
    if [ $remainder == 0 ]
    then cat ./gun_shot
	 echo "Drink bitch!"
	 sleep 2s
	 clear
	 systemctl stop $service 2> /dev/null
    else cat ./gun_knot
	 echo "You live to fight another day..."
	 sleep 2s
	 clear
    fi
    clear	
done
