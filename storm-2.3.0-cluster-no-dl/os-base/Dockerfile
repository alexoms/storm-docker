#FROM ubuntu:focal
FROM openjdk:11-jre-slim
MAINTAINER Chang
USER root
ENV DEBIAN_FRONTEND=noninteractive
#openjdk-17-jre-headless
RUN apt-get update; apt-get install -y unzip openjdk-11-jre-headless wget python nano supervisor docker.io openssh-server gpg
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN echo 'root:g3KWL6!92Gd' | chpasswd
RUN mkdir /var/run/sshd


# generate server keys
RUN ssh-keygen -A

# allow root to login
#RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

EXPOSE 22
