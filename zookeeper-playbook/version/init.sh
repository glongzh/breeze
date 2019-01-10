#! /bin/bash
set -e
path=`dirname $0`

ZookeeperVersion=`cat ${path}/components-version.txt |grep "Zookeeper" |awk '{print $3}'`

echo "" >> ${path}/yat/zookeeper.yml.gotmpl
echo "version: v${ZookeeperVersion}" >> ${path}/yat/zookeeper.yml.gotmpl

curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz > ${path}/file/jdk-8u191-linux-x64.tar.gz
curl -L https://mirrors.tuna.tsinghua.edu.cn/apache/zookeeper/zookeeper-$ZookeeperVersion/zookeeper-$ZookeeperVersion.tar.gz -o ${path}/file/zookeeper-$ZookeeperVersion.tar.gz

