

-- SELECT name, category, price FROM products WHERE category IN ('electronics','furniture');
-- SELECT name, category, price FROM products WHERE category NOT IN ('electronics','furniture');
-- SELECT name, category, price FROM products WHERE price BETWEEN 1000 AND 2000;
SELECT name, category, price FROM products WHERE price BETWEEN 1000 AND 2000 AND category IN ('electronics');