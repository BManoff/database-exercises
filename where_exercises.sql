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
    first_name = 'Irena'
    OR first_name = 'Vidya' 
    OR first_name = 'Maya';
-- 709

 SELECT 
    COUNT(first_name)
FROM
    employees
WHERE
    (first_name = 'Irena'
    OR first_name = 'Vidya' 
    OR first_name = 'Maya')
    AND gender = 'M';
-- 441


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
    COUNT(birth_date)
FROM
    employees
WHERE
    DAYOFMONTH(birth_date) = 31
        AND MONTH(birth_date) = 12;
-- 818

SELECT 
    COUNT(hire_date)
FROM
    employees
WHERE
    (hire_date BETWEEN '1990-01-01' AND '1999-12-31')
    AND 
(DAYOFMONTH(birth_date) = 31
        AND MONTH(birth_date) = 12);
-- 358

SELECT 
    count(*)
FROM
    employees
WHERE
    last_name LIKE '%q%';
-- 1873

SELECT 
    count(*)
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%';
-- 547
        
