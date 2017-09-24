#!/bin/sh
## this shell will package a project , the project can contain the other son projects or dependeny other project;
## if contain son project direct compile , if dependeny other project need install or deploy the dependeny's project that pakeage target project before
## projects that need to be packaged and dependent are passed in through arguments , the first param is target project ,the two project dependent project ,and so on
## 该脚本对项目编译打包 , 项目可能包含子项目或者依赖其他项目
## 如果包含子项目可直接编译打包，如果依赖其他项目，且无法从私服下载的，需要先安装发布依赖的项目，在打包编译目标项目
## 需要编译打包和依赖的项目均通过参数传递进来，第一个参数为打包目标项目，第二个为依赖项目，以此类推
## 注意此处至少传递一个参数，作为目标项目


## installFun
installFun()
{
     echo $1
    cd $1
   ## mvn clean install -T 1C -Dmaven.test.skip=true  -Dmaven.compile.fork=true
    mvn  -e -T2 -Dmaven.test.skip=true clean  install
}

## packageFun
packageFun ()
{
    echo $1
    cd $1
    ##mvn clean package -T 1C -Dmaven.test.skip=true  -Dmaven.compile.fork=true
    mvn  -e -T2 -Dmaven.test.skip=true clean package
}

## install or deploy dependent app
echo $*
if [ $# -gt 1 ]
then
    index=1
    for i in $*;
    do
        if [ $index -gt 1 ]
        then
            installApp=$i
            echo "安装路径 is ${installApp}"
            installFun $installApp || (echo "【Compile ERROR Log-->】 the dependent projects : The compiler exited abnormally. There was a project that failed to compile：${installApp}"; exit -1;)
        fi
        let "index++"
    done
fi

## package target app
if [ $# -gt 0 ]
then
    targetApp=$1
    packageFun $targetApp || (echo "the target package project :The compiler exited abnormally. There was a project that failed to compile：${targetApp}"; exit -1;)
else
    echo "There is no destination project to be packaged , Please enter at least one parameter for the target package project"; exit -1;
fi
