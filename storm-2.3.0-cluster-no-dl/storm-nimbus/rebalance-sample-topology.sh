#/bin/bash
~/apache-storm-2.3.0/bin/storm rebalance production-topology-wordcount -c nimbus.host=nimbus100.storm -c nimbus.thrift.port=6627