SELECT *
FROM   customers
WHERE  country = 'USA'
       AND score > 500;

SELECT *
FROM   customers
WHERE  country = 'USA'
       OR score > 500;

SELECT *
FROM   customers
WHERE  NOT score < 500;

SELECT *
FROM   customers
WHERE  score BETWEEN 100 AND 500;

SELECT *
FROM   customers
WHERE  country IN ('USA', 'UK');

SELECT *
FROM   customers
WHERE  first_name LIKE 'M%';

SELECT *
FROM   customers
WHERE  first_name LIKE '%n';

SELECT *
FROM   customers
WHERE  first_name LIKE '%r%';

SELECT *
FROM   customers
WHERE  first_name LIKE '__r%';