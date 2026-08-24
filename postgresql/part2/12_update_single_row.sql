SELECT name, price, sku FROM products WHERE sku='ELEC-MOU-001';

UPDATE products SET 
name='none',
price=55.66,
sku='fuck'
WHERE sku = 'ELEC-MOU-001';

SELECT name, price, sku FROM products WHERE sku='fuck';
