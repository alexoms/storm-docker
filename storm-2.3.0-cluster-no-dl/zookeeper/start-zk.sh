sed -i -r 's|#(log4j.appender.ROLLINGFILE.MaxBackupIndex.*)|\1|g' $ZK_HOME/conf/log4j.properties
sed -i -r 's|#autopurge|autopurge|g' $ZK_HOME/conf/zoo.cfg

# Configure zookeeper cluster ensemble (https://zookeeper.apache.org/doc/r3.1.2/zookeeperAdmin.html)
echo 'initLimit=5' >> $ZK_HOME/conf/zoo.cfg
echo 'syncLimit=2' >> $ZK_HOME/conf/zoo.cfg
echo 'zookeeper.electionPortBindRetry=0' >> $ZK_HOME/conf/zoo.cfg

# get zookeeper myid from ECS container level properties specified in task definition (env var named ZOOKEEPER_MYID)
# Will need a zookeeper1 task definition where ZOOKEEPER_MYID=1 in the container env var
# Will need a zookeeper2 task definition where ZOOKEEPER_MYID=2 in the container env var
# Will need a zookeeper3 task definition where ZOOKEEPER_MYID=3 in the container env var

export envmyiddir=$ZK_HOME/data/myid
touch $envmyiddir
if [ -f "$envmyiddir" ]
then 
    echo "$ZOOKEEPER_MYID" > "$envmyiddir"
fi

if [ $ZOOKEEPER_MYID = "1" ];
then 
    echo "server.1=`hostname -i`:2888:3888" >> $ZK_HOME/conf/zoo.cfg
    echo 'server.2=zookeeper2.storm:2888:3888' >> $ZK_HOME/conf/zoo.cfg
	echo 'server.3=zookeeper3.storm:2888:3888' >> $ZK_HOME/conf/zoo.cfg
fi
if [ $ZOOKEEPER_MYID = "2" ];
then 
    echo 'server.1=zookeeper1.storm:2888:3888' >> $ZK_HOME/conf/zoo.cfg
    echo "server.2=`hostname -i`:2888:3888"  >> $ZK_HOME/conf/zoo.cfg
	echo 'server.3=zookeeper3.storm:2888:3888' >> $ZK_HOME/conf/zoo.cfg
fi
if [ $ZOOKEEPER_MYID = "3" ];
then 
    echo 'server.1=zookeeper1.storm:2888:3888' >> $ZK_HOME/conf/zoo.cfg
    echo 'server.2=zookeeper2.storm:2888:3888' >> $ZK_HOME/conf/zoo.cfg
	echo "server.3=`hostname -i`:2888:3888"  >> $ZK_HOME/conf/zoo.cfg
fi


$ZK_HOME/bin/zkServer.sh start-foreground
