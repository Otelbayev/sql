
-- SELECT name, price, description FROM products;
-- SELECT name, price FROM products WHERE name LIKE 'usb%'; 
-- SELECT name, price FROM products WHERE name ILIKE 'uSb%'; 
SELECT name, price FROM products WHERE description ILIKE '%with%'; 