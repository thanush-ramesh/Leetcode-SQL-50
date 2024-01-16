/* Write your T-SQL query statement below */

SELECT
    a.employee_id,
    a.name,
    COUNT(*) AS reports_count,
    ROUND(AVG(CAST(b.age AS DECIMAL)), 0) AS average_age
FROM Employees a
INNER JOIN Employees b 
ON a.employee_id = b.reports_to
GROUP BY a.employee_id, a.name
ORDER BY a.employee_id;
