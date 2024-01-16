/* Write your T-SQL query statement below */
SELECT w.id
FROM Weather w
JOIN Weather prev
ON w.recordDate = DATEADD(day, 1, prev.recordDate)
WHERE w.temperature > prev.temperature;