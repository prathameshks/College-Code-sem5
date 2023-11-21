/*
5. Consider following Relation 
Employee(emp_id,employee_name,street,city)
Works(employee_name,company_name,salary)
Company(company_name,city)
Manages(employee_name,manager_name)
Create above tables with appropriate constraints like primary 
key, foreign key, not null etc. 
1. Find the names of all employees who work for „TCS‟.
2. Find the names and company names of all employees sorted in 
ascending order of company name and descending order of 
employee names of that company.
3. Change the city of employee working with InfoSys to 
„Bangalore‟
4. Find the names, street address, and cities of residence for 
all employees who work for 'TechM' and earn more than $10,000.
5. Add Column Asset to Company table. 
*/

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




select e.employee_name from Employee e inner join Works w on e.employee_name = w.employee_name where w.company_name = 'TCS';

select e.employee_name, w.company_name from Employee e inner join Works w on e.employee_name = w.employee_name order by w.company_name asc, e.employee_name desc;

update Employee e inner join Works w on e.employee_name = w.employee_name set e.city = 'Bangalore' where w.company_name = 'Infosys';

select e.employee_name, e.street, e.city from Employee e inner join Works w on e.employee_name = w.employee_name where w.company_name = 'TechM' and w.salary > 10000;   

alter table Company add column asset DECIMAL(10, 2) NOT NULL default 0;