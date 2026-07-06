-- https://datalemur.com/questions/best-selling-products

WITH rank_based_table AS 
( 
  SELECT
    *,
    RANK() OVER(
      PARTITION BY t.category_name
      ORDER BY t.sales_quantity DESC, rating DESC
    )
  FROM (
    SELECT *
    FROM products
    LEFT JOIN product_sales ON
      products.product_id = product_sales.product_id
  ) t
)
SELECT category_name, product_name
FROM rank_based_table
WHERE rank_based_table.rank = 1
  
