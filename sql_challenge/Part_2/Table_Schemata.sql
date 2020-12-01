/* TITLES */
CREATE TABLE titles(
title_id VARCHAR,
title VARCHAR,
PRIMARY KEY (title_id)
)

/* IMPORT DATA FROM CSV FILE */
COPY titles(title_id,title)
FROM 'D:\JO\aaa\NEWNEW\titles.csv'
DELIMITER ','
CSV HEADER;

/* VIEW TABLE */
SELECT * FROM titles
----
/* DEPARTMENTS */
CREATE TABLE departments(
dept_no VARCHAR null,
dept_name VARCHAR null,
PRIMARY KEY (dept_no)
)

/* IMPORT DATA FROM CSV FILE */
COPY departments(dept_no,dept_name)
FROM 'D:\JO\aaa\NEWNEW\departments.csv'
DELIMITER ','
CSV HEADER;

/* VIEW TABLE */
SELECT * FROM departments

----
/* EMPLOYEES*/
CREATE TABLE employees(
emp_no VARCHAR null,
emp_title VARCHAR,
birth_date DATE,
first_name VARCHAR,
last_name VARCHAR,
sex VARCHAR(1),
hire_date DATE,
title_id VARCHAR,
PRIMARY KEY (emp_no)
)
;

/* IMPORT DATA FROM CSV FILE */
COPY employees(emp_no, emp_title, birth_date, first_name, last_name, sex, hire_date)
FROM 'D:\JO\aaa\NEWNEW\employees.csv'
DELIMITER ','
CSV HEADER;

/* VIEW TABLE */
SELECT * FROM employees

----
/* SALARIES*/
CREATE TABLE salaries(
SAL_emp_no VARCHAR REFERENCES employees(emp_no),
salary INTEGER,
PRIMARY KEY (SAL_emp_no)
)

/* IMPORT DATA FROM CSV FILE */
COPY salaries(SAL_emp_no, salary)
FROM 'D:\JO\aaa\NEWNEW\salaries.csv'
DELIMITER ','
CSV HEADER;

/* VIEW TABLE */
SELECT * FROM salaries

----
/* DEPARTMENT_EMPLOYEE*/
CREATE TABLE dept_emp(
DEPEMP_emp_no VARCHAR null REFERENCES employees(emp_no),
DEPEMP_dept_no VARCHAR REFERENCES departments(dept_no)
)

/* IMPORT DATA FROM CSV FILE */
COPY dept_emp(DEPEMP_emp_no, DEPEMP_dept_no)
FROM 'D:\JO\aaa\NEWNEW\department_employee.csv'
DELIMITER ','
CSV HEADER;

/* VIEW TABLE */
SELECT * FROM dept_emp

------
/* DEPARTMENT_MANAGER*/
CREATE TABLE department_manager(
DEP_MAN_emp_no VARCHAR null REFERENCES employees(emp_no),
DEP_MAN_dept_no VARCHAR null REFERENCES departments(dept_no)
)

/* IMPORT DATA FROM CSV FILE */
COPY department_manager(DEP_MAN_dept_no, DEP_MAN_emp_no)
FROM 'D:\JO\aaa\NEWNEW\department_manager.csv'
DELIMITER ','
CSV HEADER;

/* VIEW TABLE */
SELECT * FROM department_manager