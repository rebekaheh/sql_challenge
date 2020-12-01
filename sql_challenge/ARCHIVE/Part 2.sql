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

SELECT * FROM titles
----
/* DEPARTMENTS */

CREATE TABLE departments(
dept_no VARCHAR null,
dept_name VARCHAR null,
PRIMARY KEY (dept_no)
)

COPY departments(dept_no,dept_name)
FROM 'D:\JO\aaa\NEWNEW\departments.csv'
DELIMITER ','
CSV HEADER;

/* VIEW TABLE */
SELECT * FROM departments

----
/* EMPLOYEES*/

/* CREATE THE 'EMPLOYEES' TABLE */

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

/* CREATE THE 'SALARIES' TABLE */
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

COPY department_manager(DEP_MAN_dept_no, DEP_MAN_emp_no)
FROM 'D:\JO\aaa\NEWNEW\department_manager.csv'
DELIMITER ','
CSV HEADER;

/* VIEW TABLE */
SELECT * FROM department_manager

/* ANALYSIS */
/* QUESTION 1 */

SELECT e.emp_no as "emp_no", 
e.last_name AS "last_name", 
e.first_name AS "first_name", 
e.sex AS "sex", 
s.sal_emp_no AS "salary"
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.sal_emp_no

/* QUESTION 2 */
SELECT *
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986'

/* QUESTION 3 */
select dm.dep_man_dept_no as "Dept_Number",
dept.dept_name as "Department Name",
dm.dep_man_emp_no as "Employee Number",
e.last_name as "Last Name", 
e.first_name as "First Name"
from department_manager dm
inner join departments dept on dm.dep_man_dept_no = dept.dept_no
inner join employees e on e.emp_no = dm.dep_man_emp_no

/* QUESTION 4 */
select e.emp_no as "Employee Number", 
e.last_name as "Last Name", 
e.first_name as "First Name", 
DP.dept_name as "Department Name"
from dept_emp dept
inner join departments DP on DP.dept_no = dept.depemp_dept_no
inner join employees e on e.emp_no = dept.depemp_emp_no

/* QUESTION 5 */
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name  like 'B%'

/* QUESTION 6 */
select DE.depemp_emp_no as "Employee Number", 
e.last_name as "Last Name", 
e.first_name as "First Name", 
DP.dept_name as "Department Name"
from dept_emp DE
inner join employees e on DE.depemp_emp_no = e.emp_no
inner join departments DP on DP.dept_no = DE.depemp_dept_no
where DP.dept_name = 'Sales'

/* QUESTION 7 */
select DE.depemp_emp_no as "Employee Number", 
e.last_name as "Last Name", 
e.first_name as "First Name", 
DP.dept_name as "Department Name"
from dept_emp DE
inner join employees e on DE.depemp_emp_no = e.emp_no
inner join departments DP on DP.dept_no = DE.depemp_dept_no
where DP.dept_name = 'Sales' OR DP.dept_name = 'Development'

/* QUESTION 8 */
SELECT last_name, COUNT(last_name)
FROM employees
group by last_name 
order by count desc

