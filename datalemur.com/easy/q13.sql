-- https://datalemur.com/questions/final-account-balance

WITH amount_table AS (
  SELECT
    t.account_id,
    MAX(CASE WHEN t.transaction_type = 'Withdrawal' THEN t.sum END) AS withdrawal_amount,
    MAX(CASE WHEN t.transaction_type = 'Deposit' THEN t.sum END) AS deposit_amount
  FROM (
    SELECT
      account_id,
      transaction_type,
      SUM(amount)
    FROM transactions
    GROUP BY account_id, transaction_type
  ) t
  GROUP BY t.account_id
)
SELECT
  account_id,
  deposit_amount - withdrawal_amount AS final_balance
FROM amount_table


-- Better Solution
SELECT
  t.account_id,
  t.deposit_amount - t.withdrawal_amount AS final_balance
FROM (
  SELECT
    account_id,
    SUM(CASE WHEN transaction_type = 'Withdrawal' THEN amount END) AS withdrawal_amount,
    SUM(CASE WHEN transaction_type = 'Deposit' THEN amount END) AS deposit_amount
  FROM transactions
  GROUP BY account_id
) t
