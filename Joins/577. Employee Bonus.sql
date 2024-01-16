/* Write your T-SQL query statement below */
SELECT name, bonus
FROM Employee E
LEFT JOIN Bonus B
ON E.empId = B.empId where B.bonus <1000 or B.bonus is null
