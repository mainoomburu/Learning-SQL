-- GROUP BY --
select*
from parks_and_recreation.employee_demographics;

-- the specified column in the select statement has to be similar to the column specified in the group by --
select gender
from parks_and_recreation.employee_demographics
group by gender;

-- when using aggregate functions, it does not have to go in the group by section --
select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender;

-- we first select our table to view the data to check what we want to group by --
select*
from parks_and_recreation.employee_salary;

-- we can group on multiple columns --
-- if 2 rows in two columns have the same values, then we only display once --
-- but if 2 rows in two columns have only one same value, then we display both --
select occupation, salary
from parks_and_recreation.employee_salary
group by occupation, salary;

-- we can use multiple aggregate functions to check our data --
select dept_id, min(salary), avg(salary)
from parks_and_recreation.employee_salary
group by dept_id;

select gender, min(age), max(age), avg(age)
from parks_and_recreation.employee_demographics
group by gender;

-- COUNT will count the actual rows within the specified column in it --
select gender, min(age), max(age), avg(age), count(age)
from parks_and_recreation.employee_demographics
group by gender;

-- ORDER BY --
-- for a text column, by default it does in an ascending order from A to Z --
select *
from parks_and_recreation.employee_demographics
order by first_name;

select*
from parks_and_recreation.employee_demographics
order by first_name asc;

-- to reverse the order for a text column to sort out from Z to A--
select*
from parks_and_recreation.employee_demographics
order by first_name desc;

-- we can also order by 2 columns --
-- we order by the first column after the order by function then the second --
-- without specifying, they are both ordered in ascending order --
select*
from parks_and_recreation.employee_demographics
order by gender, age;

-- while specifying one column --
select*
from parks_and_recreation.employee_demographics
order by gender, age desc;

select*
from parks_and_recreation.employee_demographics
order by gender desc, age;

-- if you begin your order by with the wrong column first, for instance age --
-- the display will not use the gender column to group the values as age has no unique values --
-- the order of the order by column is very important --

