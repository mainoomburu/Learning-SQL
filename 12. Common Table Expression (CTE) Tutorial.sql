-- CTE --
-- allow you to define a subquery block that can be referenced in the main query immediately after creating it --

with CTE_example as
(
select A.employee_id, concat(A.first_name, ' ', A.last_name) as full_name ,A.gender, salary, age,
sum(salary) over(partition by gender order by A.employee_id) as rolling_total
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id
group by employee_id, gender, salary
)
select*
from CTE_example
where gender = 'Male';

with Example as 
(
select A.first_name, A.last_name, age, gender, salary,
row_number() over(partition by gender order by salary desc)
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id
)
select*
from Example
where salary > 50000
and age > 40;

-- we can also create multiple CTEs inside one --
with Example1 as 
(
select employee_id, concat(first_name, ' ', last_name) as full_name, birth_date
from parks_and_recreation.employee_demographics
where birth_date > '1982-01-01'
),
Example2 as (
select employee_id, concat(first_name, ' ', last_name) as full_name, salary
from parks_and_recreation.employee_salary
where salary > 50000
)
select*
from Example1
join Example2
	on Example1.employee_id = Example2.employee_id;