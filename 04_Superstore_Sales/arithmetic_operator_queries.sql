-- ============================================================
--               DATABASE SYSTEMS - SUPERSTORE SALES
--               Assessment 5: Arithmetic Operators
-- ============================================================

-- Q1. Calculate the unit price for each order by dividing
-- Sales by Quantity.
SELECT Order_ID, Sales, Quantity,
       Sales / Quantity AS UnitPrice
FROM superstore;

-- Q2. Calculate the discount amount in currency.
SELECT Order_ID, Sales, Discount,
       Sales * Discount AS Discount_Amount
FROM superstore;

-- Q3. Calculate the net sales after discount.
SELECT Order_ID, Sales, Discount,
       Sales * (1 - Discount) AS Net_Sales
FROM superstore;

-- Q4. Find the profit margin percentage for each order.
SELECT Order_ID, Sales, Profit,
       (Profit / Sales) * 100 AS Profit_Margin_Percentage
FROM superstore;

-- Q5. Calculate the cost price of each order.
SELECT Order_ID, Sales, Profit,
       Sales - Profit AS Cost_Price
FROM superstore;

-- Q6. Add a flat shipping charge of 50 to every order.
SELECT Order_ID, Sales,
       Sales + 50 AS Sales_With_Shipping
FROM superstore;

-- Q7. Calculate Sales including 12% tax.
SELECT Order_ID, Sales,
       Sales + (Sales * 0.12) AS Sales_With_Tax
FROM superstore;

-- Q8. Find orders where Quantity is even.
SELECT *
FROM superstore
WHERE Quantity % 2 = 0;

-- Q9. Calculate average profit per unit.
SELECT Order_ID, Profit, Quantity,
       Profit / Quantity AS Average_Profit_Per_Unit
FROM superstore;

-- Q10. Increase every product's Sales value by 15%.
SELECT Order_ID, Sales,
       Sales * 1.15 AS Increased_Sales
FROM superstore;

-- Q11. Calculate total revenue per category.
SELECT Category,
       SUM(Sales) AS Total_Revenue
FROM superstore
GROUP BY Category;

-- Q12. Find the difference between Sales and Profit.
SELECT Order_ID, Sales, Profit,
       Sales - Profit AS Total_Cost_Expense
FROM superstore;

-- Q13. Calculate shipping delay in days.
SELECT Order_ID, OrderDate, ShipDate,
       DATEDIFF(ShipDate, OrderDate) AS Shipping_Delay_Days
FROM superstore;

-- Q14. Find orders where half of Sales is greater than Profit.
SELECT *
FROM superstore
WHERE Sales / 2 > Profit;

-- Q15. Calculate discount-adjusted profit.
SELECT Order_ID, Sales, Discount, Profit,
       Profit - (Sales * Discount) AS Discount_Adjusted_Profit
FROM superstore;

-- Q16. Calculate each order's percentage contribution to
-- the total Sales of its Category.
SELECT Order_ID, Category, Sales,
       (Sales / SUM(Sales) OVER (PARTITION BY Category)) * 100
           AS Category_Sales_Contribution_Percentage
FROM superstore;

-- Q17. Find the squared difference between Sales and Profit.
SELECT Order_ID, Sales, Profit,
       (Sales - Profit) * (Sales - Profit) AS Squared_Difference
FROM superstore;

-- Q18. Calculate total quantity sold per region.
SELECT Region,
       SUM(Quantity) AS Total_Quantity_Sold
FROM superstore
GROUP BY Region;

-- Q19. Estimate annual revenue for each customer by multiplying
-- average monthly sales by 12.
SELECT Customer_Name,
       AVG(Sales) AS Average_Monthly_Sales,
       AVG(Sales) * 12 AS Estimated_Annual_Revenue
FROM superstore
GROUP BY Customer_Name;

-- Q20. Calculate the break-even quantity using:
-- (Sales - Profit) / UnitPrice
-- UnitPrice is represented by Sales / Quantity.
SELECT Order_ID, Sales, Profit, Quantity,
       (Sales - Profit) / (Sales / Quantity) AS Break_Even_Quantity
FROM superstore;
