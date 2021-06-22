--Initializes departments table
CREATE TABlE departments (
	dept_no VARCHAR(20) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(20) NOT NULL
);

--Initializes employees table
CREATE TABLE employees (
	emp_no VARCHAR(20) PRIMARY KEY NOT NULL,
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	gender VARCHAR(20),
	hire_date DATE
);

--Initializes dept_emp table
CREATE TABLE dept_emp (
	emp_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(20),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	from_date DATE,
	to_date DATE
);

--Initializes dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	emp_no VARCHAR(20),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date DATE,
	to_date DATE
);

--Initializes salaries table
CREATE TABLE salaries (
	emp_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT,
	from_date DATE,
	to_date DATE
);

--Initializes titles table
CREATE TABLE titles (
	emp_no VARCHAR(20) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR(30),
	from_date DATE,
	to_date DATE
);

--Returns a table with data from employees and salaries tables
SELECT 
	employees.emp_no, employees.last_name, employees.first_name, salaries.salary
FROM 
	salaries
INNER JOIN employees ON
	employees.emp_no = salaries.emp_no;

--Returns all employees hired in 1986
SELECT 
	* 
FROM 
	employees
WHERE 
	EXTRACT(YEAR FROM hire_date) = 1986;

--Returns data on department managers
SELECT 
	dept_manager.dept_no, departments.dept_name,
	dept_manager.emp_no, employees.first_name, employees.last_name,
	dept_manager.from_date, dept_manager.to_date
FROM 
	dept_manager
INNER JOIN 
	departments ON
	dept_manager.dept_no = departments.dept_no
INNER JOIN 
	employees ON
	dept_manager.emp_no = employees.emp_no;

--Returns a table with each employee and their department
SELECT 
	dept_emp.dept_no, employees.first_name,
  	employees.last_name, departments.dept_name
FROM 
	employees
INNER JOIN 
	dept_emp ON
	dept_emp.emp_no = employees.emp_no
INNER JOIN 
	departments ON
	dept_emp.dept_no = departments.dept_name;

/* Returns data on all 
	employees named Hercules B. */
SELECT 
	* 
FROM 
	employees
WHERE 
	first_name = 'Hercules' 
AND 
	last_name LIKE 'B_';

--Returns a table with employees who work in Sales
SELECT 
	employees.emp_no, employees.first_name,
	employees.last_name, departments.dept_name
FROM 
	employees
INNER JOIN 
	dept_emp ON
	dept_emp.emp_no = employees.emp_no
INNER JOIN 
	departments ON
	dept_emp.dept_no = departments.dept_name
WHERE 
	departments.dept_name = 'Sales';

/* Returns a table with employees who work 
	in Sales and Development */
SELECT 
	employees.emp_no, employees.first_name,
  	employees.last_name, departments.dept_name
FROM 
	employees
INNER JOIN 
	dept_emp ON
	dept_emp.emp_no = employees.emp_no
INNER JOIN 
	departments ON
	dept_emp.dept_no = departments.dept_name
WHERE 
	departments.dept_name = 'Sales'
AND 
	departments.dept_name = 'Development';

/* Returns a count of number of 
	employees with each last name */
SELECT 
	employees.last_name, count(*)
FROM 
	employees
GROUP BY 
	employees.last_name
ORDER BY 
	count(*) DESC;
