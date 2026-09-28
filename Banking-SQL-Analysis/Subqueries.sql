--   High-value accounts: Find accounts with a balance above the average balance. Display: account_id, customer_id, account_type, balance
 
  select account_id,customer_id, account_type,balance
  from accounts 
  where balance>(select avg(balance)
  from accounts);



-- Large loans: Find loans larger than the average loan amount. Exclude 'No Loan' rows when calculating the average. Display: loan_id, customer_id, loan_amount, loan_status

select loan_id,customer_id,loan_amount,loan_status
from loans
where loan_amount>(select avg(loan_amount)
from loans where loan_amount!= 'No loan' );

-- Nairobi customers: Find customers whose branch is in the city of Nairobi. Display: customer_name, branch_id

select customer_name,branch_id
from customers
where branch_id in 
  (select branch_id
  from branches 
  where city ='Nairobi');
