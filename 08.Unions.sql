-- Unions

SELECT first_name, last_name
fROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name
fROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, 'Old Man' AS Label
fROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
fROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Higer Paid' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;