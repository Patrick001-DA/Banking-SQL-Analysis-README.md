
-- display customers without loans

SELECT
    c.customer_name
FROM customers c
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
WHERE l.loan_id IS NULL;


-- Display the customer name,branch -- name,city, account type, and account balance ---- for every customer.



select c.customer_name,
b.branch_name,
b.city,
a.account_type,
a.balance
from branches b
left join customers c
  using (branch_id)
left join accounts a
    using (customer_id);

   
--  Customers with active loans
select customer_name, loan_amount,loan_status
from customers
 left join loans
    using (customer_id)
 where loan_status= 'active';
 
 -- High-value customers.Display customers whose:account balance > 100,000
 
 
 select*
 from customers c
 left join accounts a
     using ( customer_id)
  where a.balance>100000;
 
 
--  Customer financial position.Display:,Customer name,Account balance,Loan amount.Difference between balance and loan amount
 
 
 select customer_name,balance,loan_amount,balance-loan_amount as financial_difference
 from customers c
 inner join accounts a
     using (customer_id)
 inner join loans l
    using (customer_id);
    
 -- Total loan by branch.Display:Branch name,Total loan amount 
    
 select b.branch_name,sum(l.loan_amount) as total_loan_amount
 from customers c
 inner join branches b
    using(branch_id)
  inner join loans l
     using(customer_id)
  group by b.branch_name;
   
   
  -- Total deposits by branch.Display:Branch name,Number of customers,Total account balance
   
   
  select b.branch_name,count(*),sum(a.balance) 
  from customers c
  inner join branches b
       using(branch_id)
  inner join accounts a
       using(customer_id)
   group by b.branch_name;
   
   
   
 --  Branches with total balances above 200,000.Display:Branch name,Total account balance
   
   select branch_name,sum(a.balance)as total_account_balance
   from customers c
   inner join branches b
     using(branch_id)
  inner join accounts a
     using(customer_id)
  group by branch_name
  having total_account_balance>200000;
   
   
    
  --  Branches with multiple active loans.Display:Branch name,Number of active loans,Total active loan amount 
  
  select b.branch_name,l.loan_status,count(l.loan_amount),sum(l.loan_amount)as total_loan_amount
   from branches b
   inner join customers c
     using(branch_id)
   inner join loans l
       using (customer_id)
    group by b.branch_name,l.loan_status
    having l.loan_status='active';
   
  
