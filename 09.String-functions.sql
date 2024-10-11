-- String Functions

SELECT LENGTH('sskyfall');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY LENGTH(first_name);

SELECT UPPER('sky');
SELECT LOWER('SKY');

SELECT first_name, UPPER(first_name)
FROM employee_demographics
ORDER BY LENGTH(first_name);

SELECT  TRIM('            SKY            ');
SELECT  LTRIM('            SKY            ');
SELECT  RTRIM('            SKY            ');

SELECT first_name, LEFT(first_name,4)
FROM employee_demographics;
SELECT first_name, RIGHT(first_name,4)
FROM employee_demographics;

SELECT first_name, SUBSTRING(first_name,3,2)
FROM employee_demographics;

SELECT *, SUBSTRING(birth_date,6,2) AS Birth_month
FROM employee_demographics;

SELECT *, REPLACE(first_name,'a','z')
FROM employee_demographics;

SELECT LOCATE('a','Abhinav');

SELECT first_name, last_name, CONCAT(FIRST_NAmE," ",LAST_NAME) AS full_name
FROM employee_demographics;
