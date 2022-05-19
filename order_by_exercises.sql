use employees;
select * from employees;

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
    ORDER BY first_name;
-- Irena Reutenauer <-- First employee
-- Vidya Simmen <-- Last employee

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
    ORDER BY first_name, last_name;
-- Irena Acton <-- First Employee
-- Vidya Zweizig <-- Last employee

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
    ORDER BY last_name, first_name;
-- Irena Acton <-- First employee
-- Maya Zyda <-- Last employee


 SELECT 
   *
FROM
    employees
WHERE
    last_name LIKE '%E' 
    AND 
    last_name Like 'E%'
ORDER BY emp_no;
    -- 899 <-- employees returned
    -- 10021 Ramzi Erde <-- First employee
    -- 499648 Tadahiro Erde <-- Last employee
    
     SELECT 
   *
FROM
    employees
WHERE
    last_name LIKE '%E' 
    AND 
    last_name Like 'E%'
ORDER BY hire_date;
-- 899 <-- Employees returned
-- Teiji Eldridge <-- Newest hire
-- Sergi Erde <-- Oldest hire


SELECT 
    *
FROM
    employees
WHERE
    (hire_date BETWEEN '1990-01-01' AND '1999-12-31')
    AND 
(DAYOFMONTH(birth_date) = 25
        AND MONTH(birth_date) = 12)
	ORDER BY birth_date asc, hire_date desc;
-- 362 <-- Employees returned
-- Khun Bernini <-- Oldest employee who was hired last
-- Doudi Pettis <-- Youngest employee who was hired first

