/*

Display a single row with max_visits, min_visits, 
average_visits where the maximum, minimum and average 
number of admissions per day is calculated. Average is 
rounded to 2 decimal places.

*/

select
	max(total_admissions) as max_visits,
    min(total_admissions) as min_visits,
    Round(avg(total_admissions), 2) as average_visits
from
	(
      select
          admission_date,
          count(*) as total_admissions
      from
          admissions
      group by
          admission_date
    )
