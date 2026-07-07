-- https://datalemur.com/questions/histogram-users-purchases
SELECT
  t.transaction_date,
  t.user_id,
  COUNT(t.product_id) AS purchase_count
FROM (
  SELECT
  *,
  RANK() OVER(
    PARTITION BY user_id
    ORDER BY transaction_date DESC
  ) AS rank_date
  FROM user_transactions
) t
WHERE t.rank_date = 1
GROUP BY transaction_date, user_id
ORDER BY transaction_date
  