# Banking SQL Analysis

## Project Overview

This project is a practical SQL banking database designed to develop and demonstrate SQL skills relevant to banking and data analyst roles.

The database contains multiple related tables representing customers, accounts, loans, branches, employees, and transactions.

## Database Structure

The project contains six tables:

* `customers` — customer demographic and branch information
* `accounts` — customer account information and balances
* `loans` — customer loan information
* `branches` — bank branch information
* `employees` — branch employee information
* `transactions` — account transaction records

## SQL Skills Practiced

### Basic SQL

* SELECT
* WHERE
* ORDER BY
* DISTINCT
* Calculated columns

### Aggregation

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* GROUP BY
* HAVING

### JOINs

* INNER JOIN
* Multiple-table JOINs
* Joining customers, accounts, loans and branches

### Intermediate SQL

* CASE statements
* Subqueries
* Common Table Expressions (CTEs)

### Advanced SQL

* RANK()
* ROW_NUMBER()
* DENSE_RANK()
* LAG()
* LEAD()
* Window functions

### Banking Analysis

The project is used to analyze:

* Customer account balances
* Loan portfolios
* Active and defaulted loans
* Branch performance
* Customer segmentation
* Deposits and withdrawals
* Loan-to-balance relationships
* Customer rankings
* Transaction activity

## Database Relationships

```text
Branches
   |
   +---- Customers
             |
             +---- Accounts
             |        |
             |        +---- Transactions
             |
             +---- Loans

Branches
   |
   +---- Employees
```

## Sample Business Questions

1. Which customers have the highest account balances?
2. Which branches hold the highest total account balances?
3. What is the average loan amount by branch?
4. Which branches have multiple active loans?
5. Which customers have loans greater than their account balances?
6. What percentage of loans are active, paid or defaulted?
7. Which customers have the highest credit exposure?
8. Which branches have the highest transaction activity?


   **Schema (MySQL v8)**

    
    
    CREATE TABLE branches (
        branch_id INT PRIMARY KEY,
        branch_name VARCHAR(50),
        city VARCHAR(50)
    );
    
    CREATE TABLE customers (
        customer_id INT PRIMARY KEY,
        customer_name VARCHAR(100),
        age INT,
        gender VARCHAR(10),
        branch_id INT,
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
    );
    
    CREATE TABLE accounts (
        account_id INT PRIMARY KEY,
        customer_id INT,
        account_type VARCHAR(20),
        balance DECIMAL(12,2),
        account_status VARCHAR(20),
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    );
    
    CREATE TABLE loans (
        loan_id INT PRIMARY KEY,
        customer_id INT,
        loan_amount DECIMAL(12,2),
        loan_status VARCHAR(20),
        interest_rate DECIMAL(5,2),
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    );
    
    CREATE TABLE employees (
        employee_id INT PRIMARY KEY,
        employee_name VARCHAR(100),
        branch_id INT,
        job_title VARCHAR(50),
        salary DECIMAL(10,2),
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
    );
    
    CREATE TABLE transactions (
        transaction_id INT PRIMARY KEY,
        account_id INT,
        transaction_type VARCHAR(20),
        amount DECIMAL(12,2),
        transaction_date DATE,
        FOREIGN KEY (account_id) REFERENCES accounts(account_id)
    );
    
    INSERT INTO branches VALUES
    (1,'Nairobi CBD','Nairobi'),
    (2,'Westlands','Nairobi'),
    (3,'Nakuru','Nakuru'),
    (4,'Kisumu','Kisumu'),
    (5,'Mombasa','Mombasa'),
    (6,'Nyeri','Nyeri'),
    (7,'Eldoret','Eldoret'),
    (8,'Thika','Thika'),
    (9,'Kiambu','Kiambu'),
    (10,'Machakos','Machakos'),
    (11,'Meru','Meru'),
    (12,'Embu','Embu'),
    (13,'Kericho','Kericho'),
    (14,'Naivasha','Naivasha'),
    (15,'Kitengela','Kitengela'),
    (16,'Kakamega','Kakamega'),
    (17,'Bungoma','Bungoma'),
    (18,'Malindi','Malindi'),
    (19,'Garissa','Garissa'),
    (20,'Narok','Narok');
    INSERT INTO customers VALUES
    (1,'John Kamau',28,'Male',1),
    (2,'Mary Wanjiku',34,'Female',2),
    (3,'Peter Mwangi',42,'Male',3),
    (4,'Grace Akinyi',31,'Female',4),
    (5,'David Otieno',39,'Male',5),
    (6,'Jane Njeri',26,'Female',6),
    (7,'Samuel Kariuki',45,'Male',1),
    (8,'Lucy Wambui',29,'Female',10),
    (9,'Brian Kiptoo',36,'Male',7),
    (10,'Ann Chebet',33,'Female',13),
    (11,'Kevin Maina',30,'Male',8),
    (12,'Faith Nyambura',27,'Female',9),
    (13,'Joseph Ochieng',41,'Male',4),
    (14,'Esther Wairimu',38,'Female',14),
    (15,'Daniel Mutua',35,'Male',15),
    (16,'Susan Muthoni',44,'Female',11),
    (17,'George Otieno',32,'Male',16),
    (18,'Caroline Jepchirchir',29,'Female',7),
    (19,'Michael Kariuki',47,'Male',12),
    (20,'Rose Wangari',37,'Female',6);
    INSERT INTO accounts VALUES
    (101,1,'Savings',85000,'Active'),
    (102,2,'Current',125000,'Active'),
    (103,3,'Savings',45000,'Active'),
    (104,4,'Savings',210000,'Active'),
    (105,5,'Current',67000,'Active'),
    (106,6,'Savings',95000,'Active'),
    (107,7,'Current',320000,'Active'),
    (108,8,'Savings',58000,'Active'),
    (109,9,'Savings',145000,'Active'),
    (110,10,'Current',88000,'Active'),
    (111,11,'Savings',72000,'Active'),
    (112,12,'Savings',110000,'Active'),
    (113,13,'Current',175000,'Active'),
    (114,14,'Savings',195000,'Active'),
    (115,15,'Current',135000,'Active'),
    (116,16,'Savings',240000,'Active'),
    (117,17,'Savings',62000,'Dormant'),
    (118,18,'Current',155000,'Active'),
    (119,19,'Savings',285000,'Active'),
    (120,20,'Current',98000,'Active');
    INSERT INTO loans VALUES
    (201,1,150000,'Active',12.50),
    (202,2,300000,'Active',13.00),
    (203,3,100000,'Paid',11.50),
    (204,4,500000,'Active',12.00),
    (205,5,250000,'Active',14.00),
    (206,6,0,'No Loan',0.00),
    (207,7,750000,'Active',11.00),
    (208,8,120000,'Active',13.50),
    (209,9,350000,'Active',12.75),
    (210,10,200000,'Active',14.50),
    (211,11,180000,'Active',13.25),
    (212,12,220000,'Paid',12.00),
    (213,13,400000,'Active',11.75),
    (214,14,275000,'Active',13.00),
    (215,15,325000,'Active',12.50),
    (216,16,450000,'Active',11.50),
    (217,17,90000,'Defaulted',15.00),
    (218,18,280000,'Active',13.75),
    (219,19,600000,'Active',11.25),
    (220,20,190000,'Paid',12.50);
    INSERT INTO employees VALUES
    (301,'Alice Mwende',1,'Branch Manager',120000),
    (302,'James Kariuki',2,'Relationship Officer',85000),
    (303,'Peter Ouma',3,'Loan Officer',78000),
    (304,'Mercy Atieno',4,'Customer Service Officer',65000),
    (305,'Robert Mwangi',5,'Branch Manager',115000),
    (306,'Catherine Njeri',6,'Relationship Officer',82000),
    (307,'Dennis Kiptoo',7,'Loan Officer',80000),
    (308,'Esther Wanjiku',8,'Teller',60000),
    (309,'Samuel Maina',9,'Customer Service Officer',65000),
    (310,'Jane Achieng',10,'Relationship Officer',83000),
    (311,'Martin Mutua',11,'Loan Officer',79000),
    (312,'Lucy Muthoni',12,'Teller',58000),
    (313,'Brian Otieno',13,'Branch Manager',110000),
    (314,'Susan Chebet',14,'Relationship Officer',81000),
    (315,'George Kamau',15,'Loan Officer',77000),
    (316,'Faith Wairimu',16,'Teller',59000),
    (317,'Daniel Ochieng',17,'Customer Service Officer',64000),
    (318,'Mary Jepkoech',18,'Relationship Officer',84000),
    (319,'Joseph Mutiso',19,'Loan Officer',76000),
    (320,'Caroline Njeri',20,'Teller',57000);
    INSERT INTO transactions VALUES
    (401,101,'Deposit',50000,'2026-01-05'),
    (402,102,'Withdrawal',20000,'2026-01-07'),
    (403,103,'Deposit',30000,'2026-01-10'),
    (404,104,'Deposit',100000,'2026-01-12'),
    (405,105,'Withdrawal',15000,'2026-01-15'),
    (406,106,'Deposit',45000,'2026-01-18'),
    (407,107,'Deposit',120000,'2026-01-20'),
    (408,108,'Withdrawal',10000,'2026-01-22'),
    (409,109,'Deposit',60000,'2026-01-25'),
    (410,110,'Withdrawal',25000,'2026-01-28'),
    (411,111,'Deposit',35000,'2026-02-02'),
    (412,112,'Deposit',50000,'2026-02-05'),
    (413,113,'Withdrawal',30000,'2026-02-08'),
    (414,114,'Deposit',75000,'2026-02-10'),
    (415,115,'Withdrawal',20000,'2026-02-13'),
    (416,116,'Deposit',90000,'2026-02-15'),
    (417,117,'Withdrawal',8000,'2026-02-18'),
    (418,118,'Deposit',55000,'2026-02-20'),
    (419,119,'Deposit',100000,'2026-02-23'),
    (420,120,'Withdrawal',12000,'2026-02-25');

---

**Query #1**

    -- Assign a unique sequential number to countries ordered by total_cases descending (no ties allowed, even if two countries have equal cases).
    
                  
       
       
       
     
                                
                                -- Which customers have the highest account balances?
    select c.customer_name, a.balance
    from customers c
    join accounts a on c.customer_id = a.customer_id
    order by a.balance desc
    limit 5;

| customer_name   | balance  |
| --------------- | -------- |
| Samuel Kariuki  | 320000.0 |
| Michael Kariuki | 285000.0 |
| Susan Muthoni   | 240000.0 |
| Grace Akinyi    | 210000.0 |
| Esther Wairimu  | 195000.0 |

---
**Query #2**

    -- Which branches hold the highest total account balance
    
    select b.branch_name, sum(a.balance) as total_balance
    from branches b
    join customers c on b.branch_id = c.branch_id
    join accounts a on c.customer_id = a.customer_id
    group by b.branch_id, b.branch_name
    order by total_balance desc;

| branch_name | total_balance |
| ----------- | ------------- |
| Nairobi CBD | 405000.0      |
| Kisumu      | 385000.0      |
| Eldoret     | 300000.0      |
| Embu        | 285000.0      |
| Meru        | 240000.0      |
| Naivasha    | 195000.0      |
| Nyeri       | 193000.0      |
| Kitengela   | 135000.0      |
| Westlands   | 125000.0      |
| Kiambu      | 110000.0      |
| Kericho     | 88000.0       |
| Thika       | 72000.0       |
| Mombasa     | 67000.0       |
| Kakamega    | 62000.0       |
| Machakos    | 58000.0       |
| Nakuru      | 45000.0       |

---
**Query #3**

    -- What is the average loan amount by branch?
    
    select b.branch_name, avg(l.loan_amount) as avg_loan
    from branches b
    join customers c on b.branch_id = c.branch_id
    join loans l on c.customer_id = l.customer_id
    where l.loan_status <> 'No Loan'
    group by b.branch_id, b.branch_name
    order by avg_loan desc;

| branch_name | avg_loan |
| ----------- | -------- |
| Embu        | 600000.0 |
| Nairobi CBD | 450000.0 |
| Kisumu      | 450000.0 |
| Meru        | 450000.0 |
| Kitengela   | 325000.0 |
| Eldoret     | 315000.0 |
| Westlands   | 300000.0 |
| Naivasha    | 275000.0 |
| Mombasa     | 250000.0 |
| Kiambu      | 220000.0 |
| Kericho     | 200000.0 |
| Nyeri       | 190000.0 |
| Thika       | 180000.0 |
| Machakos    | 120000.0 |
| Nakuru      | 100000.0 |
| Kakamega    | 90000.0  |

---
**Query #4**

    -- Which branches have multiple active loans?
    select b.branch_name, count(*) as active_loans
    from branches b
    join customers c on b.branch_id = c.branch_id
    join loans l on c.customer_id = l.customer_id
    where l.loan_status = 'Active'
    group by b.branch_id, b.branch_name
    having count(*) > 1;

| branch_name | active_loans |
| ----------- | ------------ |
| Nairobi CBD | 2            |
| Kisumu      | 2            |
| Eldoret     | 2            |

---
**Query #5**

    -- Which customers have loans greater than their account balances?
    select c.customer_name, a.balance, l.loan_amount
    from customers c
    join accounts a on c.customer_id = a.customer_id
    join loans l on c.customer_id = l.customer_id
    where l.loan_amount > a.balance;

| customer_name        | balance  | loan_amount |
| -------------------- | -------- | ----------- |
| John Kamau           | 85000.0  | 150000.0    |
| Mary Wanjiku         | 125000.0 | 300000.0    |
| Peter Mwangi         | 45000.0  | 100000.0    |
| Grace Akinyi         | 210000.0 | 500000.0    |
| David Otieno         | 67000.0  | 250000.0    |
| Samuel Kariuki       | 320000.0 | 750000.0    |
| Lucy Wambui          | 58000.0  | 120000.0    |
| Brian Kiptoo         | 145000.0 | 350000.0    |
| Ann Chebet           | 88000.0  | 200000.0    |
| Kevin Maina          | 72000.0  | 180000.0    |
| Faith Nyambura       | 110000.0 | 220000.0    |
| Joseph Ochieng       | 175000.0 | 400000.0    |
| Esther Wairimu       | 195000.0 | 275000.0    |
| Daniel Mutua         | 135000.0 | 325000.0    |
| Susan Muthoni        | 240000.0 | 450000.0    |
| George Otieno        | 62000.0  | 90000.0     |
| Caroline Jepchirchir | 155000.0 | 280000.0    |
| Michael Kariuki      | 285000.0 | 600000.0    |
| Rose Wangari         | 98000.0  | 190000.0    |

---
**Query #6**

    -- What percentage of loans are active, paid or defaulted?
    
    select loan_status,
           count(*) as loan_count,
           round(count(*) * 100.0 / (select count(*) from loans), 2) as percentage
    from loans
    group by loan_status;

| loan_status | loan_count | percentage |
| ----------- | ---------- | ---------- |
| Active      | 15         | 75.0       |
| Paid        | 3          | 15.0       |
| No Loan     | 1          | 5.0        |
| Defaulted   | 1          | 5.0        |

---
**Query #7**

    -- Which customers have the highest credit exposure?
    select c.customer_name, l.loan_amount as exposure, l.loan_status
    from customers c
    join loans l on c.customer_id = l.customer_id
    where l.loan_status in ('Active', 'Defaulted')
    order by l.loan_amount desc
    limit 5;

| customer_name   | exposure | loan_status |
| --------------- | -------- | ----------- |
| Samuel Kariuki  | 750000.0 | Active      |
| Michael Kariuki | 600000.0 | Active      |
| Grace Akinyi    | 500000.0 | Active      |
| Susan Muthoni   | 450000.0 | Active      |
| Joseph Ochieng  | 400000.0 | Active      |

---
**Query #8**

    -- Which branches have the highest transaction activity
    
    select b.branch_name,
           count(t.transaction_id) as transaction_count,
           sum(t.amount) as total_amount
    from branches b
    join customers c on b.branch_id = c.branch_id
    join accounts a on c.customer_id = a.customer_id
    join transactions t on a.account_id = t.account_id
    group by b.branch_id, b.branch_name
    order by total_amount desc;

| branch_name | transaction_count | total_amount |
| ----------- | ----------------- | ------------ |
| Nairobi CBD | 2                 | 170000.0     |
| Kisumu      | 2                 | 130000.0     |
| Eldoret     | 2                 | 115000.0     |
| Embu        | 1                 | 100000.0     |
| Meru        | 1                 | 90000.0      |
| Naivasha    | 1                 | 75000.0      |
| Nyeri       | 2                 | 57000.0      |
| Kiambu      | 1                 | 50000.0      |
| Thika       | 1                 | 35000.0      |
| Nakuru      | 1                 | 30000.0      |
| Kericho     | 1                 | 25000.0      |
| Westlands   | 1                 | 20000.0      |
| Kitengela   | 1                 | 20000.0      |
| Mombasa     | 1                 | 15000.0      |
| Machakos    | 1                 | 10000.0      |
| Kakamega    | 1                 | 8000.0       |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/x86eayavTKiNvsCggL4UtU/3133)

## Tools

* SQL
* MySQL
* DB Fiddle
* GitHub

## Project Goal

The goal of this project is to demonstrate practical SQL skills through a realistic banking dataset and develop the ability to answer business questions using relational databases.

## Author

Patrick Njuguna Muchemi

BSc Mathematics & Economics

SQL | Data Analysis | SPSS | Excel | Power BI
