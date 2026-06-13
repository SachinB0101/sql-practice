-- https://datalemur.com/questions/sql-top-three-salaries

WITH top_salaries AS (
  SELECT
    department_name,
    name,
    salary,
    DENSE_RANK() OVER (
      PARTITION BY d.department_id
      ORDER BY salary DESC
   ) AS ranking
  FROM employee e
  JOIN department d ON e.department_id = d.department_id
) 
SELECT 
  department_name,
  name,
  salary
FROM top_salaries
WHERE ranking <= 3
ORDER BY department_name, salary DESC, name