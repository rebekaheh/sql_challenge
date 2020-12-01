/* PART 1: Explain the difference between ALTER and UPDATE in SQL statements
(ALTER) allows you to change the structure of an existing table, including adding or dropping columns, changing the data type in a column, renaming a column,
setting a default value for a column, adding a constraint to a column, or renaming a table.
(UPDATE) allows you to modify data within a table
*/

/* PART 2 */

CREATE TABLE employees
(employee_id INT, 
 first_name VARCHAR(20),
 last_name VARCHAR(20), 
 department_id INT)

INSERT INTO employees
(employee_id, first_name, last_name, department_id)
VALUES (3, 'Chris', 'Christian', 25),
(14, 'Jan', 'Jansson', 45),
(17, 'Sam', 'Samuels', 45);

SELECT * FROM employees

/* Change the name of the column from department_id to dept_id */
ALTER TABLE employees
RENAME department_id TO dept_id;

SELECT * FROM employees

/* Add a column named annual_salary to the table*/
ALTER TABLE employees
ADD COLUMN annual_salary INT

SELECT * FROM employees

