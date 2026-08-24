SELECT *
FROM   customers;

SELECT *
FROM   orders;

SELECT *
FROM   customers
       INNER JOIN
       orders
       ON id = customer_id;

SELECT c.id,
       c.first_name,
       o.order_id,
       o.sales
FROM   customers AS c
       INNER JOIN
       orders AS o
       ON c.id = o.customer_id;

SELECT *
FROM   customers
       LEFT OUTER JOIN
       orders
       ON id = customer_id;

SELECT c.id,
       c.first_name,
       o.order_id,
       o.sales
FROM   customers AS c
       RIGHT OUTER JOIN
       orders AS o
       ON c.id = o.customer_id;

SELECT *
FROM   customers
       FULL OUTER JOIN
       orders
       ON id = customer_id;

SELECT *
FROM   customers AS c
       LEFT OUTER JOIN
       orders AS o
       ON c.id = o.customer_id
WHERE  o.customer_id IS NULL;

SELECT *
FROM   customers AS c
       RIGHT OUTER JOIN
       orders AS o
       ON c.id = o.customer_id
WHERE  c.id IS NULL;

SELECT *
FROM   customers AS c
       FULL OUTER JOIN
       orders AS o
       ON c.id = o.customer_id
WHERE  o.customer_id IS NULL
       OR c.id IS NULL;

SELECT *
FROM   customers
       LEFT OUTER JOIN
       orders
       ON id = customer_id
WHERE  orders.customer_id IS NOT NULL;

SELECT *
FROM   customers
       INNER JOIN
       orders
       ON id = customer_id;


SELECT *
FROM   customers;

SELECT *
FROM   orders;


SELECT *
FROM   customers CROSS JOIN orders;



