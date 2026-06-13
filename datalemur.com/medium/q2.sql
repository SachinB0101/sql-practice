-- https://datalemur.com/questions/sql-second-highest-salary

WITH rank_salary_table AS (
  SELECT
    *,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as rank_salary
  FROM employee
)
SELECT salary as second_highest_salary
FROM rank_salary_table
WHERE rank_salary = 2
