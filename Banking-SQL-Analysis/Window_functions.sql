- Using the accounts table, rank customers by their account balance from highest to lowest.Display:customer_id,account_id,balance,RANK() as balance_rank


select customer_id,account_id,balance,
     rank() over (order by balance desc)as balance_rank
from accounts;


-- Rank customers by account balance within each account type.Display:customer_id,account_id,account_type,balance,balance_rank

select customer_id,account_id,account_type,balance,
  rank() over (partition by account_type order by balance) as balance_rank
from accounts;

-- Rank customers by account balance within each branch.Display:customer_name,branch_name,balance,balance_rank


select c.customer_name,
       b.branch_name,
      a. balance,
   rank() over (partition by b.branch_id order by a.balance desc)  as balance_rank
  
 from branches b
 join customers c
   using (branch_id)
 join accounts a
   using (customer_id);

