sed -i -r 's|#(log4j.appender.ROLLINGFILE.MaxBackupIndex.*)|\1|g' $ZK_HOME/conf/log4j.properties
sed -i -r 's|#autopurge|autopurge|g' $ZK_HOME/conf/zoo.cfg

# Configure zookeeper cluster ensemble (https://zookeeper.apache.org/doc/r3.1.2/zookeeperAdmin.html)
echo 'initLimit=5' >> $ZK_HOME/conf/zoo.cfg
echo 'syncLimit=2' >> $ZK_HOME/conf/zoo.cfg
echo 'server.1=zookeeper1.storm:2888:3888' >> $ZK_HOME/conf/zoo.cfg
echo 'server.2=zookeeper2.storm:2888:3888' >> $ZK_HOME/conf/zoo.cfg
echo 'server.3=zookeeper3.storm:2888:3888' >> $ZK_HOME/conf/zoo.cfg

$ZK_HOME/bin/zkServer.sh start-foreground
