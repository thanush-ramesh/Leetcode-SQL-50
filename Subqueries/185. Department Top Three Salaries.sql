/* Write your T-SQL query statement below */
SELECT d.name AS Department, e.name AS Employee, Salary
FROM Employee e
INNER JOIN Department d ON d.id = e.departmentid
WHERE (
    SELECT COUNT(DISTINCT salary)
    FROM employee e1
    WHERE e1.salary >= e.salary
    AND e1.departmentid = e.departmentid
) < 4;