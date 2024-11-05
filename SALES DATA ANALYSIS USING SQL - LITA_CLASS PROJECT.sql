select * from SalesData$

--- Task 1: Retrieving the total sales for each product category.
SELECT 
    Product,
    SUM(Quantity * UnitPrice) AS TotalSales
FROM 
    SalesData$
GROUP BY 
    Product
ORDER BY 
    TotalSales DESC;

--- Task 2: Finding the number of sales transactions in each region.
SELECT 
    Region,
    COUNT(OrderID) AS NumberOfTransactions
FROM 
    SalesData$
GROUP BY 
    Region
ORDER BY 
    NumberOfTransactions DESC;


---Task 3: Find the highest-selling product by total sales value.
SELECT 
    Product,
    SUM(Quantity * UnitPrice) AS TotalSales
FROM 
    SalesData$
GROUP BY 
    Product
ORDER BY 
    TotalSales DESC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;


--- Task 4: calculate total revenue per product.
SELECT 
    Product,
        SUM(Quantity*UnitPrice) AS TotalRevenue
FROM 
    SalesData$
GROUP BY 
    Product
ORDER BY 
    TotalRevenue DESC;

--- Task 5: calculate monthly sales totals for the current year
SELECT 
    FORMAT(OrderDate, 'MMMM') AS SaleMonth,
    SUM(Quantity * UnitPrice) AS MonthlySales
FROM 
    SalesData$
WHERE 
    YEAR(OrderDate) = YEAR(GETDATE())  -- Filter for the current year
GROUP BY 
    FORMAT(OrderDate, 'MMMM'), DATEPART(MONTH, OrderDate)
ORDER BY 
    DATEPART (MONTH, OrderDate);

--- Task 6: find the top 5 customers by total purchase amount
SELECT 
    "Customer Id",
        SUM(Quantity * UnitPrice) AS TotalPurchaseAmount
FROM 
    SalesData$
GROUP BY 
    "Customer Id"
ORDER BY 
    TotalPurchaseAmount DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

--- Adding a new column called TotalSales
ALTER TABLE SalesData$
ADD TotalSales AS (Quantity * UnitPrice);


---Task 7: calculate the percentage of total sales contributed by each region
SELECT 
    Region,
    SUM(TotalSales) AS RegionalSales,
    (SUM(TotalSales) * 100.0 / (SELECT SUM(TotalSales) FROM SalesData$)) AS 'SalesPercentage(%)'
FROM 
    SalesData$
GROUP BY 
    Region
ORDER BY 
    'SalesPercentage(%)' DESC;

---Task 8: identify products with no sales in the last quarter
SELECT 
    Product
FROM 
    SalesData$
WHERE 
    OrderDate>= DATEADD(QUARTER, -1, GETDATE()) 
            AND OrderDate < GETDATE()
			AND Product IS NULL;

-- Define the last quarter start date (3 months ago)
DECLARE @LastQuarterStartDate DATE = DATEADD(MONTH, -3, GETDATE());

SELECT 
    DISTINCT Product
FROM 
    SalesData$
WHERE 
    Product NOT IN (
        SELECT 
            Product
        FROM 
            SalesData$
        WHERE 
            OrderDate >= @LastQuarterStartDate
    );
