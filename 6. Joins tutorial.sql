-- JOINS --
-- INNER JOIN --
-- this returns rows that are same in two tables --

select *
from parks_and_recreation.employee_demographics;

select*
from parks_and_recreation.employee_salary;

-- in this type of inner join, it only shows similar values in the demogaphics table and the salary table --
-- if table 1 has a row that is not in table 2, the row is left out --
-- inner join and join both return the same result --
select*
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;

select*
from parks_and_recreation.employee_demographics as A
inner join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;
    
-- when selecting actual columns, you have to specificy which table you are calling your data from --
select A.employee_id, age, occupation, salary
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;

-- using aggregate functions plus inner joins --    
select gender, A.employee_id, A.first_name, A.last_name, occupation, avg(salary) as avg_salary
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id
where A.first_name like '%a%'
group by gender, A.employee_id, A.first_name, A.last_name, occupation
having avg_salary > 50000;

select A.employee_id, A.first_name, A.last_name, occupation, gender, avg(salary) as avg_salary
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id
where A.first_name like '%a%'
group by A.employee_id, A.first_name, A.last_name, occupation, gender 
having avg_salary > 50000;

-- to check the 5 highest paid employees --
select A.employee_id, A.first_name, A.last_name, occupation, gender, salary
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id
order by salary desc
limit 5;

-- OUTER JOIN --
-- in this left join, we take everything from our left table (the employee demographics) --
-- and return everything that matches from the right table (the employee salary) --
select *
from parks_and_recreation.employee_demographics as A
left join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;

-- in the right join, we take everything from our right table (the employee salary) --
-- but if there is not a match to our left table, it populates that row with nulls --
select*
from parks_and_recreation.employee_demographics as A
right join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;

-- SELF JOIN --
select*
from parks_and_recreation.employee_salary as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;

-- lets say i want to assign a secret office gift party --
select A.employee_id as giver, 
A.first_name as first_name_giver,
A.last_name as last_name_giver,
B.employee_id as receiver,
B.first_name as receiver_first_name,
B.last_name as receiver_last_name
from parks_and_recreation.employee_salary as A
join parks_and_recreation.employee_salary as B
	on A.employee_id + 1 = B.employee_id;
    
-- Joining multiple tables --
-- the parks department table is a reference table used to reference the departments --
-- employee demographics table and employee salary table can change depending with the employment or termination of an employee --
select*
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
join parks_and_recreation.parks_departments as C
	on A.employee_id = B.employee_id
    and B.dept_id = C.department_id;

select A.employee_id, A.first_name, A.last_name, occupation, department_name, salary
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
join parks_and_recreation.parks_departments as C
	on A.employee_id = B.employee_id
    and B.dept_id = C.department_id
order by salary desc
limit 4;

select A.employee_id, A.first_name, A.last_name, gender, occupation, department_name, avg(salary) as avg_salary
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
join parks_and_recreation.parks_departments as C
	on A.employee_id = B.employee_id
    and B.dept_id = C.department_id
where A.last_name like '%e%'
group by A.employee_id, A.first_name, A.last_name, gender, occupation, department_name
having avg_salary > 20000;

select A.employee_id, gender, department_name, occupation, avg(salary) as avg_salary
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
join parks_and_recreation.parks_departments as C
	on A.employee_id = B.employee_id
    and B.dept_id = C.department_id
group by A.employee_id, gender, department_name, occupation
having avg_salary > 40000;
