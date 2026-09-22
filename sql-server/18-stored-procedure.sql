-- CREATE PROCEDURE ProcedureName AS 
-- BEGIN 
-- ...
-- ...
-- END
-- EXECUTE ProcedureName
SELECT COUNT(*) AS TotalCustomers,
       AVG(Score) AS AvgSales
FROM   Sales.Customers
WHERE  Country = 'USA';

DROP PROCEDURE IF EXISTS GetCustomerSummary;


GO
CREATE PROCEDURE GetCustomerSummary
AS
BEGIN
    SELECT COUNT(*) AS TotalCustomers,
           AVG(Score) AS AvgScore
    FROM   Sales.Customers
    WHERE  Country = 'USA';
END


GO
EXECUTE GetCustomerSummary ;

DROP PROCEDURE IF EXISTS GetCustomerSummary1;


GO
-- Stored procedure with param
CREATE PROCEDURE GetCustomerSummary1
@Country NVARCHAR (50)='UK'
AS
BEGIN
    DECLARE @TotalCustomers AS INT, @AvgScore AS FLOAT;
    IF EXISTS (SELECT 1
               FROM   Sales.Customers
               WHERE  Score IS NULL
                      AND Country = @Country)
        BEGIN
            PRINT ('UPDATING NULL SCORE TO 0');
            UPDATE Sales.Customers
            SET    Score = 0
            WHERE  Score IS NULL
                   AND Country = @Country;
        END
    ELSE
        BEGIN
            PRINT ('NO NULL SCORES FOUND');
        END
    SELECT @TotalCustomers = COUNT(*),
           @AvgScore = AVG(Score)
    FROM   Sales.Customers
    WHERE  Country = @Country;
    PRINT 'Total Customers from ' + @Country + ':' + CAST (@TotalCustomers AS NVARCHAR);
    PRINT 'Average Score from ' + @Country + ':' + CAST (@AvgScore AS NVARCHAR);
END


GO
EXECUTE GetCustomerSummary1 @Country = 'USA';

EXECUTE GetCustomerSummary1 @Country = 'Germany';

EXECUTE GetCustomerSummary1 ;

SELECT *
FROM   Sales.Customers;

UPDATE Sales.Customers
SET    Score = NULL
WHERE  CustomerID = 5;

DROP PROCEDURE IF EXISTS ErrorHandling;


GO
CREATE PROCEDURE ErrorHandling
AS
BEGIN
    BEGIN TRY
        SELECT *,
               1 / 0
        FROM   Sales.Customers;
    END TRY
    BEGIN CATCH
        PRINT ('An error occured!');
        PRINT (ERROR_MESSAGE());
        PRINT (ERROR_NUMBER());
        PRINT (ERROR_LINE());
        PRINT (ERROR_PROCEDURE());
    END CATCH
END


GO
EXECUTE ErrorHandling ;

DROP PROCEDURE IF EXISTS Pagination;


GO
CREATE PROCEDURE Pagination
@offset INT=0
AS
BEGIN
    SELECT   *
    FROM     Sales.Orders
    ORDER BY OrderID
    OFFSET @offset ROWS FETCH NEXT 5 ROWS ONLY;
END


GO
EXECUTE Pagination @offset = 0;

EXECUTE Pagination @offset = 5;