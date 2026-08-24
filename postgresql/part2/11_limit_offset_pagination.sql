-- SELECT name, price FROM products ORDER BY name ASC LIMIT 1;
SELECT name, price FROM products ORDER BY name ASC LIMIT 5 OFFSET 0;
SELECT name, price FROM products ORDER BY name ASC LIMIT 5 OFFSET 5;