CREATE DATABASE retail_sales;
USE retail_sales;

SELECT COUNT(*)
FROM orders;

SELECT *
FROM orders
LIMIT 10;

SELECT
ROUND(SUM(Sales),2) AS Total_Revenue
FROM orders;

SELECT
ROUND(SUM(Profit),2) AS Total_Profit
FROM orders;

SELECT
COUNT(DISTINCT 'Order ID')
FROM orders;

SELECT
COUNT(DISTINCT 'Customer ID')
FROM orders;

# Analysis 1: Revenue by Region
SELECT
Region,
ROUND(SUM(Sales),2) AS Revenue
FROM orders
GROUP BY Region
ORDER BY Revenue DESC;

# Analysis 2: Profit by Region
SELECT
Region,
ROUND(SUM(Profit),2) AS Profit
FROM orders
GROUP BY Region
ORDER BY Profit DESC;

# Analysis 3: Top 10 Customers
SELECT
`Customer Name`,
ROUND(SUM(Sales),2) AS Revenue
FROM orders
GROUP BY `Customer Name`
ORDER BY Revenue DESC
LIMIT 10;

# Analysis 4: Top 10 Products
SELECT
`Product Name`,
ROUND(SUM(Sales),2) AS Revenue
FROM orders
GROUP BY `Product Name`
ORDER BY Revenue DESC
LIMIT 10;

# Analysis 5: Loss Making Products
SELECT
`Product Name`,
ROUND(SUM(Profit),2) AS Profit
FROM orders
GROUP BY `Product Name`
HAVING Profit < 0
ORDER BY Profit ASC
LIMIT 10;

# Analysis 6: Category Performance
SELECT
Category,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(SUM(Profit),2) AS Profit
FROM orders
GROUP BY Category
ORDER BY Revenue DESC;

# Analysis 7: Sub Category Performance
SELECT
`Sub-Category`,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(SUM(Profit),2) AS Profit
FROM orders
GROUP BY `Sub-Category`
ORDER BY Revenue DESC;

# Analysis 8: Discount Impact
SELECT
Discount,
ROUND(AVG(Profit),2) AS Avg_Profit
FROM orders
GROUP BY Discount
ORDER BY Discount;

# Analysis 9: Profit Margin by Category
SELECT
Category,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(SUM(Profit),2) AS Profit,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM orders
GROUP BY Category
ORDER BY Profit_Margin DESC;

#Analysis 10: Top 10 Most Profitable Products
SELECT
`Product Name`,
ROUND(SUM(Profit),2) AS Profit
FROM orders
GROUP BY `Product Name`
ORDER BY Profit DESC
LIMIT 10;

#Analysis 11: Top 10 Most profitable customers 
SELECT
`Customer Name`,
ROUND(SUM(Profit),2) AS Profit
FROM orders
GROUP BY `Customer Name`
ORDER BY Profit DESC
LIMIT 10;

#Analysis 12: Region Profit Margin
SELECT
Region,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(SUM(Profit),2) AS Profit,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Margin_Percent
FROM orders
GROUP BY Region
ORDER BY Margin_Percent DESC;

# Analysis 13: Monthly Sales Trend
SELECT
MIN(`Order Date`),
MAX(`Order Date`)
FROM orders;

SELECT COUNT(*) AS Total_Rows
FROM orders;

SELECT
ROUND(SUM(Sales),2) AS Total_Revenue
FROM orders;

DROP TABLE orders;

