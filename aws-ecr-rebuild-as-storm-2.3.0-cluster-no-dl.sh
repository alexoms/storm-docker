#!/bin/bash


set -a # export all variables created next
source aws-ecr.properties
set +a # stop exporting

echo "Using $ECR_REPO_BASE_URL"
docker build -t="chang/base:2.3.0-storm" storm-2.3.0-cluster-no-dl/os-base
docker tag chang/base:2.3.0-storm $ECR_REPO_BASE_URL/storm-base:2.3.0-storm
docker push $ECR_REPO_BASE_URL/storm-base:2.3.0-storm

docker build -t="zookeeper:2.3.0-storm" storm-2.3.0-cluster-no-dl/zookeeper
docker tag zookeeper:2.3.0-storm $ECR_REPO_BASE_URL/zookeeper:2.3.0-storm
docker push $ECR_REPO_BASE_URL/zookeeper:2.3.0-storm

docker build -t="chang/storm:2.3.0-storm" storm-2.3.0-cluster-no-dl/storm
docker tag chang/storm:2.3.0-storm $ECR_REPO_BASE_URL/storm:2.3.0-storm
docker push $ECR_REPO_BASE_URL/storm:2.3.0-storm

docker build -t="storm-nimbus:2.3.0-storm" storm-2.3.0-cluster-no-dl/storm-nimbus
docker tag storm-nimbus:2.3.0-storm $ECR_REPO_BASE_URL/storm-nimbus:2.3.0-storm
docker push $ECR_REPO_BASE_URL/storm-nimbus:2.3.0-storm

docker build -t="storm-supervisor:2.3.0-storm" storm-2.3.0-cluster-no-dl/storm-supervisor
docker tag storm-supervisor:2.3.0-storm $ECR_REPO_BASE_URL/storm-supervisor:2.3.0-storm
docker push $ECR_REPO_BASE_URL/storm-supervisor:2.3.0-storm

docker build -t="storm-ui:2.3.0-storm" storm-2.3.0-cluster-no-dl/storm-ui
docker tag storm-ui:2.3.0-storm $ECR_REPO_BASE_URL/storm-ui:2.3.0-storm
docker push $ECR_REPO_BASE_URL/storm-ui:2.3.0-storm
