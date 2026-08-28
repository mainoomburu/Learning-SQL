-- String functions --
-- length, is recommended for columns that have a specific number of characters such as phone numbers to check --
select first_name, length(first_name)
from parks_and_recreation.employee_demographics;

-- upper, helps us standardize a column --
select first_name, upper(first_name)
from parks_and_recreation.employee_demographics;

-- other string functions are: trim, which allows us to remove whitespace --

-- substring, allows us to seperate a character based on its starting position and how many positions after it --
select birth_date, 
left(birth_date, 4) as birth_year,
right(birth_date, 5) as birthday,
substring(birth_date, 6, 2) as birth_month,
substring(birth_date, 9,2) as birth_day,
substring(birth_date, 1, 4) as year_of_birth
from parks_and_recreation.employee_demographics;

-- replace, allows us to replace a specific character with a different character --
select birth_date, replace(birth_date, '-', '/')
from parks_and_recreation.employee_demographics;

-- locate, this helps us find the position of a character in a column--
select first_name, locate('a', first_name)
from parks_and_recreation.employee_demographics;

select birth_date, locate('03', birth_date)
from parks_and_recreation.employee_demographics;

-- concat, this allows us to combine two columns --
select first_name, last_name, concat(first_name, ' ', last_name) as full_name
from parks_and_recreation.employee_salary;
