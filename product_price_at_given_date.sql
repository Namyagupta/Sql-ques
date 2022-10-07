/*
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 

Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.

*/

select * from (
    select product_id, new_price as price from Products
        where (product_id, change_date) in (
            select product_id, max(change_date) from Products
                where change_date <= '2019-08-16'
                group by product_id
        )
    union
        select distinct product_id, 10 as price from Products
            where product_id not in (
                select product_id from Products
                    where change_date <= '2019-08-16'
            )
    ) union_result;
