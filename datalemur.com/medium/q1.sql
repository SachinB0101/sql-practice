-- https://datalemur.com/questions/sql-third-transaction

SELECT t.user_id, t.spend, t.transaction_date
FROM(
  SELECT
    *,
    RANK() OVER (
              PARTITION BY user_id
              ORDER BY transaction_date
          ) AS transaction_rank
  FROM transactions
) as t 
WHERE t.transaction_rank = 3