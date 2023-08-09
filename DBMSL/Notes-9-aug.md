## Create New user in MySQL

mysql> ``` create user 'prathamesh'@'localhost' identified by "Pass@123"; ```

Query OK, 0 rows affected (0.02 sec)

mysql> ``` GRANT ALL PRIVILEGES ON *.* TO 'prathamesh'@'%' IDENTIFIED BY 'Pass@123';```

Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> ```FLUSH PRIVILEGES;```

Query OK, 0 rows affected (0.00 sec)

## Connect To the new User
(base) admin1@414-38:~$ ```mysql -u prathamesh -p ```

Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 14
Server version: 5.7.42-0ubuntu0.18.04.1 (Ubuntu)
-- Not Working

## Connect to Default User
(base) admin1@414-38:~$ ```sudo bash```

[sudo] password for admin1: 
(base) root@414-38:~# ```mysql -u root -p```

Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 5.7.42-0ubuntu0.18.04.1 (Ubuntu)

(base) admin1@414-38:~$ ```sudo mysql -u root -p```


### CREATE DB

mysql> ```create database TECOMP1;```

Query OK, 1 row affected (0.00 sec)

### USE DB

mysql>```USE TECOMP1;```

Database changed

mysql> CREATE TABLE student(
    -> Roll_no int(10) Primary Key,
    -> FName varchar(15) Not NULL,
    -> LName varchar(15),
    -> DOB date);
Query OK, 0 rows affected (0.35 sec)

mysql> INSERT INTO student  VALUES(10,'Sahil','Pawar',"2003-01-23");
Query OK, 1 row affected (0.03 sec)

mysql> select * from student;
+---------+-------+-------+------------+
| Roll_no | FName | LName | DOB        |
+---------+-------+-------+------------+
|      10 | Sahil | Pawar | 2003-01-23 |
+---------+-------+-------+------------+
1 row in set (0.00 sec)

mysql> INSERT INTO student  VALUES(21,'Parth','Dalle',"2003/01/23");
Query OK, 1 row affected (0.01 sec)

mysql> select * from student;
+---------+-------+-------+------------+
| Roll_no | FName | LName | DOB        |
+---------+-------+-------+------------+
|      10 | Sahil | Pawar | 2003-01-23 |
|      21 | Parth | Dalle | 2003-01-23 |
+---------+-------+-------+------------+
2 rows in set (0.00 sec)

mysql> INSERT INTO student VALUES(6,'Akhilesh','Mali','2004-01-13'),(13,'Yash','jadhav','2002-3-6');
Query OK, 2 rows affected (0.04 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO student VALUES (8,'Omkar','C','2003-6-9'), (9,'Ujwal','C','2003-2-10'), (23,'shivam',NULL,'2003-1-23');
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from student;                                                   +---------+----------+--------+------------+
| Roll_no | FName    | LName  | DOB        |
+---------+----------+--------+------------+
|       6 | Akhilesh | Mali   | 2004-01-13 |
|       8 | Omkar    | C      | 2003-06-09 |
|       9 | Ujwal    | C      | 2003-02-10 |
|      10 | Sahil    | Pawar  | 2003-01-23 |
|      13 | Yash     | jadhav | 2002-03-06 |
|      21 | Parth    | Dalle  | 2003-01-23 |
|      23 | shivam   | NULL   | 2003-01-23 |
+---------+----------+--------+------------+
7 rows in set (0.00 sec)

mysql> UPDATE student SET LNAME="Thorat" where Roll_no=23;
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student order by Roll_No desc;
+---------+----------+--------+------------+
| Roll_no | FName    | LName  | DOB        |
+---------+----------+--------+------------+
|      23 | shivam   | Thorat | 2003-01-23 |
|      21 | Parth    | Dalle  | 2003-01-23 |
|      13 | Yash     | jadhav | 2002-03-06 |
|      10 | Sahil    | Pawar  | 2003-01-23 |
|       9 | Ujwal    | C      | 2003-02-10 |
|       8 | Omkar    | C      | 2003-06-09 |
|       6 | Akhilesh | Mali   | 2004-01-13 |
+---------+----------+--------+------------+
7 rows in set (0.00 sec)

mysql> 
