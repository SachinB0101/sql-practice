-- https://datalemur.com/questions/sql-well-paid-employees

SELECT
  e1.employee_id,
  e1.name AS employee_name
FROM employee e1
WHERE e1.salary > (
  SELECT e2.salary 
  FROM employee e2 
  WHERE e1.manager_id = e2.employee_id
)