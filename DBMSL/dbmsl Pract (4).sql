/*
4. SQL Queries:
Create following tables with suitable constraints (primary key, 
foreign key, not null etc). 
Insert record and solve the following queries:
Create table Cust_Master(Cust_no, Cust_name, Cust_addr) 
Create table Order_table(Order_no, Cust_no, Order_date, Qty_Ordered)
Create Product(Product_no, Product_name, Order_no) 
1. List names of customers having 'A' as second letter in their 
name.
2. Display order from Customer no C1002,C1005,C1007 and C1008
3. List Clients who stay in either 'Banglore or 'Manglore'
4. Display name of customers& the product_name they have purchase
5. Create view View1 consisting of Cust_name, Product_name.
6. Disply product_name and quantity purchase by each customer
7. Perform different joint operation.
*/

CREATE TABLE Cust_Master(
    Cust_no INT PRIMARY KEY,
    Cust_name VARCHAR(255) NOT NULL,
    Cust_addr VARCHAR(255) NOT NULL
);

CREATE TABLE Order_table(
    Order_no INT PRIMARY KEY,
    Cust_no INT REFERENCES Cust_Master(Cust_no),
    Order_date DATE NOT NULL,
    Qty_Ordered INT NOT NULL
);

CREATE TABLE Product(
    Product_no INT PRIMARY KEY,
    Product_name VARCHAR(255) NOT NULL,
    Order_no INT REFERENCES Order_table(Order_no)
);

INSERT INTO Cust_Master(Cust_no, Cust_name, Cust_addr) VALUES
(1, 'John', 'MG Road, Pune'),
(2, 'David', 'FC Road, Pune'),
(3, 'Michael', 'SB Road, Pune'),
(4, 'Sarah', 'MG Road, Pune'),
(5, 'Emma', 'FC Road, Pune'),
(6, 'Andrew', 'SB Road, Pune'),
(7, 'Paul', 'MG Road, Pune'),
(8, 'Peter', 'FC Road, Pune'),
(9, 'Samuel', 'SB Road, Pune'),
(10, 'Adam', 'MG Road, Pune');

INSERT INTO Order_table(Order_no, Cust_no, Order_date, Qty_Ordered) VALUES
(101, 1, '2023-11-21', 5),
(102, 2, '2023-11-21', 10),
(103, 3, '2023-11-21', 15),
(104, 4, '2023-11-21', 20),
(105, 5, '2023-11-21', 25),
(106, 6, '2023-11-21', 30),
(107, 7, '2023-11-21', 35),
(108, 8, '2023-11-21', 40),
(109, 9, '2023-11-21', 45),
(110, 10, '2023-11-21', 50);

INSERT INTO Product(Product_no, Product_name, Order_no) VALUES
(1001, 'Product A', 101),
(1002, 'Product B', 102),
(1003, 'Product C', 103),
(1004, 'Product D', 104),
(1005, 'Product E', 105),
(1006, 'Product F', 106),
(1007, 'Product G', 107),
(1008, 'Product H', 108),
(1009, 'Product I', 109),
(1010, 'Product J', 110);


-- 1. List names of customers having 'A' as second letter in their name.
select * from Cust_Master where Cust_name like '_A%';

-- 2. Display order from Customer no C1002,C1005,C1007 and C1008
select * from Order_table where Cust_no in (2, 5, 7, 8);

-- 3. List Clients who stay in either 'Banglore or 'Manglore'
select * from Cust_Master where Cust_addr like '%Banglore%' or Cust_addr like '%Manglore%';

-- 4. Display name of customers& the product_name they have purchase
select Cust_name, Product_name FROM Order_table inner join product on ORDER_table.Order_no = Product.Order_no inner join Cust_Master on Cust_Master.Cust_no = Order_table.Cust_no;  

-- 5. Create view View1 consisting of Cust_name, Product_name.
create view View1 as select Cust_name, Product_name FROM Order_table inner join product on ORDER_table.Order_no = Product.Order_no inner join Cust_Master on Cust_Master.Cust_no = Order_table.Cust_no; 

-- 6. Disply product_name and quantity purchase by each customer
select Product_name, Qty_Ordered from Order_table inner join product on ORDER_table.Order_no = Product.Order_no;

-- 7. Perform different joint operation.
select * from Order_table inner join product on ORDER_table.Order_no = Product.Order_no inner join Cust_Master on Cust_Master.Cust_no = Order_table.Cust_no;
