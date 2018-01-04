#!/bin/bash
if [ "$1" == "" ]
then
   FILT=True
else
   FILT="$1"
fi
yacite read pubcit | yacite filter "$FILT" | yacite exec -n 'print 1' | wc -l

