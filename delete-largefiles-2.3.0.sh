#/bin/bash

export ZOOKEEPER_VERSION=3.7.0
export STORM_VER=apache-storm-2.3.0

cd storm-2.3.0-cluster-no-dl/zookeeper/
rm apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz && \
rm KEYS && \
rm apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc &&>
rm apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512
cd ../storm/
rm ${STORM_VER}.tar.gz

