#!/bin/bash

# this is the base url of your AWS ECR (elastic container repository)
ECR_REPO_BASE_URL=365696073803.dkr.ecr.us-east-1.amazonaws.com

sudo chmod 666 /var/run/docker.sock
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REPO_BASE_URL