SELECT CONCAT(first_name, '-', country) AS name_country
FROM   customers;

SELECT UPPER(first_name) AS upper_name
FROM   customers;

SELECT LOWER(first_name) AS lower_name
FROM   customers;

SELECT *
FROM   customers
WHERE  first_name != TRIM(first_name);

SELECT '16-05-2004',
       REPLACE('16-05-2004', '-', '/');

SELECT first_name,
       LEN(first_name) AS name_length
FROM   customers;

SELECT first_name,
       LEFT(TRIM(first_name), 3) AS left_extract,
       RIGHT(TRIM(first_name), 3) AS right_extract
FROM   customers;

SELECT first_name,
       SUBSTRING(TRIM(first_name), 2,2) as string
FROM   customers;