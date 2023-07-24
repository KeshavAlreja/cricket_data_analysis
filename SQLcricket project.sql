
-- chech whether the odi batting data has any null value
SELECT COUNT(*) AS TotalRows
FROM ODI_batting
WHERE Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or runs is null
   or hs is null
   or ave is null
   or bf is null
   or sr is null
   or 100 is null
   or 50 is null
   or 0 is null;

   select * from odi_batting
   
   -- Deleting all the rows that had null values in it.

  delete from ODI_batting
  FROM ODI_batting
WHERE Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or runs is null
   or hs is null
   or ave is null
   or bf is null
   or sr is null
   or 100 is null
   or 50 is null
   or 0 is null;

   

select * from odi_bowling

-- changing column names that are starting with underscore(_)

EXEC sp_rename 't20_batting.[_100]', '100', 'COLUMN';
 EXEC sp_rename 't20_batting.[_50]', '50', 'COLUMN';
 EXEC sp_rename 't20_batting.[_0]', '0', 'COLUMN';
 EXEC sp_rename 't20_batting.[_6s]', '6s', 'COLUMN';
 EXEC sp_rename 't20_batting.[_4s]', '4s', 'COLUMN';

-- chech whether the t20 data has any null value
SELECT *
FROM t20_batting
WHERE Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or runs is null
   or hs is null
   or ave is null
   or bf is null
   or sr is null
   or [100] is null
   or [50] is null
   or [0] is null
   or [4s] is null
   or [6s] is null;
  
  -- Deleting all the rows that had null values in it.
 
 DELETE FROM t20_batting
 WHERE Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   OR inns IS NULL
   OR runs IS NULL
   OR hs IS NULL
   OR ave IS NULL
   OR bf IS NULL
   OR sr IS NULL
   OR [100] IS NULL
   OR [50] IS NULL
   OR [0] IS NULL
   OR [4s] IS NULL
   OR [6s] IS NULL;


select  * from test_batting

-- changing column names that are starting with underscore(_)

EXEC sp_rename 'test_batting.[_100]', '100', 'COLUMN';
 EXEC sp_rename 'test_batting.[_50]', '50', 'COLUMN';
 EXEC sp_rename 'test_batting.[_0]', '0', 'COLUMN';

 -- chech whether the test data has any null value

SELECT *
FROM test_batting
WHERE Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or runs is null
   or hs is null
   or ave is null
   or [100] is null
   or [50] is null
   or [0] is null;


   DELETE FROM test_batting
 WHERE Player IS NULL
  OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or runs is null
   or hs is null
   or ave is null
   or [100] is null
   or [50] is null
   or [0] is null;


-- updating blank values into null values in ave column in odi_batting table

   UPDATE ODI_batting
SET Ave = NULL
WHERE Ave = '-';


-- changing data type of AVE(odi_batting) from varchar to float

ALTER TABLE odi_batting
ALTER COLUMN ave float;


   -- updating blank values into null values in sr column in odi_batting table

   UPDATE ODI_batting
SET SR = NULL
WHERE sr = '-';




-- changing data type of SR from varchar to float

ALTER TABLE odi_batting
ALTER COLUMN SR float;

ALTER TABLE t20_batting
ALTER COLUMN [4s] float;

ALTER TABLE t20_batting
ALTER COLUMN [6s] float;

ALTER TABLE t20_batting
ALTER COLUMN BF float;



   -- Add new columns to the table to split the span column into two column
ALTER TABLE odi_batting
ADD start_year INT,
    end_year INT;

ALTER TABLE t20_batting
ADD start_year INT,
    end_year INT;

ALTER TABLE test_batting
ADD start_year INT,
    end_year INT;







	

	select * from odi_batting

	

  

-- Update the new columns with values from the "span" column
UPDATE ODI_batting
SET start_year = SUBSTRING(span, 1, 4),
    end_year = SUBSTRING(span, 6, 4);

UPDATE t20_batting
SET start_year = SUBSTRING(span, 1, 4),
    end_year = SUBSTRING(span, 6, 4);


	
UPDATE test_batting
SET start_year = SUBSTRING(span, 1, 4),
    end_year = SUBSTRING(span, 6, 4);

	select top 5* from ODI_batting
	select top 5* from t20_batting
	select top 5* from test_batting

	-- rounding the decimal values upto 2 places in SR column in t20 batting 
UPDATE t20_batting
SET SR = round (SR, 2) 
   
--- deleting the unnamed column from test and t20 batting table that has nothing in it 

ALTER TABLE t20_batting
DROP COLUMN unnamed_15

ALTER TABLE test_batting
DROP COLUMN unnamed_11

-- chech whether the odi_bowling data has any null value

   SELECT COUNT(*) AS TotalRows
FROM ODI_bowling
WHERE [S.No] IS NULL
   OR Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or balls is null
   or runs is null
   or wkts is null
   or bbi is null
   or ave is null
   or econ is null
   or sr is null
   or 4 is null
   or 5 is null;
   select * from odi_bowling

-- Deleting all the rows that had null values in it.

delete from odi_bowling
WHERE [S.No] IS NULL
   OR Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or balls is null
   or runs is null
   or wkts is null
   or bbi is null
   or ave is null
   or econ is null
   or sr is null
   or _4 is null
   or _5 is null;

-- deleting the unnamed coolumn

ALTER TABLE odi_bowling
DROP COLUMN unnamed_13

-- changing column names that are starting with underscore(_)

 EXEC sp_rename 'odi_bowling.[_4]', '4', 'COLUMN';
 EXEC sp_rename 'odi_bowling.[_5]', '5', 'COLUMN';

    -- Add new columns to the table to split the span column into two column
ALTER TABLE odi_bowling
ADD start_year INT,
    end_year INT;

	UPDATE ODI_bowling
SET start_year = SUBSTRING(span, 1, 4),
    end_year = SUBSTRING(span, 6, 4);


	-- rounding the decimal values upto 2 places in Econ and SR column in odi bowling
UPDATE odi_bowling
SET econ = round (econ, 2)

UPDATE odi_bowling
SET sr = round (sr, 2)

-- Cleaning the t20_bowling data

select * from t20_bowling

EXEC sp_rename 't20_bowling.column1', 'S_no', 'COLUMN';





SELECT COUNT(*) AS TotalRows
FROM t20_bowling
WHERE [S_No] IS NULL
   OR Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or overs is null
   or mdns is null
   or runs is null
   or wkts is null
   or bbi is null
   or ave is null
   or econ is null
   or sr is null
   or 4 is null
   or 5 is null;
   

-- Deleting all the rows that had null values in it.

delete from t20_bowling
WHERE [S_No] IS NULL
   OR Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or overs is null
   or mdns is null
   or runs is null
   or wkts is null
   or bbi is null
   or ave is null
   or econ is null
   or sr is null
   or 4 is null
   or 5 is null;
-- deleting the unnamed coolumn

ALTER TABLE t20_bowling
DROP COLUMN unnamed_14

ALTER TABLE t20_bowling
DROP COLUMN bbi





    -- Add new columns to the table to split the span column into two column
ALTER TABLE t20_bowling
ADD start_year INT,
    end_year INT;

	UPDATE t20_bowling
SET start_year = SUBSTRING(span, 1, 4),
    end_year = SUBSTRING(span, 6, 4);

	


	-- rounding the decimal values upto 2 places in Econ and SR column in odi bowling
UPDATE t20_bowling
SET econ = round (econ, 2)

UPDATE t20_bowling
SET sr = round (sr, 2)



-- Cleaning the test_bowling data

select * from test_bowling

EXEC sp_rename 'test_bowling.column1', 'S_no', 'COLUMN';



select [s_no] from t20_bowling

SELECT COUNT(*) AS TotalRows
FROM test_bowling
WHERE [S_No] IS NULL
   OR Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or balls is null
   or runs is null
   or wkts is null
   or bbi is null
   or ave is null
   or econ is null
   or sr is null
   or _5 is null
   or _10 is null;
   



-- deleting the unnamed coolumn

ALTER TABLE test_bowling
DROP COLUMN unnamed_14


    -- Add new columns to the table to split the span column into two column
ALTER TABLE test_bowling
ADD start_year INT,
    end_year INT;

	UPDATE test_bowling
SET start_year = SUBSTRING(span, 1, 4),
    end_year = SUBSTRING(span, 6, 4);

	


	-- rounding the decimal values upto 2 places in Econ and SR column
UPDATE test_bowling
SET econ = round (econ, 2)

UPDATE test_bowling
SET sr = round (sr, 2)

-- Updating the odi fielding data

EXEC sp_rename 'odi_fielding.column1', 'S_no', 'COLUMN';
EXEC sp_rename 'odi_fielding.Dis', 'Dismissals', 'COLUMN';
EXEC sp_rename 'odi_fielding.ct', 'catches', 'COLUMN';
EXEC sp_rename 'odi_fielding.st', 'stumping', 'COLUMN';
EXEC sp_rename 'odi_fielding.caught wk', 'caught_wk', 'COLUMN';
EXEC sp_rename 'odi_fielding.ct_fi', 'caught_fielding', 'COLUMN';
EXEC sp_rename 'odi_fielding.md', 'most_dismissals', 'COLUMN';
EXEC sp_rename 'odi_fielding.D_I', 'Dismissals_per_inn', 'COLUMN';

select * from odi_fielding

SELECT COUNT(*) AS TotalRows
FROM odi_fielding
WHERE [S_No] IS NULL
   OR Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or dismissals is null
   or catches is null
   or stumping is null
   or caught_wk is null
   or caught_fielding is null
   or most_dismissals is null
   or dismissals_per_inn is null;

ALTER TABLE odi_fielding
DROP COLUMN unnamed_11
   


ALTER TABLE odi_fielding
ADD start_year INT,
    end_year INT;

	UPDATE odi_fielding
SET start_year = SUBSTRING(span, 1, 4),
    end_year = SUBSTRING(span, 6, 4);

	 

	-- rounding the decimal values upto 2 places in dismissals per inn column
UPDATE odi_fielding
SET dismissals_per_inn = round (dismissals_per_inn, 2)

-- Updating the t20 fielding data

EXEC sp_rename 't20_fielding.column1', 'S_no', 'COLUMN';
EXEC sp_rename 't20_fielding.Dis', 'Dismissals', 'COLUMN';
EXEC sp_rename 't20_fielding.ct', 'catches', 'COLUMN';
EXEC sp_rename 't20_fielding.st', 'stumping', 'COLUMN';
EXEC sp_rename 't20_fielding.ct_wk', 'caught_wk', 'COLUMN';
EXEC sp_rename 't20_fielding.ct_fi', 'caught_fielding', 'COLUMN';
EXEC sp_rename 't20_fielding.md', 'most_dismissals', 'COLUMN';
EXEC sp_rename 't20_fielding.D_I', 'Dismissals_per_inn', 'COLUMN';

select * from t20_fielding

SELECT COUNT(*) AS TotalRows
FROM t20_fielding
WHERE [S_No] IS NULL
   OR Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or dismissals is null
   or catches is null
   or stumping is null
   or caught_wk is null
   or caught_fielding is null
   or most_dismissals is null
   or dismissals_per_inn is null;

delete from t20_fielding
WHERE [S_No] IS NULL
   OR Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or dismissals is null
   or catches is null
   or stumping is null
   or caught_wk is null
   or caught_fielding is null
   or most_dismissals is null
   or dismissals_per_inn is null;


ALTER TABLE t20_fielding
DROP COLUMN unnamed_11
   


ALTER TABLE t20_fielding
ADD start_year INT,
    end_year INT;

	UPDATE t20_fielding
SET start_year = SUBSTRING(span, 1, 4),
    end_year = SUBSTRING(span, 6, 4);

	 

	-- rounding the decimal values upto 2 places in dismissals per inn column
UPDATE t20_fielding
SET dismissals_per_inn = round (dismissals_per_inn, 2)

-- Updating the test fielding data

EXEC sp_rename 'test_fielding.column1', 'S_no', 'COLUMN';
EXEC sp_rename 'test_fielding.Dis', 'Dismissals', 'COLUMN';
EXEC sp_rename 'test_fielding.ct', 'catches', 'COLUMN';
EXEC sp_rename 'test_fielding.st', 'stumping', 'COLUMN';
EXEC sp_rename 'test_fielding.ct_wk', 'caught_wk', 'COLUMN';
EXEC sp_rename 'test_fielding.ct_fi', 'caught_fielding', 'COLUMN';
EXEC sp_rename 'test_fielding.md', 'most_dismissals', 'COLUMN';
EXEC sp_rename 'test_fielding.D_I', 'Dismissals_per_inn', 'COLUMN';

select * from test_fielding

SELECT COUNT(*) AS TotalRows
FROM test_fielding
WHERE [S_No] IS NULL
   OR Player IS NULL
   OR Span IS NULL
   OR Mat IS NULL
   or inns is null
   or dismissals is null
   or catches is null
   or stumping is null
   or caught_wk is null
   or caught_fielding is null
   or most_dismissals is null
   or dismissals_per_inn is null;



ALTER TABLE test_fielding
DROP COLUMN unnamed_11
   


ALTER TABLE test_fielding
ADD start_year INT,
    end_year INT;

	UPDATE test_fielding
SET start_year = SUBSTRING(span, 1, 4),
    end_year = SUBSTRING(span, 6, 4);

	 

	-- rounding the decimal values upto 2 places in dismissals per inn column
UPDATE test_fielding
SET dismissals_per_inn = round (dismissals_per_inn, 2)

-- Add new columns for FullName and Region in odi_batting
ALTER TABLE ODI_batting
ADD FullName VARCHAR(100);

ALTER TABLE odi_batting
ADD region varchar(50);
    

-- Update the new columns with split values
UPDATE ODI_batting
SET FullName = SUBSTRING(player, 1, CHARINDEX(' (', player) - 1),
    region = SUBSTRING(player, CHARINDEX('(', player) + 1, CHARINDEX(')', player) - CHARINDEX('(', player) - 1);


EXEC sp_rename 'odi_batting.[FullName]', 'Player_name', 'COLUMN';


SELECT TOP 0 * FROM odi_batting


-- Add new columns for FullName and Region in t20_batting
ALTER TABLE T20_batting
ADD FullName VARCHAR(100);

ALTER TABLE T20_batting
ADD region varchar(50);
    

-- Update the new columns with split values
UPDATE t20_batting
SET fullname = SUBSTRING(player, 1, CHARINDEX(' (', player) - 1),
    region = SUBSTRING(player, CHARINDEX('(', player) + 1, CHARINDEX(')', player) - CHARINDEX('(', player) - 1);


EXEC sp_rename 't20_batting.[FullName]', 'Player_name', 'COLUMN';

-- Add new columns for FullName and Region for test_batting
ALTER TABLE Test_batting
ADD player_name VARCHAR(100);

ALTER TABLE test_batting
ADD region varchar(50);
    

-- Update the new columns with split values
UPDATE test_batting
SET player_name = SUBSTRING(player, 1, CHARINDEX(' (', player) - 1),
    region = SUBSTRING(player, CHARINDEX('(', player) + 1, CHARINDEX(')', player) - CHARINDEX('(', player) - 1);

--creating duplicate tables  for better understanding

create table batting_odi(
	Player_name varchar(100)
	,mat varchar(50)
	,inns varchar(50)
	,[no] varchar(50)
	,runs int
	,hs varchar(50)
	,ave float
	,bf varchar(50)
	,sr float
	,[100] int
    ,[50] varchar(50)
	,[0] varchar(50)
	,Country varchar(50)
	,start_year int
	,end_year int
	);
	
 insert into batting_odi(
 Player_name 
	,mat 
	,inns 
	,[no] 
	,runs 
	,hs 
	,ave 
	,bf 
	,sr 
	,[100] 
    ,[50] 
	,[0]
	,Country
	,start_year 
	,end_year)
select 	
       Player_name 
	,mat 
	,inns 
	,[no] 
	,runs 
	,hs 
	,ave 
	,bf 
	,sr 
	,[100] 
    ,[50] 
	,[0]
	,region
	,start_year 
	,end_year

from odi_batting;  

select * from batting_odi

create table batting_t20(
	Player_name varchar(100)
	,mat varchar(50)
	,inns varchar(50)
	,[no] varchar(50)
	,runs int
	,hs varchar(50)
	,ave float
	,bf varchar(50)
	,sr float
	,[100] varchar(50)
    ,[50] varchar(50)
	,[0] int
	,[4s] float
	,[6s] float
	,Country varchar(50)
	,start_year int
	,end_year int
	);
 
 insert into batting_t20(
 Player_name 
	,mat 
	,inns 
	,[no] 
	,runs 
	,hs 
	,ave 
	,bf 
	,sr 
	,[100] 
    ,[50] 
	,[0]
	,[4s]
	,[6s]
	,Country
	,start_year 
	,end_year)
select 	
     Player_name 
	,mat 
	,inns 
	,[no] 
	,runs 
	,hs 
	,ave 
	,bf 
	,sr 
	,[100] 
    ,[50] 
	,[0]
	,[4s]
	,[6s]
	,region 
	,start_year 
	,end_year

from t20_batting;    

create table batting_test(
	Player_name nvarchar(100)
	,mat tinyint
	,inns smallint
	,[no] tinyint
	,runs int
	,hs nvarchar(50)
	,ave float
	,[100] tinyint
    ,[50] tinyint
	,[0] tinyint
	,Country varchar(50)
	,start_year int
	,end_year int
	);

 insert into batting_test(
 Player_name 
	,mat 
	,inns 
	,[no] 
	,runs 
	,hs 
	,ave 
	,[100] 
    ,[50] 
	,[0]
	,Country 
	,start_year 
	,end_year)
select 	
       Player_name 
	,mat 
	,inns 
	,[no] 
	,runs 
	,hs 
	,ave 
	,[100] 
    ,[50] 
	,[0]
	,region 
	,start_year 
	,end_year

from test_batting;  



-- Add new columns for FullName and Region in odi_bowling
ALTER TABLE ODI_bowling
ADD player_name nVARCHAR(50);

ALTER TABLE odi_bowling
ADD region varchar(50);
    

-- Update the new columns with split values
UPDATE ODI_bowling
SET player_name = SUBSTRING(player, 1, CHARINDEX(' (', player) - 1),
    region = SUBSTRING(player, CHARINDEX('(', player) + 1, CHARINDEX(')', player) - CHARINDEX('(', player) - 1);

	--creating duplicate table for better understanding
	select * from bowling_odi
create table bowling_odi(
	Player_name nvarchar(50)
	,mat smallint
	,inns smallint
	,balls smallint
	,runs smallint
	,wkts smallint
	,bbi nvarchar(50)
	,ave float
	,econ float
	,sr float
	,[4] tinyint
    ,[5] tinyint
	,start_year int
	,end_year int
	,Country varchar(50)
	);

 insert into bowling_odi(
 Player_name 
	,mat 
	,inns 
	,balls 
	,runs 
	,wkts 
	,bbi 
	,ave 
	,econ 
	,sr
	,[4] 
    ,[5] 
	,start_year 
	,end_year 
	,Country )
select 	Player_name 
	,mat 
	,inns 
	,balls 
	,runs 
	,wkts 
	,bbi 
	,ave 
	,econ 
	,sr
	,[4] 
    ,[5] 
	,start_year 
	,end_year 
	,region
       

from odi_bowling;  

select * from bowling_odi

-- Add new columns for FullName and Region in t20_bowling

ALTER TABLE t20_bowling
ADD player_name nVARCHAR(50);

ALTER TABLE t20_bowling
ADD region varchar(50);
    

-- Update the new columns with split values
UPDATE t20_bowling
SET player_name = SUBSTRING(player, 1, CHARINDEX(' (', player) - 1),
    region = SUBSTRING(player, CHARINDEX('(', player) + 1, CHARINDEX(')', player) - CHARINDEX('(', player) - 1);



create table bowling_t20(
	Player_name nvarchar(50)
	,mat tinyint
	,inns tinyint
	,overs float
	,mdns tinyint
	,runs smallint
	,wkts tinyint
	,ave float
	,econ float
	,sr float
	,[4] tinyint
    ,[5] tinyint
	,start_year int
	,end_year int
	,Country varchar(50)
	);
	
 insert into bowling_t20(
 Player_name 
	,mat 
	,inns 
	,overs 
	,mdns 
	,runs 
	,wkts 
	,ave 
	,econ 
	,sr 
	,[4] 
    ,[5] 
	,start_year 
	,end_year 
	,Country )
select 	Player_name 
	,mat 
	,inns 
	,overs 
	,mdns 
	,runs 
	,wkts 
	,ave 
	,econ 
	,sr 
	,[4] 
    ,[5] 
	,start_year 
	,end_year 
	,region
       

from t20_bowling;  

-- Add new columns for FullName and Region in test_bowling
ALTER TABLE test_bowling
ADD player_name nVARCHAR(50);

ALTER TABLE test_bowling
ADD region varchar(50);
    

-- Update the new columns with split values
UPDATE test_bowling
SET player_name = SUBSTRING(player, 1, CHARINDEX(' (', player) - 1),
    region = SUBSTRING(player, CHARINDEX('(', player) + 1, CHARINDEX(')', player) - CHARINDEX('(', player) - 1);



create table bowling_test(
	Player_name nvarchar(50)
	,mat int
	,inns int
	,balls int
	,runs int
	,wkts int
	,bbi nvarchar(50)
	,bbm nvarchar(50)
	,ave float
	,econ float
	,sr float
	,[5] int
    ,[10] int
	,start_year int
	,end_year int
	,Country varchar(50)
	);
	
 insert into bowling_test(
 Player_name 
	,mat 
	,inns 
	,balls 
	,runs 
	,wkts 
	,bbi 
	,bbm 
	,ave 
	,econ 
	,sr 
	,[5] 
    ,[10] 
	,start_year 
	,end_year 
	,Country  )
select  Player_name 
	,mat 
	,inns 
	,balls 
	,runs 
	,wkts 
	,bbi 
	,bbm 
	,ave 
	,econ 
	,sr 
	,[_5] 
    ,[_10] 
	,start_year 
	,end_year 
	,region
       

from test_bowling;  

select * from odi_fielding

-- Add new columns for FullName and Region in odi_fielding
ALTER TABLE odi_fielding
ADD player_name nVARCHAR(50);

ALTER TABLE odi_fielding
ADD region varchar(50);
    

-- Update the new columns with split values
UPDATE odi_fielding
SET player_name = SUBSTRING(player, 1, CHARINDEX(' (', player) - 1),
    region = SUBSTRING(player, CHARINDEX('(', player) + 1, CHARINDEX(')', player) - CHARINDEX('(', player) - 1);



create table fielding_odi(
	Player_name nvarchar(50)
	,mat int
	,inns int
	,dismissals int
	,catches int
	,stumping int
	,caught_wk int
	,caught_fielding int
	,most_dismissals nvarchar(50)
	,dismissals_per_inn float
	,start_year int
	,end_year int
	,Country varchar(50)
	);
	
 insert into fielding_odi(
 Player_name 
	,mat 
	,inns 
	,dismissals 
	,catches 
	,stumping 
	,caught_wk 
	,caught_fielding 
	,most_dismissals 
	,dismissals_per_inn 
	,start_year 
	,end_year 
	,Country
	)
select 
     Player_name 
	,mat 
	,inns 
	,dismissals 
	,catches 
	,stumping 
	,caught_wk 
	,caught_fielding 
	,most_dismissals 
	,dismissals_per_inn 
	,start_year 
	,end_year 
	,region 
       

from odi_fielding;  

-- Add new columns for FullName and Region in t20_fielding

ALTER TABLE t20_fielding
ADD player_name nVARCHAR(50);

ALTER TABLE t20_fielding
ADD region varchar(50);
    

-- Update the new columns with split values
UPDATE t20_fielding
SET player_name = SUBSTRING(player, 1, CHARINDEX(' (', player) - 1),
    region = SUBSTRING(player, CHARINDEX('(', player) + 1, CHARINDEX(')', player) - CHARINDEX('(', player) - 1);



create table fielding_t20(
	Player_name nvarchar(50)
	,mat int
	,inns int
	,dismissals int
	,catches int
	,stumping int
	,caught_wk int
	,caught_fielding int
	,most_dismissals nvarchar(50)
	,dismissals_per_inn float
	,start_year int
	,end_year int
	,Country varchar(50)
	);
	
 insert into fielding_t20(
 Player_name 
	,mat 
	,inns 
	,dismissals 
	,catches 
	,stumping 
	,caught_wk 
	,caught_fielding 
	,most_dismissals 
	,dismissals_per_inn 
	,start_year 
	,end_year 
	,Country
	)
select 
     Player_name 
	,mat 
	,inns 
	,dismissals 
	,catches 
	,stumping 
	,caught_wk 
	,caught_fielding 
	,most_dismissals 
	,dismissals_per_inn 
	,start_year 
	,end_year 
	,region 
       

from t20_fielding;  

-- Add new columns for FullName and Region in test_fielding

ALTER TABLE test_fielding
ADD player_name nVARCHAR(50);

ALTER TABLE test_fielding
ADD region varchar(50);
    

-- Update the new columns with split values
UPDATE test_fielding
SET player_name = SUBSTRING(player, 1, CHARINDEX(' (', player) - 1),
    region = SUBSTRING(player, CHARINDEX('(', player) + 1, CHARINDEX(')', player) - CHARINDEX('(', player) - 1);



create table fielding_test(
	Player_name nvarchar(50)
	,mat int
	,inns int
	,dismissals int
	,catches int
	,stumping int
	,caught_wk int
	,caught_fielding int
	,most_dismissals nvarchar(50)
	,dismissals_per_inn float
	,start_year int
	,end_year int
	,Country varchar(50)
	);
	
 insert into fielding_test(
 Player_name 
	,mat 
	,inns 
	,dismissals 
	,catches 
	,stumping 
	,caught_wk 
	,caught_fielding 
	,most_dismissals 
	,dismissals_per_inn 
	,start_year 
	,end_year 
	,Country
	)
select 
     Player_name 
	,mat 
	,inns 
	,dismissals 
	,catches 
	,stumping 
	,caught_wk 
	,caught_fielding 
	,most_dismissals 
	,dismissals_per_inn 
	,start_year 
	,end_year 
	,region 
       

from test_fielding;  

--Cleaning the country column

UPDATE batting_odi
SET country = REPLACE(REPLACE(REPLACE(REPLACE(country, 'asia', ''), '/',''), 'ICC', ''), 'afr' , '')
WHERE country LIKE '%asia%' OR country LIKE '%/%' OR country LIKE '%ICC%' OR country LIKE '%afr%';

UPDATE batting_t20
SET country = REPLACE(REPLACE(REPLACE(REPLACE(country, 'asia', ''), '/',''), 'ICC', ''), 'afr' , '')
WHERE country LIKE '%asia%' OR country LIKE '%/%' OR country LIKE '%ICC%' OR country LIKE '%afr%';

UPDATE batting_test
SET country = REPLACE(REPLACE(REPLACE(REPLACE(country, 'asia', ''), '/',''), 'ICC', ''), 'afr' , '')
WHERE country LIKE '%asia%' OR country LIKE '%/%' OR country LIKE '%ICC%' OR country LIKE '%afr%';

UPDATE bowling_odi
SET country = REPLACE(REPLACE(REPLACE(REPLACE(country, 'asia', ''), '/',''), 'ICC', ''), 'afr' , '')
WHERE country LIKE '%asia%' OR country LIKE '%/%' OR country LIKE '%ICC%' OR country LIKE '%afr%';

UPDATE bowling_t20
SET country = REPLACE(REPLACE(REPLACE(REPLACE(country, 'asia', ''), '/',''), 'ICC', ''), 'afr' , '')
WHERE country LIKE '%asia%' OR country LIKE '%/%' OR country LIKE '%ICC%' OR country LIKE '%afr%';

UPDATE bowling_test
SET country = REPLACE(REPLACE(REPLACE(REPLACE(country, 'asia', ''), '/',''), 'ICC', ''), 'afr' , '')
WHERE country LIKE '%asia%' OR country LIKE '%/%' OR country LIKE '%ICC%' OR country LIKE '%afr%';

UPDATE fielding_odi
SET country = REPLACE(REPLACE(REPLACE(REPLACE(country, 'asia', ''), '/',''), 'ICC', ''), 'afr' , '')
WHERE country LIKE '%asia%' OR country LIKE '%/%' OR country LIKE '%ICC%' OR country LIKE '%afr%';

UPDATE fielding_t20
SET country = REPLACE(REPLACE(REPLACE(REPLACE(country, 'asia', ''), '/',''), 'ICC', ''), 'afr' , '')
WHERE country LIKE '%asia%' OR country LIKE '%/%' OR country LIKE '%ICC%' OR country LIKE '%afr%';

UPDATE fielding_test
SET country = REPLACE(REPLACE(REPLACE(REPLACE(country, 'asia', ''), '/',''), 'ICC', ''), 'afr' , '')
WHERE country LIKE '%asia%' OR country LIKE '%/%' OR country LIKE '%ICC%' OR country LIKE '%afr%';

-- Deleting all the data that have players from the country apart from these 11 main cricket playing nations namely ( 'AUS', 'SA', 'ENG', 'INDIA', 'SL', 'NZ', 'AFG', 'PAK', 'WI', 'BDESH', 'IRE').


select distinct country from batting_odi

DELETE FROM batting_odi
WHERE country NOT IN ('AUS', 'SA', 'ENG', 'INDIA', 'SL', 'NZ', 'AFG', 'PAK', 'WI', 'BDESH', 'IRE' );

select distinct country from batting_t20

DELETE FROM batting_t20
WHERE country NOT IN ('AUS', 'SA', 'ENG', 'INDIA', 'SL', 'NZ', 'AFG', 'PAK', 'WI', 'BDESH', 'IRE');

select distinct country from batting_test

DELETE FROM batting_test
WHERE country NOT IN ('AUS', 'SA', 'ENG', 'INDIA', 'SL', 'NZ', 'AFG', 'PAK', 'WI', 'BDESH', 'IRE');

select distinct country from bowling_odi

DELETE FROM bowling_odi
WHERE country NOT IN ('AUS', 'SA', 'ENG', 'INDIA', 'SL', 'NZ', 'AFG', 'PAK', 'WI', 'BDESH', 'IRE');


select distinct country from bowling_t20

DELETE FROM bowling_t20
WHERE country NOT IN ('AUS', 'SA', 'ENG', 'INDIA', 'SL', 'NZ', 'AFG', 'PAK', 'WI', 'BDESH', 'IRE');

select distinct country from bowling_test

DELETE FROM bowling_test
WHERE country NOT IN ('AUS', 'SA', 'ENG', 'INDIA', 'SL', 'NZ', 'AFG', 'PAK', 'WI', 'BDESH', 'IRE');

select distinct country from fielding_odi

DELETE FROM fielding_odi
WHERE country NOT IN ('AUS', 'SA', 'ENG', 'INDIA', 'SL', 'NZ', 'AFG', 'PAK', 'WI', 'BDESH', 'IRE');

select distinct country from fielding_t20

DELETE FROM fielding_t20
WHERE country NOT IN ('AUS', 'SA', 'ENG', 'INDIA', 'SL', 'NZ', 'AFG', 'PAK', 'WI', 'BDESH', 'IRE');

select distinct country from fielding_test

DELETE FROM fielding_test
WHERE country NOT IN ('AUS', 'SA', 'ENG', 'INDIA', 'SL', 'NZ', 'AFG', 'PAK', 'WI', 'BDESH', 'IRE');

-- Creating a seaparate table 'Players' for giving an unique ID for each player.

create table players
(
 Player_ID  int identity(1,1)
,Player_name varchar(100)
,Country varchar(100))

insert into players
(Player_name
,Country)

select * from 
(
select distinct Player_name
,Country 
from bowling_odi
union
select distinct Player_name
,Country
from fielding_odi
union
select distinct Player_name
,Country
from batting_odi
union
select distinct Player_name
,Country 
from bowling_test
union
select distinct Player_name
,Country
from fielding_test
union
select distinct Player_name
,Country
from batting_test
union
select distinct Player_name
,Country
from bowling_t20
union
select distinct Player_name
,Country
from fielding_t20
union
select distinct Player_name
,Country 
from batting_t20
) as subquery

-- adding player_id column in all the tables so that we can perform joins on player_id 

alter table batting_odi
add Player_id int;

alter table batting_t20
add Player_id int;

alter table batting_test
add Player_id int;

alter table bowling_odi
add Player_id int;

alter table bowling_t20
add Player_id int;

alter table bowling_test
add Player_id int;

alter table fielding_odi
add Player_id int;

alter table fielding_t20
add Player_id int;

alter table fielding_test
add Player_id int;

--Transfering the player id from players table into all the tables

UPDATE b
SET b.player_id = p.player_id
FROM batting_odi AS b
INNER JOIN players AS p ON b.player_name = p.player_name;

UPDATE bowling_odi
SET bowling_odi.player_id = p.player_id
FROM bowling_odi 
INNER JOIN players AS p ON bowling_odi.player_name = p.player_name;

UPDATE fielding_odi
SET fielding_odi.player_id = p.player_id
FROM fielding_odi 
INNER JOIN players AS p ON fielding_odi.player_name = p.player_name;


UPDATE batting_t20
SET batting_t20.player_id = p.player_id
FROM batting_t20 
INNER JOIN players AS p ON batting_t20.player_name = p.player_name;

UPDATE bowling_t20
SET bowling_t20.player_id = p.player_id
FROM bowling_t20 
INNER JOIN players AS p ON bowling_t20.player_name = p.player_name;

UPDATE fielding_t20
SET fielding_t20.player_id = p.player_id
FROM fielding_t20 
INNER JOIN players AS p ON fielding_t20.player_name = p.player_name;

UPDATE batting_test
SET batting_test.player_id = p.player_id
FROM batting_test
INNER JOIN players AS p ON batting_test.player_name = p.player_name;

UPDATE bowling_test
SET bowling_test.player_id = p.player_id
FROM bowling_test 
INNER JOIN players AS p ON bowling_test.player_name = p.player_name;

UPDATE fielding_test
SET fielding_test.player_id = p.player_id
FROM fielding_test 
INNER JOIN players AS p ON fielding_test.player_name = p.player_name;







--WORKING ON THE  CLEANED DATA
-- List the top 5 run scorers in each of 3 formats. Return player name and runs scored.

select top 5 player_name, runs
from batting_odi;


select top 5 player_name, runs
from batting_t20;

select top 5 player_name, runs
from batting_test;

-- List top 10 batsmen with highest avg in odi cricket who have scored atleast 7000 runs. Return player name and avg.

select top 10 player_name, Ave
from ODI_batting
where runs > 7000
order by ave desc;


-- List the batsmen with highest no. of NO in test cricket.

select top 5 player_name , [no] 
from batting_test
order by [no] desc; 

--- List all the batsmen with more than 20 centuries in odi cricket.


select player_name, [100]
from batting_odi
where [100] > 20
order by [100] desc;

-- List the batsmen whose SR is above 85 and has scored atleast 5000 runs.


select player_name, runs, sr
from batting_odi
where sr > 85 and runs > 5000
order by sr desc;


--List top 5 batsmen with atleast 1000 runs having lowest Balls/boundary ratio. Return player name and and ratio

Select  top 5 player_name, round(Balls_per_bdry_ratio,2) as rounded_balls_per_bounday
from (
select 
     player_name,(BF/([4s] + [6s])) as Balls_per_bdry_ratio
from batting_t20
where runs > 1000
group by player_name, BF, [4s], [6s])
as subquery
order by Balls_per_bdry_ratio asc;


-- List top 5 batsmen with best 50 to 100 conversion rate in test cricket.Return player name and percentage of coversion.

select top 5 player_name,runs,
cast(fifty_to_100_conv_rate AS DECIMAL(10, 2)) as conv_rate
from (
select 
     player_name,runs,
	 ([100] * 100./ ([100]+[50])) as fifty_to_100_conv_rate
from batting_test

where runs >7000
   and  [100] >=1

)
as subquery
order by fifty_to_100_conv_rate desc;

--List the batsmen whose avegarge is above 40 in all 3 formats. Return name,ave

select batting_odi.player_name
      ,cast(batting_odi.ave as decimal(10,2)) as odi
	  ,cast(batting_test.ave as decimal(10,2)) as  test
	  ,cast(batting_t20.ave as decimal(10,2)) as t20
	  
from((
    batting_odi
join
    batting_test
on
  batting_odi.player_name = batting_test.player_name)

join
    batting_t20
on batting_odi.player_name = batting_t20.player_name)

where 
     CAST(batting_odi.ave AS DECIMAL(10, 2)) > 40.00
    AND CAST(batting_test.Ave AS DECIMAL(10, 2)) > 40.00
    AND CAST(batting_t20.ave AS DECIMAL(10, 2)) > 40.00;

--Creating a separate table for batsmen whose avg is above 40 in all formats for better visualisation

create table batsman_avg_above_40
(player_ID int 
,player_name varchar(100)
,odi_avg float
,test_avg float
,t20_avg float);

insert into batsman_avg_above_40(player_ID, player_name, odi_avg, test_avg, t20_avg)
select * from 
	( 
	select players.player_ID
	  ,batting_odi.player_name
      ,cast(batting_odi.ave as decimal(10,2)) as odi
	  ,cast(batting_test.ave as decimal(10,2)) as  test
	  ,cast(batting_t20.ave as decimal(10,2)) as t20  
	  from(((
    batting_odi
join
    batting_test
on
  batting_odi.player_name = batting_test.player_name)

join
    batting_t20
on batting_odi.player_name = batting_t20.player_name)

join
    players
on batting_odi.player_name = players.player_name)

where 
     CAST(batting_odi.ave AS DECIMAL(10, 2)) > 40.00
    AND CAST(batting_test.Ave AS DECIMAL(10, 2)) > 40.00
    AND CAST(batting_t20.ave AS DECIMAL(10, 2)) > 40.00)
	as subquery;
	  
	

select * from batsman_avg_above_40



-- List the batsmen who has scored atleast 35 centuries accross formats.Return player name and centuries.


select 
     batting_odi.player_name
	,batting_odi.[100] as ODI
	,batting_test.[100] as TEST
	,batting_t20.[100] as T20
    ,(batting_odi.[100] + batting_test.[100] + batting_t20.[100]) as TOTAL 

from ((batting_odi
join 
    batting_test
on 
   batting_odi.player_name = batting_test.player_name)

join batting_t20
  on  batting_odi.player_name = batting_t20.player_name)

where 
      (batting_odi.[100] + batting_test.[100] + batting_t20.[100]) > 35
	  
order by 
       (batting_odi.[100] + batting_test.[100] + batting_t20.[100])  desc;


 --List players who have taken atleast 150 wickets and scored atleast 5000 runs in #odi cricket. Return player name, runs scored and wickets taken.

select batting_odi.player_name
      ,batting_odi.runs
	  ,bowling_odi.wkts

from batting_odi
join bowling_odi
on batting_odi.player_name = bowling_odi.player_name

where batting_odi.runs >= 7000
and bowling_odi.wkts >= 150;

-- List top 10 players with maximum no. of catches in international cricket. Return player name, catches taken in #odi and #test and total.

select top 10 
       fielding_odi.player_name
      ,fielding_odi.catches as odi
	  ,fielding_test.catches as test
	  ,fielding_t20.catches as t20
	  ,max(fielding_odi.catches  + fielding_test.catches + fielding_t20.catches ) as total
from  ((
fielding_odi



join fielding_test

on fielding_odi.player_name = fielding_test.player_name)

join fielding_t20

on fielding_odi.player_name = fielding_t20.player_name)

group by fielding_odi.player_name , fielding_odi.catches , fielding_test.catches , fielding_t20.catches 

order by (fielding_odi.catches + fielding_test.catches + fielding_t20.catches)   desc;


-- List top 10 bowlers with max no. of 10 wicket haul in test cricket

-- We can check for any duplicates in tables

SELECT  Player_name 
	,mat 
	,inns 
	,balls 
	,runs 
	,wkts 
	,bbi 
	,bbm 
	,ave 
	,econ 
	,sr 
	,[5] 
    ,[10] 
	,start_year 
	,end_year 
	,Country, COUNT(*) AS DuplicateCount
FROM bowling_test
GROUP BY  Player_name 
	,mat 
	,inns 
	,balls 
	,runs 
	,wkts 
	,bbi 
	,bbm 
	,ave 
	,econ 
	,sr 
	,[5] 
    ,[10] 
	,start_year 
	,end_year 
	,Country
HAVING COUNT(*) > 1;


--deleting all the duplicate rows with the help of CTE(common table expression).CTE deletes all the duplicates rows and keep only the original one

WITH CTE AS (
    SELECT Player_name 
	,mat 
	,inns 
	,balls 
	,runs 
	,wkts 
	,bbi 
	,bbm 
	,ave 
	,econ 
	,sr 
	,[5] 
    ,[10] 
	,start_year 
	,end_year 
	,Country,
           ROW_NUMBER() OVER (PARTITION BY  Player_name 
	,mat 
	,inns 
	,balls 
	,runs 
	,wkts 
	,bbi 
	,bbm 
	,ave 
	,econ 
	,sr 
	,[5] 
    ,[10] 
	,start_year 
	,end_year 
	,Country ORDER BY player_name asc) AS RN
    FROM bowling_test
)
DELETE FROM CTE WHERE RN > 1;



select   top 10 player_name
      ,wkts
	  ,[10] as [10 wkt haul]
from bowling_test
order by [10] desc;




-- List the players who has scored a century as well as taken a 5 wicket haul in odi cricket.

select batting_odi.player_name   
      ,batting_odi.[100] as hundreds
	  ,bowling_odi.[5] as [5 wicket haul]

from batting_odi

join bowling_odi

on

batting_odi.player_name = bowling_odi.player_name

where batting_odi.[100] >= 1
	  and bowling_odi.[5] >= 1

	  order by batting_odi.[100] desc;

-- List top 10 batsmen with highest no. of runs accross formats who started their odi career after 2010. Return player name, odi runs, test runs, t20 runs total runs.

select top 10
       batting_odi.start_year
      ,batting_odi.player_name
      ,batting_odi.runs as odi
	  ,batting_t20.runs as t20
      ,batting_test.runs as test
	  ,(batting_odi.runs + batting_t20.runs + batting_test.runs) as total 

from ((
    batting_odi

join batting_t20
 
 on batting_odi.player_name = batting_t20.player_name)


 join batting_test

 on batting_odi.player_name = batting_test.player_name)

 where batting_odi.start_year >= 2010

 order by (batting_odi.runs + batting_t20.runs + batting_test.runs) desc;

--List top 5 bowlers in ODI cricket with lowest balls/wkt ratio with atleast 150 matches. Return player name and ratio

select top 5 
           player_name
          ,round(balls_per_wkt_ratio,2) as balls_per_wkt
from (
select player_name, (balls/wkts) as balls_per_wkt_ratio
from bowling_odi
where mat >= 150
and wkts > 100
group by player_name, balls , wkts )
as subquery
order by balls_per_wkt_ratio asc;

-- List top 5 players in test cricket who have taken most no. of catches without being a wicket keeper.


select top 5
           player_name
		  ,caught_fielding as catches
from fielding_test
order by caught_fielding desc;

-- List top 10 playerss with best dimissals per inn ratio having at least 200 dismissals
     
        select top 10
           player_name
		  ,dismissals_per_inn 
from fielding_test
where dismissals >200
order by dismissals_per_inn desc;

       
-- Creating a separate table for dismissals_per_inn	for better visualisation in other visualisation tools.   

create table dismissals_per_inn
(player_ID int 
,player_name varchar(100)
,dismissals_per_inn float);

	
	insert into dismissals_per_inn
	select * from 
	( 
	select top 10 
		   b.player_ID
		  ,a.player_name
		  ,a.dismissals_per_inn   
	  from fielding_test as a
	  inner join players as b
	  on a.player_name = b.player_name
      where dismissals >200
      order by dismissals_per_inn desc)
	  as subquery;
	
	select * from dismissals_per_inn	

	-- Select all player in  odi matches and return player is , player name , matches played,runs scored, wkts taken, 100s, 50s , catches and highest score

	select 
	     a. player_id
		,b.player_name
		,b.mat
		,b.runs
		,b.[100]
		,b.[50]
		,b.hs
		,c.wkts
		,d.catches

from 
(((players as a
inner join batting_odi as b
on a.player_id = b.player_id )

inner join bowling_odi as c
on a.player_id = c.player_id)

inner join fielding_odi as d
on a.player_id = d.player_id)

--list player with highest dimissals per inn.return country ,player_id,olayer_name and dismissals per inn

select a.player_id
      ,a.player_name 
	  ,d.dismissals_per_inn
	  ,a.country

from players as a

 right join

dismissals_per_inn as d

on a.player_id = d.player_id

order by d.dismissals_per_inn desc;


-- Who is the highest scorer in test for South africa 

select top 15  
       player_name 
	  ,max(runs) as top_scorer

from batting_test

where country = 'SA'
group by player_name 

order by max(runs) desc;

