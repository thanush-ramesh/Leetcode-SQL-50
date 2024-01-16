/* Write your T-SQL query statement below */
SELECT
    r.contest_id,
    ROUND(100.0 * COUNT(DISTINCT r.user_id) / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register r
JOIN Users u
    ON r.user_id = u.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id ASC;