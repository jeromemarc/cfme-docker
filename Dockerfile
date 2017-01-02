# Dockerizing CloudForms 4.2 (CFME): Dockerfile for building CloudForms demos.
# Based on registry.access.redhat.com/cloudforms_beta/cfme4, adds database
# dump from the MBU lab environment.

FROM registry.access.redhat.com/cloudforms_beta/cfme4

COPY appliance-initialize.sh /bin/

COPY vmdb_production_latest.dump restore_db.sh /tmp/
