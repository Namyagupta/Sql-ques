--Consecutive Available Seats
/*
Table: Cinema

+-------------+------+
| Column Name | Type |
+-------------+------+
| seat_id     | int  |
| free        | bool |
+-------------+------+
seat_id is an auto-increment primary key column for this table.
Each row of this table indicates whether the ith seat is free or not. 1 means free while 0 means occupied.
 

Write an SQL query to report all the consecutive available seats in the cinema.

Return the result table ordered by seat_id in ascending order.

*/

SELECT DISTINCT c1.seat_id
FROM cinema c1 JOIN cinema c2
ON c1.seat_id=c2.seat_id-1 OR c1.seat_id=c2.seat_id+1
WHERE c1.free=1 AND c2.free=1
ORDER BY c1.seat_id ASC;
