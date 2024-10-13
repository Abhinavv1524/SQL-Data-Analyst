-- Triggers and Events 

SELECT * FROM employee_demographics;

SELECT * FROM employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name) 
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name); 
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation,salary,dept_id)
VALUES (13,'Jean-Ralphio','Saperstein', 'Entertainment 720 CEO', 1000000, NULL);


-- Events
delimiter $$
create event delete_retirees
on schedule every 30 second
do
begin
	delete 
    from employee_demographics
    where age >= 60;
end $$
delimiter ;

show variables like 'event%';


