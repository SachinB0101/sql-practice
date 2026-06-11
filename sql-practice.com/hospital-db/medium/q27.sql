/*

Display every patient that has at least one admission 
and show their most recent admission along with the 
patient and doctor's full name.

*/

select
	concat(p.first_name, " ", p.last_name) as patient_name,
    a.admission_date,
    concat(d.first_name, " ", d.last_name) as doctor_name
from patients p
join admissions a on
	p.patient_id = a.patient_id
join doctors d on
	a.attending_doctor_id = d.doctor_id
group by p.patient_id
having a.admission_date = max(a.admission_date)