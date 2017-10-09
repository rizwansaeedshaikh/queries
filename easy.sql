STATION TABLE		
-------------------------
FIELD 	|	TYPE		|
-------------------------
ID		|	NUMBER		|
CITY	|	VARCHAR2(2)	|
STATE	|	VARCHAR2(2)	|
LAT_N	|	NUMBER		|
LONG_W	|	NUMBER		|
-------------------------

Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order, but must exclude duplicates from your answer.
ORACLE, DB2, MYSQL
SELECT DISTINCT CITY FROM STATION WHERE MOD(ID,2) = 0;

Let be the number of CITY entries in STATION, and let be the number of distinct CITY names in STATION; query the value of from STATION. In other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
ORACLE, DB2, MYSQL
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;

Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
Sample Output
ABC 3
PQRS 4
Explanation
When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with the respective lengths and . The longest-named city is obviously PQRS, but there are options for shortest-named city; we choose ABC, because it comes first alphabetically.
Oracle
SELECT * FROM (SELECT CITY , LENGTH(CITY) FROM STATION GROUP BY CITY HAVING LENGTH(CITY) = (SELECT MAX(LENGTH(CITY)) FROM STATION) ORDER BY CITY ASC)  WHERE ROWNUM = 1 ; 
SELECT * FROM (SELECT  CITY , LENGTH(CITY) FROM STATION GROUP BY CITY HAVING LENGTH(CITY) = (SELECT MIN(LENGTH(CITY)) FROM STATION) ORDER BY CITY ASC) WHERE ROWNUM = 1 ;

MySQL and DB2
SELECT CITY , LENGTH(CITY) FROM STATION GROUP BY CITY HAVING LENGTH(CITY) = (SELECT MAX(LENGTH(CITY)) FROM STATION) ORDER BY CITY ASC LIMIT 1; 
SELECT CITY , LENGTH(CITY) FROM STATION GROUP BY CITY HAVING LENGTH(CITY) = (SELECT MIN(LENGTH(CITY)) FROM STATION) ORDER BY CITY ASC LIMIT 1;

