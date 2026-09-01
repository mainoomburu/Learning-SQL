-- WINDOW FUNCTIONS --
-- row number -- rank -- dense rank --

select concat(A.first_name, ' ', A.last_name) as full_name, gender
occupation, salary,
row_number() over(partition by gender order by salary desc) as row_namba,
rank() over(partition by gender order by salary desc) as rank_namba,
dense_rank() over(partition by gender order by salary desc) as dense_rank_namba
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;

select concat(A.first_name, ' ', A.last_name) as full_name,
gender, occupation, salary,
case
	when salary < 30000 then 'Underpaid'
	when salary between 30000 and 50000 then 'Well Paid'
    when salary > 50000 then 'Highly Paid'
end as salary_definition,
row_number() over(partition by gender order by salary desc) as row_namba,
case
	when age <= 32 and gender = 'Male' then 'Young Man'
    when age > 32 and gender = 'Male' then 'Old Man'
	when age <= 32 and gender = 'Female' then 'Young Woman'
    when age > 32 and gender = 'Female' then 'Old Lady'
end as definition_of_employee, age
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
join parks_and_recreation.parks_departments as C
	on A.employee_id = B.employee_id
    and B.dept_id = C.department_id;