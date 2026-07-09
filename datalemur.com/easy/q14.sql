-- https://datalemur.com/questions/second-day-confirmation
WITH date_table AS (
  SELECT
    t.email_id,
    MAX(CASE WHEN t.signup_action = 'Not confirmed' THEN t.action_date END) AS n_c_d,
    MAX(CASE WHEN t.signup_action = 'Confirmed' THEN t.action_date END) AS c_d 
  FROM texts t
  GROUP BY email_id
)
SELECT
  emails.user_id
FROM date_table
INNER JOIN emails ON
  date_table.email_id = emails.email_id
WHERE EXTRACT(DAY FROM c_d) - EXTRACT(DAY FROM n_c_d) = 1
  