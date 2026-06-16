-- https://datalemur.com/questions/duplicate-job-listings

SELECT
  COUNT(t.company_id) AS duplicate_companies
FROM (
  SELECT 
    company_id, 
    title,
    description,
    COUNT(*) AS distinct_count
  FROM job_listings
  GROUP BY company_id,  title, description
  HAVING COUNT(*) >= 2
  ORDER BY company_id, title, description
) t

-- Note for me 
-- 'GROUP BY' groups those rows where all the column on which 
-- the 'group by' is being applied share same entry