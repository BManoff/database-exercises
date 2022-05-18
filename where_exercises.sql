use employees;
select * from employees;

SELECT 
    COUNT(first_name)
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya');
-- 709

 SELECT 
    COUNT(first_name)
FROM
    employees
WHERE
    first_name OR ('Irena' , 'Vidya', 'Maya');
-- ERROR confused what is wanted here?

-- 4?

 SELECT 
    COUNT(*)
FROM
    employees
WHERE
    last_name like ('E%');
-- 7330

 SELECT 
   count(*)
FROM
    employees
WHERE
    last_name LIKE '%E' 
    OR 
    last_name Like 'E%';
-- 30723 

 SELECT 
   count(*)
FROM
    employees
WHERE
    last_name LIKE '%E' 
    AND 
    last_name Like 'E%';
    -- 899

SELECT 
    COUNT(hire_date)
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- 135214

SELECT 
    birth_date
FROM
    employees
WHERE
    birth_date %-12-25;