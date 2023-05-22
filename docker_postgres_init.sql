-- Move into the db
\c students

-- Create our table if it doesn't already exist
CREATE TABLE IF NOT EXISTS students
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(255),
    email VARCHAR(255),
    age INT,
    DOB DATE
);

-- Changes the owner of the table
ALTER TABLE students
    OWNER to pguser;

INSERT INTO students(id, name, email, age, DOB) VALUES 
    (1, 'John Smith', 'jsmith@jsmith.com', 24, '2023-05-18');