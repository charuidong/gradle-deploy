#!/bin/sh

#bake pre app
#mkdir app
deployAppPath=$1
bakeAppPath=$2

if [ -x $bakeAppPath ]; then
    echo "删除备份文件夹$bakeAppPath"
    rm -rf $bakeAppPath
fi
if [ -x $deployAppPath ]; then
    echo "开始备份>>并且创建文件夹"
    mv $deployAppPath $bakeAppPath
fi

