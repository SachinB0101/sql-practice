/*
For each day display the total amount of admissions 
on that day. Display the amount changed from the previous date.
*/

select
	a.admission_date,
    a.admission_day,
    a.admission_day - (lag(a.admission_day) over (order by a.admission_date)) as admission_count_change
from
  (select
      admission_date,
      count(*) as admission_day
  from admissions
  group by admission_date) as a