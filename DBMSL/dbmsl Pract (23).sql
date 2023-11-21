/*
Trigger: Create a row level trigger for the CUSTOMERS table that 
would fire INSERT or UPDATE or DELETE operations performed on the 
CUSTOMERS table. This trigger will display the salary difference 
between the old values and new values.

*/

CREATE TABLE customers (
    id          NUMBER(10) PRIMARY KEY,
    cname        VARCHAR2(50),
    salary      NUMBER(10)
);

INSERT INTO customers VALUES (1, 'John', 1000);
INSERT INTO customers VALUES (2, 'Smith', 2000);
INSERT INTO customers VALUES (3, 'Peter', 3000);
INSERT INTO customers VALUES (4, 'Mary', 4000);
INSERT INTO customers VALUES (5, 'David', 5000);


CREATE OR REPLACE TRIGGER trg_customers
AFTER INSERT OR UPDATE OR DELETE ON customers
FOR EACH ROW
DECLARE
    v_old_salary customers.salary%TYPE;
    v_new_salary customers.salary%TYPE;
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('New record inserted');
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('Record updated');
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('Record deleted');
    END IF;
    v_old_salary := :OLD.salary;
    v_new_salary := :NEW.salary;
    DBMS_OUTPUT.PUT_LINE('Old salary: ' || v_old_salary);
    DBMS_OUTPUT.PUT_LINE('New salary: ' || v_new_salary);
    DBMS_OUTPUT.PUT_LINE('Salary difference: ' || (v_new_salary - v_old_salary));
END;
/

UPDATE customers SET salary = 1500 WHERE id = 1;
UPDATE customers SET salary = 2500 WHERE id = 2;
UPDATE customers SET salary = 3500 WHERE id = 3;
