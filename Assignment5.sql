/*
Cursor in a stored procedure is used to iterate through a result set returned by a SELECT statement

SYNTAX and STEPS

DECLARE cursor_name CURSOR FOR SELECT_statement;

OPEN cursor_name;

DECLARE CONTINUE HANDLER FOR NOT FOUND // terminate statement

FETCH cursor_name INTO variables list;

CLOSE cursor_name;
*/


CREATE TABLE OldRollNumber(
    RollNumber INT UNIQUE NOT NULL,
    Name VARCHAR(50),
    Addr VARCHAR(50),
    PRIMARY KEY (RollNumber)
);

CREATE TABLE NewRollNumber(
    RollNumber INT UNIQUE NOT NULL,
    Name VARCHAR(50),
    Addr VARCHAR(50),
    PRIMARY KEY (RollNumber)
);


INSERT INTO OldRollNumber
VALUES(1,"Aditya","Pune");

INSERT INTO OldRollNumber
VALUES(2,"Shivam","Pune");

INSERT INTO OldRollNumber
VALUES(3,"Atharva","Pune");

INSERT INTO OldRollNumber
VALUES(4,"Raunak","Pune");

INSERT INTO NewRollNumber
VALUES(1,"Aditya","Pune");

INSERT INTO NewRollNumber
VALUES(5,"Shruti","Pune");

INSERT INTO NewRollNumber
VALUES(6,"Aryan","Pune");

INSERT INTO NewRollNumber
VALUES(2,"Shivam","Pune");


DELIMITER $
CREATE PROCEDURE merge_data()
BEGIN
    DECLARE exit_cond BOOLEAN default FALSE;
    DECLARE rno INT;
    DECLARE oldtablecursor CURSOR FOR SELECT RollNumber FROM OldRollNumber;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET exit_cond=TRUE;



    OPEN oldtablecursor;
    l1:LOOP
        FETCH oldtablecursor INTO rno;
        IF NOT EXISTS(SELECT * FROM NewRollNumber WHERE RollNumber=rno)
            THEN
                INSERT INTO NewRollNumber SELECT * FROM OldRollNumber WHERE
                RollNumber=rno;
        END IF;
        IF (exit_cond)
            THEN
                CLOSE oldtablecursor;
                LEAVE l1;
        END IF;
    END LOOP l1;
    


END;
$