/*
Show first_name, last_name, and the total number of admissions 
attended for each doctor.


Every admission has been attended by a doctor.
*/

select 
	d.first_name,
    d.last_name,
    ad.admissions_total
from doctors as d
join (
  select
      attending_doctor_id,
      count(*) as admissions_total
  from admissions as ad
  group by attending_doctor_id
  ) as ad
  on ad.attending_doctor_id = d.doctor_id
      
      
