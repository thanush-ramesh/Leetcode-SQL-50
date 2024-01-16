/* Write your T-SQL query statement below */
SELECT project_id  , ROUND(AVG(CAST(e.experience_years AS DECIMAL(10,2))),2) AS average_years
FROM Project p
INNER JOIN Employee e
ON e.employee_id = p.employee_id 
GROUP BY project_id order by project_id