FROM chang/base:2.3.0-storm

MAINTAINER Chang

# was 3.4.13.  3.7.0 tar needs to be the bin version.
ENV ZOOKEEPER_VERSION 3.7.0

# run get-largefiles-2.3.0.sh before building dockerfile so as to pre-download the large files
COPY apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz
COPY KEYS KEYS
COPY apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc
COPY apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512 apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512

#Download Zookeeper
#RUN wget -q https://archive.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz && \
#wget -q https://archive.apache.org/dist/zookeeper/KEYS && \
#wget -q https://archive.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc && \
#wget -q https://archive.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512

#Verify download
RUN sha512sum -c apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512 && \
gpg --import KEYS && \
gpg --verify apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc

#Install
RUN tar -xzf apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz -C /opt

RUN rm apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz
RUN rm KEYS
RUN rm apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.asc
RUN rm apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz.sha512

#Configure
RUN mv /opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin/conf/zoo_sample.cfg /opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin/conf/zoo.cfg

ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
ENV ZK_HOME /opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin
RUN sed  -i "s|/tmp/zookeeper|$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg; mkdir $ZK_HOME/data

ADD start-zk.sh /usr/bin/start-zk.sh 
EXPOSE 2181 2888 3888

WORKDIR /opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin
VOLUME ["/opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin/conf", "/opt/apache-zookeeper-${ZOOKEEPER_VERSION}-bin/data"]

CMD /usr/sbin/sshd && bash /usr/bin/start-zk.sh
