-- Display the total amount of patients for each province. Order by descending.

select
	pr.province_name,
    count(*) as patient_count
from patients as p
join province_names as pr
	on pr.province_id = p.province_id
group by pr.province_name
order by patient_count desc