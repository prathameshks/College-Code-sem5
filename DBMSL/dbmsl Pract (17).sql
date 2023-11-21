/*
Write a PL/SQL block of code using Cursor that will merge the 
data available in the newly created table N_Roll Call with the 
data available in the table O_RollCall. If the data in the first 
table already exist in the second table then that data should be 
skipped.
*/

CREATE TABLE O_RollCall
(
    RollNo NUMBER(3),
    Attendance VARCHAR2(10)
);

INSERT INTO O_RollCall VALUES(1,'P');
INSERT INTO O_RollCall VALUES(2,'P');
INSERT INTO O_RollCall VALUES(3,'P');
INSERT INTO O_RollCall VALUES(4,'P');
INSERT INTO O_RollCall VALUES(5,'P');
INSERT INTO O_RollCall VALUES(6,'P');
INSERT INTO O_RollCall VALUES(7,'P');
INSERT INTO O_RollCall VALUES(8,'P');
INSERT INTO O_RollCall VALUES(9,'P');
INSERT INTO O_RollCall VALUES(10,'P');

CREATE TABLE N_RollCall
(
    RollNo NUMBER(3),
    Attendance VARCHAR2(10)
);


INSERT INTO N_RollCall VALUES(1,'P');
INSERT INTO N_RollCall VALUES(2,'P');
INSERT INTO N_RollCall VALUES(3,'P');
INSERT INTO N_RollCall VALUES(4,'P');
INSERT INTO N_RollCall VALUES(5,'P');
INSERT INTO N_RollCall VALUES(6,'P');
INSERT INTO N_RollCall VALUES(7,'P');
INSERT INTO N_RollCall VALUES(8,'P');
INSERT INTO N_RollCall VALUES(9,'P');
INSERT INTO N_RollCall VALUES(10,'P');
INSERT INTO N_RollCall VALUES(11,'P');
INSERT INTO N_RollCall VALUES(12,'P');
INSERT INTO N_RollCall VALUES(13,'P');
INSERT INTO N_RollCall VALUES(14,'P');
INSERT INTO N_RollCall VALUES(15,'P');
INSERT INTO N_RollCall VALUES(16,'P');
INSERT INTO N_RollCall VALUES(17,'P');
INSERT INTO N_RollCall VALUES(18,'P');
INSERT INTO N_RollCall VALUES(19,'P');
INSERT INTO N_RollCall VALUES(20,'P');


DECLARE 
    CURSOR c1 IS SELECT * FROM N_RollCall;
    r1 c1%ROWTYPE;
    v_count NUMBER;
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO r1;
        EXIT WHEN c1%NOTFOUND;
        
        SELECT COUNT(*) INTO v_count FROM O_RollCall WHERE RollNo = r1.RollNo;
        
        IF v_count >= 1 THEN
            CONTINUE;
        ELSE
            INSERT INTO O_RollCall VALUES(r1.RollNo,r1.Attendance);
        END IF; 
    END LOOP;
    CLOSE c1;
END;
/


SELECT * FROM O_RollCall;
SELECT * FROM N_RollCall;
