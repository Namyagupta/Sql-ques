--Q. Write a query to find no of gold medals per swimmer who won only gold medal

/* CREATE TABLE events (
ID int,
event varchar(255),
YEAR INt,
GOLD varchar(255),
SILVER varchar(255),
BRONZE varchar(255)
); 

delete from events;

INSERT INTO events VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
INSERT INTO events VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
INSERT INTO events VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
INSERT INTO events VALUES (4,'100m',2016, 'Ronald','maria','paula');
INSERT INTO events VALUES (5,'200m',2016, 'Alfred','carol','Steven');
INSERT INTO events VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
INSERT INTO events VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
INSERT INTO events VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
INSERT INTO events VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO events VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
INSERT INTO events VALUES (12,'500m',2016,'Thomas','Steven','Catherine');
*/

--Solution 1 (Sub Query): 
SELECT GOLD AS Player_Name, COUNT(*) AS No_of_Medals
FROM events
WHERE GOLD NOT IN (SELECT SILVER FROM events UNION ALL SELECT BRONZE FROM events)
GROUP BY GOLD;

--SOLUTION 2 (GROUP BY having CTE):
WITH CTE AS (SELECT GOLD as player_name, 'gold' as medal_type FROM events UNION ALL
SELECT SILVER as player_name, 'silver' as medal_type FROM events UNION ALL 
SELECT BRONZE as player_name, 'bronze' as medal_type FROM events)
SELECT player_name, COUNT(1) as No_of_Gold
FROM CTE 
GROUP BY player_name
HAVING COUNT(distinct medal_type)=1 AND max(medal_type)='gold'
