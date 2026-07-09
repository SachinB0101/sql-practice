-- https://datalemur.com/questions/cards-issued-difference

SELECT 
  t.card_name,
  (t.max_issued_amount - t.min_issued_amount) AS difference
FROM (
  SELECT
    card_name,
    MAX(issued_amount) AS max_issued_amount,
    MIN(issued_amount) AS min_issued_amount
  FROM monthly_cards_issued
  GROUP BY card_name
) t
ORDER BY difference DESC

