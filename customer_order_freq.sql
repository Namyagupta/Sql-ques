/*
Table: Customers

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| country       | varchar |
+---------------+---------+
customer_id is the primary key for this table.
This table contains information about the customers in the company.
 

Table: Product

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| description   | varchar |
| price         | int     |
+---------------+---------+
product_id is the primary key for this table.
This table contains information on the products in the company.
price is the product cost.
 

Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| customer_id   | int     |
| product_id    | int     |
| order_date    | date    |
| quantity      | int     |
+---------------+---------+
order_id is the primary key for this table.
This table contains information on customer orders.
customer_id is the id of the customer who bought "quantity" products with id "product_id".
Order_date is the date in format ('YYYY-MM-DD') when the order was shipped.
 

Write an SQL query to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020.
*/

SELECT o.customer_id, c.name FROM Orders o 
JOIN Customers c ON o.customer_id=c.customer_id
JOIN Product p ON o.product_id=p.product_id
GROUP BY o.customer_id HAVING(
    SUM(CASE WHEN o.order_date LIKE '2020-06%' THEN o.quantity*p.price ELSE 0 END)>=100
    AND
    SUM(CASE WHEN o.order_date LIKE '2020-07%' THEN o.quantity*p.price ELSE 0 END)>=100
)
