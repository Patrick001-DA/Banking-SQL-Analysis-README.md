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

## Tools

* SQL
* MySQL
* DB Fiddle
* GitHub

## Project Goal

The goal of this project is to demonstrate practical SQL skills through a realistic banking dataset and develop the ability to answer business questions using relational databases.

## Author

Patrick Njuguna Muchemi
