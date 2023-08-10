--  create db
create database bank_ps;
use bank_ps;

-- create branch table
create table Branch(
branch_name varchar(20) primary key,
branch_city varchar(20),
assets int
);

-- accout table
create table Account(
acc_no int primary key,
branch_name varchar(20),
balance int,
foreign key(branch_name) references Branch(branch_name)
);

-- customer table
create table Customer(
cust_name varchar(20) primary key,
cust_street varchar(20),
cust_city varchar(20)
);


-- depositor table
create table Depositor(
cust_name varchar(20),
acc_no int,
foreign key(cust_name) references Customer(cust_name),
foreign key(acc_no) references Account(acc_no)
);

-- loan table
create table Loan(
loan_no int primary key,
branch_name varchar(20),
ammount int,
foreign key(branch_name) references Branch(branch_name)
);


-- borrower table
create table Borrower(
cust_name varchar(20),
loan_no int,
foreign key(cust_name) references Customer(cust_name),
foreign key(loan_no) references Loan(loan_no)
);

-- insert in branch table
INSERT INTO Branch values
('Pune_wadia','Pune',10256),
('Pune_kharadi','Pune',23056),
('Pimpri_1','Pimpri',1),
('Bhoom_main','Bhoom',125445);


