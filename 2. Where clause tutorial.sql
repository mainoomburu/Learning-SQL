# WHERE clause
-- understanding how to use where clause --

-- the first instance is to filter out string or characters --
select * 
from parks_and_recreation.employee_salary
where first_name = 'leslie';

-- this is to filter out integer values --
select *
from parks_and_recreation.employee_salary
where salary = 50000;

-- this is to show the not equal operator with the where clause --
select *
from parks_and_recreation.employee_demographics
where gender != 'male';

-- this is for filtering date type data types --
select *
from parks_and_recreation.employee_demographics
where birth_date > '1985-01-01';

-- using logical operators to filter out data (AND, OR, NOT) --
-- AND logical operator --
select *
from parks_and_recreation.employee_salary
where salary >= 50000
and employee_id < 6;

select*
from parks_and_recreation.employee_demographics
where gender != 'male'
and age > 30;

-- OR logical operator --
select*
from parks_and_recreation.employee_demographics
where gender != 'male'
or age > 34;

-- OR NOT logical operator --
select*
from parks_and_recreation.employee_demographics
where age > 30
or not gender = 'male';

-- when using and or logical operators together  using the paranthesis is recommended--
select*
from parks_and_recreation.employee_demographics
where (first_name = 'leslie' and age = 44) or age > 40;

-- using LIKE operator for specific patterns
-- check for any name starting with an a --
select*
from parks_and_recreation.employee_demographics
where first_name like 'a%';

-- check for any first name that ends with an a --
select*
from parks_and_recreation.employee_demographics
where first_name like '%a';

-- check for any name with an a --
select*
from parks_and_recreation.employee_demographics
where first_name like '%a%';
