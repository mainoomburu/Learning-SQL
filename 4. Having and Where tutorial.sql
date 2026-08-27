-- HAVING vs WHERE --
-- when you run the below, it brings an error --
-- This is because the aggregate function only happens after the group by function--
-- this means, the aggregate function column is not created in this instance and thus cannot be filtered by the where clause --
select gender, avg(age)
from parks_and_recreation.employee_demographics
where avg(age) > 35
group by gender;

-- to solve this, we use the having function after the group by --
select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender
having avg(age) > 38;

-- we first select the database and table we would like to work on to view which columns --
select *
from parks_and_recreation.employee_salary;

select occupation, avg(salary)
from parks_and_recreation.employee_salary
group by occupation;

select occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like '%manager%'
group by occupation;

-- to use both where clause and having clause, the order in which you place them is key --
-- we use the where clause to filter at a row level --
-- we use the having clause to filter out aggregated functions --
select occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 60000;
