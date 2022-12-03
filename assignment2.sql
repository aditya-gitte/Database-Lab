/*mysql -u root -p*/

/*
most important concepts in this assignment
  -primary key
  -foreign key
  -on delete cascade
*/





--DDL COMMANDS (data definition commands)

CREATE DATABASE Assignment2;

CREATE TABLE Employee(
    --you can add parameters like UNIQUE and NOT NULL and AUTO_INCREMENT to any of the attributes
    Emp_id int  UNIQUE NOT NULL,
    Dept_id int NOT NULL, 
    fname varchar (50),
    lname varchar (50),
    designation varchar (50), 
    salary int,
    JoinDate int
    --you can add a line PRIMARY KEY (Emp_id) to add a foerign key, you can also do this by altering the table, similarly foreign keys can also be added
);

CREATE TABLE Dept ( 
    dept_id int NOT NULL, 
    dname varchar (50), 
    dlocation varchar (50)
);

CREATE TABLE Project (
    Proj_id int NOT NULL,
    Dept_id int,
    Pname varchar (50),
    Plocation varchar (50),
    Pcost int, 
    Pyear int
);

ALTER TABLE Employee
    ADD PRIMARY KEY (Emp_id);

ALTER TABLE Dept
    ADD PRIMARY KEY (Dept_id);

ALTER TABLE Project
    ADD PRIMARY KEY(Proj_id);

--Use this command to drop a table
DROP TABLE <tableName>


--dept_id is the foreign key in Employee table to Dept table
--ON DELETE CASCADE: if not set, we wouldn't be able to delete rows from dept because some rows in Employee would be dependent on it, but when we set it, after deleting the row from Dept, it will automatically delete the corresponding rows from employee
--ON DELETE SET NULL: similar use as ON DELETE CASCADE but instead of deleting, it sets the dept id value in the employee table to NULL if the corresponding row from dept is deleted.
ALTER TABLE Employee
    ADD FOREIGN KEY (Dept_id)
    REFERENCES Dept (Dept_id)
    ON DELETE CASCADE;

ALTER TABLE Project
    ADD FOREIGN KEY (Dept_id)
    REFERENCES Dept (Dept_id)
    ON DELETE CASCADE;


ALTER TABLE Employee
ADD Email varchar(255);

ALTER TABLE Employee
DROP COLUMN Email;

INSERT INTO Employee
VALUES(1,1,"Aditya","Gitte","teacher",0,05/12/21);

INSERT INTO Employee
VALUES(2,2,"Atharva","Nagmoti","teacher",0,05/11/21);

INSERT INTO Employee
VALUES(3,1,"Aryan","Agrawal","teacher",0,05/02/21);

INSERT INTO Employee
VALUES(4,3,"Dhiraj","Thorat","teacher",0,05/10/21);

INSERT INTO Employee
VALUES(5,2,"tejas","more","teacher",0,05/12/21);


INSERT INTO Dept
VALUES(1,"CE","a1");


INSERT INTO Dept
VALUES(2,"IT","a2");


INSERT INTO Dept
VALUES(3,"ENTC","a3");


DELETE FROM Employee 
WHERE fname="tejas";

UPDATE Employee
SET salary=1000
WHERE fname="Aditya";

UPDATE Dept
SET dname="Electronics and Telecommunication"
WHERE dept_id=3;

--Views
CREATE VIEW Aview 
AS 
SELECT Emp_id FROM Employee WHERE fname="Aditya";

SELECT * from Aview;


--index
CREATE INDEX empIndx
ON Employee(Emp_id);

--sequence
SELECT * from Employee
ORDER BY fname ASC;