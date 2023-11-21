/*
1. Consider following Relation 
Account(Acc_no, branch_name,balance)
Branch(branch_name,branch_city,assets)
Customer(cust_name,cust_street,cust_city)
Depositor(cust_name,acc_no)
Loan(loan_no,branch_name,amount)
Borrower(cust_name,loan_no)
Create above tables with appropriate constraints like primary 
key, foreign key, not null etc.
1. Find the names of all branches in loan relation.
2. Find all loan numbers for loans made at „Wadia College‟ Branch 
with loan amount > 12000.
3. Find all customers who have a loan from bank. Find their 
names,loan_no and loan amount.
4. List all customers in alphabetical order who have loan from 
„Wadia College‟ branch.
5. Display distinct cities of branch.
*/

CREATE DATABASE IF NOT EXISTS practical1;
USE practical1;

CREATE TABLE Account(
    Acc_no INT PRIMARY KEY,
    branch_name VARCHAR(255) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Branch(
    branch_name VARCHAR(255) PRIMARY KEY,
    branch_city VARCHAR(255) NOT NULL,
    assets DECIMAL(15, 2) NOT NULL
);

CREATE TABLE Customer(
    cust_name VARCHAR(255) PRIMARY KEY,
    cust_street VARCHAR(255) NOT NULL,
    cust_city VARCHAR(255) NOT NULL
);

CREATE TABLE Depositor(
    cust_name VARCHAR(255) REFERENCES Customer(cust_name),
    acc_no INT REFERENCES Account(Acc_no),
    PRIMARY KEY (cust_name, acc_no)
);

CREATE TABLE Loan(
    loan_no INT PRIMARY KEY,
    branch_name VARCHAR(255) REFERENCES Branch(branch_name),
    amount DECIMAL(15, 2) NOT NULL
);

CREATE TABLE Borrower(
    cust_name VARCHAR(255) REFERENCES Customer(cust_name),
    loan_no INT REFERENCES Loan(loan_no),
    PRIMARY KEY (cust_name, loan_no)
);

INSERT INTO Branch(branch_name, branch_city, assets) VALUES
('Wadia College', 'Pune', 10000000),
('Symbiosis', 'Pune', 20000000),
('MIT', 'Pune', 15000000);

INSERT INTO Account(Acc_no, branch_name, balance) VALUES
(1, 'Wadia College', 5000),
(2, 'Symbiosis', 10000),
(3, 'MIT', 15000);

INSERT INTO Customer(cust_name, cust_street, cust_city) VALUES
('John', 'MG Road', 'Pune'),
('David', 'FC Road', 'Pune'),
('Michael', 'SB Road', 'Pune');

INSERT INTO Depositor(cust_name, acc_no) VALUES
('John', 1),
('David', 2),
('Michael', 3);

INSERT INTO Loan(loan_no, branch_name, amount) VALUES
(101, 'Wadia College', 12000),
(102, 'Symbiosis', 15000),
(103, 'MIT', 18000);

INSERT INTO Borrower(cust_name, loan_no) VALUES
('John', 101),
('David', 102),
('Michael', 103);

INSERT INTO Branch(branch_name, branch_city, assets) VALUES
('Wadia College', 'Pune', 10000000),
('Symbiosis', 'Pune', 20000000),
('MIT', 'Pune', 15000000);

INSERT INTO Account(Acc_no, branch_name, balance) VALUES
(1, 'Wadia College', 5000),
(2, 'Symbiosis', 10000),
(3, 'MIT', 15000);

INSERT INTO Customer(cust_name, cust_street, cust_city) VALUES
('John', 'MG Road', 'Pune'),
('David', 'FC Road', 'Pune'),
('Michael', 'SB Road', 'Pune');

INSERT INTO Depositor(cust_name, acc_no) VALUES
('John', 1),
('David', 2),
('Michael', 3);

INSERT INTO Loan(loan_no, branch_name, amount) VALUES
(101, 'Wadia College', 12000),
(102, 'Symbiosis', 15000),
(103, 'MIT', 18000);

INSERT INTO Borrower(cust_name, loan_no) VALUES
('John', 101),
('David', 102),
('Michael', 103);


SELECT DISTINCT branch_name FROM Loan;
select loan_no from Loan where branch_name = 'Wadia College' and amount > 12000;
select cust_name, loan_no, amount from Loan join Borrower on Loan.loan_no = Borrower.loan_no;
select cust_name from Loan join Borrower on Loan.loan_no = Borrower.loan_no where branch_name = 'Wadia College' order by cust_name;
select distinct branch_city from Branch;