-- https://datalemur.com/questions/completed-trades

WITH user_trades AS (
  SELECT 
    user_id,
    COUNT(*) AS user_prod
  FROM trades
  WHERE status = 'Completed'
  GROUP BY user_id
)
SELECT
  city,
  SUM(user_prod) AS total_orders
FROM user_trades t
LEFT JOIN users u 
  ON t.user_id = u.user_id
GROUP BY city
ORDER BY total_orders DESC
LIMIT 3
