-- Join is used to combine two or more tables, based on related columns between them.

CREATE DATABASE TABLES;

USE TABLES;

CREATE TABLE student(
	stu_id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO student
VALUES(101, "adam"),
(103, "eve"),
(105, "emma");

SELECT * FROM student;

CREATE TABLE course (
	stu_id INT PRIMARY KEY,
    course VARCHAR(20)
);

INSERT INTO course
VALUES (102,"maths"),
(103,"english"),
(107,"python"),
(105, "java");

SELECT * FROM course;

-- use if needed
-- TRUNCATE TABLE student;
-- TRUNCATE TABLE course;
-- DROP TABLE student;
-- DROP TABLE course;

-- Types of Joins

-- 1) Inner Join (Returns records that have matching values in both tables)

SELECT *
FROM student
INNER JOIN course
ON student.stu_id = course.stu_id;

SELECT *
FROM student as s -- using ailas
INNER JOIN course as c
ON s.stu_id = c.stu_id;

-- 2) Left Join (Returns all records from the left table, and the matched records from the right table)

SELECT *
FROM student
LEFT JOIN course
ON student.stu_id = course.stu_id;

-- 3) Right Join (Returns all records from the right table, and the matched records from the left table)

SELECT *
FROM student as a
RIGHT JOIN course as b
ON a.stu_id = b.stu_id;

-- 4) Full Join (Returns all records when there is a match in either left or right table)

SELECT *
FROM student as a
LEFT JOIN course as b
on a.stu_id = b.stu_id
UNION -- merge both left and right joins to form a full join
SELECT *
FROM student as a
RIGHT JOIN course as b
on a.stu_id = b.stu_id;

-- Practice Question-2
-- Write SQL commands to display the Right Exclusive Join (Type-5) (Returns only right table data excluding left table)

SELECT *
FROM student as a
RIGHT JOIN course as b
on a.stu_id = b.stu_id
WHERE a.stu_id IS NULL;

-- 6) Left Exclusive Join (Returns only left table data excluding right table)

SELECT *
FROM student as a
LEFT JOIN course as b
on a.stu_id = b.stu_id
WHERE b.stu_id IS NULL;

-- 7) Exclusive Full Outer Join (Returns the exclusive data of both left and right table and leave the intersection data)

SELECT *
FROM student as a
LEFT JOIN course as b
on a.stu_id = b.stu_id
WHERE b.stu_id is NULL
UNION ALL -- merge both left and right exclusive joins
SELECT *
FROM student as a
RIGHT JOIN course as b
on a.stu_id = b.stu_id
WHERE a.stu_id is NULL;

-- 8) Self Join (It is a regular join but the table is joined with itself)

CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    managerid INT
);

INSERT INTO employee
VALUES(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

SELECT *
FROM employee as a
JOIN employee as b
on a.id = b.managerid; -- managers individual table is attached to employee's individual table

SELECT a.name, b.name
FROM employee as a
JOIN employee as b
on a.id = b.managerid; -- displays both the manager and employee names in a table 

SELECT a.name as manager_name, b.name
FROM employee as a
JOIN employee as b
on a.id = b.managerid; -- displays a table with two columns named manager_name and name

-- Union and Union all

-- Union (it is used to combine the result-set of two or more SELECT statements.Gives UNIQUE records)

SELECT name FROM employee
UNION
SELECT name FROM employee; -- displays all names as it is the union of same table

SELECT name FROM employee
UNION ALL
SELECT name FROM employee; -- displays duplicates of the names as it works as intersection

-- SQL sub-queries (or) Inner queries (or) Nested queries (it is a query within another SQL query)

-- 3 types to write sub-queries => 1) Select 2) form 3) where (prefered one)

-- Practice Question-3
-- Get names of all the students from studentinfo table who scored more than class average

CREATE TABLE stu(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL
);

INSERT INTO stu
VALUES (101, "anil", 79),
(102, "bhumika", 90),
(103, "chetan", 89),
(104, "dhruva", 50),
(105, "emanuel", 95),
(106, "farah", 91);

-- Static
SELECT AVG(marks) FROM stu; -- output : 82.3333

SELECT name, marks
FROM stu
WHERE marks > 82.3333;

-- Dynamic (SQL sub-queries way)
SELECT name, marks
FROM stu
WHERE marks > (SELECT AVG(marks) FROM stu);

-- Practice Question-4
-- Find the names of all students with even roll numbers.

SELECT name, rollno
FROM stu
WHERE rollno IN (
	SELECT rollno
	FROM stu
	WHERE rollno % 2 = 0);
    
ALTER TABLE stu
ADD COLUMN city VARCHAR(50);

UPDATE stu
SET city = CASE rollno
	WHEN 101 THEN "Pune"
    WHEN 102 THEN "Mumbai"
    WHEN 103 THEN "Mumbai"
    WHEN 104 THEN "Delhi"
    WHEN 105 THEN "Delhi"
    WHEN 106 THEN "Delhi"
END
WHERE rollno IN (101, 102, 103, 104, 105, 106);

-- Practice Question-5
-- Find the max marks from the students of delhi (Write using sub-query in FORM)

SELECT city,MAX(marks)
FROM (SELECT * FROM stu WHERE city = "Delhi") As temp;

-- Using sub-query in WHERE 
SELECT city,MAX(marks) 
FROM stu
WHERE city IN (
	SELECT city
	FROM stu
	WHERE city = "Delhi"
);

-- easy way
SELECT city,MAX(marks)
FROM stu
WHERE city = "Delhi";

-- using sub-query in SELECT
SELECT name, marks ,(SELECT MAX(MARKS) FROM stu) As top_marks
FROM stu;

-- MYSQL Views (A view is an virtual table based on the result-set of an SQL statement)

CREATE VIEW view1 As
SELECT rollno,name,marks FROM stu;

SELECT * FROM view1;

SELECT * FROM view1
WHERE marks > 90;

-- use if needed
-- DROP VIEW view1;