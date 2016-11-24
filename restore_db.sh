#!/bin/bash
DBASE="vmdb_production"

echo "Stop evmserverd"
systemctl stop evmserverd

echo "Drop database"
dropdb --no-password -U root $DBASE

echo "Create database"
createdb --no-password -U root $DBASE

echo "Restore database"
pg_restore --no-password -U root -d $DBASE "/tmp/"$DBASE"_latest.dump"

echo "Set Region ID"
mv -f /tmp/REGION /var/www/miq/vmdb/

echo "Update v2_key"
mv -f /tmp/v2_key /var/www/miq/vmdb/certs/

echo "Start evmserverd"
systemctl restart evmserverd

echo "Clean temp directory"
rm -rf /tmp/*

echo "Set admin credentials"
/var/www/miq/vmdb/script/rails r "User.find_by_userid('admin').update_attributes(:password => 'smartvm')"
