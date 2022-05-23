use join_example_db;


-- Join example database

-- #2
SELECT * FROM users
JOIN roles ON users.role_id = roles.id;

SELECT * FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT * FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- #3
SELECT 
    roles.name, COUNT(users.name)
FROM
    users
        RIGHT JOIN
    roles ON users.role_id = roles.id
GROUP BY roles.name;

-- employees database
-- #1
use employees;

-- #2
SELECT 
    d.dept_name AS department_name,
    CONCAT(e.first_name, ' ', e.last_name) AS department_manager
FROM
    employees AS e
        JOIN
    dept_manager AS dm ON dm.emp_no = e.emp_no
        JOIN
    departments AS d ON d.dept_no = dm.dept_no
WHERE
    dm.to_date >= NOW()
ORDER BY department_name ASC;

-- #3
SELECT 
    d.dept_name AS department_name,
    CONCAT(e.first_name, ' ', e.last_name) AS department_manager
FROM
    employees AS e
        JOIN
    dept_manager AS dm ON dm.emp_no = e.emp_no
        JOIN
    departments AS d ON d.dept_no = dm.dept_no
WHERE
    dm.to_date >= NOW() AND e.gender = 'F'
ORDER BY department_name ASC;

-- #4
SELECT 
    t.title, COUNT(e.emp_no) AS count
FROM
    employees AS e
        JOIN
    dept_emp AS de ON de.emp_no = e.emp_no
        JOIN
    departments AS d ON d.dept_no = de.dept_no
        JOIN
    titles AS t ON t.emp_no = e.emp_no
WHERE
    t.to_date >= NOW()
        AND de.to_date >= NOW()
        AND d.dept_no = 'd009'
GROUP BY t.title;

-- #5
SELECT 
    d.dept_name AS department_name,
    CONCAT(e.first_name, ' ', e.last_name) AS name,
    s.salary
FROM
    employees AS e
        JOIN
    dept_emp AS de ON de.emp_no = e.emp_no
        JOIN
    departments AS d ON d.dept_no = de.dept_no
        JOIN
    salaries AS s ON s.emp_no = de.emp_no
        JOIN
    dept_manager AS dm ON dm.emp_no = e.emp_no
WHERE
    dm.to_date >= NOW()
        AND s.to_date >= NOW()
ORDER BY d.dept_name;

-- #6

SELECT 
    d.dept_no AS dept_no,
    d.dept_name AS department_name,
    COUNT(e.emp_no) AS num_employees
FROM
    employees AS e
        JOIN
    dept_emp AS de ON de.emp_no = e.emp_no
        JOIN
    departments AS d ON d.dept_no = de.dept_no
WHERE
    de.to_date >= NOW()
GROUP BY department_name
ORDER BY dept_no asc;


-- #7
SELECT 
    d.dept_name AS dept_name, AVG(s.salary) AS average_salary
FROM
    salaries AS s
        JOIN
    dept_emp AS de ON de.emp_no = s.emp_no
        JOIN
    departments AS d ON d.dept_no = de.dept_no
WHERE
    s.to_date >= NOW()
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- #8
SELECT 
    e.first_name AS first_name, e.last_name AS last_name
FROM
    employees AS e
        JOIN
    dept_emp AS de ON de.emp_no = e.emp_no
        JOIN
    departments AS d ON d.dept_no = de.dept_no
        JOIN
    salaries AS s ON s.emp_no = e.emp_no
WHERE
    d.dept_no = 'd001'
ORDER BY s.salary DESC
LIMIT 1;
  
 -- #9
 SELECT 
    e.first_name AS first_name,
    e.last_name AS last_name,
    s.salary AS salary,
    d.dept_name AS dept_name
FROM
    employees AS e
        JOIN
    dept_emp AS de ON de.emp_no = e.emp_no
        JOIN
    departments AS d ON d.dept_no = de.dept_no
        JOIN
    dept_manager AS dm ON dm.emp_no = de.emp_no
        JOIN
    salaries AS s ON s.emp_no = e.emp_no
WHERE
    s.to_date >= NOW()
        AND dm.to_date >= NOW()
ORDER BY s.salary DESC
LIMIT 1;
  
  -- #10
 SELECT 
    d.dept_name AS dept_name,
    ROUND(AVG(s.salary)) AS average_salary
FROM
    employees AS e
        JOIN
    dept_emp AS de ON de.emp_no = e.emp_no
        JOIN
    departments AS d ON d.dept_no = de.dept_no
        JOIN
    salaries AS s ON s.emp_no = e.emp_no
GROUP BY dept_name
ORDER BY average_salary DESC;



