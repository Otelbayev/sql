-- products?category=electronic

-- SELECT name, category, price FROM products WHERE category='electronics';
-- SELECT name FROM products WHERE price > 1000;
SELECT name, is_active FROM products WHERE is_active = FALSE;