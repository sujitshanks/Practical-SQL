
--CH03

--Character Types (use Varchar)

CREATE TABLE char_data_types (
	varchar_column varchar(10),
	char_column char(10),
	text_column text
);

INSERT INTO char_data_types
VALUES
	('abc', 'abc', 'abc'),
	('defghi', 'defghi', 'defghi');
	
COPY char_data_types TO 'E:\typetest.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');


--Number types

CREATE TABLE number_data_types(
	numeric_column numeric(20,5),
	real_column real,
	double_column double precision
);

INSERT INTO number_data_types 
VALUES
	(.7, .7, .7),
	(2.13579, 2.13579, 2.13579),
	(2.1357987654, 2.1357987654, 2.1357987654);
	
SELECT * FROM number_data_types;


--Floating points can cause numerical calculation errors
SELECT
	numeric_column * 10000000 AS "Fixed",
	real_column * 10000000 AS "Float"
FROM number_data_types
WHERE numeric_column = .7;

-- Here the output under float will not be 7000000 but 6999985.7645 or something of that sort. Why? Thats how bits are compressed to store floating point numbers in SQL. Tread carefully.



-- Datetime types

CREATE TABLE date_time_types (
	timestamp_column timestamp with time zone,
	interval_column interval
);

INSERT INTO date_time_types
VALUES
	('2018-12-31 01:00 EST','2 days'),
	('2018-12-31 01:00 -8','1 month'),
	('2018-12-31 01:00 Australia/Melbourne','1 century'),
	(now(), '1 week');
	
SELECT * FROM date_time_types;


-- Using the interval data type

SELECT timestamp_column, interval_column, timestamp_column - interval_column AS new_date
FROM date_time_types;


-- Miscellaneous Types


