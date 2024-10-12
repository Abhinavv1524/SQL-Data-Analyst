-- CTEs

SELECT gender, AVG(salary),MAX(Salary),MIN(salary),COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

-- With CTE

WITH CTE_example AS
(
SELECT gender, AVG(salary),MAX(Salary),MIN(salary),COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT * 
FROM CTE_example;


-- Without CTE
SELECT AVG(avg_salary) 
FROM (SELECT gender, AVG(salary) as avg_salary,MAX(Salary),MIN(salary),COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery;

-- More than one CTE

WITH CTE_example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_example2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT * 
FROM CTE_example c1
JOIN CTE_example2 c2
	ON c1.employee_id = c2.employee_id;