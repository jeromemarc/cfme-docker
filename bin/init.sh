#!/bin/bash
DOCKER_ID=ecwpz91

echo "Downloading database backup..."
wget -N  http://10.9.62.89/dumps/42/vmdb_production_latest.dump

echo "Creating docker image."
docker build -t "$DOCKER_ID"/cfme4-demo:latest .

echo "Pushing image to Docker Hub"
docker push "$DOCKER_ID"/cfme4-demo
