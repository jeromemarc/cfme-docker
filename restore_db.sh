#!/bin/bash
DBASE="vmdb_production"

echo "Drop database"
dropdb --no-password -U root $DBASE

echo "Create database"
createdb --no-password -U root $DBASE

echo "Restore database"
pg_restore --no-password -U root -d $DBASE "/tmp/"$DBASE"_latest.dump"

echo "Fix authentication"
bundle exec /var/www/miq/vmdb/tools/fix_auth.rb --v2 --invalid bogus

echo "Remove dump file"
rm -rf "/tmp/"$DBASE"_latest.dump"

# echo "Set admin passwd"
# /var/www/miq/vmdb/bin/rails r "User.find_by_userid('admin').update_attributes(:password =>'smartvm')"
