--Locks and blocking
BEGIN TRAN;
UPDATE Products
SET unitprice += 1.00
WHERE productid = 2;-- Isolation ReadUncommittedBEGIN TRAN;
UPDATE Products
SET unitprice += 1.00
WHERE productid = 2;
SELECT productid, unitprice
FROM Products
WHERE productid = 2;

Rollback Tran;

-- Isolation ReadCommitted
BEGIN TRAN;
UPDATE Products
SET unitprice += 1.00
WHERE productid = 2;
SELECT productid, unitprice
FROM Products
WHERE productid = 2;

Commit Tran;


-- Isolation Repeatable Read
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRAN;
SELECT productid, unitprice
FROM Products
WHERE productid = 2;

SELECT productid, unitprice
FROM Products
WHERE productid = 2;
COMMIT TRAN;
UPDATE Products
SET unitprice = 19.00
WHERE productid = 2;

-- Isolation Serializable
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRAN
SELECT productid, productname, categoryid, unitprice
FROM Products
WHERE categoryid = 1;SELECT productid, productname, categoryid, unitprice
FROM Products
WHERE categoryid = 1;
COMMIT TRAN;

--Run the following code in all open connections to set the isolation level back to the default:
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


--Deadlock
BEGIN TRAN;
UPDATE Products
SET unitprice += 1.00
WHERE productid = 2;SELECT orderid, productid, unitprice
FROM [Order Details]
WHERE productid = 2;
COMMIT TRAN;--After doin all run this for clean up. UPDATE Products
SET unitprice = 19.00
WHERE productid = 2;
UPDATE [Order Details]
SET unitprice = 19.00
WHERE productid = 2
AND orderid >= 10500;
UPDATE [Order Details]
SET unitprice = 15.20
WHERE productid = 2
AND orderid < 10500;


--Snapshot isolation level
ALTER DATABASE Northwind SET ALLOW_SNAPSHOT_ISOLATION ON;
BEGIN TRAN;
UPDATE Products
SET unitprice += 1.00
WHERE productid = 2;
SELECT productid, unitprice
FROM Products
WHERE productid = 2;
COMMIT TRAN;

--Conflict Detection
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRAN;
SELECT productid, unitprice
FROM Products
WHERE productid = 2;UPDATE Products
SET unitprice = 20.00
WHERE productid = 2;
COMMIT TRAN;UPDATE Products
SET unitprice = 19.00
WHERE productid = 2;BEGIN TRAN;
SELECT productid, unitprice
FROM Products
WHERE productid = 2;UPDATE Products
SET unitprice = 20.00
WHERE productid = 2;UPDATE Products
SET unitprice = 19.00
WHERE productid = 2;