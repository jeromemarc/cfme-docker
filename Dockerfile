# Dockerizing CloudForms 4.1 (CFME): Dockerfile for building CloudForms demos.
# Based on registry.access.redhat.com/cloudforms/cfme4:latest, adds
# database dump from the environment in the MBU lab.

FROM registry.access.redhat.com/cloudforms/cfme4:latest

COPY . /tmp/

# Run Ansible script mentioned in 'bin/init.sh'
