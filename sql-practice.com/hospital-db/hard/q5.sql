/*

Each admission costs $50 for patients without insurance, and 
$10 for  patients with insurance. All patients with an even 
patient_id have insurance.

Give each patient a 'Yes' if they have insurance, and a 'No' 
if they don't have insurance. Add up the admission_total cost 
for each has_insurance group.

*/

select
	adm.has_insurance,
    sum(adm.insurance_cost) as admission_total 
from
	(
      select
      	patient_id,
        case
            when patient_id % 2 = 0 then 'Yes'
            else 'No'
        end as has_insurance,
        case
            when patient_id % 2 = 0 then 10
            else 50
        end as insurance_cost
      from
        admissions
    ) as adm
group by adm.has_insurance
