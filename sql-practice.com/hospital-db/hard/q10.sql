/*
Sort the province names in ascending order in such 
a way that the province 'Ontario' is always on top.
*/

select
	province_name
from 
	(
      	select
            province_name,
            case
                when province_name = 'Ontario' then 1
                else 2
            end as rank_province
        from
            province_names
        order by rank_province, province_name asc
    )
