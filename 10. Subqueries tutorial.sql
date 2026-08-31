-- SUBQUERIES --
-- subquery within a where --
 select*
 from parks_and_recreation.employee_demographics 
 where employee_id in 
				(select employee_id
                from parks_and_recreation.employee_salary
                where dept_id = 1);
                
-- subquery within a select statement --
-- this will help us compare the average salary to the salary of an individual --
select first_name, salary,
	(select avg(salary)
	from parks_and_recreation.employee_salary)
from parks_and_recreation.employee_salary;

select first_name, age,
	(select avg(age)
    from parks_and_recreation.employee_demographics
    )
from parks_and_recreation.employee_demographics;

-- subquery within from --
select gender, 
avg(age) as avg_age, 
max(age) as max_age, 
min(age) as min_age, 
count(age) as count_age
from parks_and_recreation.employee_demographics
group by gender;

select gender, avg(max_age)
from(
	select gender, 
    avg(age) as avg_age, 
    max(age) as max_age, 
    min(age) as min_age, 
    count(age) as count_age
	from parks_and_recreation.employee_demographics
	group by gender) as aggregated_age
group by gender;

select dept_id, 
avg(salary) as avg_sal, 
max(salary) as max_sal, 
min(salary) as min_sal, 
count(salary) as count_sal
from parks_and_recreation.employee_salary
group by dept_id;

select dept_id, avg(min_sal)
from(
	select dept_id, 
    avg(salary) as avg_sal, 
    max(salary) as max_sal, 
    min(salary) as min_sal, 
    count(salary) as count_sal
	from parks_and_recreation.employee_salary
	group by dept_id) as aggregate_salary
group by dept_id;