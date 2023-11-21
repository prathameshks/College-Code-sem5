/*
 Write a PL/SQL Block to increase the salary of employees by 10% 
of existing salary, who are having salary less than average 
salary of organization, whenever such salary updates takes place, 
a record for same is maintained in the increment_salary table.
emp(emp_no, salary)
increment_salary(emp_no, salary)
*/

CREATE TABLE emp(
    emp_no NUMBER(5) PRIMARY KEY,
    salary NUMBER(10,2)
);

CREATE TABLE increment_salary(
    emp_no NUMBER(5),
    salary NUMBER(10,2)
);

INSERT INTO emp VALUES(1, 10000);
INSERT INTO emp VALUES(2, 20000);
INSERT INTO emp VALUES(3, 30000);
INSERT INTO emp VALUES(4, 40000);
INSERT INTO emp VALUES(5, 50000);

DECLARE
    avg_sal NUMBER(10,2);
BEGIN
    SELECT AVG(salary) INTO avg_sal FROM emp;
    UPDATE emp SET salary = salary + (salary * 0.1) WHERE salary < avg_sal;
    INSERT INTO increment_salary SELECT * FROM emp WHERE salary < avg_sal;
END;
/

SELECT * FROM emp;
SELECT * FROM increment_salary;

-- procedure using cursor
CREATE or REPLACE PROCEDURE increment_sal2 IS
    CURSOR c1 IS SELECT * FROM emp;
    emp_rec c1%ROWTYPE;
    avg_sal NUMBER(10,2);
BEGIN
    SELECT AVG(salary) INTO avg_sal FROM emp;
    FOR emp_rec IN c1 LOOP
        IF emp_rec.salary < avg_sal THEN
            UPDATE emp SET salary = salary + (salary * 0.1) WHERE emp_no = emp_rec.emp_no;
            INSERT INTO increment_salary VALUES(emp_rec.emp_no, emp_rec.salary);
        END IF;
    END LOOP;
END;
/

exec increment_sal2;
execute increment_sal2;