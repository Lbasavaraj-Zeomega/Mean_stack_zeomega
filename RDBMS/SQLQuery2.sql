-----------------------Day 2 ------------------------------------
create table CUSTOMERS (
id numeric(18,0) identity(1,1) ,
name varchar(30),
age numeric(18,0),
ADDRESS varchar(100),
salary numeric(10,2))



insert into CUSTOMERS(name,age,ADDRESS,salary)
select 'Ramesh',32,'Ahmedabad',2000.00 union all
select 'Khilan',25,'Delhi',1500.00 union all
select 'kaushik',23,'Kota',2000.00 union all
select 'Chaitali',25,'Mumbai',6500.00 union all
select 'Hardik',27,'Bhopal',8500.00 union all
select 'Komal',22,'MP',4500.00 union all
select 'Muffy',24,'Indore',10000.00

--Argumentt functions----
select * from CUSTOMERS
--avg salary----
select avg(salary) from CUSTOMERS

select avg(salary) as AVG_Salray from CUSTOMERS
---avg salary of group bu age----
select avg(salary) as AVG_Salray,age From CUSTOMERS GROUP BY age

select avg(salary) as AVG_Salray,age From CUSTOMERS GROUP BY age order by age asc 
---count records--
select count(id) as COUNT_CUSTOMERS from CUSTOMERS
----count records distinct by age--
select count(distinct age) as COUNT_AGE from CUSTOMERS
--count minimun salary of gourp by age  ---
select min(salary) as  MIN_Salary,age from CUSTOMERS group by age order by age 
-- count max salary---
select max(salary) as MAX_Salary from CUSTOMERS
--count max salary of gourp by age  ---
select max(salary) as MAX_Salary,age from CUSTOMERS group by age order by age 



---DATETIME functions----
select getdate() as CRT_Date
---for date name--
select DATENAME(MONTH,GETDATE()) as month_name
----for month number----
select DATEPART(MONTH,GETDATE()) as MONTH_NUMBWER
---get year--
select YEAR(getdate()) as year
--for difrence  of year---
select DATEDIFF(year,getdate(),getdate()-7)

SELECT DATEDIFF(year, '2012-12-31 23:59:59.9999999', '2019-01-01 00:00:00.0000000')
--add date to next 3 month----
select DATEADD(month,3,getdate())


-----MATHEMATICS  Functions----

DECLARE @i int
SET @i = -25.8



SELECT ABS(@i) AS [Absolute Value]



-- Calculating ABS directly
SELECT ABS(-27) AS [Absolute Value]



-- Calculating ABS directly
SELECT 2 + 55 - 77
SELECT ABS(2 + 55 - 77) AS [Absolute Value]

-------------
DECLARE @i float
SET @i = -208.45



SELECT FLOOR(@i)AS [SQLFLOOR]
-- Calculating FLOOR directly
SELECT FLOOR(0.24)AS [SQLFLOOR]



-- Calculating FLOOR directly
SELECT 2.45 + 7.55 - 14.88
SELECT ABS(2.45 + 7.55 - 14.88)AS [SQLFLOOR]
SELECT FLOOR(2.45 + 7.55 - 14.88)AS [SQLFLOOR]



-----

DECLARE @i float
SET @i = 248.6759



SELECT ROUND(@i, -1)AS [Negative One]




SELECT ROUND(@i, 1)AS [Result 2]
SELECT ROUND(@i, 2)AS [Result 3]
SELECT ROUND(@i, 3)AS [Result 4]



SELECT ROUND(@i, -1)AS [Negative One]
SELECT ROUND(@i, -2)AS [Negative Two]
SELECT ROUND(@i, -3)AS [Negative Three]




---------------
-- Case stmt
select case when datediff(yy, mbr_birth_dt,getdate()) between 5 and 20 then 'Kids'
when datediff(yy, mbr_birth_dt,getdate())between 21 and 30 then 'Younger'
Else 'Elder'
end, datediff(yy, mbr_birth_dt,getdate()) age ,mbr_birth_dt,mbr_name
from mbr where entity_active='Y'



-----BEGIN END



BEGIN
Declare @mbr_idn INT=158440
DECLARE @name VARCHAR(MAX);



SELECT TOP 1
@name = mbr_name
FROM
mbr where mbr_idn=@mbr_idn
ORDER BY
mbr_idn DESC;

IF @@ROWCOUNT <> 0
BEGIN
PRINT 'Member name is ' + @name
END
ELSE
BEGIN
PRINT 'No data found';
END;
END




------------- While loop
--The WHILE statement is a control-flow statement that allows you to execute a statement block repeatedly as long as a specified condition is TRUE.



DECLARE @counter INT = 1;



WHILE @counter <= 5
BEGIN
PRINT @counter;
SET @counter = @counter + 1;
END






