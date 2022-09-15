#!/bin/bash
#
# A simple MVP script that will run wkfnSC against a queue manager.
ckksum=""

# Outer loop that keeps the wkfn service running
while true; do

   tmpCksum=`cksum /dynamic-wkfn-config-wkfnsc/dynamic-definitions.wkfnsc | cut -d" " -f1`

   if (( tmpCksum != cksum ))
   then
      cksum=$tmpCksum
      echo "Applying wkfnSC"
      runwkfnsc $1 < /dynamic-wkfn-config-wkfnsc/dynamic-definitions.wkfnsc
   else
      sleep 3
   fi

done
