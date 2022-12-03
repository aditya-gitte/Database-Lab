CREATE DATABASE Assignment3;

CREATE TABLE Employee(
    Emp_id int  UNIQUE NOT NULL,
    Dept_id int NOT NULL, 
    fname varchar (50),
    lname varchar (50),
    designation varchar (50), 
    salary int,
    JoinDate date,
    PRIMARY KEY (Emp_id)
);

CREATE TABLE Dept ( 
    dept_id int NOT NULL, 
    dname varchar (50), 
    dlocation varchar (50),
    PRIMARY KEY (dept_id)
);

CREATE TABLE Project (
    Proj_id int NOT NULL,
    Dept_id int,
    Pname varchar (50),
    Plocation varchar (50),
    Pcost int, 
    Pyear int,
    PRIMARY KEY (Proj_id)
);

INSERT INTO Employee
VALUES(1,1,"Aditya","Gitte","teacher",0,DATE '05/12/21');

INSERT INTO Employee
VALUES(2,2,"Atharva","Nagmoti","teacher",10,DATE '05/11/21');

INSERT INTO Employee
VALUES(3,1,"Aryan","Agrawal","teacher",12,DATE '05/02/21');

INSERT INTO Employee
VALUES(4,3,"Dhiraj","Thorat","teacher",14,DATE '05/10/21');

INSERT INTO Employee
VALUES(5,2,"tejas","more","teacher",5,DATE '05/12/21');

INSERT INTO Dept
VALUES(1,"CE","a1");


INSERT INTO Dept
VALUES(2,"IT","a2");


INSERT INTO Dept
VALUES(3,"ENTC","a3");

INSERT INTO Dept
VALUES(4,"Mechnical","a4");

SELECT Employee.Emp_id, Employee.fname, Dept.dname
FROM Employee
INNER JOIN Dept ON Employee.dept_id=Dept.dept_id;

SELECT Employee.Emp_id, Employee.fname, Dept.dname
FROM Employee
LEFT JOIN Dept ON Employee.dept_id=Dept.dept_id;

SELECT Employee.Emp_id, Employee.fname, Dept.dname
FROM Employee
RIGHT JOIN Dept ON Employee.dept_id=Dept.dept_id;

SELECT Employee.Emp_id, Employee.fname, Dept.dname
FROM Employee
NATURAL JOIN Dept;

SELECT Employee.Emp_id, Employee.fname, Dept.dname
FROM Employee
CROSS JOIN Dept ON Employee.dept_id=Dept.dept_id;

SELECT Employee.Emp_id, Employee.fname, Dept.dname
FROM Employee
CROSS JOIN Dept;

--Views
CREATE VIEW EmpNameandDept 
AS 
SELECT Employee.fname, Dept.dname
FROM Employee
LEFT JOIN Dept ON Employee.dept_id=Dept.dept_id;

SELECT * from EmpNameandDept;

--Subqueries
SELECT * from Employee
WHERE Emp_id=(SELECT Emp_id from Employee WHERE salary>13);
--This query works only if the subquery returns one row, 

SELECT * from Employee
WHERE Emp_id IN (SELECT Emp_id from Employee WHERE salary>10);
--This query works even if the subquery returns more than one row, 


SELECT * from Employee
WHERE salary>(SELECT salary from Employee WHERE fname="Aryan");

SELECT * from Employee
WHERE salary>(SELECT salary from Employee WHERE fname="Atharva");

