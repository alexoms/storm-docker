FROM ubuntu:focal
MAINTAINER Chang
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update; apt-get install -y unzip openjdk-17-jre-headless wget supervisor docker.io openssh-server gpg
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64/
RUN echo 'root:chang' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
