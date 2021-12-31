#/bin/bash

/data/apache-storm-0.9.2-incubating/bin/storm jar ~/src_chang/storm/examples/storm-starter/target/storm-starter-0.9.2-incubating.jar org.apache.storm.starter.RollingTopWords production-topology -c nimbus.host==nimbus100.storm -c nimbus.thrift.port=49627