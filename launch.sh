#!/bin/bash
export $DBHOST 
CRED=$(aws secretsmanager get-secret-value --secret-id postgres-creds --region us-east-1 --output text --query SecretString)
USER=$(echo $CRED | jq '.username' | tr -d '"')
PASS=$(echo $CRED | jq '.password' | tr -d '"')

echo $'HOST='$DBHOST \
'\nDATABASE=students\n' \
'USERNAME='$USER \
'\nPASSWORD='$PASS > src/.env

docker run ./dbseed.dockerfile -e USER=$USER -e HOST=$DBHOST

docker-compose up --build -d
