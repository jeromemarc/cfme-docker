#!/bin/bash
echo "Downloading CloudForms database backups locally for the environment in the MBU lab"
wget -N http://10.9.62.89/dumps/vmdb_production_latest.dump

echo "Downloading MBU region ID for database configuration"
wget -N http://10.9.62.89/dumps/REGION

echo "Downloading v2_key for database password"
wget -N http://10.9.62.89/dumps/v2_key

echo "Creating image from Dockerfile"
docker build -t cfme-docker/cfme4:1.1 .
# [TODO] Add release increment.

# [TODO] Push image to docker hub.
