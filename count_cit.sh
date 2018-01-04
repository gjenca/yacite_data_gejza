#!/bin/bash
if [ "$1" == "" ]
then
   FILT=True
else
   FILT="$1"
fi
yacite read pubcit | yacite filter "$FILT" | yacite filter 'not myown' | yacite exec -n 'print cites' |
	tr ',' '\n' | wc -l

