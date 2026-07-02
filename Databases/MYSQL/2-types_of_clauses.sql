-- Sample Database
-- Practice Question-1
/* Create a sample database named collegeinfo with columns rollno,
name, marks, grade and city then insert 6 values in it */

CREATE DATABASE collegeinfo;

USE collegeinfo;

CREATE TABLE student (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student 
VALUES(732, "Naveen", 35, 'D', "Bangalore"),
(576, "Bharghav", 98, 'A', "Markapur"),
(429, "Surya", 47, 'C', "Ongole"),
(783, "harsha", 99, 'A', "Vijayawada"),
(1276, "Ram", 78, 'B', "Kurnool"),
(669, "John", 19, 'F', "Ongole");

SELECT * FROM student;

-- DROP TABLE student; -- use if needed

SELECT city FROM student;

SELECT DISTINCT city FROM student; -- Displays only unique values

-- Where Caluse

SELECT * 
FROM student
WHERE marks >= 80; -- syntax : WHERE condition
SELECT * 
FROM student
WHERE city = "Ongole";

-- Using operators in WHERE
/* Types of Operators:
	1) Arithemetic Operators : +,-,*,/,,%
    2) Comparsion Operators : =, !=, >= , <= , > , <
    3) Logical Operators : AND, OR, NOT, IN BETWEEN, ALL, LIKE, ANY
    4) Bitwise Operators : & (Bitwise AND) , | | (Bitwise OR)
*/

SELECT * 
FROM student
WHERE marks + 10 > 100; -- Arithemtic operator

SELECT *
FROM student
WHERE marks - 10 > 80; -- Arithemtic operator

SELECT *
FROM student 
WHERE marks * 2 > 75; -- Arithemtic operator

SELECT * 
FROM student
WHERE marks = 99; -- equal to operator

SELECT *
FROM student
WHERE city != "Ongole"; -- Comparsion operator

SELECT *
FROM student
WHERE city = "Vijayawada" OR marks > 85; -- Logical operator

SELECT * 
FROM student
WHERE marks BETWEEN 70 AND 90; -- Logical operator

SELECT *
FROM student
WHERE city IN ("Delhi","Mumbai","Ongole","Kurnool"); -- Logical Operator

SELECT *
FROM student
WHERE city NOT IN ("Pune","Delhi","Ongole","Vijayawada"); -- Logical Operator

-- LIMIT caluse => limits upto only required number of rows

SELECT *
FROM student
LIMIT 2;

SELECT *
FROM student
WHERE marks > 90
LIMIT 4; -- WHERE + LIMIT caluse (Limit is 4 but only 2 students satisfy the required condition)

-- Order by clause (Types - ascending order, descending order)

SELECT *
FROM student
ORDER BY city ASC; -- ascending order

SELECT * 
FROM student
ORDER BY city DESC; -- descending order

SELECT *
FROM student
ORDER BY marks DESC
LIMIT 3; -- Top 3 students in marks (LIMIT + ORDER BY)

-- Aggregate functions (Performs a calculation on set of values and return a single value)

SELECT COUNT(name)
FROM student;

SELECT MIN(marks)
FROM student;

SELECT MAX(marks)
FROM student;

SELECT MAX(city)
FROM student; -- alphabetial order

SELECT SUM(marks)
FROM student;

SELECT SUM(city)
FROM student; -- sum of cities is not possible so output is "0"

SELECT AVG(marks)
FROM student;

-- GROUP BY clause (it collects data from multiple records and group the result by one or more column)

SELECT city, count(rollno)
FROM student
GROUP BY city;

SELECT city, avg(marks)
FROM student
GROUP BY city;

-- Practice Question-2
-- Write a Query to find the avg marks in each city in ascending order.

SELECT city, avg(marks)
FROM student
GROUP BY city
ORDER BY city; -- default is ascending 
-- (OR)
SELECT city, avg(marks)
FROM student
GROUP BY city
ORDER BY avg(marks);

SELECT grade, count(rollno)
FROM student
GROUP BY grade
ORDER BY grade;

-- Pratice Question-3
/* Create a customer bank database with columns customer_id,
payment, customer, mode, city and find the total payment according to each payment method. */

CREATE DATABASE bank;

USE bank;

CREATE TABLE customerdata (
	customer_id INT PRIMARY KEY,
    customer VARCHAR(50),
    payment DOUBLE NOT NULL,
    paymentmode VARCHAR(70),
    city VARCHAR(60)
);

INSERT INTO customerdata
VALUES (101, "Olivia Barret", 10000, "Netbanking", "Portland"),
(102, "Ethan Sinclair", 20000, "Credit Card", "Miami"),
(103, "Maya Hernandez", 25000, "Credit Card", "Seattle"),
(104, "Liam Donovan", 28000, "Netbanking", "Denver"),
(105, "Sophia Nguyen", 34000, "Credit Card", "New Orleans"),
(106, "Caleb Foster", 12000, "Debit Card", "Minneapolis"),
(107, "Ava Patel", 22000, "Debit Card", "Phoenix"),
(108, "Lucas Carter", 16000, "Netbanking", "Boston"),
(109, "Isabella Martinez", 17000, "Netbanking", "Nashvile"),
(110, "Jackson Brooks", 16500, "Netbanking", "Boston");

SELECT paymentmode, SUM(payment)
FROM customerdata
GROUP BY paymentmode; -- total amount on each mode

-- HAVING clause (Similar to WHERE, helps for implement constriants in group by clauses)
-- where won't work sometimes in group by clause

SELECT city, count(name)
FROM student
GROUP BY city
HAVING max(marks) > 90; -- count of number of students in each city whose max marks cross 90.

/* Order for Caluses : 
	SELECT column(s)
    FROM table_name
    WHERE condition
    GORUP BY column(s)
    HAVING condition
    ORDER BY column(s);
*/

SELECT city, count(name)
FROM student
WHERE grade = 'B'
GROUP BY city
HAVING MAX(marks) > 60
ORDER BY city; -- (or) ORDER BY city ASC

-- Table Realted Queries

-- 1) Update (make changes to the exisiting row)

SET SQL_SAFE_UPDATES = 0; -- removes the safe mode 

UPDATE student
SET grade = 'O'
WHERE grade = 'A';

UPDATE student
SET grade = 'C'
WHERE marks BETWEEN 35 AND 50; -- Just Pass student got C grade

UPDATE student
SET marks = marks + 1;

SELECT * FROM student;

-- 2) Delete (removes any exisiting row)

DELETE FROM student
WHERE marks < 30; -- removed John

SELECT * FROM student;

-- 3) alter (to change the schema)



-- FOREIGN key

CREATE TABLE dept( -- Parent table
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO dept 
VALUES (101, "CSE"),
(102, "MECH");

UPDATE dept
SET id = 111
WHERE name = "CSE";

UPDATE dept
SET id = 407
WHERE name = "MECH";

SELECT * FROM dept;

-- We can view the link by clicking on database option and start reverse enginerring then we see a EER diagram

CREATE TABLE teacher( -- child table
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
     -- Cascading on FK
     ON DELETE CASCADE
     ON UPDATE CASCADE
);

INSERT INTO teacher 
VALUES (101, "Venky", 101),
(102, "Lasyaa", 102);

SELECT * FROM teacher; -- The updation is done automatically here too.