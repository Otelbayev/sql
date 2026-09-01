--T13
SELECT *
FROM   customer_complaint;

INSERT  INTO customer_complaint (
    complaint_id,
    customer_id,
    complaint_date,
    category,
    description,
    status,
    priority
)
VALUES                         (1, 1, '2026-09-01', 'category1', 'desctiption1', 'InProgress', 'NeNormal'),
(2, 2, '2026-09-01', 'category2', 'desctiption2', 'Closed', 'Test');

--T14
SELECT *
FROM   customer_complaint
WHERE  [status] = 'Open';

UPDATE customer_complaint
SET    [status] = 'InProgress'
WHERE  [status] = 'Open';


--T15

SELECT * FROM accounts

--T16
--T17