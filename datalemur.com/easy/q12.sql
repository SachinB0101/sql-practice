-- https://datalemur.com/questions/click-through-rate

SELECT 
  t.app_id,
  ROUND((100.0*t.click_count)/(t.impression_count),2) AS ctr 
FROM (
  SELECT
    app_id,
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) AS impression_count,
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) AS click_count
  FROM events
  WHERE EXTRACT(YEAR FROM timestamp) = 2022
  GROUP BY app_id
) t
