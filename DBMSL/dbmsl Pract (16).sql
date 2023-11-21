/*
 Write a Unnamed PL/SQL of code for the following requirements:-
Schema:
 Borrower (Rollin, Name, DateofIssue, NameofBook, Status)
 Fine (Roll_no,Date,Amt)
Accept roll_no & name of book from user.
Check the number of days (from date of issue).
1. If days are between 15 to 30 then fine amounts will be Rs 5 
per day.
2. If no. of days>30, per day fine will be Rs 50 per day & for 
days less than 30, Rs. 5 per day.
3. After submitting the book, status will change from I to R.
4. If condition of fine is true, then details will be stored into 
fine table.
*/

CREATE TABLE Borrower(
Rollno NUMBER(10),
Name VARCHAR2(20),
DateofIssue DATE,
NameofBook VARCHAR2(20),
Status VARCHAR2(1)
);

CREATE TABLE Fine(
Rollno NUMBER(10),
Date_Ret DATE,
Amt NUMBER(10)
);

INSERT INTO Borrower VALUES(1,'Rahul','01-NOV-2023','C++','I');
INSERT INTO Borrower VALUES(2,'Raj','11-NOV-2023','Java','I');
INSERT INTO Borrower VALUES(3,'Rohan','01-DEC-2022','Python','I');
INSERT INTO Borrower VALUES(4,'Ramesh','01-DEC-2019','C','I');
INSERT INTO Borrower VALUES(5,'Rakesh','11-NOV-2023','C#','I');
INSERT INTO Borrower VALUES(6,'Rajesh','11-NOV-2023','C++','I');
INSERT INTO Borrower VALUES(7,'Rahul','11-NOV-2023','Java','I');
INSERT INTO Borrower VALUES(8,'Raj','01-DEC-2023','Python','I');
INSERT INTO Borrower VALUES(9,'Rohan','01-OCT-2023','C','I');
INSERT INTO Borrower VALUES(10,'Ramesh','01-DEC-2019','C#','I');

SET SERVEROUTPUT ON;

DECLARE
    v_rollno Borrower.Rollno%TYPE;
    v_nameofbook Borrower.NameofBook%TYPE;
    v_dateofissue Borrower.DateofIssue%TYPE;
    v_status Borrower.Status%TYPE;
    v_date DATE;
    v_amt Fine.Amt%TYPE;
    v_days NUMBER(10);
BEGIN
    v_rollno := &rollno;
    v_nameofbook := '&nameofbook';
    SELECT DateofIssue,Status INTO v_dateofissue,v_status FROM Borrower WHERE Rollno = v_rollno AND NameofBook = v_nameofbook;
    v_days := SYSDATE - v_dateofissue;
    IF v_days BETWEEN 15 AND 30 THEN
        v_amt := v_days * 5;
    ELSIF v_days > 30 THEN
        v_amt := v_days * 50;
    END IF;
    IF v_amt > 0 THEN
        INSERT INTO Fine VALUES(v_rollno,SYSDATE,v_amt);
    END IF;
    UPDATE Borrower SET Status = 'R' WHERE Rollno = v_rollno AND NameofBook = v_nameofbook;
    COMMIT;
END;
/