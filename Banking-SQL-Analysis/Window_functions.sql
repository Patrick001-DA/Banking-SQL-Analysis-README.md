-- Using the accounts table, rank customers by their account balance from highest to lowest.Display:customer_id,account_id,balance,RANK() as balance_rank


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
-- Salary comparison within job title — for each employee, show their salary next to the salary of the previous employee (ordered by salary) with the same job_title."

select employee_name,job_title,salary, 
lag(salary) over (partition by job_title order by salary)as previous_salary
from employees;



-- For each loan, show the loan_amount of the next loan (ordered by loan_amount) with the same loan_status. Display: loan_id, loan_status, loan_amount, next_loan_amount


select loan_id,loan_status,loan_amount,lead(loan_amount) over (partition by loan_status order by loan_amount)as next_loan_amount
from loans;


-- Question ## .For each customer's account, ordered by balance within their branch, show the previous account's balance, using 0 as the default when there isn't one. Display: branch_id, customer_name, balance, previous_balance



select c.branch_id, c.customer_name,a.balance,
 lag(a.balance,1,0) over (partition by c.branch_id order by a.balance desc)as previous_balance


from customers c
 left join accounts a
   using(customer_id)
 where a.account_id is not null;



-- Using Question ##, calculate the gap between an employee's salary and the previous one in their job_title. Display: employee_name, job_title, salary, previous_salary, salary_gap (salary minus previous_salary)
with salary_comparison as (select employee_name,job_title,salary, 
lag(salary) over (partition by job_title order by salary)as previous_salary
from employees )

select employee_name,job_title,salary, previous_salary,salary-previous_salary as salary_gsp
from salary_comparison;




