DROP TABLE IF EXISTS basics.sales;

CREATE TABLE basics.sales(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    price NUMERIC(10,2) NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO basics.sales(title,price) VALUES
('title',10.33),
('title2',10.34);

INSERT INTO basics.sales(title,price) VALUES
('jdfafal',10.35);

SELECT * FROM basics.sales;