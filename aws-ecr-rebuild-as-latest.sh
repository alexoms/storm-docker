#!/bin/bash


set -a # export all variables created next
source aws-ecr.properties
set +a # stop exporting

echo "Using $ECR_REPO_BASE_URL"
docker build -t="chang/base" os-base
docker tag chang/base:latest $ECR_REPO_BASE_URL/storm-base:latest
docker push $ECR_REPO_BASE_URL/storm-base:latest

docker build -t="zookeeper" zookeeper
docker tag zookeeper:latest $ECR_REPO_BASE_URL/zookeeper:latest
docker push $ECR_REPO_BASE_URL/zookeeper:latest

docker build -t="chang/storm" storm
docker tag chang/storm:latest $ECR_REPO_BASE_URL/storm:latest
docker push $ECR_REPO_BASE_URL/storm:latest

docker build -t="storm-nimbus" storm-nimbus
docker tag storm-nimbus:latest $ECR_REPO_BASE_URL/storm-nimbus:latest
docker push $ECR_REPO_BASE_URL/storm-nimbus:latest

docker build -t="storm-supervisor" storm-supervisor
docker tag storm-supervisor:latest $ECR_REPO_BASE_URL/storm-supervisor:latest
docker push $ECR_REPO_BASE_URL/storm-supervisor:latest

docker build -t="storm-ui" storm-ui
docker tag storm-ui:latest $ECR_REPO_BASE_URL/storm-ui:latest
docker push $ECR_REPO_BASE_URL/storm-ui:latest