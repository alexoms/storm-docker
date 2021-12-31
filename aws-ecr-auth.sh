#!/bin/bash

set -a # export all variables created next
source aws-ecr.properties
set +a # stop exporting

echo "Using $ECR_REPO_BASE_URL"

sudo chmod 666 /var/run/docker.sock
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REPO_BASE_URL