-- Data Analysis

-- Employee details
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no=s.emp_no;

-- All employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- Managers of each department
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, d.dept_name
FROM employees e
	JOIN dept_manager dm ON dm.emp_no=e.emp_no
		JOIN departments d ON d.dept_no=dm.dept_no;

-- Department of each employee
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
	JOIN dept_employee de ON e.emp_no=de.emp_no 
		JOIN departments d ON de.dept_no=d.dept_no
		
-- Employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- Employees in the sales department
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
	JOIN dept_employee de ON e.emp_no=de.emp_no
		JOIN departments d ON d.dept_no=de.dept_no
			WHERE dept_name='Sales';

-- Employees in the sales and development departments
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
	JOIN dept_employee de ON e.emp_no=de.emp_no
		JOIN departments d ON d.dept_no=de.dept_no
			WHERE dept_name='Sales' OR dept_name='Development';

-- Frequency count of employee last names (ie: employees who share last names)
SELECT last_name, COUNT(last_name) "number_of_employees"
FROM employees
GROUP BY last_name
ORDER BY "number_of_employees" desc;