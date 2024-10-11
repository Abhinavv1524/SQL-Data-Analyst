-- Sub query

select * 
from employee_demographics
where employee_id IN (select employee_id from employee_salary where dept_id = 1);

select * 
from employee_salary;