/*
Show patient_id, diagnosis from admissions. Find patients 
admitted multiple times for the same diagnosis.
*/

select 
	patient_id,
    diagnosis
from
	admissions
group by patient_id, diagnosis
having count(diagnosis) > 1

-- thought process
-- by grouping by both patient_id and diagnosis, we can get how many times a
-- patient got diiferent diagnosed and then counting the ones which are
-- more than one gives the answere. 