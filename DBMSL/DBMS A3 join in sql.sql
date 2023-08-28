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

