-- Show the provinces that has more patients identified 
-- as 'M' than 'F'. Must only show full province_name 

SELECT province_name
FROM (
    SELECT
        pr.province_name,
        SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) as male,
        SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) as female
    FROM patients as p
    JOIN province_names AS pr
        ON p.province_id = pr.province_id
    GROUP BY pr.province_name
) as gender_counts
WHERE male > female
	