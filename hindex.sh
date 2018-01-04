#!/bin/bash
if [ "$1" == "" ]
then
   FILT=True
else
   FILT="$1"
fi
yacite read pubcit | yacite filter "$FILT" | yacite render timescited.txt | sort -rn | cat -n |
while read n x
do
	if [ $n -le $x ]
	then
		echo 1
	fi
done | wc -l


