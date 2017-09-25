#!/bin/sh
# fileformat window[doc] linux[unix]

## 注意此处至少传递一个参数，作为打包的目标项目
buildAppPath=$1

## packageFun
packageFun ()
{
    echo $1
    cd $1
    ##mvn clean package -T 1C -Dmaven.test.skip=true  -Dmaven.compile.fork=true
    mvn  -e -T2 -Dmaven.test.skip=true clean package
}

## package target app
if [ $# -gt 0 ]
then
    if [ -x $buildAppPath ]; then
        packageFun $buildAppPath || (echo "the target package project :The compiler exited abnormally. There was a project that failed to compile：$buildAppPath"; exit -1;)
    fi
else
    echo "There is no destination project to be packaged , Please enter at least one parameter for the target package project"; exit -1;
fi
