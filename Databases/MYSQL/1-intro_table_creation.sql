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
    age INT NOT NULL -- NOT NULL => we need to store any value for sure in it
);

INSERT INTO student VALUES(1, "THARUN", 18); -- INSERT values to table
INSERT INTO student VALUES(2, "ARJUN", 28);

SELECT * FROM student; -- Display the table (Select and view all columns)

SHOW TABLES; -- displays all the available tables

-- DROP TABLE student; -- Deletes the table

CREATE TABLE teacher (
	teacherID INT PRIMARY KEY,
    name VARCHAR(50),
    AadharId DOUBLE UNIQUE
);

INSERT INTO teacher(teacherID, name, AadharId) VALUES(10, "Manoj", 2161),(20, "Bhavitaa", 8384);

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

/* Practice Question-1
	Create a database for your company named XYZ.
    step-1 : create a table inside this DB to store employee info (id, name and salary)
    step-2 : Add following information in the DB:
				1, "adam", 25000
                2, "bob", 30000
                3, "casey", 40000
	step-3 : Select & view all your table data.
*/

CREATE DATABASE XYZ;

USE XYZ;

CREATE TABLE employee(
	Id INT,
	PRIMARY KEY (Id),
    name VARCHAR(50),
    salary DOUBLE NOT NULL
);

INSERT INTO employee VALUES(1, "adam", 25000),(2, "bob", 30000), (3, "casey", 40000);

SELECT * FROM employee;

DROP DATABASE XYZ;

CREATE TABLE classMembers (
	Id INT,
    -- FOREIGN KEY (Id) references student(id), -- Example for a foreign key
    course VARCHAR(50),
	PRIMARY KEY (Id, course), -- pair of primary key => allows unique combinations only
    classId INT UNIQUE,
    age INT CHECK (age >= 18), -- Check constraint
    fee DOUBLE DEFAULT 41000 -- default => helps we user entry nothing
);

INSERT INTO classMembers(Id,course,classId,age) 
VALUES(81,"CSE",2,18),
(82,"ECE",1,19),
(84,"CIVIL",3,20);

SELECT * FROM classMembers;

CREATE DATABASE state;

USE state;

CREATE TABLE cityEntry(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(100),
    age INT,
    constraint age_check CHECK (age >= 18 and city = "Vijayawada") 
    -- constriant check (We can ignore writing 'age_check' it's just a variable)
);

INSERT INTO cityEntry
VALUES(1, "Kiran", "Vijayawada", 29),
(2, "Abhi", "Vijayawada", 25);

SELECT * FROM cityEntry;