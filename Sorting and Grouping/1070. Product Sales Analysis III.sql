WITH FirstYearSales AS (
    SELECT s.product_id,MIN(s.year) AS first_year
    FROM Sales s
    GROUP BY s.product_id
)

SELECT s.product_id, fys.first_year, s.quantity, s.price
FROM Sales s
JOIN FirstYearSales fys 
ON s.product_id = fys.product_id 
AND s.year = fys.first_year;