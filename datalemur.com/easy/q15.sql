-- https://datalemur.com/questions/sql-ibm-db2-product-analytics

SELECT
  t.unique_queries,
  COUNT(t.employee_id) AS employee_count
FROM (
  SELECT
    e.employee_id,
    COUNT(DISTINCT q.query_id) AS unique_queries
  FROM employees e
  LEFT JOIN queries q
    ON e.employee_id = q.employee_id
    AND q.query_starttime >= '2023-07-01'
    AND q.query_starttime < '2023-10-01'
  GROUP BY e.employee_id
) t
GROUP BY t.unique_queries
ORDER BY t.unique_queries;
