#!/bin/sh

#解压jar包
depTomcatPath=$1
depServNameWar="$2.war"
depAppwarPath=$depTomcatPath/$2

if [ -x $depAppwarPath ]; then
    echo "remove deploy derver path : $depAppwarPath"
	rm -rf $depAppwarPath
fi

if [ -x $depTomcatPath ]; then
    echo "unzip app path :$depTomcatPath >> unzip appwar :$depServNameWar"
    cd $depTomcatPath
    unzip $depServNameWar -d $depAppwarPath
else
    echo "解压包不存在，无法解压项目"
fi