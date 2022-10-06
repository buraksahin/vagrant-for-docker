#!/bin/sh -e
APP_DB_NAME=app_db
APP_DB_USER=buraksahin
APP_SCHEMA_NAME=app_schema
APP_DB_PASS='SCRAM-SHA-256$4096:p5J9Jv5sk8q7887yIci3VQ==$ytEuQw9/SqjCKR9YvhVN4TT7TOUSPh8dBMogMDTlij4=:ocV7HAYi/v7Y5lwTOc0e6eHAOcV0WwlL/zwxJvr90dE='

PG_VERSION=10

apt-get -y install libpq-dev # For building ruby 'pg' gem

PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
PG_DIR="/var/lib/postgresql/$PG_VERSION/main"

# Edit postgresql.conf to change listen address to '*':
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"

# Append to pg_hba.conf to add password auth:
echo "host    all             all             all                     md5" >> "$PG_HBA"

# Explicitly set default client_encoding
echo "client_encoding = utf8" >> "$PG_CONF"

# Restart so that all new config is loaded:
service postgresql restart

# Create table and role
sudo -u postgres -g postgres psql <<EOF
SET password_encryption  = 'scram-sha-256';
DROP DATABASE IF EXISTS $APP_DB_NAME;
DROP ROLE IF EXISTS $APP_DB_USER;
CREATE ROLE $APP_DB_USER PASSWORD '$APP_DB_PASS' NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN;
CREATE DATABASE $APP_DB_NAME OWNER $APP_DB_USER;
CREATE SCHEMA IF NOT EXISTS $APP_SCHEMA_NAME AUTHORIZATION $APP_DB_USER;
EOF
