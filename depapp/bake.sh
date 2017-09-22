#!/bin/sh

#bake pre app
#mkdir app
deployAppPath=$1
bakeAppPath=$2
rm -rf $bakeAppPath
mv $deployAppPath $bakeAppPath
mkdir $deployAppPath
