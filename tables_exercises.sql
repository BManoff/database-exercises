use employees;
show tables;
select * from employees;
select * from departments;
select * from dept_emp;
describe employees;
describe departments;

show create table dept_manager;

-- Which table(s) do you think contain a numeric type column?
--  The emp_no contains and INT numeric data type

-- Which table(s) do you think contain a string type column?
--  The name tables contain a varchar string data type.

-- Which table(s) do you think contain a date type column?
--  The birth_date and hire_date tables contain date data types.

-- What is the relationship between the employees and the departments tables?
--  many to many

'CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1'