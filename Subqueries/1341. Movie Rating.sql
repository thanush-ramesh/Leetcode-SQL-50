/* Write your T-SQL query statement below */

SELECT results
FROM (
    SELECT TOP 1 name AS results, COUNT(m.user_id) AS cnt
    FROM Users u
    INNER JOIN MovieRating m ON u.user_id = m.user_id
    GROUP BY name
    ORDER BY cnt DESC, name
) [user]
UNION ALL
SELECT results
FROM (
    SELECT TOP 1 title AS results,
           AVG(CAST(rating AS DECIMAL(5, 1))) AS avg
    FROM Movies m
    JOIN MovieRating m2 ON m.movie_id = m2.movie_id
    WHERE YEAR(m2.created_at) = 2020 AND MONTH(m2.created_at) = 2
    GROUP BY title
    ORDER BY avg DESC, title
) movie;
