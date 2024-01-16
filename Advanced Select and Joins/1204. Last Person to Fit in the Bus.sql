/* Write your T-SQL query statement below */
SELECT TOP 1 person_name FROM (
    SELECT *, SUM(weight) OVER (ORDER BY Turn) AS total_sum FROM queue
) t 
WHERE total_sum <= 1000
ORDER BY turn DESC;