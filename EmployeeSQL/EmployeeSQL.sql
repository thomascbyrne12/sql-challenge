CREATE TABlE departments (
	dept_no VARCHAR(20),
	dept_name VARCHAR(20)
);

CREATE TABLE dept_emp (
	emp_no VARCHAR(20),
	dept_no VARCHAR(20),
	from_date VARCHAR(20),
	to_date VARCHAR(20)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(20),
	emp_no VARCHAR(20),
	from_date VARCHAR(20),
	to_date VARCHAR(20)
);

CREATE TABLE employees (
	emp_no VARCHAR(20),
	birth_date VARCHAR(20),
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	gender VARCHAR(20),
	hire_date VARCHAR(20)
);

CREATE TABLE salaries (
	emp_no VARCHAR(20),
	salary INT,
	from_date VARCHAR(20),
	to_date VARCHAR(20)
);

CREATE TABLE titles (
	emp_no VARCHAR(20),
	title VARCHAR(30),
	from_date VARCHAR(20),
	to_date VARCHAR(20)
);
