FROM chang/base:2.3.0-storm

MAINTAINER Chang 

ENV STORM_VER apache-storm-2.3.0

# run get-largefiles-2.3.0.sh before building dockerfile so as to pre-download the large files
#RUN mkdir -p /data/
COPY apache-storm-2.3.0.tar.gz apache-storm-2.3.0.tar.gz
RUN tar -xzf apache-storm-2.3.0.tar.gz -C /opt
RUN rm apache-storm-2.3.0.tar.gz

#RUN wget -q -O - http://archive.apache.org/dist/storm/${STORM_VER}/${STORM_VER}.tar.gz | tar -xzf - -C /opt

ENV STORM_HOME /opt/${STORM_VER}
RUN groupadd storm; useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; chown -R storm:storm $STORM_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm

RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh 

# rerun ownership to include storm.yaml and cluster.xml
RUN chown -R storm:storm $STORM_HOME

RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf
