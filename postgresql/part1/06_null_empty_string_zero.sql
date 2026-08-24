DROP TABLE IF EXISTS basics.value_examples;

CREATE TABLE basics.value_examples(
    id SERIAL PRIMARY KEY,
    nickname VARCHAR(100),
    bio TEXT,
    score INTEGER
);

INSERT INTO basics.value_examples (nickname,bio,score) VALUES
(null, 'null nickname', 10),
('','empty string nickname', 20),
('nickname', '', 0),
('none', null, null);

SELECT * FROM basics.value_examples;
SELECT * FROM basics.value_examples WHERE bio is null;

