--INDEXES
-- data pate
-- index page
-- heap
-- clustered index
-- b-tree
-- non clustered index
--rowstore index
--columnstore index

SELECT *
FROM   Sales.DBCustomers
WHERE  CustomerID = 1;

CREATE CLUSTERED INDEX idx_DBCustomers_CustomerID
    ON Sales.DBCustomers(CustomerID);

DROP INDEX idx_DBCustomers_CustomerID
    ON Sales.DBCustomers;

-------------------------------------------
SELECT *
FROM   Sales.DBCustomers
WHERE  FirstName = 'Anna';

CREATE INDEX idx_DBCustomers_FirstName
    ON Sales.DBCustomers(FirstName);

-------------------------------------------
SELECT *
FROM   Sales.DBCustomers
WHERE  Country = 'USA'
       AND Score > 500;

CREATE INDEX idx_DBCustomers_CountryScore
    ON Sales.DBCustomers(Country, Score);

    