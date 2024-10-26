create database hr_analysis;
use hr;
describe hr_analysis.hr;
select * from hr_analysis.hr;

-- date cleaning
UPDATE hr_analysis.hr
SET start_date = STR_TO_DATE(start_date, '%d/%m/%Y');
ALTER TABLE hr_analysis.hr 
MODIFY start_date DATE;

-- column header rename
ALTER TABLE hr_analysis.hr
CHANGE COLUMN `full/part_time` full_part_time VARCHAR(255);

-- total employees
SELECT COUNT(*) AS total_employees FROM hr_analysis.hr;

-- average salary
SELECT AVG(Salary) AS average_salary FROM hr_analysis.hr;

-- employee by department
SELECT department, COUNT(*) AS employees_per_dept
FROM hr_analysis.hr
GROUP BY department;

-- full time/part time
SELECT full_part_time, COUNT(*) AS count
FROM hr_analysis.hr
GROUP BY full_part_time;

-- Gender distribution
SELECT gender, COUNT(*) AS count
FROM hr_analysis.hr
GROUP BY gender;

-- employee tenure
SELECT Emp_ID, 
	TIMESTAMPDIFF(YEAR, start_date, CURDATE()) AS years_with_company
FROM hr_analysis.hr;

-- avg salary by dept
SELECT department, AVG(salary) AS avg_salary_per_dept
FROM hr_analysis.hr
GROUP BY department;

-- top 5 paid employee
SELECT first_name, last_name, salary
FROM hr_analysis.hr
ORDER BY salary DESC
LIMIT 5;

-- employee by location
SELECT country, city, COUNT(*) AS count
FROM hr_analysis.hr
GROUP BY country, city;

-- employee type
SELECT employee_type, COUNT(*) AS count
FROM hr_analysis.hr
GROUP BY employee_type;

-- hiring trend by year
SELECT YEAR(start_date) AS year, COUNT(*) AS hires_per_year
FROM hr_analysis.hr
GROUP BY year;


