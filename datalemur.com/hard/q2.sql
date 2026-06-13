-- https://datalemur.com/questions/yoy-growth-rate
SELECT 
  *,
  ROUND((((t.curr_year_spend - t.prev_year_spend)/t.prev_year_spend)*100.0), 2) AS yoy_rate
FROM (
  SELECT 
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    spend AS curr_year_spend,
    LAG(spend) OVER (
      PARTITION BY product_id
    ) AS prev_year_spend
  FROM user_transactions
) t