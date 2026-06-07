USE retail_sales;

# Top 20% Customers Contribution (Pareto Analysis)
SELECT
`Customer Name`,
ROUND(SUM(Sales),2) AS Revenue
FROM orders
GROUP BY `Customer Name`
ORDER BY Revenue DESC;

# Customer Ranking (Window Function)
SELECT
`Customer Name`,
ROUND(SUM(Sales),2) AS Revenue,
RANK() OVER(
ORDER BY SUM(Sales) DESC
) AS Customer_Rank
FROM orders
GROUP BY `Customer Name`;

# Category Ranking
SELECT
Category,
ROUND(SUM(Profit),2) AS Profit,
RANK() OVER(
ORDER BY SUM(Profit) DESC
) AS Profit_Rank
FROM orders
GROUP BY Category;

# High Value Customers
SELECT
`Customer Name`,
ROUND(SUM(Sales),2) AS Revenue
FROM orders
GROUP BY `Customer Name`
HAVING Revenue > 1000
ORDER BY Revenue DESC;

WITH customer_sales AS (
    SELECT
        `Customer Name`,
        SUM(Sales) AS Revenue
    FROM orders
    GROUP BY `Customer Name`
)
# Customer Segmentation
SELECT
    `Customer Name`,
    ROUND(Revenue,2) AS Revenue,
    CASE
        WHEN Revenue >= 1000 THEN 'High Value'
        WHEN Revenue >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segment
FROM customer_sales
ORDER BY Revenue DESC;
