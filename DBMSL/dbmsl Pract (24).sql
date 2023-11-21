/*
Trigger :Write a after trigger for Insert, update and delete 
event considering following requirement:
Emp(Emp_no, Emp_name, Emp_salary)
a) Trigger should be initiated when salary tried to be inserted 
is less than Rs.50,000/-
b) Trigger should be initiated when salary tried to be updated 
for value less than Rs. 50,000/-
Also the new values expected to be inserted will be stored in new 
table Tracking(Emp_no,Emp_salary).
*/

CREATE TABLE EMP2(
    EMP_NO NUMBER(5),
    EMP_NAME VARCHAR2(20),
    EMP_SALARY NUMBER(10)
);

CREATE TABLE TRACKING(
    EMP_NO NUMBER(5),
    EMP_SALARY NUMBER(10)
);

CREATE OR REPLACE TRIGGER EMP_TRG2 
AFTER INSERT OR UPDATE OR DELETE ON EMP2 
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        IF :NEW.EMP_SALARY < 50000 THEN
            INSERT INTO TRACKING VALUES(:NEW.EMP_NO, :NEW.EMP_SALARY);
        END IF;
    END IF;

    IF UPDATING THEN
        IF :NEW.EMP_SALARY < 50000 THEN
            INSERT INTO TRACKING VALUES(:NEW.EMP_NO, :NEW.EMP_SALARY);
        END IF;
    END IF;

    IF DELETING THEN
        IF :OLD.EMP_SALARY < 50000 THEN
            INSERT INTO TRACKING VALUES(:OLD.EMP_NO, :OLD.EMP_SALARY);
        END IF;
    END IF;
END;
/

INSERT INTO EMP2 VALUES(1,'A',10000);
INSERT INTO EMP2 VALUES(2,'B',20000);

UPDATE EMP2 SET EMP_SALARY=30000 WHERE EMP_NO=1;
UPDATE EMP2 SET EMP_SALARY=40000 WHERE EMP_NO=2;

DELETE FROM EMP2 WHERE EMP_NO=1;
DELETE FROM EMP2 WHERE EMP_NO=2;

SELECT * FROM TRACKING;