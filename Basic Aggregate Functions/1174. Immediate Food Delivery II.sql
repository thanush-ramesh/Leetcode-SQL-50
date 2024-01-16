/* Write your T-SQL query statement below */
WITH first_order AS 
(
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num
    FROM Delivery 
) 
SELECT 
   ROUND( 100.0 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(customer_id) ,2)AS immediate_percentage
FROM first_order
WHERE row_num = 1;