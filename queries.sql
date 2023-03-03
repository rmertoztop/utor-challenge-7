--query tables
SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM salaries;

--display employee number, last name, first name, sex and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries 
ON employees.emp_no = salaries.emp_no;

--list first name, last name, and hire date for employees hired in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date > '1985-12-31' AND hire_date < '1987-01-01';

--list managers with department number, department name, employee number, last name, and first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON employees.emp_no = dept_manager.emp_no;

--department number of employees, employee number, last name, first name, and department name
SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no;

--first name, last name, sex of each employee with first name Hercules last name B...
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

--employees in Sales department, list employee number, last name, and first name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name LIKE 'Sales';

--employees in Sales and Development departments, employee number, last name, first name, department name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN departments
ON dept_emp.dept_no = departments.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name LIKE 'Sales'
OR departments.dept_name LIKE 'Development'

--frequency counts of all employee last names in descending order
SELECT employees.last_name, COUNT(employees.last_name) AS frequency_count
FROM employees
GROUP BY employees.last_name
ORDER BY frequency_count DESC;