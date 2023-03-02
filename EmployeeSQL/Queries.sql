---- Query 01
SELECT
	employees.emp_no AS emp_no, last_name, first_name, sex, salary
FROM
	employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

---- Query 02
SELECT
	first_name, last_name, hire_date
FROM
	employees
WHERE
	EXTRACT(YEAR FROM hire_date) = 1986;

---- Query 03
SELECT
	departments.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM
	employees INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
	INNER JOIN departments ON dept_manager.dept_no = departments.dept_no;

---- Query 04
SELECT
	departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM
	employees INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
	INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;

---- Query 05
SELECT
	first_name, last_name, sex
FROM
	employees
WHERE
	first_name = 'Hercules' AND last_name LIKE 'B%';

---- Query 06
SELECT
	emp_no, last_name, first_name
FROM
	employees
WHERE
	emp_no IN (
		SELECT 
			emp_no
		FROM
			dept_emp INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
		WHERE
			dept_name = 'Sales'
	);

---- Query 07
SELECT
	employees.emp_no, last_name, first_name, dept_name
FROM
	employees INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
	INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE
	dept_name = 'Sales' OR dept_name = 'Development';

---- Query 08
SELECT
	last_name, COUNT(emp_no) AS frequency
FROM
	employees
GROUP BY
	last_name
ORDER BY
	frequency DESC;
