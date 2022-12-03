
create table lib (
    srollno INT,
    sname varchar(20),
    bookname varchar(20),
    date_issue date,
    price int
);

create table aud (
    actionperformed varchar(20),
    date_performace date,
    srollno int references lib(srollno),
    sname varchar(20),
    bookname varchar(20),
    date_issue date
);

SELECT * FROM aud;

delimiter //
CREATE TRIGGER trig 
AFTER INSERT ON lib 
FOR EACH row 

BEGIN
    INSERT INTO aud VALUES("insert bitch",now(),new.srollno, sname,new.bookname,new.date_issue);
END
//

INSERT INTO lib VALUES (10, 'Aditya', 'PPL', '2021-03-07', 430);
SELECT * FROM aud;



delimiter //
create trigger trig2
before delete on lib
for each row 
begin
insert into aud values("delete bitch",now(),old.srollno,old.sname,old.bookname,old.date_issue);
end //


delete from lib where srollno = 10;
select * from aud;

delimiter //
create trigger trig3
after update on lib
for each row 
begin
insert into aud values ("update bitch",now(),old.srollno,old.sname,old.bookname,old.date_issue);
end //


UPDATE lib
SET sname = 'xoxoxo'
WHERE price = 430;
select * from aud;
select * from lib;