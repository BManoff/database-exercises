USE kalpana_1815;
drop table if exists my_numbers;

CREATE TEMPORARY TABLE my_numbers(
    n INT UNSIGNED NOT NULL,
    name VARCHAR(10) NOT NULL
);

select * from my_numbers;

# insert data in my_numbers
INSERT INTO my_numbers(n, name) VALUES (1, 'a'), (2, 'b'), (3, 'c'), (4, 'd'), (5, 'e');

# delete rows based on some condition
DELETE FROM my_numbers WHERE n > 4;

#-------------------------------------------------------
USE employees;
CREATE TEMPORARY TABLE kalpana_1815.employees AS 
SELECT * FROM employees 
JOIN salaries USING (emp_no);

USE kalpana_1815;
SELECT * FROM employees_with_salaries;

-- #1
CREATE TEMPORARY TABLE employees_with_departments AS
(select first_name, last_name, dept_name
from employees.employees
join employees.dept_emp using (emp_no)
join employees.departments using (dept_no)
where to_date >= NOW());
#a
ALTER TABLE employees_with_departments add full_name varchar(50);
#b
UPDATE employees_with_departments
SET full_name = CONCAT(first_name,' ',last_name);
#c
ALTER TABLE employees_with_departments drop column first_name;
ALTER TABLE employees_with_departments drop column last_name;
#d
select * from employees_with_departments;
-- Could have selected the information from the table initially and concatonated the names.

-- #2

USE sakila;
create temporary table kalpana_1815.mypayments select payment_id, customer_id, staff_id, rental_id, amount * 100 as cents, payment_date, last_update
    from payment;

use kalpana_1815;
select * from mypayments;

alter table mypayments change cents cents int;

-- #3
create temporary table overall as (
    select avg(salary) as avg_salary, std(salary) as std_salary
    from employees.salaries  where to_date > now()
);
create temporary table current_info as (
    select dept_name, avg(salary) as department_current_average
    from employees.salaries
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where employees.dept_emp.to_date > NOW()
    and employees.salaries.to_date > NOW()
    group by dept_name);

alter table current_info add overall_avg float(10,2);
alter table current_info add overall_std float(10,2);
alter table current_info add zscore float(10,2);

update current_info set overall_avg = (select avg_salary from overall);
update current_info set overall_std = (select std_salary from overall);

update current_info 
set zscore = (department_current_average - overall_avg) / overall_std;

select * from kalpana_1815.current_info
order by zscore desc;
-- Sales = best
-- HR = worst

SELECT AVG(salary), STDDEV(salary)
FROM employees.salaries;
