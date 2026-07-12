-- https://datalemur.com/questions/frequent-callers

SELECT 
  COUNT(*) AS policy_holder_count
FROM (
  SELECT
    policy_holder_id
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(case_id) >= 3
) t