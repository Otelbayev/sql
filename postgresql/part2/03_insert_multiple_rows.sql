INSERT INTO products (
    name, category, price, stock, sku, description
) VALUES 
('laptom 1', 'category', 10.33, 5, 'false', 'desk'),
('laptom 2', 'category', 10.33, 5, 'none', 'desk'),
('laptom 3', 'category', 10.33, 5, 'true', 'desk'),
('laptom 4', 'category', 10.33, 5, 'true', 'desk');


SELECT name, price FROM products WHERE sku IN ('ELEC-CAB-001', 'ELEC-MOU-001');