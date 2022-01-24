#!/bin/bash


set -a # export all variables created next
source aws-ecr.properties
set +a # stop exporting

echo "Using $ECR_REPO_BASE_URL"
docker build -t="chang/base" storm-0.9.2-cluster/os-base
docker tag chang/base:0.9.2-storm $ECR_REPO_BASE_URL/storm-base:0.9.2-storm
docker push $ECR_REPO_BASE_URL/storm-base:0.9.2-storm

docker build -t="zookeeper" storm-0.9.2-cluster/zookeeper
docker tag zookeeper:0.9.2-storm $ECR_REPO_BASE_URL/zookeeper:0.9.2-storm
docker push $ECR_REPO_BASE_URL/zookeeper:0.9.2-storm

docker build -t="chang/storm" storm-0.9.2-cluster/storm
docker tag chang/storm:0.9.2-storm $ECR_REPO_BASE_URL/storm:0.9.2-storm
docker push $ECR_REPO_BASE_URL/storm:0.9.2-storm

docker build -t="storm-nimbus" storm-0.9.2-cluster/storm-nimbus
docker tag storm-nimbus:0.9.2-storm $ECR_REPO_BASE_URL/storm-nimbus:0.9.2-storm
docker push $ECR_REPO_BASE_URL/storm-nimbus:0.9.2-storm

docker build -t="storm-supervisor" storm-0.9.2-cluster/storm-supervisor
docker tag storm-supervisor:0.9.2-storm $ECR_REPO_BASE_URL/storm-supervisor:0.9.2-storm
docker push $ECR_REPO_BASE_URL/storm-supervisor:0.9.2-storm

docker build -t="storm-ui" storm-0.9.2-cluster/storm-ui
docker tag storm-ui:0.9.2-storm $ECR_REPO_BASE_URL/storm-ui:0.9.2-storm
docker push $ECR_REPO_BASE_URL/storm-ui:0.9.2-storm