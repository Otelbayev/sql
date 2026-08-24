DROP TABLE IF EXISTS basics.products_basic;

CREATE TABLE basics.products_basic (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    stock INTEGER DEFAULT 0,
    total BIGINT DEFAULT 0,
    price NUMERIC(10,2),
    is_active BOOLEAN DEFAULT true
);

INSERT INTO basics.products_basic(name, description, stock, total, price, is_active) VALUES 
('name', 'desc', 100, 10000, 99.99, true);

SELECT * FROM basics.products_basic;
SELECT id,name, total FROM basics.products_basic WHERE is_active=true;