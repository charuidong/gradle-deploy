#!/bin/sh

#解压jar包
depAppwarPath=$1
depServNameWar=$2
cd $depAppwarPath
jar -xvf $depServNameWar
