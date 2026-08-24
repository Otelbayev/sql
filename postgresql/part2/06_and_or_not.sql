-- AND means every condition must be true
-- OR mean one candition must be true
-- NOT reverse/exclude a condition

-- SELECT * FROM products WHERE category='electronics' AND price > 1000;
-- SELECT * FROM products WHERE category='electronics' OR category ='furniture';
SELECT * FROM products WHERE NOT category='electronics';