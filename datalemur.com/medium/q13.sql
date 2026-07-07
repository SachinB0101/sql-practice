-- https://datalemur.com/questions/card-launch-success

SELECT
  t.card_name,
  t.issued_amount
FROM (
  SELECT
    *,
    RANK() OVER (
      PARTITION BY card_name
      ORDER BY issue_year, issue_month
    )
  FROM monthly_cards_issued
) t 
WHERE t.rank = 1
ORDER BY t.issued_amount DESC