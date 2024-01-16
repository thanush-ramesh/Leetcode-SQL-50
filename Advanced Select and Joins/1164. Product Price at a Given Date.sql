/* Write your T-SQL query statement below */
select distinct product_id,
coalesce((select top 1 new_price from products p where products.product_id = p.product_id
and p.change_date <= '2019-08-16' order by p.change_date desc
), 10) price
from products
