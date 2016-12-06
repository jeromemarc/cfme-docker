#!/bin/bash
echo "Downloading CloudForms database backups locally for the environment in the MBU lab"
wget -N http://10.9.62.89/dumps/vmdb_production_latest.dump

echo "Downloading MBU region ID for database configuration"
wget -N http://10.9.62.89/dumps/REGION

echo "Downloading v2_key for database password"
wget -N http://10.9.62.89/dumps/v2_key

echo "Creating image from Dockerfile"
docker build -t cfme-docker/cfme4:1.1 .

# echo "Starting docker container"
# docker run --privileged -di -p 80:80 -p 443:443 --name cfme4 cfme-docker/cfme4:1.1
#
# echo "Restoring demo database"
# docker exec cfme4 /tmp/restore_db.sh
#
# echo "Committing container’s file changes or settings into a new image"
# docker commit $(docker ps -aq -f name=cfme4) ecwpz91/cfme4-demo:latest
#
# echo "Push docker iamge to Docker Hub"
# docker push ecwpz91/cfme4-demo
