-- Triggers --
-- in this instance, when someone data is put in the salary table, we want to automatically update the demographics table --
select*
from parks_and_recreation.employee_demographics;

select*
from parks_and_recreation.employee_salary;

-- It is best practice to check if the trigger you want to create exists --
-- If it does drop it before creating --
drop trigger if exists parks_and_recreation.insert_employee;

delimiter $$
create trigger insert_employee
	after insert on parks_and_recreation.employee_salary
    for each row
begin
	insert into parks_and_recreation.employee_demographics(employee_id, first_name, last_name)
    values (new.employee_id, new.first_name, new.last_name);
end $$
delimiter ;

insert into parks_and_recreation.employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
values(15, 'Makin', 'Kenia', 'Consultant', 72000, Null);


drop trigger if exists parks_and_recreation.remove_employee;

delimiter $$
create trigger remove_employee
	after insert on parks_and_recreation.employee_demographics
	for each row
begin
	insert into parks_and_recreation.employee_salary(employee_id, first_name, last_name)
    values(new.employee_id, new.first_name, new.last_name);
end $$
delimiter ;

insert into parks_and_recreation.employee_demographics(employee_id, first_name, last_name, age, gender, birth_date)
values(16, 'Kimmy', 'Antonelli', 19, 'Male', Null);


-- Event --
-- Takes place when scheduled --
drop event if exists parks_and_recreation.delete_null;

delimiter $$
create event delete_null
on schedule every 30 second
do
begin
	delete
    from parks_and_recreation.employee_demographics
    where birth_date is null and age is null;
end $$
delimiter ;

-- To check whether the event was applied --
select*
from parks_and_recreation.employee_demographics;





