-- https://datalemur.com/questions/sql-bloomberg-stock-min-max-1

WITH cte AS (
  SELECT
    ticker,
    date,
    open,
    RANK() OVER(
      PARTITION BY ticker
      ORDER BY open
    ) AS rank_stock_asec,
    RANK() OVER(
      PARTITION BY ticker
      ORDER BY open DESC
    ) AS rank_stock_desc
  FROM stock_prices
)
SELECT
  ticker,
  MIN(CASE WHEN rank_stock_desc = 1 THEN TO_CHAR(date, 'Mon-YYYY') END) AS highest_mth,
  MIN(CASE WHEN rank_stock_desc = 1 THEN open END) AS highest_open,
  MAX(CASE WHEN rank_stock_asec = 1 THEN TO_CHAR(date, 'Mon-YYYY') END) AS lowest_mth,
  MAX(CASE WHEN rank_stock_asec = 1 THEN open END) AS lowest_open
FROM cte
GROUP BY ticker