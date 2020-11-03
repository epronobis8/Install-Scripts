#! /bin/bash

masterpwd=$(aws ssm get-parameters --region us-east-1 --names PSQLmasterpwd --with-decryption --query Parameters[0].Value)

masterpwd=`echo $masterpwd | sed -e 's/^"//' -e 's/"$//'`
printf -v masterpwd "%q" "$masterpwd"
echo $masterpwd

CHANGE_PASSWORD="psql --host=database-1.cluster-c2xgnkyikpg3.us-east-1.rds.amazonaws.com --port=5432 -U postgres password=$masterpwd"

$CHANGE_PASSWORD << PSQL

CREATE ROLE sonarqube2 WITH PASSWORD 'S3cur3p@ssw0rd1';
GRANT sonarqube2 TO postgres;
CREATE DATABASE sonarqube2 OWNER sonarqube2;
GRANT ALL PRIVILEGES ON DATABASE sonarqube2 TO sonarqube2;
ALTER ROLE "sonarqube2" WITH LOGIN;

PSQL
