-- LIMIT --
-- in the first instance, when we use limit, it shows the first four rows --
select*
from parks_and_recreation.employee_demographics
limit 4;

-- we can combine limit with order by from A to Z --
select *
from parks_and_recreation.employee_demographics
order by first_name
limit 3;

-- to find the 3 oldest employees --
select*
from parks_and_recreation.employee_demographics
order by age desc
limit 3;

-- to find the 4 highest paid employees --
select*
from parks_and_recreation.employee_salary
order by salary desc
limit 4;

-- we can combine where, group by, having and limit clauses --
select occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like '%a%'
group by occupation
having avg(salary) > 50000 
limit 5;

-- ALIASING --
-- this is a way of changing the name of a column using the keyword AS --
select gender, avg(age) as avg_age
from parks_and_recreation.employee_demographics
group by gender
having avg_age > 25;

select occupation, avg(salary) as avg_salary
from parks_and_recreation.employee_salary
where occupation like '%man%'
group by occupation
having avg_salary > 20000;

-- aliasing helps improve our display columns for aggregate functions --


