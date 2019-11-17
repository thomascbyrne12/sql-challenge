CREATE TABlE departments (
	dept_no VARCHAR(20),
	dept_name VARCHAR(20)
);

CREATE TABLE dept_emp (
	emp_no VARCHAR(20),
	dept_no VARCHAR(20),
	from_date DATE,
	to_date DATE
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(20),
	emp_no VARCHAR(20),
	from_date DATE,
	to_date DATE
);

CREATE TABLE employees (
	emp_no VARCHAR(20),
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	gender VARCHAR(20),
	hire_date DATE
);

CREATE TABLE salaries (
	emp_no VARCHAR(20),
	salary INT,
	from_date DATE,
	to_date DATE
);

CREATE TABLE titles (
	emp_no VARCHAR(20),
	title VARCHAR(30),
	from_date DATE,
	to_date DATE
);

SELECT employees.emp_no, employees.last_name, employees.first_name, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no = salaries.emp_no;

SELECT * FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;
