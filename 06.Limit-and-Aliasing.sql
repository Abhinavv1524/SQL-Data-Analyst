-- Limits in SQL

SELECT *
FROM employee_demographics
WHERE age> 40
ORDER BY age DESC
LIMIT 4;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 1,3;

-- Aliasing 
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING avg(age)>40;

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg(age)>40;