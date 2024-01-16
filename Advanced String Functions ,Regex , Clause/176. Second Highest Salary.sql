/* Write your T-SQL query statement below */
SELECT COALESCE(
    (SELECT DISTINCT MAX(salary) AS SecondHighestSalary
     FROM Employee
     WHERE salary < (SELECT MAX(salary) FROM Employee)),
    NULL) AS SecondHighestSalary;