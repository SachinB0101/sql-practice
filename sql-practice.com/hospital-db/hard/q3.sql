/*
Show patient_id, first_name, last_name, and attending doctor's specialty.
Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's 
first name is 'Lisa'

Check patients, admissions, and doctors tables for required information. 
*/

select
	p.patient_id,
    p.first_name,
    p.last_name,
    ad.specialty
from
  (
    select
        a.patient_id,
        d.specialty
    from admissions a
    join doctors d on
        a.attending_doctor_id = d.doctor_id
    where 
        d.first_name = 'Lisa' and
        a.diagnosis = 'Epilepsy'
  ) ad
join patients p on p.patient_id = ad.patient_id
	