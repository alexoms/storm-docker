#!/bin/bash

docker build -t="chang/base" os-base
docker tag chang/base:latest 365696073803.dkr.ecr.us-east-1.amazonaws.com/storm-base:latest
docker push 365696073803.dkr.ecr.us-east-1.amazonaws.com/storm-base:latest

docker build -t="zookeeper" zookeeper
docker tag zookeeper:latest 365696073803.dkr.ecr.us-east-1.amazonaws.com/zookeeper:latest
docker push 365696073803.dkr.ecr.us-east-1.amazonaws.com/zookeeper:latest

docker build -t="chang/storm" storm
docker tag chang/storm:latest 365696073803.dkr.ecr.us-east-1.amazonaws.com/storm:latest
docker push 365696073803.dkr.ecr.us-east-1.amazonaws.com/storm:latest

docker build -t="storm-nimbus" storm-nimbus
docker tag storm-nimbus:latest 365696073803.dkr.ecr.us-east-1.amazonaws.com/storm-nimbus:latest
docker push 365696073803.dkr.ecr.us-east-1.amazonaws.com/storm-nimbus:latest

docker build -t="storm-supervisor" storm-supervisor
docker tag storm-supervisor:latest 365696073803.dkr.ecr.us-east-1.amazonaws.com/storm-supervisor:latest
docker push 365696073803.dkr.ecr.us-east-1.amazonaws.com/storm-supervisor:latest

docker build -t="storm-ui" storm-ui
docker tag storm-ui:latest 365696073803.dkr.ecr.us-east-1.amazonaws.com/storm-ui:latest
docker push 365696073803.dkr.ecr.us-east-1.amazonaws.com/storm-ui:latest




