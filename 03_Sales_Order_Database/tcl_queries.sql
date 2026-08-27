-- ============================================================
-- DATABASE SYSTEMS
-- Sales Order Database – TCL Queries
-- Assessment 5 Lab
-- Name: Shreyaan Sardana
-- Reg No: 25BBS0069
-- ============================================================

-- Query 1
-- Increase the quantity of order 1 by 1 and commit the change.
START TRANSACTION;

UPDATE sales_orders
SET quantity = quantity + 1
WHERE row_id = 1;

COMMIT;


-- Query 2
-- Increase the quantity of order 2 by 5 and roll back the change.
START TRANSACTION;

UPDATE sales_orders
SET quantity = quantity + 5
WHERE row_id = 2;

ROLLBACK;


-- Query 3
-- Decrease quantity by 10, create a savepoint, increase sales by 100,
-- then roll back to the savepoint so only the later change is undone.
START TRANSACTION;

UPDATE sales_orders
SET quantity = quantity - 10
WHERE row_id = 3;

SAVEPOINT stock_updated;

UPDATE sales_orders
SET sales = sales + 100
WHERE row_id = 3;

ROLLBACK TO SAVEPOINT stock_updated;

COMMIT;


-- Query 4
-- Increase quantity for order 4, create a savepoint, delete order 5,
-- then roll back to the savepoint so the DELETE is undone.
START TRANSACTION;

UPDATE sales_orders
SET quantity = quantity + 2
WHERE row_id = 4;

SAVEPOINT points_added;

DELETE FROM sales_orders
WHERE row_id = 5;

ROLLBACK TO SAVEPOINT points_added;

COMMIT;


-- Query 5
-- Reduce sales by 10% for order 100, create a savepoint,
-- then release the savepoint and commit the transaction.
START TRANSACTION;

UPDATE sales_orders
SET sales = sales * 0.90
WHERE row_id = 100;

SAVEPOINT discount_applied;

RELEASE SAVEPOINT discount_applied;

COMMIT;


-- Query 6
-- Set the transaction isolation level to READ COMMITTED,
-- start a transaction and retrieve order 101.
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT *
FROM sales_orders
WHERE row_id = 101
LIMIT 0, 1000;

COMMIT;


-- Query 7
-- Decrease the quantity of order 205 by 3 and commit the change.
START TRANSACTION;

UPDATE sales_orders
SET quantity = quantity - 3
WHERE row_id = 205;

COMMIT;


-- Query 8
-- Increase quantity and decrease profit for order 205 after creating
-- a savepoint. Roll back to the savepoint so the profit change is undone.
START TRANSACTION;

UPDATE sales_orders
SET quantity = quantity + 3
WHERE row_id = 205;

SAVEPOINT refund_points;

UPDATE sales_orders
SET profit = profit - 50
WHERE row_id = 205;

ROLLBACK TO SAVEPOINT refund_points;

COMMIT;


-- Query 9
-- Increase sales by 10% for order 100 using ROUND(),
-- then roll back the update.
START TRANSACTION;

SAVEPOINT before_price_update;

UPDATE sales_orders
SET sales = ROUND(sales * 1.10, 2)
WHERE row_id = 100;

ROLLBACK TO SAVEPOINT before_price_update;

COMMIT;


-- Query 10
-- Decrease quantity for order 301, create a savepoint,
-- decrease quantity for order 302, then roll back to the savepoint.
START TRANSACTION;

UPDATE sales_orders
SET quantity = quantity - 1
WHERE row_id = 301;

SAVEPOINT item1_reserved;

UPDATE sales_orders
SET quantity = quantity - 1
WHERE row_id = 302;

ROLLBACK TO SAVEPOINT item1_reserved;

COMMIT;
