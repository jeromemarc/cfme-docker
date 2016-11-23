#!/bin/bash
DBASE="vmdb_production"

echo "Stop evmserverd"
/usr/bin/systemctl stop evmserverd
/usr/bin/systemctl stop httpd

echo "Set Region ID"
mv -f /tmp/REGION /var/www/miq/vmdb/

echo "Update v2_key"
mv -f /tmp/v2_key /var/www/miq/vmdb/certs/

echo "Drop database"
/opt/rh/rh-postgresql94/root/usr/bin/dropdb --no-password -U root $DBASE

echo "Create database"
/opt/rh/rh-postgresql94/root/usr/bin/createdb --no-password -U root $DBASE

echo "Restore database"
/opt/rh/rh-postgresql94/root/usr/bin/pg_restore --no-password -U root -d $DBASE $DBASE.dump

echo "Start evmserverd"
/usr/bin/systemctl start evmserverd

# echo "Clean temp directory"
# rm -rf /tmp/*
