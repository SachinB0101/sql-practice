-- https://datalemur.com/questions/sql-highest-grossing

SELECT 
  tt.category,
  tt.product,
  tt.total_spend
FROM (
  SELECT 
    t.category,
    t.product,
    t.total_spend,
    ROW_NUMBER() OVER (
      PARTITION BY t.category
      ORDER BY t.total_spend DESC
    )
  FROM (
    SELECT DISTINCT
      category,
      product,
      SUM(spend) OVER (
        PARTITION BY category, product
      ) AS total_spend
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    ORDER BY category, total_spend DESC
  ) t
) tt
WHERE tt.row_number <= 2

-- better solution
/*SELECT 
  category,
  product,
  total_spend
FROM (
  SELECT 
    category,
    product,
    SUM(spend) AS total_spend,
    ROW_NUMBER() OVER (
      PARTITION BY category
      ORDER BY SUM(spend) DESC
    ) AS row_num
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product
) t
WHERE row_num <= 2
ORDER BY category, total_spend DESC
*/
