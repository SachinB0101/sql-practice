-- Show the total number of admissions

select distinct
	count (patient_id)
from admissions;