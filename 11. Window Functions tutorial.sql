-- group by function breaks down everything by its unique columns --
select A.first_name, A.last_name, gender, avg(salary) as avg_salary
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id
group by A.first_name, A.last_name, gender;

-- whereas in a window function of the above, the rows are not affected as the column is completely independent of other columns--
select A.first_name, B.first_name, gender, avg(salary) over(partition by gender)
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;
    
-- a rolling total --
-- it starts at a specific value and adds on from subsequent rows based of your partition--
select A.first_name, A.last_name, gender, salary,
sum(salary) over(partition by gender order by A.employee_id) as rolling_total
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;
    
-- Row number --
-- this works like an aggregate function --
-- this row numbers will not repeat themselves --
select A.employee_id, A.first_name, A.first_name, gender, salary,
row_number() over()
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;
    
-- row number gives each row a number based on what you are partitioning by --
-- when using row number, it won't have duplicate  rows on what we are partitioning by --
select A.employee_id, A.first_name, A.first_name, gender, salary,
row_number() over(partition by gender) as row_namba
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;
    
-- if we want to rank based on the highest salary first down to the lowest salary, we add an order by to our window function --
select A.employee_id, A.first_name, A.first_name, gender, salary,
row_number() over(partition by gender order by salary desc)
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;

-- Rank --
-- this gives each row a unique rank --
-- if it encounters a duplicate based on the order by, it's going to assign it the same number and gives the next number positionally --
select A.employee_id, A.first_name, A.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_namba,
rank() over(partition by gender order by salary desc) as rank_namba
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;

-- dense rank --
-- if it encounters a duplicate based on the order by, it's going to assign it the same number and gives the next number numerically --
select A.employee_id, A.first_name, A.first_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_namba,
rank() over(partition by gender order by salary desc) as rank_namba,
dense_rank() over(partition by gender order by salary desc) as dense_rank_namba
from parks_and_recreation.employee_demographics as A
join parks_and_recreation.employee_salary as B
	on A.employee_id = B.employee_id;
