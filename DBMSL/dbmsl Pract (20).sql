/*
Write a Stored Procedure namely proc_Grade for the categorization 
of student. If marks scored by students in examination is <=1500 
and marks>=990 then student will be placed in distinction 
category if marks scored are between 989 and 900 category is 
first class, if marks 899 and 825 category is Higher Second 
Class.
Write a PL/SQL block for using procedure created with above 
requirement.
Stud_Marks(name, total_marks), 
Result(Roll,Name, Class)
*/

CREATE TABLE STUD_MARKS(
    ROLL NUMBER(2),
    SNAME VARCHAR2(20),
    TOTAL_MARKS NUMBER(4)
);

INSERT INTO STUD_MARKS VALUES(
    1,
    'A',
    1000
);

INSERT INTO STUD_MARKS VALUES(
    2,
    'B',
    1500
);

INSERT INTO STUD_MARKS VALUES(
    3,
    'C',
    990
);

INSERT INTO STUD_MARKS VALUES(
    4,
    'D',
    989
);

INSERT INTO STUD_MARKS VALUES(
    5,
    'E',
    900
);

INSERT INTO STUD_MARKS VALUES(
    6,
    'F',
    899
);

INSERT INTO STUD_MARKS VALUES(
    7,
    'G',
    825
);

INSERT INTO STUD_MARKS VALUES(
    8,
    'I',
    725
);

CREATE TABLE RESULT(
    ROLL NUMBER(2),
    SNAME VARCHAR2(20),
    CLASS VARCHAR2(20)
);

SELECT
    *
FROM
    STUD_MARKS;

SELECT
    *
FROM
    RESULT;

CREATE OR REPLACE PROCEDURE PROC_GRADE IS
    CURSOR C1 IS
    SELECT
        *
    FROM
        STUD_MARKS;
    R1 C1%ROWTYPE;
BEGIN
    C1.OPEN;
    LOOP
        FETCH C1 INTO R1;
        EXIT WHEN C1%NOTFOUND;
        IF R1.TOTAL_MARKS <= 1500 AND R1.TOTAL_MARKS >= 990 THEN
            INSERT INTO RESULT VALUES(
                R1.ROLL,
                R1.SNAME,
                'Distinction'
            );
        ELSIF R1.TOTAL_MARKS <= 989 AND R1.TOTAL_MARKS >= 900 THEN
            INSERT INTO RESULT VALUES(
                R1.ROLL,
                R1.SNAME,
                'First Class'
            );
        ELSIF R1.TOTAL_MARKS <= 899 AND R1.TOTAL_MARKS >= 825 THEN
            INSERT INTO RESULT VALUES(
                R1.ROLL,
                R1.SNAME,
                'Higher Second Class'
            );
        ELSE
            INSERT INTO RESULT VALUES(
                R1.ROLL,
                R1.SNAME,
                'Fail'
            );
        END IF;
    END LOOP;

    C1.CLOSE;
END;
/

SELECT
    *
FROM
    STUD_MARKS;

SELECT
    *
FROM
    RESULT;



CREATE OR REPLACE PROCEDURE PROC_GRADE IS
CURSOR C1 IS SELECT * FROM STUD_MARKS;
R1 C1%ROWTYPE;
BEGIN
OPEN C1;
LOOP
FETCH C1 INTO R1;
EXIT WHEN C1%NOTFOUND;
IF R1.TOTAL_MARKS <= 1500 AND R1.TOTAL_MARKS >= 990 THEN
 INSERT INTO RESULT VALUES(R1.ROLL,R1.SNAME,'Distinction');
 ELSIF R1.TOTAL_MARKS <= 989 AND R1.TOTAL_MARKS >= 900 THEN
 INSERT INTO RESULT VALUES(R1.ROLL,R1.SNAME,'First Class');
 ELSIF R1.TOTAL_MARKS <= 899 AND R1.TOTAL_MARKS >= 825 THEN
 INSERT INTO RESULT VALUES(R1.ROLL,R1.SNAME,'Higher Second Class');
 ELSE
 INSERT INTO RESULT VALUES(R1.ROLL,R1.SNAME,'Fail');
 END IF;
 END LOOP;
 CLOSE C1;
 END;
 /