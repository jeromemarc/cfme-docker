#!/bin/bash
echo "Downloading CloudForms database backups locally for the environment in the MBU lab"
curl http://10.9.62.89/dumps/vmdb_production_latest.dump

echo "Downloading MBU region ID for database configuration"
curl http://10.9.62.89/dumps/REGION

echo "Downloading v2_key for database password"
curl http://10.9.62.89/dumps/v2_key

# [TODO] Create image from Dockerfile.
# docker build -t cfme-docker/cfme4:1.1 . // [TODO] Add release increment

# [TODO] Executes ansible-container to:
# 1) Stop the evmserverd
# 2) Drop 'vmdb_production' database
# 3) Overwrite the REGION file
# 4) Overwrite the v2_key file
# 5) Create blank 'vmdb_production' database
# 6) Restore 'vmdb_production' from database dump
# 7) Restart the evmserverd

# [TODO] Push image to docker hub.
