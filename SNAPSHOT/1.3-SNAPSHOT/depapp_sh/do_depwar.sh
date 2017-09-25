#!/bin/sh
# fileformat window[doc] linux[unix]

#do deploy more server war
workSpace=$1
depAppName=$2
depAppPath=$1/$2
doDepWar="$depAppName.war"

if [ -x $depAppPath ]; then
    echo "  do more server war path is : $depAppPath"
    cd $workSpace
    jar -cvfM $doDepWar $depAppName
fi
