-- Temporary tables --
-- it is important to choose the appropriate name for your table to understand your workflow --
create temporary table salary_over_50k
select*
from parks_and_recreation.employee_salary
where salary >= 50000;

select*
from salary_over_50k;