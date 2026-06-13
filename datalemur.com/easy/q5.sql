-- Q. https://datalemur.com/questions/laptop-mobile-viewership

SELECT 
  (
    SELECT 
      COUNT(*) as laptop_views
    FROM viewership
    WHERE device_type = 'laptop'
    GROUP BY device_type
  ),
  COUNT(*) as mobile_views
FROM viewership
WHERE device_type = 'phone' OR device_type = 'tablet'

-- Better solution
SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 
FROM viewership;