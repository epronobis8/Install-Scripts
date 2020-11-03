#! /bin/bash

psqlUser='postgres'
psqlPassword='postgres'

dbpwd=$(aws ssm get-parameters --region us-east-1 --names SonarQube --with-decryption --query Parameters[0].Value)
dbpwd=`echo $dbpwd | sed -e 's/^"//' -e 's/"$//'`
echo $dbpwd

CHANGE_PASSWORD="psql --host=database-1.cluster-c2xgnkyikpg3.us-east-1.rds.amazonaws.com --port=5432 -U postgres password=$psqlPassword"

$CHANGE_PASSWORD << PSQL

ALTER ROLE sonarqube WITH PASSWORD '$dbpwd';

PSQL
