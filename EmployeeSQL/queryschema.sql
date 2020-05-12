SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles

-- 1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
    JOIN salaries as sal
    ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

-- 2. List first name, last name, and hire date 
-- for employees who were hired in 1986.

SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees as emp
WHERE emp.hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY emp.hire_date;

-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.

SELECT man.dept_no, dep.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM employees as emp
	JOIN dept_manager as man
	ON (emp.emp_no = man.emp_no)
		JOIN departments as dep
		ON (man.dept_no = dep.dept_no)
ORDER BY man.dept_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM employees as emp
	JOIN dept_emp as demp
	ON emp.emp_no = demp.emp_no
		JOIN departments as dep
		ON (dep.dept_no = demp.dept_no);
	
-- 5. List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."	

SELECT emp.first_name, emp.last_name, emp.sex
	FROM employees as emp
	WHERE emp.first_name = 'Hercules'
	AND emp.last_name LIKE 'B%';
	
-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
	FROM employees as emp
		JOIN dept_emp as demp
		ON (emp.emp_no = demp.emp_no)
			JOIN departments as dep
			ON (demp.dept_no = dep.dept_no)
			WHERE dep.dept_name = 'Sales';
			
-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
	FROM employees as emp
		JOIN dept_emp as demp
		ON (emp.emp_no = demp.emp_no)
			JOIN departments as dep
			ON (demp.dept_no = dep.dept_no)
			WHERE dep.dept_name = 'Sales' 
			OR dep.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT employees.last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name);

SELECT * FROM employees
WHERE emp_no = '499942';

