-- Write an SQL query to report the names of all the salespersons who did not have any orders related to the company with the name "RED". Return the result table in any order.

# Write your MySQL query statement below
SELECT s.name
FROM SalesPerson s
WHERE s.sales_id 
NOT IN (
    SELECT s.sales_id FROM Orders o 
    JOIN SalesPerson s ON o.sales_id=s.sales_id
    JOIN Company c ON o.com_id=c.com_id
    WHERE c.name = 'RED'
);
