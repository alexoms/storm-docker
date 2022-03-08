#sed -i -e "s/%zookeeper%/$ZK_PORT_2181_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
#sed -i -e "s/%nimbus%/$NIMBUS_PORT_6627_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml

echo "storm.local.hostname: `hostname -i`" >> $STORM_HOME/conf/storm.yaml

# create sample file showing env variables extracted from sec
export envtestdir=/tmp/env_extracted.txt
touch $envtestdir
if [ -f "$envtestdir" ]
then 
    echo "$TEST1_DB_PW_ENC" > "$envtestdir"
fi

/usr/sbin/sshd && supervisord
#supervisord
