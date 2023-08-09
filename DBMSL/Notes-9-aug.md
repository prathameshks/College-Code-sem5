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

### CREATE DB

mysql> ```create database TECOMP1;```

Query OK, 1 row affected (0.00 sec)

### USE DB

mysql> ```USE TECOMP1;```

Database changed

