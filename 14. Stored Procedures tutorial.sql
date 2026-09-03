-- Stored Procedures --
-- They can be used over and over again when called --
-- the first way we can create a stored procedure is by right clicking on the stored procedure and clicking create stored procedure --
-- first we create the stored procedure --
create procedure large_salaries()
select*
from parks_and_recreation.employee_salary
where salary >= 50000;

call large_salaries();

-- we can also --
delimiter $$
create procedure large_salaries2()
begin
	select*
    from parks_and_recreation.employee_salary
    where salary > 20000;
    select*
    from parks_and_recreation.employee_demographics
    where age > 40;
end $$
delimiter ;

call large_salaries2();

delimiter $$
create procedure employee_information()
begin
	select first_name, last_name,
	case
		when age > 38 and gender = 'Male' then 'Old Man'
	end as defined
	from parks_and_recreation.employee_demographics
	union
	select first_name, last_name,
	case
		when age > 38 and gender = 'Female' then 'Old Lady'
	end
	from parks_and_recreation.employee_demographics
	union
	select first_name, last_name,
	case
		when salary between 10000 and 30000 then 'Underpaid'
		when salary <= 50000 then 'Well Paid'
		when salary > 50000 then 'Highly Paid'
	end
	from parks_and_recreation.employee_salary
	order by first_name, last_name;
end $$
delimiter ;

call employee_information();

-- in the instance we want two or more queries inside our created procedure, we use a delimiter --
-- in this instance i was trying to use CTEs with stored procedures --
delimiter $$
create procedure highest_salary2()
begin
	with highest_paid as
	(
	select A.employee_id, concat(A.first_name, ' ', A.last_name) as full_name, gender, age, salary,
	row_number() over(partition by gender order by salary desc)
	from parks_and_recreation.employee_demographics as A
	join parks_and_recreation.employee_salary as B
		on A.employee_id = B.employee_id
	),
	department as(
	select A.employee_id, concat(A.first_name, ' ', A.last_name) as full_name, gender, occupation, department_name, salary,
	row_number() over(partition by gender order by salary desc)
	from parks_and_recreation.employee_demographics as A
	join parks_and_recreation.employee_salary as B
	join parks_and_recreation.parks_departments as C
		on A.employee_id = B.employee_id
		and B.dept_id = C.department_id
	)
	select*
	from highest_paid as h
	join department as d
		on h.employee_id = d.employee_id
	where h.salary > 50000;
end $$
delimiter ;

call highest_salary2();

-- refined the data i was calling

delimiter $$
create procedure salary_by_occupation()
begin
	with highest_paid as
	(
	select A.employee_id, concat(A.first_name, ' ', A.last_name) as full_name, gender, age,
	row_number() over(partition by gender order by age desc)
	from parks_and_recreation.employee_demographics as A
	join parks_and_recreation.employee_salary as B
		on A.employee_id = B.employee_id
	),
	department as(
	select A.employee_id, gender, occupation, department_name, salary,
	row_number() over(partition by gender order by salary desc)
	from parks_and_recreation.employee_demographics as A
	join parks_and_recreation.employee_salary as B
	join parks_and_recreation.parks_departments as C
		on A.employee_id = B.employee_id
		and B.dept_id = C.department_id
	)
	select h.employee_id, h.full_name, d.occupation, d.salary
	from highest_paid as h
	join department as d
		on h.employee_id = d.employee_id
	where d.salary > 50000
    order by salary desc;
end $$
delimiter ;

call salary_by_occupation();