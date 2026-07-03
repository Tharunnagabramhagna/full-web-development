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

