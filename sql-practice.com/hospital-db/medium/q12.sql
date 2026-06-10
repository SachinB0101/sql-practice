/*
Show all patient's first_name, last_name, and birth_date who were 
born in the 1970s decade. Sort the list starting from the earliest 
birth_date.
*/

select 
	first_name,
    last_name,
    birth_date
from patients
where (year(birth_date) - 1970) in (0,1,2,3,4,5,6,7,8,9)
order by 
	year(birth_date),
	month(birth_date),
    day(birth_date)

--- alternative 1
SELECT
  first_name,
  last_name,
  birth_date
FROM patients
WHERE
  YEAR(birth_date) BETWEEN 1970 AND 1979
ORDER BY birth_date ASC;