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
SELECT  t.title, count(e.emp_no) as count
FROM employees AS e
JOIN dept_emp as de
on de.emp_no = e.emp_no
join departments as d
on d.dept_no = de.dept_no
join titles as t
on t.emp_no = e.emp_no
WHERE t.to_date >= NOW()
and de.to_date >= NOW()
and d.dept_no = 'd009'
group by t.title;

-- #5
SELECT  d.dept_name as department_name, CONCAT(e.first_name, ' ', e.last_name) AS name, s.salary
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  join salaries as s
  on s.emp_no = de.emp_no
  join dept_manager as dm
  on dm.emp_no = e.emp_no
WHERE dm.to_date >= NOW()
and s.to_date >= NOW()
order by d.dept_name;

-- #6

SELECT  d.dept_no as dept_no, d.dept_name as department_name, count(e.emp_no) as num_employees
FROM employees AS e
JOIN dept_emp as de
on de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date >= NOW()
group by department_name
order by department_name asc;

-- #7
select d.dept_name as dept_name, avg(s.salary) as average_salary
from salaries as s
join dept_emp as de
on de.emp_no = s.emp_no
join departments as d
on d.dept_no = de.dept_no
where s.to_date >= NOW()
group by dept_name
order by average_salary desc
limit 1;

-- #8
SELECT  e.first_name AS first_name, e.last_name as last_name
FROM employees AS e
join dept_emp as de
on de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  join salaries as s
  on s.emp_no = e.emp_no
  where d.dept_no = 'd001'
  order by s.salary desc
  limit 1;
  
 -- #9
 SELECT  e.first_name AS first_name, e.last_name as last_name, s.salary as salary, d.dept_name as dept_name
FROM employees AS e
join dept_emp as de
on de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  join dept_manager as dm
  on dm.emp_no = de.emp_no
  join salaries as s
  on s.emp_no = e.emp_no
  where s.to_date >= NOW()
  and dm.to_date >= NOW()
  order by s.salary desc
  limit 1;
  
  -- #10
 SELECT d.dept_name as dept_name, round(avg(s.salary)) as average_salary
FROM employees AS e
join dept_emp as de
on de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  join salaries as s
  on s.emp_no = e.emp_no
  group by dept_name
  order by average_salary desc;



