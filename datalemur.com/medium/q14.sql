-- https://datalemur.com/questions/international-call-percentage

WITH caller_table AS (
  SELECT
    pi.country_id AS caller_country,
    pc.receiver_id
  FROM phone_calls pc
  INNER JOIN phone_info pi ON
    pc.caller_id = pi.caller_id
),
receiver_table AS (
  SELECT 
    ct.caller_country,
    pi.country_id AS receiver_country
  FROM caller_table ct
  INNER JOIN phone_info pi ON
    ct.receiver_id = pi.caller_id
)
SELECT 
  ROUND((COUNT(*)*100.0) / (SELECT COUNT(*) FROM phone_calls), 1) AS international_calls_pct
FROM receiver_table
WHERE caller_country != receiver_country 
