#!/bin/bash

docker build -t="chang/base" os-base
docker build -t="chang/zookeeper" zookeeper
docker build -t="chang/storm" storm
docker build -t="chang/storm-nimbus" storm-nimbus
docker build -t="chang/storm-supervisor" storm-supervisor
docker build -t="chang/storm-ui" storm-ui
