-- https://datalemur.com/questions/odd-even-measurements

WITH measurement_day_table AS (
  SELECT
    DATE(measurement_time) AS measurement_day,
    measurement_value,
    ROW_NUMBER() OVER(
      PARTITION BY DATE(measurement_time)
      ORDER BY measurement_time
    ) AS row_num
  FROM measurements
)
SELECT
  measurement_day,
  SUM(CASE WHEN row_num%2 != 0 THEN measurement_value END) AS odd_sum,
  SUM(CASE WHEN row_num%2 = 0 THEN measurement_value END) AS even_sum
FROM measurement_day_table
GROUP BY measurement_day
 
-- SELECT
--   DATE(measurement_time) AS measurement_day,
--   measurement_value,
--   ROW_NUMBER() OVER(
--     PARTITION BY DATE(measurement_time)
--     ORDER BY measurement_time
--   ) AS row_num
-- FROM measurements
  

-- SELECT * FROM measurements 
-- WHERE DATE(measurement_time) = '07/11/2022 00:00:00' 
-- ORDER BY DATE(measurement_time)