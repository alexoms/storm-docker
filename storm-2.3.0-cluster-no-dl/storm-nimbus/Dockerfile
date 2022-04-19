FROM chang/storm:2.3.0-storm
MAINTAINER Chang

RUN /usr/bin/config-supervisord.sh nimbus 
RUN /usr/bin/config-supervisord.sh drpc

EXPOSE 6627
EXPOSE 3772
EXPOSE 3773
ADD start-supervisor.sh /usr/bin/start-supervisor.sh
RUN mkdir /usr/share/storm/
COPY storm-starter-2.3.0.jar /usr/share/storm/storm-starter-2.3.0.jar
ADD start-sample-topology.sh /usr/bin/start-sample-topology.sh
RUN chmod a+x /usr/bin/start-sample-topology.sh
ADD rebalance-sample-topology.sh /usr/bin/rebalance-sample-topology.sh
RUN chmod a+x /usr/bin/rebalance-sample-topology.sh
ADD kill-sample-topology.sh /usr/bin/kill-sample-topology.sh
RUN chmod a+x /usr/bin/kill-sample-topology.sh
ADD start-local-sample-topology.sh /usr/bin/start-local-sample-topology.sh
RUN chmod a+x /usr/bin/start-local-sample-topology.sh
CMD /usr/bin/start-supervisor.sh
