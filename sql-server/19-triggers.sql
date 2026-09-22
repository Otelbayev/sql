-- CREATE TRIGGER TriggerName ON TableName
-- AFTER : INSERT, UPDATE, DELETE
-- BEGIN
-- ... sql statement go here
-- END
CREATE TABLE Sales.EmployeeLogs (
    LogID      INT           IDENTITY (1, 1) PRIMARY KEY,
    EmployeeID INT          ,
    LogMessage VARCHAR (255),
    LogDate    DATE         
);


GO
CREATE TRIGGER trg_AfterInsertEmployee
    ON Sales.Employees
    AFTER INSERT
    AS BEGIN
           INSERT INTO Sales.EmployeeLogs (
               EmployeeID,
               LogMessage,
               LogDate
           )
           SELECT EmployeeID,
                  'New Employee added' + CAST (EmployeeID AS VARCHAR),
                  GETDATE()
           FROM   INSERTED;
       END


GO
SELECT *
FROM   Sales.EmployeeLogs;

SELECT *
FROM   Sales.Employees;

INSERT  INTO Sales.Employees (
    EmployeeID,
    FirstName,
    LastName,
    Department,
    BirthDate,
    Gender,
    Salary,
    ManagerID
)
VALUES                      (6, 'TEST', 'TEST', 'TEST', '2004-04-16', 'M', 100000, 3);