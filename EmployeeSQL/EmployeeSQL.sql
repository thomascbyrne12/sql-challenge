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

SELECT dept_manager.dept_no, departments.dept_name,
	dept_manager.emp_no, employees.first_name, employees.last_name,
	dept_manager.from_date, dept_manager.to_date
	FROM dept_manager
	INNER JOIN departments ON
	dept_manager.dept_no = departments.dept_no
	INNER JOIN employees ON
	dept_manager.emp_no = employees.emp_no;

  SELECT dept_emp.dept_no, employees.first_name,
  	employees.last_name, departments.dept_name
  	FROM employees
  	INNER JOIN dept_emp ON
  	dept_emp.emp_no = employees.emp_no
  	INNER JOIN departments ON
  	dept_emp.dept_no = departments.dept_name;

SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B_';

SELECT employees.emp_no, employees.first_name,
	employees.last_name, departments.dept_name
	FROM employees
	INNER JOIN dept_emp ON
	dept_emp.emp_no = employees.emp_no
	INNER JOIN departments ON
	dept_emp.dept_no = departments.dept_name
	WHERE departments.dept_name = 'Sales';

  SELECT employees.emp_no, employees.first_name,
  	employees.last_name, departments.dept_name
  	FROM employees
  	INNER JOIN dept_emp ON
  	dept_emp.emp_no = employees.emp_no
  	INNER JOIN departments ON
  	dept_emp.dept_no = departments.dept_name
  	WHERE departments.dept_name = 'Sales'
  	AND departments.dept_name = 'Development';
