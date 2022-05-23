use employees;

-- #1
SELECT 
    *
FROM
    employees
        JOIN
    dept_emp USING (emp_no)
WHERE
    hire_date IN (SELECT 
            hire_date
        FROM
            employees
        WHERE
            emp_no = 101010)
        AND to_date >= NOW();

-- #2
SELECT 
    title
FROM
    titles
        JOIN
    employees USING (emp_no)
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            first_name LIKE 'Aamod');
            
-- #3
SELECT 
    COUNT(emp_no)
FROM
    employees
WHERE
    emp_no NOT IN (SELECT 
            emp_no
        FROM
            dept_emp
        WHERE
            to_date > NOW());



-- #4
SELECT 
    CONCAT(first_name, ' ', last_name) AS female_dept_managers
FROM
    employees
        JOIN
    dept_manager USING (emp_no)
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            gender = 'F')
        AND to_date > NOW();

-- #5
SELECT 
    CONCAT(first_name, ' ', last_name) AS names
FROM
    employees
        JOIN
    salaries USING (emp_no)
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            salaries
        GROUP BY emp_no
        HAVING salary > AVG(salary))
        AND to_date >= NOW();

-- #6
SELECT 
    COUNT(*) AS total,
    (COUNT(*) / (SELECT 
            COUNT(*)
        FROM
            salaries
        WHERE
            to_date > NOW()) * 100) AS percent_of_total
FROM
    salaries
WHERE
    salary > (SELECT 
            MAX(salary) - STDDEV(s.salary)
        FROM
            salaries AS s)
        AND to_date > NOW();