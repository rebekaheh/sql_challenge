/* What is the difference between DML and DDL? */
/* DML is Data Manipulation Language and is used to add, retrieve, or update data. DML includes commands such as 
UPDATE, INSERT, & MERGE, and uses the WHERE clause in its statemtent. */
/* DDL is Data Definition Language and is used to create database schema and define some constraints. DDL includes commands such as
CREATE, DROP, RENAME, & ALTER, and doesn't use the WHERE clause. */

/* Demonstrate a use of DML in the following table: */

SELECT * FROM vendor

INSERT INTO vendor(id, vendor_name, vendor_country)
VALUES (5, 'Another Vendor', 'Another Country')

SELECT * FROM vendor