--T8
CREATE TABLE customer_complaint (
    complaint_id   INT          PRIMARY KEY,
    customer_id    INT         ,
    complaint_date DATE        ,
    category       VARCHAR (50),
    description    TEXT        ,
    status         VARCHAR (50),
    CONSTRAINT fk_customer_complaints_customer FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

--T9
ALTER TABLE customer_complaint
    ADD priority VARCHAR (20) DEFAULT 'Normal';

--T10
ALTER TABLE customer_complaint
    ADD CONSTRAINT chk_complaint_status CHECK (status IN ('Open', 'InProgress', 'Closed'));

--T11
SELECT *
FROM   accounts
WHERE  balance < 0;

UPDATE accounts
SET    balance = 0
WHERE  balance < 0;

ALTER TABLE accounts
    ADD CONSTRAINT chk_account_balance CHECK (balance >= 0);

-- ALTER TABLE accounts DROP CONSTRAINT chk_account_balance;
--T12
ALTER TABLE customer_complaint DROP CONSTRAINT fk_customer_complaints_customer;

ALTER TABLE customer_complaint
    ADD CONSTRAINT fk_customer_complaints_customer FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE;