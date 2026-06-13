-- https://datalemur.com/questions/user-retention

WITH active_july_users AS (
  SELECT DISTINCT user_id
  FROM user_actions
  WHERE EXTRACT(MONTH FROM event_date) = 6
)
SELECT
  7 AS month_,
  COUNT(t.user_id)
FROM (
  SELECT 
    user_actions.user_id
  FROM user_actions
  JOIN active_july_users
    ON user_actions.user_id = active_july_users.user_id
  WHERE EXTRACT(MONTH FROM user_actions.event_date) = 7
  GROUP BY user_actions.user_id
) t