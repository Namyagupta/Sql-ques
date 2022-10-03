/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* * * * * 
* * * * 
* * * 
* * 
*
Write a query to print the pattern P(20).
*/

DECLARE @i INT
SELECT @i = 20
WHILE @i>0
BEGIN
   PRINT REPLICATE('* ', @i)
   SET @i=@i-1
END
