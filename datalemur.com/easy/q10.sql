-- https://datalemur.com/questions/sql-avg-review-ratings

SELECT
  EXTRACT(MONTH FROM submit_date) AS mth,
  product_id AS product,
  ROUND(AVG(stars), 2)
FROM reviews
GROUP BY mth, product
  