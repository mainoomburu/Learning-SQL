use parks_and_recreation;

select*
from parks_and_recreation.employee_demographics;

select first_name, last_name
from parks_and_recreation.employee_demographics;

select first_name,
last_name,
age,
age + 10 as new_age
from parks_and_recreation.employee_demographics;

select
distinct gender
from parks_and_recreation.employee_demographics;