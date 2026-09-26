--  Count customers
SELECT COUNT(*) AS total_customers
FROM customers;

--  Count loans
SELECT COUNT(*) AS total_loans
FROM loans;
--  Total account balances
SELECT SUM(balance) AS total_balance
FROM accounts;

-- Total loan amount
SELECT SUM(loan_amount) AS total_loans
FROM loans;

--  Average account balance
SELECT AVG(balance) AS average_balance
FROM accounts;

--  Average loan amount
SELECT AVG(loan_amount) AS average_loan
FROM loans;
--  Lowest account balance
SELECT MIN(balance) AS lowest_balance
FROM accounts;

-- Lowest loan amount
SELECT MIN(loan_amount) AS lowest_loan
FROM loans;

--  Highest account balance
SELECT MAX(balance) AS highest_balance
FROM accounts;

--   Highest loan amount
SELECT MAX(loan_amount) AS highest_loan
FROM loans;

--   Number of accounts by account type
SELECT
    account_type,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type;

-- Total loans by loan status
SELECT
    loan_status,
    SUM(loan_amount) AS total_loan_amount
FROM loans
GROUP BY loan_status;


--  Account types with total balance above 300,000
SELECT
    account_type,
    SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type
HAVING SUM(balance) > 300000;

--  Loan statuses with total loans above 500,000
SELECT
    loan_status,
    SUM(loan_amount) AS total_loan_amount
FROM loans
GROUP BY loan_status
HAVING SUM(loan_amount) > 500000;



















