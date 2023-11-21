/*
Write a PL/SQL block for following requirements and handle the 
exceptions. Roll no. of students will be entered by the user. 
Attendance of roll no. entered by user will be checked in the 
Stud table. If attendance is less than 75% then display the 
message “Term not granted” and set the status in stud table as 
“Detained”. Otherwise display message “Term granted” and set the 
status in stud table as “Not Detained”
 Student (Roll, Name, Attendance ,Status)

*/

CREATE TABLE attendance(
    roll NUMBER(3),
    attendance NUMBER(3)
);

INSERT INTO attendance VALUES(1, 80);
INSERT INTO attendance VALUES(2, 70);
INSERT INTO attendance VALUES(3, 60);
INSERT INTO attendance VALUES(4, 50);
INSERT INTO attendance VALUES(5, 40);

CREATE TABLE student(
    roll NUMBER(3),
    status VARCHAR2(20)
);

INSERT INTO student(roll) VALUES(1);
INSERT INTO student(roll) VALUES(2);
INSERT INTO student(roll) VALUES(3);
INSERT INTO student(roll) VALUES(4);
INSERT INTO student(roll) VALUES(5);
INSERT INTO student(roll) VALUES(6);

DECLARE
    roll NUMBER(3);
    att NUMBER(3);
    st VARCHAR2(20);
BEGIN
    roll := &roll;
    SELECT attendance INTO att FROM attendance WHERE roll = roll AND ROWNUM <= 1;
    if att < 75 then
        st := 'Detained';
        dbms_output.put_line('Term not granted');
    else
        st := 'Not Detained';
        dbms_output.put_line('Term granted');
    end if;
    UPDATE student SET status = st WHERE roll = roll;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Roll number not found');
END;
/
