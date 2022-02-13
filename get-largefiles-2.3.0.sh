#/bin/bash

export ZOOKEEPER_VERSION=3.7.0
export STORM_VER=apache-storm-2.3.0
wget -q https://archive.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz && \
wget -q https://archive.apache.org/dist/zookeeper/KEYS && \
wget -q https://archive.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc && \
wget -q https://archive.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512
wget -q -O - http://archive.apache.org/dist/storm/${STORM_VER}/${STORM_VER}.tar.gz

mv apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz storm-2.3.0-cluster-no-dl/archive/
mv KEYS storm-2.3.0-cluster-no-dl/archive/
mv apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc storm-2.3.0-cluster-no-dl/archive/
mv apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512 storm-2.3.0-cluster-no-dl/archive/
mv ${STORM_VER}.tar.gz storm-2.3.0-cluster-no-dl/archive/



