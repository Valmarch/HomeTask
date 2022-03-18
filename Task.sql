--1 Топ-3 покупців за сумою замовлень
SELECT Customers.CustomerName, Customers.CustomerID,
SUM(OrderDetails.Quantity * Products.Price) AS Cost
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON OrderDetails.OrderID = OrderDetails.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY Customers.CustomerID
ORDER BY Cost DESC
LIMIT 3



--2 Топ-3 покупців за кількістю замовлень
SELECT Customers.CustomerName, Customers.CustomerID, COUNT() AS
OrdersCount
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID
ORDER BY OrdersCount DESC
LIMIT 3


--3 Найдорожче замовлення
SELECT OrderDetails.OrderID, SUM(OrderDetails.Quantity * Products.Price) AS
Cost
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY OrderDetails.OrderID
ORDER BY Cost DESC
LIMIT 1


--4 Середня вартість замовлення в категорії “Meat/Poultry”
SELECT AVG (Price) AS Average_price FROM (
SELECT OrderDetails.OrderID, Products.CategoryID, Products.Price *
OrderDetails.Quantity AS Price
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE Products.CategoryID = 6
GROUP BY OrderDetails.OrderID) Average_price
GROUP BY Average_price.CategoryID