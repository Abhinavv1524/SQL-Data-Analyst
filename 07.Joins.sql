SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;

-- inner join

SELECT dem.employee_id, age,occupation
FROM employee_demographics AS dem -- aliasing as dem
INNER JOIN employee_salary AS sal -- aliasing as sal
	ON dem.employee_id = sal.employee_id -- selecting on which column wh have to perform join
;

-- outer joins
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Self join

SELECT *
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id +1 = emp2.employee_id
;

SELECT emp1.employee_id AS emp_santa, 
emp1.first_name AS first_name_santa, 
emp1.last_name AS lastt_name_santa,
emp2.employee_id,
emp2.first_name,
emp2.last_name
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id +1 = emp2.employee_id
;

-- Joining Multiple table together

SELECT *
FROM employee_demographics AS dem 
INNER JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS par
	ON sal.dept_id = par.department_id
;
