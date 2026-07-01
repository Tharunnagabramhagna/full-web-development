CREATE DATABASE temp1; -- Create a database (Good practice)
-- or
create database temp1; -- bad practice but we can write like this
DROP DATABASE temp1; -- delete a database

CREATE DATABASE IF NOT EXISTS temp2; -- create only when it doesn't exists
DROP DATABASE IF EXISTS  temp2; -- delete if it exists

-- DROP DATABASE IF EXISTS company; -- shows warning as there is no database with name "company"

CREATE DATABASE college;

USE college;

CREATE TABLE student (
	id INT PRIMARY KEY, -- PRIMARY KEY => helps to carry unique data and constraints null values
    name VARCHAR(50), -- VARCHAR => uses required memory (not memory waste)
    age INT NOT NULL -- NOT NULL => constraints null values
);

INSERT INTO student VALUES(1, "THARUN", 18); -- INSERT values to table
INSERT INTO student VALUES(2, "ARJUN", 28);

SELECT * FROM student; -- Display the table (Select and view all columns)

SHOW TABLES; -- displays all the available tables

-- DROP TABLE student; -- Deletes the table

CREATE TABLE teacher (
	teacherID INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO teacher(teacherID, name) VALUES(10, "Manoj"),(20, "Bhavitaa");

SHOW TABLES;

SELECT * FROM teacher;

DROP TABLE teacher;

/* 
	Types of SQL Commands:
		1) DDL (Data Definition Language) : e.g. create, drop
        2) DQL (Data Query Language) : e.g. select
        3) DML (Data Manipulation Language) : e.g. insert, update
        4) DCL (Data Control Language) : e.g. grant & revoke permissions to users
        5) TCL (Transaction Control Language) : start transaction, commit, rollback
*/

SHOW DATABASES; -- displays all the available databases

