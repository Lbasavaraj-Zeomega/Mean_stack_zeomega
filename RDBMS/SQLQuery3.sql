create table dbo.student(
student_idn numeric(18,0) NOT NULL,
student_name varchar(100) NOT NULL,
mark numeric (18,0) NULL,
crt_date datetime,
update_dt datetime,
active char(1) not null
)

select * from student

sp_rename 'student','student_detail'

select * from student_detail

drop table student_detail_latest

CREATE TABLE #myTempTable
(
DummyField1 INT,
DummyField2 VARCHAR(20)
)


select * from #myTempTable

Alter Table student_detail ALTER COLUMN student_name varchar(150) not null

Alter Table student_detail add today_date datetime null;

select * from student_detail

sp_rename 'student_detail.update_dt','updated_date'

ALTER TABLE student_detail DROP COLUMN today_date

select * from student_detail

insert into student_detail (student_idn,student_name,mark,crt_date,updated_date,active) values
(4,'Basavaraj4',100,getdate(),getutcdate(),'y')

update student_detail set student_name='Basavaraj' where crt_date='2022-03-02 05:08:25.757'

delete from student_detail where updated_date='2022-02-28 12:19:52.813'

select student_name ,* from student_detail where crt_date='2022-03-02 10:53:11.853'

truncate table student_detail




