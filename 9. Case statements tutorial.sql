-- CASE statements --
-- it allows us to add logic to our select statement --
select first_name, last_name, age,
case
	when age <= 30 then 'Young'
end as young_employee
from parks_and_recreation.employee_demographics;

-- we can add multiple when statements --
select first_name, last_name, age,
case
	when age <= 30 then 'Young'
    when age between 31 and 45 then 'Old'
    when age > 45 then 'Soon to retire'
end as age_profile
from parks_and_recreation.employee_demographics;

-- lets say we want to calculate the pay increase for a company--
-- < 50000 = 5% --
-- >50000 = 7% --
-- Finance = 10% --
select first_name, last_name, occupation, salary,
case
	when salary < 50000 then salary + (salary * 0.05)
    when salary > 50000 then salary + (salary * 0.08)
end as pay_rise,
case 
	when dept_id = 6 then salary * 0.10
end as bonus
from parks_and_recreation.employee_salary;

-- attempting to use union and case statements --
-- we are trying to find the age group of each employee and their salary range --
select first_name, last_name,
case
	when age >= 40 then 'Older'
    when age < 40 then 'Younger'
end as job
from parks_and_recreation.employee_demographics
union
select first_name, last_name,
case
	when salary >= 70000 then 'Highly Paid'
    when salary < 70000 then 'Well Paid'
end
from parks_and_recreation.employee_salary
order by first_name, last_name;

-- how about using join with use case --
-- Joining 2 tables --
-- we are trying to find the pay gap between employees --
select A.first_name, A.last_name, A.gender, salary,
case
	when salary >= 70000 then 'Highly Paid'
    when salary between 30000 and 70000 then 'Well Paid'
    when salary < 30000 then 'Underpaid'
end as pay
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id
where gender = 'male'
order by salary desc
limit 5;

-- Joining 3 tables --
-- finding the highest paid employee
select concat(A.first_name, ' ', A.last_name) as full_name, B.occupation, department_name, salary,
case
	when salary > 70000 then 'Highly Paid'
    when salary between 50000 and 70000 then 'Well Paid'
    when salary < 50000 then 'Underpaid'
end as pay
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
join parks_and_recreation.parks_departments as C
	on A.employee_id = B.employee_id
    and B.dept_id = C.department_id
where department_id = 1
order by salary desc;