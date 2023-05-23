#!/bin/bash
CRED=$(aws secretsmanager get-secret-value --secret-id postgres-creds --region us-east-1 --output text --query SecretString)
export USER=$(echo $CRED | jq '.username' | tr -d '"')
export PASS=$(echo $CRED | jq '.password' | tr -d '"')

sed -i "0,/process.env.USERNAME/s//$USER/" /app/src/db.js
sed -i "0,/process.env.HOST/s//$DBHOST/" /app/src/db.js
sed -i "0,/process.env.DATABASE/s//students/" /app/src/db.js
sed -i "0,/process.env.PASSWORD/s//$PASS/" /app/src/db.js

echo $"HOST=$DBHOST
DATABASE=students
USERNAME=$USER
PASSWORD=$PASS" > /app/src/.env

docker-compose up --build -d
