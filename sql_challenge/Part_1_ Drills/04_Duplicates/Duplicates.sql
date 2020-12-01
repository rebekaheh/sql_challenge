/* Part 1: How do you locate a duplicate record with one field? Using the table below, write a query to demonstrate. */

SELECT DISTINCT yarn_name
FROM yarn
ORDER BY yarn_name

/* Part 2: How do you find duplicate records using more than one field? Using the table from Part 1, write a query to demonstrate. */

SELECT DISTINCT yarn_name, yarn_type, grams, color, lot, qty, vendor_id
FROM yarn
ORDER BY yarn_name