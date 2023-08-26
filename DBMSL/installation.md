# Installation in Github CodeSpaces

### Step 1: Open Codespace Terminal

### Step 2: Update and Upgrade

```bash
sudo apt update && sudo apt upgrade -y
```

#### Step 3: Install MySQL

```bash
sudo apt install mysql-server -y
```

#### Step 4: Start MySQL Service

```bash
sudo service mysql start
```

#### Step 5: Login to MySQL

```bash
sudo mysql -u root
```

#### Step 6: Create User

```bash
CREATE USER 'prathamesh'@'localhost' IDENTIFIED BY '1234';
```

#### Step 7: Grant Privileges

```bash
GRANT ALL PRIVILEGES ON *.* TO 'prathamesh'@'localhost' WITH GRANT OPTION;
```

#### Step 8: Create Database

```bash
CREATE DATABASE dbmsl;
```

#### Step 9: Exit MySQL

```bash
exit
```

# Installation in Windows

### Step 1: Download MySQL Installer

[Download MySQL Installer](https://dev.mysql.com/downloads/installer/)

### Step 2: Install MySQL

### Step 3: Start MySQL Service

### Step 4: Login to MySQL

```bash
mysql -u root -p
```

### Step 5: Create User

```bash
CREATE USER 'prathamesh'@'localhost' IDENTIFIED BY '1234';
```

### Step 6: Grant Privileges

```bash
GRANT ALL PRIVILEGES ON *.* TO 'prathamesh'@'localhost' WITH GRANT OPTION;
```

### Step 7: Create Database

```bash
CREATE DATABASE dbmsl;
```

### Step 8: Exit MySQL

```bash
exit
```

# Connect to MySQL Server

### Step 1: Open MySQL Shell

```bash
mysql -u prathamesh -p
```

### Step 2: Enter Password

### Step 3: Select Database

```bash
USE dbmsl;
```

# Connect to MySQL Server Remotely

### Step 1: Open MySQL Shell

```bash
mysql -u prathamesh -p -h
```

### Step 2: Enter Password

### Step 3: Select Database

```bash
USE dbmsl;
```
