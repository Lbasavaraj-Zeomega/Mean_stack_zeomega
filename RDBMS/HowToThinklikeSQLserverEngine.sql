use [StackOverflow2010]


SET STATISTICS IO ON
SET STATISTICS TIME ON

select TOP 10 * FROM Users

sp_help Users

DROP INDEX IX_LastAccessDate on dbo.Users

DROp INDEX IX_LastAccessDate_Id_Includes on dbo.Users

DROP INDEX IX_LastAccessDate_Id_DisplayName_Age on dbo.Users

CREATE NONCLUSTERED INDEX IX_LastAccessDate on dbo.Users(LastAccessDate)
--INCLUDE (Age, DisplayName)

--CREATE NONCLUSTERED INDEX IX_LastAccessDate_Id_DisplayName_Age on dbo.Users(LastAccessDate,Id,DisplayName,Age)

SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users
  WHERE LastAccessDate > '2014-07-01'
  ORDER BY LastAccessDate;

  SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users
  WHERE LastAccessDate > '2018-09-02 04:00'
  ORDER BY LastAccessDate;  --4842

  SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users
  WHERE LastAccessDate > '2018-09-02 03:00'
  ORDER BY LastAccessDate;
---------------------------------------------------
    SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users
  WHERE LastAccessDate > '2018-09-02 03:00'
  ORDER BY LastAccessDate;

  SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users WITH (INDEX = IX_LastAccessDate)
  WHERE LastAccessDate > '2018-09-02 03:00'
  ORDER BY LastAccessDate;


  SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users
  WHERE LastAccessDate > '2018-09-01 02:00'
  ORDER BY LastAccessDate;

  SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users WITH (INDEX = IX_LastAccessDate)
  WHERE LastAccessDate > '2018-09-01 02:00'
  ORDER BY LastAccessDate;

--Users table - 299398
-------------------------------------------------------------
DBCC SHOW_STATISTICS ('dbo.Users','IX_LastAccessDate')

  SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users
  WHERE LastAccessDate > '2018-09-02 04:00'
  ORDER BY LastAccessDate;

  select top 100 age,* from users
-------------------------------------------------------------

SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users
  WHERE LastAccessDate BETWEEN '2018-08-27' AND '2018-08-28'
  ORDER BY LastAccessDate;
 
SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users
  WHERE CAST(LastAccessDate AS DATE) = '2018-08-27'
  ORDER BY LastAccessDate
  ----------------------------------------------------
  SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users
  WHERE LastAccessDate BETWEEN '2018-08-31' AND '2018-09-01'
  ORDER BY LastAccessDate;
 
SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users
  WHERE CAST(LastAccessDate AS DATE) = '2018-08-31'
  ORDER BY LastAccessDate;

  -----------------------------------------------------

  SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users
  WHERE LastAccessDate BETWEEN '2018-08-31' AND '2018-09-01'
  ORDER BY LastAccessDate;
 
SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users
  WHERE CAST(LastAccessDate AS DATE) = '2018-08-31'
  ORDER BY LastAccessDate;

  --DROP INDEX IX_LastAccessDate_Id_Includes on Users

  CREATE INDEX IX_LastAccessDate_Id_Includes
  ON dbo.Users(LastAccessDate, Id)
  INCLUDE (DisplayName, Age);
GO
CREATE INDEX IX_LastAccessDate_Id_DisplayName_Age
  ON dbo.Users(LastAccessDate, Id, DisplayName, Age);
GO

