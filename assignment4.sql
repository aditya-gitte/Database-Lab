CREATE DATABASE Assignment4;

CREATE TABLE Borrower(
    RollNumber int NOT NULL UNIQUE,
    Name varchar(50),
    DateOfIssue date,
    NameOfBook varchar(50),
    -- when status =I, the book has been issued
    Status char,
    PRIMARY KEY (RollNumber)
);


INSERT INTO Borrower
VALUES(1,"Aditya", '2022-10-11',"Maths", 'I');

INSERT INTO Borrower
VALUES(2,"Atharva", '2022-10-01',"Physics", 'I');

INSERT INTO Borrower
VALUES(3,"Aryan", '2022-09-13',"English", 'I');

INSERT INTO Borrower
VALUES(4,"Shivam", '2022-09-15',"Chem", 'I');

INSERT INTO Borrower
VALUES(5,"Raunak", '2022-09-22',"Bio", 'I');

INSERT INTO Borrower
VALUES(6,"Shruti", '2022-09-11',"Hindi", 'I');

CREATE TABLE Fine(
    RollNumber int NOT NULL,
    DateOfIssue date,
    Amount int NOT NULL,
    FOREIGN KEY (RollNumber) REFERENCES Borrower(RollNumber)
);

--try eqaul to sign for assignment of variables 


DELIMITER $
CREATE PROCEDURE fine_calculation(IN rno INT)
BEGIN
    DECLARE i_date DATE;
    DECLARE fine_amt INT;
    DECLARE diff INT;
    DECLARE exit handler for sqlexception SELECT "table not found"; 

    SELECT DateOfIssue FROM Borrower WHERE RollNumber=rno INTO i_date;
    SELECT datediff(curdate(),i_date) INTO diff;

    IF(diff>15 AND diff<=30) 
        THEN 
            SET fine_amt=diff*5;
            INSERT INTO Fine VALUES(rno,i_date,fine_amt); --is asked in question you can enter the currdate() into the fine table as well

    ELSEIF(diff>30)
        THEN    
            SET fine_amt= diff*10;
            INSERT INTO Fine VALUES(rno,i_date,fine_amt);

    ELSE
        SIGNAL SQLSTATE '4500' MESSAGE_TEXT="message"

    END IF;

    UPDATE Borrower
        SET Status='R' WHERE RollNumber=rno;

END;
$





CALL fine_calculation(3)

DROP PROCEDURE fine_calculation;    
