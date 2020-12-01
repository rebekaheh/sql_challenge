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
SELECT dm.dep_man_dept_no AS "Dept_Number",
dept.dept_name AS "Department Name",
dm.dep_man_emp_no AS "Employee Number",
e.last_name AS "Last Name", 
e.first_name AS "First Name"
FROM department_manager dm
INNER JOIN departments dept on dm.dep_man_dept_no = dept.dept_no
INNER JOIN employees e on e.emp_no = dm.dep_man_emp_no

/* QUESTION 4 */
SELECT e.emp_no AS "Employee Number", 
e.last_name AS "Last Name", 
e.first_name AS "First Name", 
DP.dept_name AS "Department Name"
FROM dept_emp dept
INNER JOIN departments DP ON DP.dept_no = dept.depemp_dept_no
INNER JOIN employees e ON e.emp_no = dept.depemp_emp_no

/* QUESTION 5 */
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

/* QUESTION 6 */
SELECT DE.depemp_emp_no AS "Employee Number", 
e.last_name AS "Last Name", 
e.first_name AS "First Name", 
DP.dept_name AS "Department Name"
FROM dept_emp DE
INNER JOIN employees e ON DE.depemp_emp_no = e.emp_no
INNER JOIN departments DP ON DP.dept_no = DE.depemp_dept_no
WHERE DP.dept_name = 'Sales'

/* QUESTION 7 */
SELECT DE.depemp_emp_no AS "Employee Number", 
e.last_name AS "Last Name", 
e.first_name AS "First Name", 
DP.dept_name AS "Department Name"
FROM dept_emp DE
INNER JOIN employees e ON DE.depemp_emp_no = e.emp_no
INNER JOIN departments DP ON DP.dept_no = DE.depemp_dept_no
WHERE DP.dept_name = 'Sales' OR DP.dept_name = 'Development'

/* QUESTION 8 */
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name 
ORDER BY COUNT DESC

