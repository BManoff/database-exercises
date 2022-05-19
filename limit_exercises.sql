use employees;

SELECT DISTINCT
    last_name
FROM
    employees
	ORDER BY last_name desc
    LIMIT 10;
-- Zykh
-- Zyda
-- Zwicker
-- Zweizig
-- Zumaque
-- Zultner
-- Zucker
-- Zuberek
-- Zschoche
-- Zongker



SELECT 
    first_name, last_name
FROM
    employees
WHERE
    (hire_date BETWEEN '1990-01-01' AND '1999-12-31')
    AND 
(DAYOFMONTH(birth_date) = 31
        AND MONTH(birth_date) = 12)
	ORDER BY hire_date
    LIMIT 5;
-- Magdalena Guting
-- Chaosheng Plavsic
-- Sachin Brodie
-- Douadi Streit
-- Ymte Schlegelmilch

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    (hire_date BETWEEN '1990-01-01' AND '1999-12-31')
    AND 
(DAYOFMONTH(birth_date) = 31
        AND MONTH(birth_date) = 12)
	ORDER BY hire_date
    LIMIT 5 OFFSET 45;
-- Tomofumi, Ducloy
-- Willard, Itschner
-- Ziyad, Schueller
-- Claude, Ventosa
-- Alenka, Garrabrants


