/* Write your T-SQL query statement below */
SELECT ROUND(sum(tiv_2016),2) AS tiv_2016
FROM Insurance 
WHERE tiv_2015 IN (
            SELECT tiv_2015 FROM Insurance
            GROUP BY tiv_2015
            HAVING COUNT(tiv_2015) > 1
)
AND
 CONCAT (lat,lon) IN
 (
     SELECT  CONCAT(lat,lon) FROM Insurance
     GROUP BY CONCAT(lat,lon)
     HAVING COUNT(CONCAT(lat,lon)) = 1
 )