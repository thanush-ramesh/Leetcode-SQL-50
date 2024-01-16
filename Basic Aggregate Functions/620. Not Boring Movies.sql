/* Write your T-SQL query statement below */
select id ,movie,description ,rating
from Cinema
WHERE id%2 <> 0
AND description NOT LIKE '%boring%'
ORDER BY rating desc