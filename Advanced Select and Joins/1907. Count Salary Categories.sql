/* Write your T-SQL query statement below */

select 'Low Salary' as category, (select count(account_id) from Accounts where income < 20000) as accounts_count from Accounts 
union
select 'Average Salary' as category, (select count(account_id) from Accounts where income between 20000 and 50000) as accounts_count from Accounts 
union
select 'High Salary' as category, (select count(account_id) from Accounts where income > 50000) as accounts_count from Accounts 