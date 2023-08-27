-- create db
CREATE DATABASE IF NOT EXISTS bank;

-- USE DB
USE bank;

-- create branch table
CREATE TABLE branch (
branch_name VARCHAR(20) PRIMARY KEY,
branch_city VARCHAR(20),
assets INT
);

-- create account table
CREATE TABLE account(
    account_number INT PRIMARY KEY,
    branch_name VARCHAR(20),
    balance INT,
    FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
);

-- create customer table
CREATE TABLE customer(
    customer_name VARCHAR(30) PRIMARY KEY,
    customer_street VARCHAR(50),
    customer_city VARCHAR(20)
);

-- create depositor table
CREATE TABLE depositor(
    customer_name VARCHAR(30),
    account_number INT,
    FOREIGN KEY(account_number) REFERENCES account(account_number),
    FOREIGN KEY(customer_name) REFERENCES customer(customer_name)
);

-- create loan table
CREATE TABLE loan(
    loan_number INT PRIMARY KEY,
    branch_name VARCHAR(20),
    amount INT,
    FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
);

-- create borrower table
CREATE TABLE borrower(
    customer_name VARCHAR(30),
    loan_number INT,
    FOREIGN KEY(loan_number) REFERENCES loan(loan_number),
    FOREIGN KEY(customer_name) REFERENCES customer(customer_name)
);


INSERT INTO branch values 
('AKURDI' ,'NIGDI', 150000),
('CAMP', 'PUNE', 100000),
('KHADKI', 'PUNE', 155000),
('NAVI MUMBAI', 'MUMBAI', 105000),
('SANTA CRUZ', 'MUMBAI', 105000),
('STATION', 'PUNE', 155000);

INSERT INTO account values (1001, 'CAMP' ,60000),
(1002, 'STATION' ,100000),
(1003, 'STATION' ,130000),
(1004, 'KHADKI' ,10000),
(2001, 'AKURDI' ,50000),
(2002, 'AKURDI' ,150000),
(2003, 'AKURDI' ,12000),
(2004, 'AKURDI' ,50000),
(3001, 'NAVI MUMBAI' ,60000),
(3002, 'SANTA CRUZ' ,16000),
(3003, 'NAVI MUMBAI' ,10000),
(3004, 'NAVI MUMBAI' ,12000);

INSERT INTO customer values ('ADESH PARDESHI', 'CAMP' ,'PUNE'),
('ANKITA KAMBLI', 'PIMPRI' ,'PIMPRI'),
('APOORV SHAH', 'VASAI ROAD' ,'MUMBAI'),
('DHIREN JAIN', 'AKURDI' ,'NIGDI'),
('NIDA SHAIKH', 'SANTA CRUZ' ,'MUMBAI'),
('PRIYANKA LOKHANDE', 'BORIWALI(E)' ,'MUMBAI'),
('RIDDHI RUNWAL', 'AKURDI' ,'NIGDI'),
('RIDDHI SANGHVI', 'WAKDEWADI' ,'PUNE'),
('SHARVARI KULKARNI', 'VIMAN-NAGAR' ,'PUNE'),
('SHIKHA JAISWAL', 'ABC CHOWK' ,'PUNE'),
('SOHAM BHOJ', 'AKURDI' ,'NIGDI'),
('YOJNA GADIYA', 'BORIWALI(W)' ,'MUMBAI');


INSERT INTO depositor values ('ADESH PARDESHI', 1001),
('RIDDHI SANGHVI', 1002),
('SHARVARI KULKARNI', 1003),
('SHIKHA JAISWAL', 1004),
('ANKITA KAMBLI', 2001),
('DHIREN JAIN', 2002),
('RIDDHI RUNWAL', 2003),
('SOHAM BHOJ', 2004),
('APOORV SHAH', 3001),
('NIDA SHAIKH', 3002),
('PRIYANKA LOKHANDE', 3003),
('YOJNA GADIYA', 3004);


INSERT INTO loan values(101, 'CAMP' ,15000),
(102, 'STATION' ,100000),
(103, 'KHADKI' ,10000),
(201, 'AKURDI' ,12000),
(202, 'AKURDI' ,50000),
(301, 'NAVI MUMBAI' ,20000),
(302, 'SANTA CRUZ' ,20000),
(303, 'SANTA CRUZ' ,60000),
(304, 'NAVI MUMBAI' ,60000);


INSERT INTO borrower values ('ADESH PARDESHI', 101),
('RIDDHI SANGHVI', 102),
('SHARVARI KULKARNI', 103),
('ANKITA KAMBLI', 201),
('RIDDHI RUNWAL', 202),
('APOORV SHAH', 301),
('APOORV SHAH', 301),
('NIDA SHAIKH', 302),
('PRIYANKA LOKHANDE', 303),
('YOJNA GADIYA', 304);


-- SELECT STATEMENTS
SELECT * FROM branch;
SELECT * FROM account;
SELECT * FROM customer;
SELECT * FROM depositor;
SELECT * FROM borrower;
SELECT * FROM loan;


-- 1. Find the names of all branches in loan relation.
SELECT DISTINCT(branch_name) FROM loan;

-- 2. Find all loan numbers for loans made at Akurdi Branch with loan amount > 12000.
SELECT loan_number FROM loan WHERE branch_name = "AKURDI" AND amount > 12000;

-- 3. Find all customers who have a loan from bank. Find their names,loan_no and loan amount.
SELECT customer_name,borrower.loan_number,amount FROM borrower,loan WHERE borrower.loan_number = loan.loan_number;

-- 4. List all customers in alphabetical order who have loan from Akurdi branch.
SELECT customer_name FROM borrower,loan WHERE loan.branch_name = 'AKURDI' AND borrower.loan_number = loan.loan_number ORDER BY customer_name;


-- 5. Find all customers who have an account or loan or both at bank. 
SELECT customer_name FROM customer
WHERE customer_name IN (SELECT customer_name FROM borrower UNION SELECT customer_name FROM depositor);

SELECT customer.customer_name FROM customer,borrower 
WHERE customer.customer_name = borrower.customer_name 
UNION SELECT customer.customer_name FROM customer,depositor 
WHERE customer.customer_name = depositor.customer_name;


-- 6. Find all customers who have both account and loan at bank.
SELECT customer.customer_name FROM customer,borrower,depositor 
WHERE customer.customer_name = borrower.customer_name and customer.customer_name = depositor.customer_name;

SELECT customer.customer_name FROM customer
JOIN borrower ON customer.customer_name = borrower.customer_name
JOIN depositor ON customer.customer_name = depositor.customer_name;
 

-- 7. Find all customers who have account but no loan at the bank.
SELECT customer_name FROM customer WHERE customer_name IN (SELECT customer_name FROM depositor) AND customer_name NOT IN (SELECT customer_name FROM borrower);

SELECT customer.customer_name FROM customer
JOIN depositor ON customer.customer_name = depositor.customer_name
LEFT JOIN borrower ON customer.customer_name = borrower.customer_name
WHERE borrower.customer_name IS NULL;

-- 8. Find the average account balance at each branch
SELECT branch_name,AVG(balance) FROM account GROUP BY branch_name;


-- 9. Find no. of depositors at each branch.
SELECT branch_name,count(branch_name) FROM account 
INNER JOIN depositor ON account.account_number = depositor.account_number 
GROUP BY branch_name;


-- 10. Find name of Customer and city where customer name starts with Letter P. 
SELECT customer_name,customer_city FROM customer WHERE customer_name LIKE "P%" or "p%";


-- 11. Display distinct cities of branch.
SELECT DISTINCT branch_city from branch;


-- 12. Find the branches where average account balance > 12000
SELECT branch_name,AVG(balance) FROM account GROUP BY branch_name having AVG(balance)>12000;


-- 13. Find number of tuples in customer relation.
SELECT COUNT(*) AS "NUM OF TUPLES" from customer;


-- 14. Calculate total loan amount given by bank. 
SELECT SUM(amount) from loan;

-- 15. Delete all loans with loan amount between 1300 and 1500. 
DELETE FROM loan WHERE amount BETWEEN 1300 AND 1500;

-- 16. Delete all tuples at every branch located in Nigdi.
DELETE FROM depositor WHERE account_number IN
(SELECT account_number FROM account JOIN branch ON account.branch_name = branch.branch_name WHERE branch.branch_city = 'NIGDI');

DELETE FROM borrower WHERE loan_number IN
(SELECT loan_number FROM loan JOIN branch ON loan.branch_name = branch.branch_name WHERE branch.branch_city = 'NIGDI');

DELETE FROM account WHERE branch_name IN
(SELECT branch_name FROM branch WHERE branch_city = 'NIGDI');

DELETE FROM loan WHERE branch_name IN
(SELECT branch_name FROM branch WHERE branch_city = 'NIGDI');

DELETE FROM branch WHERE branch_city = 'NIGDI';


--END 

-- data from tables where foreign key is present
select * FROM depositor WHERE account_number IN 
(SELECT account_number FROM account JOIN branch ON account.branch_name = branch.branch_name WHERE branch.branch_city = 'NIGDI');

select * FROM borrower WHERE loan_number IN
(SELECT loan_number FROM loan JOIN branch ON loan.branch_name = branch.branch_name WHERE branch.branch_city = 'NIGDI');

select * FROM account WHERE branch_name IN
(SELECT branch_name FROM branch WHERE branch_city = 'NIGDI');

select * FROM loan WHERE branch_name IN
(SELECT branch_name FROM branch WHERE branch_city = 'NIGDI');

select * FROM branch WHERE branch_city = 'NIGDI';

--  to get deleted data back ie above data
INSERT INTO branch VALUES ('AKURDI' ,'NIGDI', 150000);
INSERT INTO account VALUES (2001, 'AKURDI' ,50000),
(2002, 'AKURDI' ,150000),
(2003, 'AKURDI' ,12000),
(2004, 'AKURDI' ,50000);
INSERT INTO depositor VALUES ('ANKITA KAMBLI', 2001),
('DHIREN JAIN', 2002),
('RIDDHI RUNWAL', 2003),
('SOHAM BHOJ', 2004);
INSERT INTO loan VALUES(201, 'AKURDI' ,12000),
(202, 'AKURDI' ,50000);
INSERT INTO borrower VALUES ('ANKITA KAMBLI', 201),
('RIDDHI RUNWAL', 202);
