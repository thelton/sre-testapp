#!/bin/bash

psql -h $HOST -d students -U $USER -c "CREATE TABLE IF NOT EXISTS students (id SERIAL PRIMARY KEY, name VARCHAR(255), email VARCHAR(255), age INT, DOB DATE); ALTER TABLE students OWNER to $USER;INSERT INTO students(id, name, email, age, DOB) VALUES(1, 'John Smith', 'jsmith@jsmith.com', 24, '2023-05-18');"