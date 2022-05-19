use employees;

SELECT Distinct title FROM titles;
-- 7

SELECT 
    last_name
FROM
    employees
GROUP BY last_name
HAVING last_name LIKE '%E'
    AND last_name LIKE 'E%';

SELECT 
    first_name, last_name
FROM
    employees
GROUP BY first_name, last_name
HAVING last_name LIKE '%E'
    AND last_name LIKE 'E%';
    
SELECT 
    count(distinct last_name)
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%';
-- Chleq
-- Lindqvist
-- Qiwen

SELECT 
    first_name, COUNT(*) as 'Gender count'
FROM
    employees
GROUP BY first_name , gender
HAVING first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY first_name;

    SELECT 
    CONCAT(LOWER(SUBSTR(first_name, 1, 1)),
            LOWER(SUBSTR(last_name, 1, 4)),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)
	)
    AS username,
    count(CONCAT(LOWER(SUBSTR(first_name, 1, 1)),
            LOWER(SUBSTR(last_name, 1, 4)),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)
	)) AS 'Number_of_usernames',
    first_name,
    last_name,
    birth_date
FROM
    employees
GROUP BY first_name, last_name, birth_date
ORDER BY 'Number_of_usernames';
-- Yes, there are duplicate user names. 
-- Bonus: There are 6 duplicate usernames.

SELECT 
    AVG(salary), emp_no
FROM
    salaries
GROUP BY emp_no;
