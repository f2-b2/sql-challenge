﻿--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
	JOIN salaries AS s 
		ON e.emp_no = s.emp_no;
		

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE DATE_PART('Year', e.hire_date) = '1986'


--3. List the manager of each department along with their 
--department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
	JOIN dept_manager AS dm
		ON e.emp_no = dm.emp_no
	JOIN departments AS d
		ON dm.dept_no = d.dept_no


--4. List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name.
SELECT  e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM employees AS e
	LEFT JOIN dept_emp AS de 
		ON e.emp_no = de.emp_no
	LEFT JOIN departments AS d 
		ON de.dept_no = d.dept_no


--5. List first name, last name, and sex of each employee whose 
-- first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules'
AND last_name Like 'B%';


--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	LEFT JOIN dept_emp AS de 
		ON e.emp_no = de.emp_no
	LEFT JOIN departments AS d
		ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales'


--7. List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	LEFT JOIN dept_emp AS de 
		ON e.emp_no = de.emp_no
	LEFT JOIN departments AS d
		ON de.dept_no = d.dept_no
	WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development'


--8. List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT last_name, count(last_name) AS employee_count
FROM employees
GROUP BY last_name
ORDER BY employee_count DESC