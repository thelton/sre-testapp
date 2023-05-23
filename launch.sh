#!/bin/bash

CRED=$(aws secretsmanager get-secret-value --secret-id postgres-creds --region us-east-1 --output text --query SecretString)
export USER=$(echo $CRED | jq '.username' | tr -d '"')
export PASS=$(echo $CRED | jq '.password' | tr -d '"')
export DBHOST=sre-testapp-db.czmthj6yjt68.us-east-1.rds.amazonaws.com

echo $"HOST=$DBHOST
DATABASE=students
USERNAME=$USER
PASSWORD=$PASS" > src/.env

docker-compose up --build -d
