#!/bin/bash
DBASE="vmdb_production"

echo "Stop evmserverd"
systemctl stop evmserverd
systemctl stop httpd

echo "Set Region ID"
mv -f /tmp/REGION /var/www/miq/vmdb/

echo "Update v2_key"
mv -f /tmp/v2_key /var/www/miq/vmdb/certs/

echo "Drop database"
dropdb --no-password -U root $DBASE

echo "Create database"
createdb --no-password -U root $DBASE

echo "Restore database"
pg_restore --no-password -U root -d $DBASE $DBASE.dump

echo "Start evmserverd"
systemctl start evmserverd

echo "Clean temp directory"
rm -rf /tmp/*
