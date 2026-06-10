/*

Show the percent of patients that have 'M' as 
their gender. Round the answer to the nearest 
hundreth number and in percent form.

*/

select 
	concat(round((sum(gender = 'M')*100.0 / count(*)), 2), '%') as percent_of_male_patients
from patients