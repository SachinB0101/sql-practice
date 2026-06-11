/*

Show patient_id, first_name, last_name from patients 
whose does not have any records in the admissions table. 
(Their patient_id does not exist in any admissions.patient_id rows.)

*/

select
	p.patient_id,
	p.first_name,
    p.last_name
from patients p 
left join admissions a 
	on p.patient_id = a.patient_id
where a.admission_date is null