-- Table related Queries

-- 3) Alter (to change the schema)

CREATE DATABASE university;

USE university;

CREATE TABLE student (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student 
VALUES(101, "Anna", 35, 'E', "Locknow"),
(102, "Arjun", 98, 'A', "Mumbai"),
(103, "Sujeeth", 75, 'B', "Chennai"),
(104, "Pavan", 99, 'A', "Pune"),
(105, "Ram", 78, 'B', "Mumbai"),
(106, "John", 21, 'F', "Madanapalle");

SELECT * FROM student;

-- DROP TABLE student; -- use only if needed

-- Exmaple-1)

-- i) Add column feature
ALTER TABLE student
ADD COLUMN age INT; -- a new column of age is created with null values

SELECT * FROM student;

-- ii) Drop column feature
ALTER TABLE student
DROP COLUMN age; -- removes age column

SELECT * FROM student;

-- iii) Rename table feature
ALTER TABLE student
RENAME TO studentinfo; -- changes the table name

SELECT * FROM studentinfo;

-- iv) Change column feature (renames a column)
ALTER TABLE studentinfo
CHANGE COLUMN rollno id INT UNIQUE; -- synatax : CHANGE COLUMN old_name new_name datatype constraints

SELECT * FROM studentinfo;

-- v) Modify column feature (modify datatype/ constriants)
ALTER TABLE studentinfo
MODIFY marks DOUBLE; -- INT => DOUBLE

SELECT * FROM studentinfo;

-- Example-2)

ALTER TABLE studentinfo
ADD COLUMN age INT NOT NULL DEFAULT 18; -- set the values of age column to 18

SELECT * FROM studentinfo;

ALTER TABLE studentinfo
MODIFY COLUMN age VARCHAR(2); -- DOUBLE => VARCHAR

SELECT * FROM studentinfo;

-- test MODIFY with this data
-- INSERT INTO studentinfo
-- VALUES (107, "bob", 78, 'B', "Chittor",100);

ALTER TABLE studentinfo
CHANGE COLUMN age stu_age INT;

SELECT * FROM studentinfo;
-- Now This is possible to insert
INSERT INTO studentinfo
VALUES (107, "bob", 78, 'B', "Chittor",100);

ALTER TABLE studentinfo
DROP COLUMN stu_age;

SELECT * FROM studentinfo;

ALTER TABLE studentinfo
RENAME TO stu;

SELECT * FROM stu;

ALTER TABLE stu
RENAME TO student;

SELECT * FROM student;

-- 4) Truncate (to delete table's data)
TRUNCATE TABLE student;
SELECT * FROM student;

INSERT INTO student 
VALUES(101, "Amrita", 34, 'F', "Jaipur"),
(102, "Arjun", 91, 'A', "Mumbai"),
(103, "Bharath", 75, 'B', "Chittor"),
(104, "Pavan", 92, 'A', "Pune"),
(105, "Ram", 79, 'B', "Kolkata"),
(106, "Charan", 25, 'F', "Nellore");

SELECT * FROM student;

-- Practice Question-1
/*
	In the student table:
    a. Change the name of column "name" to "full_name".
    b. Delete all the students who scored marks less than 80.
    c. Delete the column for grade.
*/

ALTER TABLE student
CHANGE COLUMN name full_name VARCHAR(50);

SELECT * FROM student;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM student
WHERE marks < 80;

SELECT * FROM student;

ALTER TABLE student
DROP COLUMN grade;

SELECT * FROM student;

