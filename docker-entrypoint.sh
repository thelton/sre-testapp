#!/bin/bash

psql -h $HOST -d students -U $USER -c "CREATE TABLE IF NOT EXISTS students (id SERIAL PRIMARY KEY, name VARCHAR(255), email VARCHAR(255), age INT, DOB DATE); ALTER TABLE students OWNER to $USER;';"
6Nxe8fCqLvLm8zSL