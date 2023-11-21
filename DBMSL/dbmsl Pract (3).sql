/*
Consider following Relation 
Account(Acc_no, branch_name,balance)
Branch(branch_name,branch_city,assets)
Customer(cust_name,cust_street,cust_city)
Depositor(cust_name,acc_no)
Loan(loan_no,branch_name,amount)
Borrower(cust_name,loan_no)
Create above tables with appropriate constraints like primary 
key, foreign key, not null etc.
1. Find the branches where average account balance > 15000.
2. Find number of tuples in customer relation.
3. Calculate total loan amount given by bank.
4. Delete all loans with loan amount between 1300 and 1500.
5. Find the average account balance at each branch
6. Find name of Customer and city where customer name starts with 
Letter P. 
*/

SELECT branch_name FROM Account GROUP BY branch_name HAVING AVG(balance) > 15000;

SELECT COUNT(*) FROM Customer;

SELECT SUM(amount) FROM Loan;

DELETE FROM Loan WHERE amount BETWEEN 1300 AND 1500;

SELECT branch_name, AVG(balance) FROM Account GROUP BY branch_name;

SELECT cust_name, cust_city FROM Customer WHERE cust_name LIKE 'P%';

