SELECT
  tweet_count_per_user as tweet_bucket, 
  COUNT(user_id) as users_num
FROM (
  SELECT
    user_id,
    COUNT(tweet_id) as tweet_count_per_user
  FROM tweets
  WHERE extract(year from tweet_date) = 2022
  GROUP BY user_id
) as total_tweets
GROUP BY tweet_count_per_user;


SELECT
  t.candidate_id
FROM(
  
WHERE t.Python = TRUE OR t.Tableau = TRUE or t.PostgreSQL = TRUE