--Locks and blocking

SELECT productid, unitprice
FROM Products
WHERE productid = 2;--Note that lock timeouts do not roll back transactions.SET LOCK_TIMEOUT 5000;
SET LOCK_TIMEOUT -1;
SELECT productid, unitprice
FROM Products
WHERE productid = 2;


--Isolation Read Uncommitted
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT productid, unitprice
FROM Products
WHERE productid = 2;

--Isolation Read Committed
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT productid, unitprice
FROM Products
WHERE productid = 2;UPDATE Products
SET unitprice = 19.00
WHERE productid = 2;


-- Isolation Repeatable Read
UPDATE Products
SET unitprice += 1.00
WHERE productid = 2;

--Isolation Serializable
INSERT INTO Products
(productname, supplierid, categoryid,
unitprice, discontinued)
VALUES('Product ABCDE', 1, 1, 20.00, 0);

Select * from Products;


DELETE FROM Products
WHERE productid > 77;

--Run the following code in all open connections to set the isolation level back to the default:
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

--Deadlock
BEGIN TRAN;
UPDATE [Order Details]
SET unitprice += 1.00
WHERE productid = 2;SELECT productid, unitprice
FROM Products
WHERE productid = 2;
COMMIT TRAN;

--Snapshot isolation level
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRAN;

SELECT productid, unitprice
FROM Products
WHERE productid = 2;
Commit Tran;


BEGIN TRAN
SELECT productid, unitprice
FROM Products
WHERE productid = 2;
COMMIT TRAN;UPDATE Products
SET unitprice = 19.00
WHERE productid = 2;--Conflict DetectionUPDATE Products
SET unitprice = 25.00
WHERE productid = 2;


