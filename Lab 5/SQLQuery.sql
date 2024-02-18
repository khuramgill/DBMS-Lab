SELECT C.CustomerID,O.OrderID,O.OrderDate FROM Customers C LEFT JOIN Orders O ON C.CustomerID = O.CustomerID;


SELECT C.CustomerID,O.OrderID,O.OrderDate FROM Customers C LEFT JOIN Orders O ON C.CustomerID = O.CustomerID WHERE O.OrderID IS NULL;

SELECT C.CustomerID,O.OrderID,O.OrderDate FROM Customers C JOIN Orders O ON C.CustomerID = O.CustomerID WHERE YEAR(O.OrderDate) = 1997 AND MONTH(O.OrderDate) = 7;
SELECT CustomerID , COUNT(OrderID) AS totalorders FROM Orders GROUP BY CustomerID;
SELECT E.EmployeeID,DATEADD(day, num.n, '1996-07-04') AS Date FROM Employees E CROSS JOIN (SELECT TOP 1000 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n FROM sys.columns) AS num;
SELECT C.CustomerID,COUNT(O.OrderID) AS TotalOrders,SUM(OD.Quantity) AS TotalQuantity FROM Customers C JOIN Orders O ON C.CustomerID = O.CustomerID JOIN [Order Details] OD ON O.OrderID = OD.OrderID WHERE C.Country = 'USA' GROUP BY C.CustomerID;
SELECT C.CustomerID, C.CompanyName, O.OrderID, O.OrderDate FROM Customers C LEFT JOIN   Orders O ON C.CustomerID = O.CustomerID AND CONVERT(DATE, O.OrderDate) = '1997-07-04';
SELECT * FROM Employees E1 JOIN Employees E2 ON E1.ReportsTo = E2.EmployeeID WHERE DATEDIFF(year, E1.BirthDate, GETDATE()) > DATEDIFF(year, E2.BirthDate, GETDATE());

SELECT E1.FirstName + ' ' + E1.LastName AS EmployeeName, DATEDIFF(year, E1.BirthDate, GETDATE()) AS Age,DATEDIFF(year, E2.BirthDate, GETDATE()) AS ManagerAge FROM Employees E1 JOIN Employees E2 ON E1.ReportsTo = E2.EmployeeID WHERE DATEDIFF(year, E1.BirthDate, GETDATE()) > DATEDIFF(year, E2.BirthDate, GETDATE());
SELECT P.ProductName, O.OrderDate FROM Products P JOIN [Order Details] OD ON P.ProductID = OD.ProductID JOIN  Orders O ON OD.OrderID = O.OrderID WHERE CONVERT(DATE, O.OrderDate) = '1997-08-08';
SELECT C.Address,C.City,C.Country FROM Customers C JOIN  Orders O ON C.CustomerID = O.CustomerID WHERE O.EmployeeID = (SELECT EmployeeID FROM Employees WHERE FirstName = 'Anne') AND O.ShippedDate > O.RequiredDate;
SELECT DISTINCT  C.Country FROM Customers C JOIN Orders O ON C.CustomerID = O.CustomerID JOIN [Order Details] OD ON O.OrderID = OD.OrderID JOIN Products P ON OD.ProductID = P.ProductID WHERE P.CategoryID = 1;

