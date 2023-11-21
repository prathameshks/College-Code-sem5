/*
6. Consider following Relation 
Employee(emp_id,employee_name,street,city)
Works(employee_name,company_name,salary)
Company(company_name,city)
Manages(employee_name,manager_name)
Create above tables with appropriate constraints like primary 
key, foreign key, not null etc. 
1. Change the city of employee working with InfoSys to 
„Bangalore‟
2. Find the names of all employees who earn more than the average 
salary of all employees of their company. Assume that all 
people work for at most one company.
3. Find the names, street address, and cities of residence for 
all employees who work for 'TechM' and earn more than $10,000.
4. Change name of table Manages to Management.
5. Create Simple and Unique index on employee table.
6. Display index Information
*/

CREATE DATABASE if not exists practical6;
use practical6;

CREATE TABLE Employee(
    emp_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL
);

CREATE TABLE Works(
    employee_name VARCHAR(255) REFERENCES Employee(employee_name),
    company_name VARCHAR(255) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (employee_name, company_name)
);

CREATE TABLE Company(
    company_name VARCHAR(255) PRIMARY KEY,
    city VARCHAR(255) NOT NULL
);

CREATE TABLE Manages(
    employee_name VARCHAR(255) REFERENCES Employee(employee_name),
    manager_name VARCHAR(255) REFERENCES Employee(employee_name),
    PRIMARY KEY (employee_name, manager_name)
);

INSERT INTO Employee(emp_id, employee_name, street, city) VALUES
(1, 'John', 'MG Road', 'Pune'),
(2, 'David', 'FC Road', 'Pune'),
(3, 'Michael', 'SB Road', 'Pune'),
(4, 'Sarah', 'MG Road', 'Pune'),
(5, 'Emma', 'FC Road', 'Pune'),
(6, 'Andrew', 'SB Road', 'Pune'),
(7, 'Paul', 'MG Road', 'Pune'),
(8, 'Peter', 'FC Road', 'Pune'),
(9, 'Samuel', 'SB Road', 'Pune'),
(10, 'Adam', 'MG Road', 'Pune');

INSERT INTO Works(employee_name, company_name, salary) VALUES
('John', 'TCS', 5000),
('David', 'Infosys', 10000),
('Michael', 'TechM', 15000),
('Sarah', 'TCS', 20000),
('Emma', 'Infosys', 25000),
('Andrew', 'TechM', 30000),
('Paul', 'TCS', 35000),
('Peter', 'Infosys', 40000),
('Samuel', 'TechM', 45000),
('Adam', 'TCS', 50000);

INSERT INTO Company(company_name, city) VALUES
('TCS', 'Pune'),
('Infosys', 'Pune'),
('TechM', 'Pune'),
('Wipro', 'Pune'),
('IBM', 'Pune'),
('Microsoft', 'Pune'),
('Google', 'Pune'),
('Facebook', 'Pune'),
('Amazon', 'Pune'),
('Netflix', 'Pune');

INSERT INTO Manages(employee_name, manager_name) VALUES
('John', 'David'),
('David', 'Michael'),
('Michael', 'Sarah'),
('Sarah', 'Emma'),
('Emma', 'Andrew'),
('Andrew', 'Paul'),
('Paul', 'Peter'),
('Peter', 'Samuel'),
('Samuel', 'Adam'),
('Adam', 'John');

-- 1. Change the city of employee working with InfoSys to „Bangalore‟
UPDATE Employee SET city = 'Bangalore' WHERE employee_name IN (SELECT employee_name FROM Works WHERE company_name = 'Infosys');

-- 2. Find the names of all employees who earn more than the average salary of all employees of their company. Assume that all people work for at most one company.
SELECT employee_name,salary FROM Works WHERE salary > (SELECT AVG(salary) FROM Works WHERE company_name = Works.company_name);

-- 3. Find the names, street address, and cities of residence for all employees who work for 'TechM' and earn more than $10,000.
SELECT employee_name,street,city FROM Employee WHERE employee_name IN (SELECT employee_name FROM Works WHERE company_name = 'TechM' AND salary > 10000);

-- 4. Change name of table Manages to Management.
ALTER TABLE Manages RENAME TO Management;

-- 5. Create Simple and Unique index on employee table.
CREATE UNIQUE INDEX employee_name_index ON Employee(employee_name);

-- 6. Display index Information
SHOW INDEX FROM Employee;
