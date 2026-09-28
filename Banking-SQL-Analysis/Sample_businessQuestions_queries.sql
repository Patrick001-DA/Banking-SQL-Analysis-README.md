-- Which customers have the highest account balances?
select c.customer_name, a.balance
from customers c
join accounts a on c.customer_id = a.customer_id
order by a.balance desc
limit 5;

-- Which branches hold the highest total account balance

select b.branch_name, sum(a.balance) as total_balance
from branches b
join customers c on b.branch_id = c.branch_id
join accounts a on c.customer_id = a.customer_id
group by b.branch_id, b.branch_name
order by total_balance desc;

-- What is the average loan amount by branch?

select b.branch_name, avg(l.loan_amount) as avg_loan
from branches b
join customers c on b.branch_id = c.branch_id
join loans l on c.customer_id = l.customer_id
where l.loan_status <> 'No Loan'
group by b.branch_id, b.branch_name
order by avg_loan desc;

-- Which branches have multiple active loans?
select b.branch_name, count(*) as active_loans
from branches b
join customers c on b.branch_id = c.branch_id
join loans l on c.customer_id = l.customer_id
where l.loan_status = 'Active'
group by b.branch_id, b.branch_name
having count(*) > 1;

-- Which customers have loans greater than their account balances?
select c.customer_name, a.balance, l.loan_amount
from customers c
join accounts a on c.customer_id = a.customer_id
join loans l on c.customer_id = l.customer_id
where l.loan_amount > a.balance;

-- What percentage of loans are active, paid or defaulted?

select loan_status,
       count(*) as loan_count,
       round(count(*) * 100.0 / (select count(*) from loans), 2) as percentage
from loans
group by loan_status;

-- Which customers have the highest credit exposure?
select c.customer_name, l.loan_amount as exposure, l.loan_status
from customers c
join loans l on c.customer_id = l.customer_id
where l.loan_status in ('Active', 'Defaulted')
order by l.loan_amount desc
limit 5;

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



























