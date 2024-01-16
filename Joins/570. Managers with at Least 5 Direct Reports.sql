/* Write your T-SQL query statement below */
select M.name AS name 
FROM Employee E
INNER JOIN Employee M
ON E.managerId = M.id 
GROUP BY M.name , M.id
HAVING COUNT(E.id) >= 5;