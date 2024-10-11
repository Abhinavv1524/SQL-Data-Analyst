-- case statements

SELECT first_name, last_name,age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Older'
    WHEN age > 50 THEN 'Death Door'
END AS age_bracket
FROM  employee_demographics;


SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 then salary+(salary *0.05)
	WHEN salary > 50000 then salary + (salary *0.07)
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.1
END AS bonus
FROM employee_salary;

select * from parks_departments;