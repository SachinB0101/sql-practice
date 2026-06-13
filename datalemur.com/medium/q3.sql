-- https://datalemur.com/questions/time-spent-snaps

WITH time_activity_table as (
  SELECT
    user_id,
    activity_type,
    SUM(time_spent) as time_spend_per_activity
  FROM activities
  WHERE activity_type IN ('open', 'send')
  GROUP BY user_id, activity_type 
  ORDER BY user_id, activity_type
)
SELECT 
  a.age_bucket,
  MAX(CASE WHEN t.activity_type = 'open' THEN ROUND(t.time_spend_per_activity*100.0/t.total_activity_time,2) END) AS open_perc,
  MAX(CASE WHEN t.activity_type = 'send' THEN ROUND(t.time_spend_per_activity*100.0/t.total_activity_time,2) END) AS send_perc
FROM (
  SELECT
    *,
    SUM(	time_spend_per_activity) OVER (PARTITION BY user_id) as total_activity_time
  FROM time_activity_table 
) t
JOIN age_breakdown a  
  ON t.user_id = a.user_id
GROUP BY a.age_bucket

