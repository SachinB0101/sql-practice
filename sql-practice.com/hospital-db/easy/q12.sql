/*
Show all the columns from admissions where the patient was admitted and 
discharged on the same day.
*/

select
	*
from
	admissions
where 
	year(admission_date) = year(discharge_date) and
    month(admission_date) = month(discharge_date) and
    day(admission_date) = day(discharge_date)