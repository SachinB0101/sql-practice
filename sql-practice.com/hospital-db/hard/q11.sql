/*

We need a breakdown for the total amount of 
admissions each doctor has started each year. 
Show the doctor_id, doctor_full_name, specialty, 
year, total_admissions for that year.

*/

select
	d.doctor_id,
    d.first_name || " " || d.last_name as doctor_name,
    d.specialty,
    year(a.admission_date) as select_year,
    count(admission_date) as total_admissions
from admissions a 
join doctors d on
	a.attending_doctor_id = d.doctor_id
group by doctor_id, select_year