/* Write your T-SQL query statement below */
-- Create a Common Table Expression (CTE) to calculate the rolling sum and row number
WITH AmountDate AS (
    SELECT
        visited_on,
        SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS ind
    FROM (
        SELECT visited_on, SUM(amount) AS amount
        FROM customer
        GROUP BY visited_on
    ) t
)

-- Select results and calculate average_amount, filtering by row number
SELECT
    visited_on,
    amount,
    ROUND(amount * 1.00 / 7, 2) AS average_amount
FROM
    AmountDate
WHERE
    ind >= 7;
