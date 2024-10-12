-- Window Functions in SQL

SELECT * 
FROM employee_demographics;


SELECT dem.first_name,dem.last_name,gender, AVG(salary) AS AVERAGE_SALARY
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name,dem.last_name,gender;

SELECT dem.first_name,dem.last_name,gender, AVG(salary) OVER(PARTITION BY gender )
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

-- Rolling Total
SELECT dem.first_name,dem.last_name,gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    

SELECT dem.first_name,dem.last_name,gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Dense_rank_num
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
