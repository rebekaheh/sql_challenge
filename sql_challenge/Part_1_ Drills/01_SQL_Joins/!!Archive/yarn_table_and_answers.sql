/* PART 1: Describe the different types of joins supported in SQL
(1) INNER JOIN- joins the first table with the second by matching the value in the pka column of one table with the value in the fka column of the other. 
If the values are equal, the inner join adds a new row that contains the columns from both tables.
(2) LEFT JOIN- compares the values in the columns from the left table to the values in the columns from the right table. If the values are equal, the join creates
a new row that contains the columns of both tables. If the values do not match, the join fills the columns of the right table with NULL. To select the rows of the left table that do not have
matching rows in the right table, use a WHERE clause (WHERE b is NULL).
(3) RIGHT JOIN- same as the LEFT JOIN, but reversed. To select the rows of the right table that do not have matching rows in the left table, use a WHERE clause (WHERE a is null).
(4) FULL OUTER JOIN- contains all the rows from both the left and right tables, with the matching rows from both sides if the values match, or NULL if they don't.
(5) SELF-JOIN- joins a table to itself, typically used to query hierarchiacal data or to compare rows within the same data (example: which employees report to which managers,
though technically they're all considered employees).
(6) CROSS JOIN- produces a Cartesian Product. Resulting rows are equal to column a rows * column b rows (2 * 3 = 6 total rows)
(7) NATURAL JOIN- creates an implicit join based on the same column names in the joined tables. It can be an inner, left, or right join, and doesn't need to be specified. While convienient, 
this join should be avoided because more than one common column between tables will result in an empty result set. 
*/ 

/* PART 2: Which join was used to create the final view below? 
*/

CREATE TABLE yarn (
id INT NOT NULL,
yarn_name VARCHAR (20),
yarn_type VARCHAR (20),
grams INT,
color INT,
lot INT,
qty INT,
vendor_id INT,
FOREIGN KEY (id)
	REFERENCES vendor (id)
);

INSERT INTO yarn
	(id, yarn_name, yarn_type, grams, color, lot, qty, vendor_id)
	VALUES (1, 'Merino Supreme', 'Worsted', 50, 8, 76123, 1, 1),
	(2, 'Cartwheel', 'Bulky', 200, 2, 1801, 2, 2),
	(3, 'Paloma Tweed', 'Super Bulky', 50, 42513, 63978, 2, 3),
	(4, 'Heritage', 'Sock', 100, 5640, 1707058, 1, 2);

SELECT * FROM yarn

SELECT vendor_name, vendor_country, yarn_name, yarn_type
FROM vendor v
FULL OUTER JOIN yarn y
	ON v.id=y.id