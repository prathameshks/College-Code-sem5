/*
AIM : SQL Queries – all types of Join, Sub-Query and View:
Write at least10 SQL queries for suitable database application using SQL DML statements.
Note: Instructor will design the queries which demonstrate the use of concepts like all types of
Join, Sub-Query and View.
*/

-- create db
CREATE DATABASE IF NOT EXISTS bank_a3;

-- USE DB
USE bank_a3;

-- create branch table
CREATE TABLE branch (
branch_name VARCHAR(20) PRIMARY KEY,
branch_city VARCHAR(20),
assets INT
);

-- create account table
CREATE TABLE account(
    acc_no INT PRIMARY KEY,
    branch_name VARCHAR(20),
    balance INT,
    FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
);

-- create customer table
CREATE TABLE customer(
    cust_name VARCHAR(30) PRIMARY KEY,
    cust_street VARCHAR(50),
    cust_city VARCHAR(20)
);

-- create depositor table
CREATE TABLE depositor(
    cust_name VARCHAR(30),
    acc_no INT,
    FOREIGN KEY(acc_no) REFERENCES account(acc_no),
    FOREIGN KEY(cust_name) REFERENCES customer(cust_name)
);

-- create loan table
CREATE TABLE loan(
    loan_no INT PRIMARY KEY,
    branch_name VARCHAR(20),
    amount INT,
    FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
);

-- create borrower table
CREATE TABLE borrower(
    cust_name VARCHAR(30),
    loan_no INT,
    FOREIGN KEY(loan_no) REFERENCES loan(loan_no),
    FOREIGN KEY(cust_name) REFERENCES customer(cust_name)
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

/*
Struct
Account (Acc_no, branch_name,balance)
Branch (branch_name,branch_city,assets)
Customer (cust_name,cust_street,cust_city)
Depositor (cust_name,acc_no)
Loan (loan_no,branch_name,amount)
Borrower (cust_name,loan_no)

*/


-- QUERIES 
-- 1. Create a View1 to display List all customers in alphabetical order who have loan from Pune_Station branch.
CREATE VIEW view1 AS SELECT loan.loan_no,cust_name,branch_name,amount FROM loan JOIN borrower ON loan.loan_no = borrower.loan_no WHERE branch_name = "STATION" ORDER BY cust_name ASC;
update loan set branch_name="STATION" where loan_no = 303;

-- 2. Create View2 on branch table by selecting any two columns and perform insert update delete operations.
CREATE VIEW view2 AS SELECT branch_name,branch_city FROM branch;
INSERT INTO view2 VALUES ('AKURDI' ,'NIGDI');
SELECT * FROM view2;

UPDATE view2 SET branch_city = 'PUNE' WHERE branch_name = 'AKURDI';
SELECT * FROM view2;

DELETE FROM view2 WEHRE branch_name = 'AKURDI';

-- 3. Create View3 on borrower and depositor table by selecting any one column from each table perform insert update delete operations.
CREATE VIEW view3 AS SELECT cust_name FROM borrower UNION SELECT cust_name FROM depositor;

-- 4. Create Union of left and right joint for all customers who have an account or loan or both at bank Department of Computer Engineering Page 15
SELECT * FROM depositor LEFT JOIN borrower ON depositor.cust_name = borrower.cust_name UNION SELECT * FROM depositor RIGHT JOIN borrower ON depositor.cust_name = borrower.cust_name;

-- 5. Display content of View1,View2,View3 
SELECT * FROM view1;
SELECT * FROM view2;
SELECT * FROM view3;

-- 6. Create Simple and Unique index.
CREATE INDEX index1 ON customer(cust_name);
CREATE UNIQUE INDEX index2 ON customer(cust_name);


-- 7. Display index Information 
SHOW INDEX FROM customer;


-- 8. Truncate table Customer. 
TRUNCATE TABLE customer;
select * from customer;



-- Part 2

-- Consider following Relation: 
-- Companies (comp_id, name, cost, year)
--  C001 ONGC 2000 2010
--  C002 HPCL 2500 2012
--  C005 IOCL 1000 2014
--  C006 BHEL 3000 2015 
-- Orders (comp_id, domain, quantity)
--  C001 Oil 109
--  C002 Gas 121
--  C005 Telecom 115
-- Create above tables with appropriate constraints execute the following query:

CREATE DATABASE company_a3;
use company_a3;

CREATE TABLE companies(
    comp_id VARCHAR(5) PRIMARY KEY,
    name VARCHAR(20),
    cost INT,
    year YEAR(4)
    );

CREATE TABLE orders(
    comp_id VARCHAR(5),
    domain VARCHAR(10),
    quantity INT,
    FOREIGN KEY(comp_id) REFERENCES companies(comp_id)
    );

INSERT INTO companies VALUES
('C001','ONGC',2000,2010),
('C002','HPCL',2500,2012),
('C005','IOCL',1000,2014),
('C006','BHEL',3000,2015);

INSERT INTO orders VALUES
('C001','Oil',109),
('C002','Gas',121),
('C005','Telecom',115);

SELECT * FROM companies;
SELECT * FROM orders;


-- 1. Find names, costs, domains and quantities for companies using inner join.
SELECT name,cost,domain,quantity FROM companies INNER JOIN orders ON companies.comp_id = orders.comp_id;

-- 2. Find names, costs, domains and quantities for companies using left outer join.
SELECT name,cost,domain,quantity FROM companies LEFT JOIN orders ON companies.comp_id = orders.comp_id;

-- 3. Find names, costs, domains and quantities for companies using right outer join.
SELECT name,cost,domain,quantity FROM companies RIGHT JOIN orders ON companies.comp_id = orders.comp_id;

-- 4. Find names, costs, domains and quantities for companies using Union operator.
SELECT name, cost, domain, quantity FROM companies LEFT JOIN orders ON companies.comp_id = orders.comp_id
UNION
SELECT name, cost, domain, quantity FROM orders LEFT JOIN companies ON companies.comp_id = orders.comp_id;

-- 5. Create View View1 by selecting both tables to show company name and quantities.
CREATE OR REPLACE VIEW view1 AS SELECT name,quantity FROM companies LEFT JOIN orders ON companies.comp_id = orders.comp_id;
select * from view1;

-- 6. Create View2 on branch table by selecting any two columns and perform insert update delete operations.
CREATE OR REPLACE VIEW view2 AS SELECT comp_id,name FROM companies;
INSERT INTO view2 VALUES('C009','Meta');
INSERT INTO view2 VALUES('C010','Google');
select * from view2;

UPDATE view2 SET name = 'Facebook' WHERE comp_id = 'C009';
select * from view2;
SELECT * from companies;

DELETE FROM view2 WHERE name = 'Google';
DELETE FROM view2 WHERE comp_id = 'C009';
select * from view2;


-- 7. Display content of View1, View2
select * from view1;
select * from view2;

