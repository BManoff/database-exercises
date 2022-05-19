use employees;

 SELECT 
   upper(concat(first_name, ' ', last_name))
FROM
    employees
WHERE
    last_name LIKE '%E' 
    AND 
    last_name Like 'E%';


SELECT 
    first_name,
    last_name,
    DATEDIFF(NOW(), hire_date) AS 'Days at the company'
FROM
    employees
WHERE
    (hire_date BETWEEN '1990-01-01' AND '1999-12-31')
        AND (DAYOFMONTH(birth_date) = 31
        AND MONTH(birth_date) = 12);

SELECT 
    MIN(salary) AS 'Smallest salary',
    MAX(Salary) AS 'Largest salary'
FROM
    salaries;
    
    SELECT 
    CONCAT(LOWER(SUBSTR(first_name, 1, 1)),
            LOWER(SUBSTR(last_name, 1, 4)),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)
	)
    AS username,
    first_name,
    last_name,
    birth_date
FROM
    employees;

