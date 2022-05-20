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
SELECT roles.name, count(users.name) FROM users
RIGHT JOIN roles ON users.role_id = roles.id
group by roles.name;

-- employees database
-- #1
use employees;

-- #2
SELECT  d.dept_name as department_name, CONCAT(e.first_name, ' ', e.last_name) AS department_manager
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date >= NOW()
order by department_name asc;

-- #3
SELECT  d.dept_name as department_name, CONCAT(e.first_name, ' ', e.last_name) AS department_manager
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date >= NOW()
and e.gender = 'F'
order by department_name asc;

-- #4
SELECT  t.title, count(*)
FROM employees AS e
JOIN titles AS t
  ON t.emp_no = e.emp_no
  Join departments as d
  on d.dept_no = 
WHERE t.to_date >= NOW()
group by t.title;

select * from departments;