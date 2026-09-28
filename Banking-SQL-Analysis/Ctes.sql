
-- Busy branches: Use a CTE to count customers per branch, then show only branches with more than 1 customer. Display: branch_id, customer_count

with customer_per_branch as
  ( select branch_id,count(*)as customer_count
   from customers
  group by branch_id)

select branch_id,customer_count
from customer_per_branch
where customer_count>1;


-- Active loan details: Use a CTE to select Active loans, then join to customers. Display: customer_name, loan_amount, interest_rate



with active_loans as(select* from loans l where loan_status= 'active')
select customer_name,l.loan_amount,interest_rate
from customers c
left join loans l
   using ( customer_id);

-- Deposit totals: Use a CTE to total the Deposit amounts per account, then join to accounts. Display: account_id, account_type, total_deposits



with total_deposit_per_account as 
   (select account_id,sum(amount)as total_deposits 
    from transactions 
    where transaction_type= 'deposit'
    group by account_id)



select a.account_id, a.account_type,t.total_deposits
from accounts a
join total_deposit_per_account t
   on a.account_id =t.account_id;

