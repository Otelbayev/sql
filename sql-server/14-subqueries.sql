SELECT ProductID,
       Price,
       AVG(Price) OVER () AS avg_price
FROM   Sales.Products;