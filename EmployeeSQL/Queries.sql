---- Query 01
SELECT
	employees.emp_no AS emp_no, last_name, first_name, sex, salary
FROM
	employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

---- Query 02
SELECT
	last_name, first_name, hire_date
FROM
	employees
WHERE
	EXTRACT(YEAR FROM hire_date) = 1986;

---- Query 03
SELECT
	dept_data.dept_no, dept_data.dept_name, emp_data.emp_no, emp_data.last_name, emp_data.first_name
FROM
	(
		SELECT
			dept_manager.emp_no AS emp_no, dept_manager.dept_no AS dept_no, last_name, first_name
		FROM
			employees INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
	) emp_data
	INNER JOIN
	(
		SELECT
			dept_manager.emp_no AS emp_no, dept_manager.dept_no AS dept_no, dept_name
		FROM
			departments INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
	) dept_data
	ON dept_data.emp_no = emp_data.emp_no AND dept_data.dept_no = emp_data.dept_no;

---- Query 04
SELECT
	dept_data.dept_no, emp_data.emp_no, emp_data.last_name, emp_data.first_name, dept_data.dept_name
FROM
	(
		SELECT
			dept_emp.emp_no AS emp_no, dept_emp.dept_no AS dept_no, last_name, first_name
		FROM
			employees INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
	) emp_data
	INNER JOIN
	(
		SELECT
			dept_emp.emp_no AS emp_no, dept_emp.dept_no AS dept_no, dept_name
		FROM
			departments INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
	) dept_data
	ON dept_data.emp_no = emp_data.emp_no AND dept_data.dept_no = emp_data.dept_no;

---- Query 05
SELECT
	last_name, first_name, sex
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
