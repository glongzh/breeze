#! /bin/bash
set -e
path=`dirname $0`
curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz > ${path}/file/jdk-8u191-linux-x64.tar.gz
curl -L https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz -o ${path}/file/zookeeper-3.4.13.tar.gz

