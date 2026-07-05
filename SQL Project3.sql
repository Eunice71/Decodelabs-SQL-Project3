USE decodelabs_project3;

RENAME TABLE `cleaned-orders-dataset` TO orders;

SELECT COUNT(*) AS TotalRows
FROM orders;

USE decodelabs_project3;

SELECT COUNT(*) AS TotalRows
FROM orders;



SELECT OrderID, Product, Quantity, UnitPrice, TotalPrice
FROM orders
LIMIT 10;

# how many orders got cancelled, filter with WHERE
SELECT COUNT(*) AS CancelledCount
FROM orders
WHERE OrderStatus = 'Cancelled';

# top 10 highest or bulk purchase, sort purchase by ORDER BY
SELECT OrderID, Product, Quantity, UnitPrice, TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 10;

# product with the highest revenue, highest average order, aggregate with GROUP BY
SELECT Product,
       COUNT(*) AS NumOrders,
       SUM(TotalPrice) AS TotalRevenue,
       ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM orders
GROUP BY Product
ORDER BY TotalRevenue DESC;

# combine WHERE & GROUP BY to filter cancelled orders
SELECT PaymentMethod,
       COUNT(*) AS NumOrders
FROM orders
WHERE OrderStatus = 'Cancelled'
GROUP BY PaymentMethod
ORDER BY NumOrders DESC;

# products that fall below the 1,000 average order value threshold, filter groups with HAVING
SELECT Product,
       COUNT(*) AS NumOrders,
       ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM orders
GROUP BY Product
HAVING AVG(TotalPrice) > 1000
ORDER BY AvgOrderValue DESC;

# to know the percentage distribution
SELECT OrderStatus,
       COUNT(*) AS NumOrders,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS PercentOfTotal
FROM orders
GROUP BY OrderStatus
ORDER BY NumOrders DESC;

