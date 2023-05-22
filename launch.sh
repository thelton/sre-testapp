#!/bin/bash
 
CRED=$(aws secretsmanager get-secret-value --secret-id postgres-creds --region us-east-1 --output text --query SecretString)
USER=$(echo $CRED | jq '.username' | tr -d '"')
PASSWORD=$(echo $CRED | jq '.password' | tr -d '"')

docker run dbseed.dockerfile -e DBUSER=$USER -e HOST=$DBHOST

docker-compose up --build
