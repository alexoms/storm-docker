#/bin/bash

export ZOOKEEPER_VERSION=3.7.0
export STORM_VER=apache-storm-2.3.0

cd storm-2.3.0-cluster-no-dl/zookeeper/
wget -q -N --show-progress https://archive.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz && \
wget -q -N --show-progress https://archive.apache.org/dist/zookeeper/KEYS && \
wget -q -N --show-progress https://archive.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc && \
wget -q -N --show-progress https://archive.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512
cd ../storm/
wget -q -N --show-progress http://archive.apache.org/dist/storm/${STORM_VER}/${STORM_VER}.tar.gz


