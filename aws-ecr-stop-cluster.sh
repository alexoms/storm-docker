#!/bin/bash

set -a # export all variables created next
source aws-ecr.properties
set +a # stop exporting

echo "Using $ECR_REPO_BASE_URL"

aws ecs update-service --region us-east-1 --cluster storm-cluster --service nimbus --desired-count 0
aws ecs update-service --region us-east-1 --cluster storm-cluster --service zookeeper1 --desired-count 0
aws ecs update-service --region us-east-1 --cluster storm-cluster --service zookeeper2 --desired-count 0
aws ecs update-service --region us-east-1 --cluster storm-cluster --service zookeeper3 --desired-count 0
aws ecs update-service --region us-east-1 --cluster storm-cluster --service storm-supervisor --desired-count 0
aws ecs update-service --region us-east-1 --cluster storm-cluster --service stormui --desired-count 0