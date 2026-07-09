-- https://datalemur.com/questions/uncategorized-calls-percentage

SELECT
  ROUND((COUNT(*)*100.0) / (SELECT COUNT(*) FROM callers), 1) AS uncategorised_call_pct
FROM callers
WHERE call_category IS NULL OR call_category = 'n/a'