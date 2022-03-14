---create unique table------ 
select * into dbo.Users_Basavaraj from dbo.users

select * from dbo.Users_Basavaraj
--ADD primary key----
alter table dbo.Users_Basavaraj add constraint [pk_Users_Basavaraj_id]
primary key clustered ([ID] ASC)

---Added deatils in the messages 
select ID from dbo.Users_Basavaraj

--Adding Where condition
SELECT Id
FROM Users_Basavaraj
WHERE LastAccessDate > '2014/07/01';

CREATE NONCLUSTERED INDEX
[idx_Users_Basavaraj_LastAccessDate] ON [dbo].[Users_Basavaraj]
([LastAccessDate] ASC )

SELECT Id
FROM Users_Basavaraj
WHERE LastAccessDate > '2014/07/01';

--Example for aboutme coloumn in jiva
sp_help Users_Basavaraj

drop index [idx_Users_Basavaraj_LastAccessDate] on  [dbo].[Users_Basavaraj]

--Adding an ORDER BY
SELECT Id  
  FROM Users_Basavaraj 
  WHERE LastAccessDate > '2014/07/01'  
  ORDER BY LastAccessDate; 

CREATE NONCLUSTERED INDEX [idx_Users_Basavaraj_LastAccessDate] 
ON [dbo].[Users_Basavaraj]
([LastAccessDate] ASC )
									  
SELECT Id  
  FROM Users_Basavaraj  
  WHERE LastAccessDate > '2014/07/01'  
  ORDER BY LastAccessDate; 

DROP INDEX [idx_Users_Basavaraj_LastAccessDate] ON [dbo].[Users_Basavaraj]

--The Perils of SELECT *
SELECT Id  
  FROM Users_Basavaraj  
  WHERE LastAccessDate > '2014/07/01'  
  ORDER BY LastAccessDate; 

SELECT * 
  FROM Users_Basavaraj 
  WHERE LastAccessDate > '2014/07/01'  
  ORDER BY LastAccessDate; 

--Running a Query Repeatedly
SET STATISTICS IO, TIME ON; 
GO 

SELECT Id 					
  FROM dbo.Users_Basavaraj 
  WHERE LastAccessDate > '2014/07/01' 
  ORDER BY LastAccessDate; 
GO 10 

--Non-clustered index
SELECT Id 
 FROM dbo.Users_Basavaraj 
 WHERE LastAccessDate > '2014/07/01'; 

CREATE NONCLUSTERED INDEX [idx_Users_Basavaraj_LastAccessDate_ID] ON [dbo].[Users_Basavaraj]
([LastAccessDate] ASC , ID ASC)

SELECT Id 
 FROM dbo.Users_Basavaraj 
 WHERE LastAccessDate > '2014/07/01';

--seek vs scan
--seek reading full table
SELECT Id 
  FROM dbo.Users_Basavaraj 
  WHERE LastAccessDate > '1800/01/01'; 

--Scan is better
SELECT TOP 10 * 
  FROM dbo.Users_Basavaraj; 

--Key Lookup
SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users_Basavaraj 
  WHERE LastAccessDate > '2018-09-02 04:00' 
  ORDER BY LastAccessDate; 

--cost of the key lookup
SELECT LastAccessDate, Id
  FROM dbo.Users_Basavaraj 
  WHERE LastAccessDate > '2018-09-02 04:00' 
  ORDER BY LastAccessDate;

SELECT LastAccessDate, Id, DisplayName, Age
  FROM dbo.Users_Basavaraj 
  WHERE LastAccessDate > '2018-09-02 04:00' 
  ORDER BY LastAccessDate;

CREATE NONCLUSTERED INDEX [idx_Users_Basavaraj_LastAccessDate_ID]
ON [dbo].[Users_Basavaraj] ([LastAccessDate])
INCLUDE ([Age],[DisplayName])
WITH(DROP_EXISTING = ON);


