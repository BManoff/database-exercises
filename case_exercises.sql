-- #1
use employees;

select emp_no, dept_no, from_date, to_date,
if (to_date > curdate(), 'Yes', 'No') as "Is_Current_employee"
from dept_emp;

-- #2
select last_name,
case when substr(last_name, 1, 1) <='H' then "A_thru_H"
when substr(last_name, 1, 1) <= 'Q' then "I_thru_Q"
else "R_thru_Z"
end as alphabet_names
from employees;

-- #3
select -- concat(first_name, " ", last_name) as "Employee Name",
case when birth_date like '195%' then "50's"
when birth_date like '196%' then "60's"
else "Record not found"
end as decade_born_in, count(*) as number_of_employees
from employees
group by decade_born_in;

-- #4
SELECT
  dept_name,
    CASE
       WHEN dept_name IN ('Research', 'Development') THEN 'R&D'
        WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('production', 'quality') THEN 'Prod & QM'
        When dept_name IN ('Finance', 'Human') THEN 'Finance & HR'
        When dept_name like 'Customer Service' Then 'Customer Service'
    END AS department_categories, AVG(salary) as 'average_salary'
    from departments
join dept_emp using (dept_no)
join salaries using (emp_no)
where salaries.to_date > now() and dept_emp.to_date > now()
group by 'department_catagories';
