/*
Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

Write an SQL query to report the first login date for each player.
*/
SELECT player_id, event_date as first_login FROM (
    SELECT *, 
    DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date ASC) as RNK FROM Activity
) AS temp
WHERE RNK=1;
