#/bin/bash
storm jar /usr/share/storm/storm-starter-2.3.0.jar org.apache.storm.starter.WordCountTopology production-topology-wordcount -c nimbus.host=nimbus100.storm -c nimbus.thrift.port=6627