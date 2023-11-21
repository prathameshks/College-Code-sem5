/*
2. Consider following Relation 
Account(Acc_no, branch_name,balance)
Branch(branch_name,branch_city,assets)
Customer(cust_name,cust_street,cust_city)
Depositor(cust_name,acc_no)
Loan(loan_no,branch_name,amount)
Borrower(cust_name,loan_no)
Create above tables with appropriate constraints like primary 
key, foreign key, not null etc.
1. Find all customers who have both account and loan at bank.
2. Find all customers who have an account or loan or both at 
bank.
3. Find all customers who have account but no loan at the bank.
4. Find average account balance at „Wadia College‟ branch.
5. Find no. of depositors at each branch
*/

USE practical1;

TRUNCATE TABLE Account;
TRUNCATE TABLE Branch;
TRUNCATE TABLE Customer;
TRUNCATE TABLE Depositor;
TRUNCATE TABLE Loan;
TRUNCATE TABLE Borrower;

INSERT INTO Customer(cust_name, cust_street, cust_city) VALUES
('John', 'MG Road', 'Pune'),
('David', 'FC Road', 'Pune'),
('Michael', 'SB Road', 'Pune'),
('Sarah', 'MG Road', 'Pune'),
('Emma', 'FC Road', 'Pune');

INSERT INTO Depositor(cust_name, acc_no) VALUES
('John', 1),
('David', 2),
('Michael', 3),
('Sarah', 4),
('Emma', 5);

INSERT INTO Loan(loan_no, branch_name, amount) VALUES
(101, 'Wadia College', 12000),
(102, 'Symbiosis', 15000),
(103, 'MIT', 18000),
(104, 'Fergusson', 20000),
(105, 'BMCC', 22000);

INSERT INTO Borrower(cust_name, loan_no) VALUES
('John', 101),
('David', 102),
('Michael', 103),
('Sarah', 104),
('Emma', 105);

/*
1. Find all customers who have both account and loan at bank.
2. Find all customers who have an account or loan or both at 
bank.
3. Find all customers who have account but no loan at the bank.
4. Find average account balance at „Wadia College‟ branch.
5. Find no. of depositors at each branch
*/

-- 1. Find all customers who have both account and loan at bank.
SELECT DISTINCT c.cust_name
FROM Customer c
INNER JOIN Depositor d ON c.cust_name = d.cust_name
INNER JOIN Borrower b ON c.cust_name = b.cust_name;

-- 2. Find all customers who have an account or loan or both at bank.
SELECT DISTINCT c.cust_name
FROM Customer c
LEFT JOIN Depositor d ON c.cust_name = d.cust_name
LEFT JOIN Borrower b ON c.cust_name = b.cust_name;

-- 3. Find all customers who have account but no loan at the bank.
SELECT DISTINCT c.cust_name
FROM Customer c
LEFT JOIN Depositor d ON c.cust_name = d.cust_name
LEFT JOIN Borrower b ON c.cust_name = b.cust_name
WHERE b.cust_name IS NULL;

-- 4. Find average account balance at „Wadia College‟ branch.
SELECT AVG(balance) AS avg_balance
FROM Account
WHERE branch_name = 'Wadia College';

-- 5. Find no. of depositors at each branch
SELECT branch_name, COUNT(*) AS no_of_depositors
FROM Depositor
left join Account ON Depositor.acc_no = Account.acc_no
GROUP BY branch_name;