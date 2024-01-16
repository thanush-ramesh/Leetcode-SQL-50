/* Write your T-SQL query statement below */
SELECT query_name,
       ROUND(SUM(1.0*rating / position)/COUNT(*), 2) AS quality,
       ROUND(100.0 * SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*), 2) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name;
