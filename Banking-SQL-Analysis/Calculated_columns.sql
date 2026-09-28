-- For every loan, calculate the interest amount using: loan_amount × interest_rate / 100 Display:loan_id,loan_amount,interest_rate,calculated interest_amount

select loan_id,loan_amount,interest_rate,
      loan_amount*(interest_rate/100) as caculated_interest_amount
from loans;


-- Calculate the estimated total amount payable for each loan: loan_amount + interest_amount Display:loan_id,loan_amount,interest_rate,interest_amount,total_repayment

select loan_id, loan_amount, interest_rate,
       loan_amount*(interest_rate/100) as interest_amount,
       loan_amount + (loan_amount*(interest_rate/100)) as total_repayment
from loans;




-- Using the transactions table, calculate what the balance would be if the transaction amount were added to the account balance.You'll need:accounts+transactions Display:account_id,current balance,transaction type,transaction amount,calculated balance

select a.account_id, a.balance, t.transaction_type, t.amount,t.amount+a.balance as calculated_balance

from accounts a
Left join transactions t 
     using(account_id);



-- Using accounts and loans, calculate:loan_amount / balance Display:,customer ID,account balance,loan amount,loan_to_balance_ratio

select a.customer_id, a.balance,l.loan_amount,l.loan_amount/a.balance as loan_to_balance_ratio
from accounts a
 left join loans l
  using (customer_id);
  
 -- Calculate:balance - loan_amount Display:customer name,account balance,loan amount,remaining_balance
  
  
  select c.customer_name,a.balance,l.loan_amount,balance-loan_amount as remaining_balance
 from customers c
   left join accounts a
     using(customer_id)
   left join loans l
     using(customer_id);
     
     
 --  Calculate a 10% transaction fee and the amount after the fee.Display:transaction ID,transaction type,amount,transaction_fee,amount_after_fee Formula:transaction_fee = amount × 10 / 100   
     
     
     
  select transaction_id, transaction_type,amount, amount*(10/100) as transaction_fee,amount-(amount*(10/100))as amount_after_fee
  from transactions;
  
  
