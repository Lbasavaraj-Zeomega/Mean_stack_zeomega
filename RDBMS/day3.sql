                                                                                    --------------------day3------------------------
--creating table----
create table student(
id int primary key ,
name varchar(50) not null,
gender varchar(50) not null,
dob datetime null,
total_score int not null,
city varchar(50) not null
)
--------insert values------
INSERT INTO student

VALUES
(6, 'Kate', 'Female', '03-JAN-1985', 500, 'Liverpool'),
(2, 'Jon', 'Male', '02-FEB-1974', 545, 'Manchester'),
(9, 'Wise', 'Male', '11-NOV-1987', 499, 'Manchester'),
(3, 'Sara', 'Female', '07-MAR-1988', 600, 'Leeds'),
(1, 'Jolly', 'Female', '12-JUN-1989', 500, 'London'),
(4, 'Laura', 'Female', '22-DEC-1981', 400, 'Liverpool'),
(7, 'Joseph', 'Male', '09-APR-1982', 643, 'London'),
(5, 'Alan', 'Male', '29-JUL-1993', 500, 'London'),
(8, 'Mice', 'Male', '16-AUG-1974', 543, 'Liverpool'),
(10, 'Elis', 'Female', '28-OCT-1990', 400, 'Leeds');

select * from student 

drop table student

sp_help student

Alter table student drop  upd_date 

alter table student alter column total_score int 

---creating index nonclustered index------
create index idx_student_gender on student(gender)


---create procedure-----
create procedure p_student 
as  
begin 
select * from student
end
--execute procedure------
exec p_student


-------------user defined fucntions---------
CREATE FUNCTION [dbo].[ufn_GetAge] ( @DateOfBirth DATETIME,@CurrentDate DATETIME)
RETURNS INT
AS
BEGIN
DECLARE @Age INT
IF @DateOfBirth >= @CurrentDate
RETURN 0
SET @Age = DATEDIFF(YY, @DateOfBirth, @CurrentDate)
IF MONTH(@DateOfBirth) > MONTH(@CurrentDate) OR
(MONTH(@DateOfBirth) = MONTH(@CurrentDate) AND
DAY(@DateOfBirth) > DAY(@CurrentDate))
SET @Age = @Age - 1
RETURN @Age
END



select stud_id,stud_name,dbo.ufn_GetAge(birth_date,getdate()) age from student







-------------------Joins-----------------
CREATE TABLE dbo.employee (
emp_no INTEGER NOT NULL,
emp_fname CHAR(20) NOT NULL,
emp_lname CHAR(20) NOT NULL,
dept_no CHAR(4) NULL,
salary money ,
start_Date DATETIME null,
date_of_birth datetime null,
region VARCHAR (10) null,
city VARCHAR(20) null,
managerid INTEGER null
)






insert into employee VALUES (1, 'Jason', 'Martin', 'd1','5505','2005-03-22','2085-03-22','North','Vancouver',3)
insert into employee VALUES (2, 'Alison', 'Mathews','d1','2503','2003-07-21','2073-07-21','South','Utown',4)
insert into employee VALUES (3, 'James', 'Smith', 'd1','2141','2001-12-01','2061-12-01','North','Paris',5)
insert into employee VALUES (4, 'Celia', 'Rice', 'd2','2006','2006-03-03','2086-03-03','South','London',6)
insert into employee VALUES (5, 'Robert', 'Black', 'd2','2004','2004-07-02','2074-07-02','East','Newton',7)
insert into employee VALUES (6, 'Linda', 'Green', 'd2','2852','2002-05-19','2062-05-19','East','Calgary',8)
insert into employee VALUES (7, 'David', 'Larry', 'd3','2748','2008-03-18','2068-03-18','West','New York',9)
INSERT INTO employee VALUES (8, 'James' , 'Cat' , 'd3','2957' ,'2007-07-17' ,'2071-07-17','West' ,'Regina' ,9)
INSERT INTO employee VALUES (9, 'James' , 'Cat' , 'd3','2957' ,'2007-07-17' ,'2071-07-17','West' ,'Regina' ,9)
select * from dbo.employee
GO

CREATE TABLE dbo.works_on (emp_no INTEGER NOT NULL,
project_no CHAR(4) NOT NULL,
job CHAR (15) NULL,
enter_date DATETIME NULL)

insert into dbo.works_on values (1, 'p1', 'analyst' , '1997.10.1' )
insert into dbo.works_on values (1, 'p3', 'manager' , '1999.1.1' )
insert into dbo.works_on values (2, 'p2', 'clerk' , '1998.2.15' )
insert into dbo.works_on values (2, 'p2', NULL, '1998.6.1' )
insert into dbo.works_on values (3, 'p2', NULL, '1997.12.15' )
insert into dbo.works_on values (4, 'p3', 'analyst' , '1998.10.15' )
insert into dbo.works_on values (5, 'p1', 'manager' , '1998.4.15' )
insert into dbo.works_on values (6, 'p1', NULL, '1998.8.1' )
insert into dbo.works_on values (7, 'p2', 'clerk' , '1999.2.1' )
insert into dbo.works_on values (8, 'p3', 'clerk' , '1997.11.15' )
insert into dbo.works_on values (7, 'p1', 'clerk' , '1998.1.4' )
select * from dbo.works_on
GO


----innert join-----
select * from  employee e inner join works_on w on e.emp_no=w.emp_no where e.dept_no='d1' and w.project_no='p2'

-------left join-------
select * from employee e left join  works_on w on e.emp_no=w.emp_no where e.emp_no=9

select * from works_on w join employee e on e.emp_no=w.emp_no where e.emp_no=9



CREATE TABLE dbo.department(dept_no CHAR(4) NOT NULL,
dept_name CHAR(25) NOT NULL,
location CHAR(30) NULL)
insert into dbo.department values ('d1', 'developer', 'Dallas')
insert into dbo.department values ('d2', 'tester', 'Seattle')
insert into dbo.department values ('d3', 'marketing', 'Dallas')
select*from dbo.department
GO
create table dbo.job(ID int,
title nvarchar (10),
averageSalary int
)
GO
insert into dbo.job(ID, title, averageSalary) values(1,'Developer',3000)
insert into dbo.job(ID, title, averageSalary) values(2,'Tester', 4000)
insert into dbo.job(ID, title, averageSalary) values(3,'Designer', 5000)
insert into dbo.job(ID, title, averageSalary) values(4,'Programmer', 6000)

-----3 table join---------------
select d.dept_name from employee e
inner join works_on w on e.emp_no=w.emp_no
inner join department d on e.dept_no=d.dept_no
where e.emp_lname='Martin'

select d.dept_name from employee e
left join works_on w on e.emp_no=w.emp_no
left join department d on e.dept_no=d.dept_no
where e.emp_lname='Martin'

----------------------cross join--------------

select * from works_on cross join department where works_on.project_no='p1'

-----------self join------------------
select t1.emp_no,t2.emp_no from employee t1,employee t2


DECLARE @Season VARCHAR (100)
SET @Season = 'Sfgdxfghhd'
DECLARE @Climate VARCHAR (50)
SET @Climate =
CASE @Season
WHEN 'Winter' THEN 'Cold'
WHEN 'Spring' THEN 'Mild'
WHEN 'Summer' THEN 'Hot'
WHEN 'Fall' THEN 'Cool'
ELSE 'Unknown'
END
SELECT @Climate


create table ProductModel
(ProductModelID numeric(18,0),
Name varchar(50),
price numeric(18,0))
go
insert into ProductModel (ProductModelID, Name,price)
select 1,'abc',1500 union all
select 2,'xyz',154789 union all
select 3,'lmn',125639 union all
select 4,'abcd',124569873 union all
select 5,'1254',302150 union all
select 6,'784566',120000
go



-- Create Gloves table.
SELECT ProductModelID, Name
INTO dbo.Gloves
FROM ProductModel
WHERE ProductModelID IN (3, 4);
GO




select * from productmodel
select * from gloves




SELECT *
FROM ProductModel
WHERE ProductModelID NOT IN (3, 4)
UNION
SELECT *
FROM dbo.Gloves
ORDER BY Name;
GO




SELECT ProductModelID, Name
FROM ProductModel
--WHERE ProductModelID NOT IN (3, 4)
UNION all
SELECT ProductModelID, Name
FROM dbo.Gloves
ORDER BY Name;
GO

