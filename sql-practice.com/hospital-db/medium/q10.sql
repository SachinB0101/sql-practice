/*
Show first name, last name and role of every person that is either 
patient or doctor. The roles are either "Patient" or "Doctor"
*/


select
	first_name,
    last_name,
    case
    	when patient_id is not NULL then 'Patient'
        else 'Doctor'
    end as role
from 
	patients
union all
select 
    first_name,
    last_name,
    case
    	when doctor_id is not NULL then 'Doctor'
        else 'Patient'
    end as role
from
	doctors
