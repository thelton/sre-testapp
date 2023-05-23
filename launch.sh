#!/bin/bash
CRED=$(aws secretsmanager get-secret-value --secret-id postgres-creds --region us-east-1 --output text --query SecretString)
export USER=$(echo $CRED | jq '.username' | tr -d '"')
export PASS=$(echo $CRED | jq '.password' | tr -d '"')

sed -i "0,/process.env.USERNAME/s//$USER/" /app/src/db.js
sed -i "0,/process.env.HOST/s//$DBHOST/" /app/src/db.js
sed -i "0,/process.env.DATABASE/s//students/" /app/src/db.js
sed -i "0,/process.env.PASSWORD/s//$PASS/" /app/src/db.js

echo "Setting HOST=$DBHOST in /app/src/.env" 
echo "HOST=$DBHOST" > /app/src/.env
echo "DATABASE=students" >> /app/src/.env
echo "USERNAME=$USER" >> /app/src/.env
echo "PASSWORD=$PASS" >> /app/src/.env

docker-compose up --build -d
