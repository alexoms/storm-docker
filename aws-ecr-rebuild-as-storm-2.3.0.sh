#!/bin/bash


set -a # export all variables created next
source aws-ecr.properties
set +a # stop exporting

echo "Using $ECR_REPO_BASE_URL"
docker build -t="chang/base" os-base
docker tag chang/base:latest $ECR_REPO_BASE_URL/storm-base:2.3.0-storm
docker push $ECR_REPO_BASE_URL/storm-base:2.3.0-storm

docker build -t="zookeeper" zookeeper
docker tag zookeeper:latest $ECR_REPO_BASE_URL/zookeeper:2.3.0-storm
docker push $ECR_REPO_BASE_URL/zookeeper:2.3.0-storm

docker build -t="chang/storm" storm
docker tag chang/storm:latest $ECR_REPO_BASE_URL/storm:2.3.0-storm
docker push $ECR_REPO_BASE_URL/storm:2.3.0-storm

docker build -t="storm-nimbus" storm-nimbus
docker tag storm-nimbus:latest $ECR_REPO_BASE_URL/storm-nimbus:2.3.0-storm
docker push $ECR_REPO_BASE_URL/storm-nimbus:2.3.0-storm

docker build -t="storm-supervisor" storm-supervisor
docker tag storm-supervisor:latest $ECR_REPO_BASE_URL/storm-supervisor:2.3.0-storm
docker push $ECR_REPO_BASE_URL/storm-supervisor:2.3.0-storm

docker build -t="storm-ui" storm-ui
docker tag storm-ui:latest $ECR_REPO_BASE_URL/storm-ui:2.3.0-storm
docker push $ECR_REPO_BASE_URL/storm-ui:2.3.0-storm
