#/bin/bash
storm local /usr/share/storm/storm-starter-2.3.0.jar org.apache.storm.starter.WordCountTopology production-topology-wordcount -c topology.debug=true