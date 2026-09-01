-- T1
SELECT first_name,
       last_name,
       city,
       segment
FROM   customers;

-- T2
SELECT   first_name,
         last_name,
         salary
FROM     employees
ORDER BY salary DESC;

-- T3
SELECT DISTINCT currency
FROM   accounts;

--T4
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM   customers;

--T5
SELECT   TOP 5 account_id,
               account_type,
               currency,
               balance
FROM     accounts
ORDER BY balance DESC;

--T6
SELECT account_id,
       balance,
       balance * 0.05 AS annual_interest
FROM   accounts;

--T7
SELECT   DISTINCT txn_type,
                  channel
FROM     transactions
ORDER BY txn_type ASC, channel ASC;