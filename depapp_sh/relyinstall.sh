#!/bin/sh
## 注意此处至少传递一个参数，作为待安装项目

relyAppPath=$1

## installFun
installFun()
{
   echo $1
   cd $1
   ## mvn clean install -T 1C -Dmaven.test.skip=true  -Dmaven.compile.fork=true
   mvn  -e -T2 -Dmaven.test.skip=true clean  install
}

## install or deploy dependent app
echo $*
if [ $# -gt 0 ]
then
    if [ -x $relyAppPath ]; then
            echo "依赖项目安装路径 is $relyAppPath"
            installFun $relyAppPath || (echo "【Compile ERROR Log-->】 the dependent projects : The compiler exited abnormally. There was a project that failed to compile：$relyAppPath"; exit -1;)
    fi
fi
