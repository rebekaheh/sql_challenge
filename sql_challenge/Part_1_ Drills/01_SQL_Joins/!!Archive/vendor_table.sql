CREATE TABLE vendor
(id serial PRIMARY KEY,
vendor_name VARCHAR(20),
vendor_country VARCHAR(20))

INSERT INTO vendor
	(id, vendor_name, vendor_country)
	VALUES (1, 'Carlton', 'Turkey'),
	(2, 'Cascade Yarns', 'United States'),
	(3, 'Debbie Bliss', 'England'),
	(4, 'Tahki', 'Greece');

SELECT * FROM vendor



