#!/bin/bash
DOCKER_ID=ecwpz91

echo "Downloading database backup..."
wget -N http://10.9.62.89/dumps/vmdb_production_latest.dump

echo "Downloading region ID..."
wget -N http://10.9.62.89/dumps/REGION

echo "Downloading v2_key..."
wget -N http://10.9.62.89/dumps/v2_key

echo "Creating docker image."
docker build -t "$DOCKER_ID"/cfme4-demo:latest .

# echo "Pushing image to Docker Hub"
# docker push "$DOCKER_ID"/cfme4-demo
