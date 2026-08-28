-- UNIONS --
-- the below case of union will show bad data as it combines everything --
-- with bad data, you can not extrapolate anything --
select employee_id, first_name
from parks_and_recreation.employee_demographics
union
select occupation, salary
from parks_and_recreation.employee_salary;

-- so we use union with the same data --
-- there are two type of union with the same data --
-- union distinct or union which returns unique values from both data --
select first_name, last_name
from parks_and_recreation.employee_demographics
union
select first_name, last_name
from parks_and_recreation.employee_salary;

-- union all which returns all the data duplicating data from both tables --
select first_name, last_name
from parks_and_recreation.employee_demographics
union all
select first_name, last_name
from parks_and_recreation.employee_salary;

-- use case of a union --
-- lets say we are trying to find highly paid employees in this company who are older than 40 --
select first_name, last_name, 'Old Man' as label
from parks_and_recreation.employee_demographics
where age > 40 and gender = 'Male'
union
select first_name, last_name, 'Old Lady' as label
from parks_and_recreation.employee_demographics
where age > 40 and gender = 'Female'
union
select first_name, last_name, 'Highly Paid Employee' as label
from parks_and_recreation.employee_salary
where salary > 70000
order by first_name, last_name;