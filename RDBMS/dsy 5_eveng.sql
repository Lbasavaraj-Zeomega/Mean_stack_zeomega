select * from Basavaraj_97
select * into Basavaraj_97 from users
----------------
ALTER TABLE Basavaraj_97
ADD CONSTRAINT PK_users_vk_id PRIMARY KEY CLUSTERED (id);



sp_BlitzIndex @tablename='users_vk'
----------------Should Columns Go In the Key or the Includes?
-----1
CREATE INDEX IX_LastAccessDate_Id_Includes
ON dbo.Basavaraj_97(LastAccessDate, Id)
INCLUDE (DisplayName, Age);
GO
-----2
UPDATE dbo.Basavaraj_97
SET Age = Age + 1
WHERE Id = 639;
------ drop index IX_LastAccessDate_Id_Includes on users_vk
-----3
CREATE INDEX IX_LastAccessDate_Id_DisplayName_Age
ON dbo.Basavaraj_97(LastAccessDate, Id, DisplayName, Age);
GO
---sp_BlitzIndex @tablename='users_vk'()
------ drop index IX_LastAccessDate_Id_DisplayName_Age on users_vk
-----4
UPDATE dbo.Basavaraj_97
SET Age = Age + 1
WHERE Id = 639;
------------------Included Columns Aren’t Free
----1
UPDATE dbo.Basavaraj_97
SET Age = Age + 1
WHERE Id = 639;
----2
CREATE INDEX IX_LastAccessDate_Id_DisplayName_Age
ON dbo.Basavaraj_97(LastAccessDate, Id, DisplayName, Age);
----3
CREATE INDEX IX_LastAccessDate_Id_Includes
ON dbo.Basavaraj_97(LastAccessDate, Id) INCLUDE (DisplayName, Age);
--------------------------Index Column Order Matters a LOT
------1
CREATE INDEX IX_LastAccessDate_Id_DisplayName_Age
ON dbo.Basavaraj_97(LastAccessDate, Id, DisplayName, Age);
GO
------2
SELECT Id
FROM dbo.Basavaraj_97
WHERE DisplayName = N'Brent Ozar';
------3
CREATE INDEX IX_DisplayName ON dbo.Users_vk(DisplayName);
GO
------4 drop index IX_DisplayName on users_vk
SELECT Id
FROM dbo.Basavaraj_97
WHERE DisplayName = N'Brent Ozar';



------------------------When a Seek Isn’t
GO
CREATE INDEX IX_LastAccessDate_Id_DisplayName_Age
ON dbo.Basavaraj_97(LastAccessDate, Id, DisplayName, Age);
GO



SELECT Id
FROM dbo.Basavaraj_97
WHERE LastAccessDate > '1800/01/01'
AND DisplayName = N'Brent Ozar';
GO