
--  Display all customers


SELECT *
FROM customers;


--  Display customer name, age and gender

SELECT
    customer_name,
    age,
    gender
FROM customers;


--  Display customers older than 35


SELECT *
FROM customers
WHERE age > 35;


--  Display female customers

SELECT *
FROM customers
WHERE gender = 'Female';


--  Display customers between age 30 and 40


SELECT *
FROM customers
WHERE age BETWEEN 30 AND 40;


--  Display customers from selected branches

SELECT *
FROM customers
WHERE branch_id IN (1, 4, 7);


--  Display all accounts with a balance greater than 100,000

SELECT *
FROM accounts
WHERE balance > 100000;


--  Display accounts with balance between 50,000 and 150,000

SELECT *
FROM accounts
WHERE balance BETWEEN 50000 AND 150000;


--  Display active accounts

SELECT *
FROM accounts
WHERE account_status = 'Active';


--  Display dormant accounts

SELECT *
FROM accounts
WHERE account_status = 'Dormant';


--  Display savings accounts

SELECT *
FROM accounts
WHERE account_type = 'Savings';

--  Display current accounts

SELECT *
FROM accounts
WHERE account_type = 'Current';


--  Sort accounts from highest to lowest balance

SELECT *
FROM accounts
ORDER BY balance DESC;


--  Display the 5 customers with the highest account balances

SELECT *
FROM accounts
ORDER BY balance DESC
LIMIT 5;


-- Count the total number of customers

SELECT COUNT(*) AS total_customers
FROM customers;

--  Calculate the average account balance


SELECT AVG(balance) AS average_balance
FROM accounts;

--  Find the highest account balance

SELECT MAX(balance) AS highest_balance
FROM accounts;


--  Find the lowest account balance


SELECT MIN(balance) AS lowest_balance
FROM accounts;

--  Calculate the total money held in accounts


SELECT SUM(balance) AS total_account_balance
FROM accounts;

--  Count the number of savings and current accounts

SELECT
    account_type,
    COUNT(*) AS number_of_accounts
FROM accounts
GROUP BY account_type;

--  Calculate the average balance by account type


SELECT
    account_type,
    AVG(balance) AS average_balance
FROM accounts
GROUP BY account_type;


-- Calculate the total balance by account type

SELECT
    account_type,
    SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;

--  Count loans by loan status

SELECT
    loan_status,
    COUNT(*) AS number_of_loans
FROM loans
GROUP BY loan_status;


-- Calculate total loan amount by loan status
SELECT
    loan_status,
    SUM(loan_amount) AS total_loan_amount
FROM loans
GROUP BY loan_status;


-- Find loans greater than 300,000

SELECT *
FROM loans
WHERE loan_amount > 300000;


--  Find active loans


SELECT *
FROM loans
WHERE loan_status = 'Active';

-- Find defaulted loans

SELECT *
FROM loans
WHERE loan_status = 'Defaulted';


--  Calculate the total loan portfolio


SELECT SUM(loan_amount) AS total_loan_amount
FROM loans;

-- Sort loans from highest to lowest

SELECT *
FROM loans
ORDER BY loan_amount DESC;

