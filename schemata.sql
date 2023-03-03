--drop titles table
DROP TABLE IF EXISTS titles CASCADE;
--create the titles table
CREATE TABLE titles (
	title_id VARCHAR(10) NOT NULL,
	title VARCHAR(30) NOT NULL,
	--set the title id as a primary key
	PRIMARY KEY(title_id)
);

--drop departments table
DROP TABLE IF EXISTS departments CASCADE;
--create the departments table
CREATE TABLE departments (
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	--set the department number as a primary key
	PRIMARY KEY(dept_no)
);

--drop employees table
DROP TABLE IF EXISTS employees CASCADE;
--create the employees table
CREATE TABLE employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(5) NOT NULL,
	hire_date DATE NOT NULL,
	--set the employee number as primary key
	PRIMARY KEY(emp_no),
	--set employee title id as foreign key with title id from titles table as reference
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
);

--drop dept_manager table
DROP TABLE IF EXISTS dept_manager CASCADE;
--create the department manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	--set department number as foreign key with department number from departments table as reference
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	--set employee number as foreign key with employee number from employees table as reference
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

--drop dept_emp table
DROP TABLE IF EXISTS dept_emp CASCADE;
--create the department employee table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	--set employee number as foreign key with employee number from employees table as reference
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	--set department number as foreign key with department number from departments table as reference
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

--drop salaries table
DROP TABLE IF EXISTS salaries CASCADE;
--create the salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	--set employee number as foreign key with employee number from employees table as reference
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);
