/*
Table: Products

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| product_id       | int     |
| product_name     | varchar |
| product_category | varchar |
+------------------+---------+
product_id is the primary key for this table.
This table contains data about the company's products.
 

Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| order_date    | date    |
| unit          | int     |
+---------------+---------+
There is no primary key for this table. It may have duplicate rows.
product_id is a foreign key to the Products table.
unit is the number of products ordered in order_date.
 

Write an SQL query to get the names of products that have at least 100 units ordered in February 2020 and their amount.
*/

# Write your MySQL query statement below
SELECT p.product_name, SUM(o.unit) as unit
FROM Products p JOIN Orders o
ON p.product_id=o.product_id
WHERE o.order_date LIKE '2020-02%'
GROUP BY p.product_id HAVING SUM(o.unit)>=100;
