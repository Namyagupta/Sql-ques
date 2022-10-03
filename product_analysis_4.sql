/*
Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| user_id     | int   |
| quantity    | int   |
+-------------+-------+
sale_id is the primary key of this table.
product_id is a foreign key to Product table.
Each row of this table shows the ID of the product and the quantity purchased by a user.
Table: Product

+-------------+------+
| Column Name | Type |
+-------------+------+
| product_id  | int  |
| price       | int  |
+-------------+------+
product_id is the primary key of this table.
Each row of this table indicates the price of each product.
Write an SQL query that reports for each user the product id on which the user spent the most money. In case the same user spent the most money on two or more products, report all of them.
*/

SELECT user_id, product_id FROM
( SELECT s.product_id, s.user_id, SUM(quantity*price) as amount,
 DENSE_RANK() OVER(PARTITION BY s.user_id ORDER BY SUM(s.quantity*p.price) DESC) as RNK
 FROM Sales s JOIN Product p ON s.product_id=p.product_id
 GROUP BY s.user_id, s.product_id
) temp
WHERE RNK=1;
