/* Write your T-SQL query statement below */
SELECT 
    s.user_id,
    ROUND(COUNT(CASE c.action WHEN 'confirmed' THEN 1 END) * 1.0 / COUNT(*), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY 
    s.user_id