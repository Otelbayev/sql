DROP TABLE IF EXISTS basics.students;

CREATE TABLE basics.students (
    -- SERIAL - creaet auto incremental integer id
    -- PRIMARY KEY - unique key
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    age INTEGER CHECK (age>=18),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO basics.students(name, email, age) VALUES ('Jasurbek', 'jasurdev1604@gmail.com', 22), ('None', 'none@gmail.com', 33);

SELECT * FROM basics.students;