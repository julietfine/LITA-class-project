---Project 2: Customer Segmentation for a Subscription Service---

select * from [dbo].[CustomerData$]



-- Task 1: retrieve the total number of customers from each region
SELECT Region, COUNT(*) AS TotalCustomers
FROM CustomerData$
GROUP BY Region;

--- Task 2: find the most popular subscription type by the number of customers.
SELECT TOP 1 SubscriptionType, COUNT(*) AS NumberOfCustomers
FROM CustomerData$
GROUP BY SubscriptionType
ORDER BY NumberOfCustomers DESC;

-- Task 3: find customers who canceled their subscription within 6 months.
SELECT CustomerID, CustomerName, Region, SubscriptionType, SubscriptionStart, SubscriptionEnd, Revenue
FROM CustomerData$
WHERE Canceled = 'TRUE' AND DATEDIFF(month, SubscriptionStart, SubscriptionEnd) <= 6;


--- Task 4: calculate the average subscription duration for all customers.
SELECT AVG(DATEDIFF(day, SubscriptionStart, SubscriptionEnd)) AS AverageSubscriptionDuration
FROM CustomerData$;

SELECT CustomerID, CustomerName, AVG(DATEDIFF(day, SubscriptionStart, SubscriptionEnd)) AS AverageSubscriptionDuration
FROM CustomerData$
GROUP BY CustomerID, CustomerName;


--- Task 5: find customers with subscriptions longer than 12 months.
SELECT CustomerID, CustomerName, SubscriptionStart, SubscriptionEnd, Revenue
FROM CustomerData$
WHERE DATEDIFF(day, SubscriptionStart, SubscriptionEnd) > 365;



--- Task 6: calculate total revenue by subscription type.
SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
FROM CustomerData$
GROUP BY SubscriptionType;



--- Task 7: find the top 3 regions by subscription cancellations.
SELECT TOP 3 Region, COUNT(*) AS CancellationCount
FROM CustomerData$
WHERE Canceled = 'TRUE'
GROUP BY Region
ORDER BY CancellationCount DESC;



--- Task 8: find the total number of active and canceled subscriptions.

SELECT 
    SUM(CASE WHEN Canceled = 'FALSE' THEN 1 ELSE 0 END) AS ActiveSubscriptions,
    SUM(CASE WHEN Canceled = 'TRUE' THEN 1 ELSE 0 END) AS CanceledSubscriptions
FROM CustomerData$;

