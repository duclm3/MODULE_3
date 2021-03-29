
create table Test
(
	TestId int  not null primary key,
	Name varchar(20)
);
create table Student
(
	RN int not null primary key,
    Name varchar(20),
    Age tinyint
);
create table StudentTest
(
	TestId int,
    RN int,
    Primary key(TestId,RN),
    Foreign key (TestId) references Test(TestId),
    Foreign key (RN) references Student(RN)
);

alter table StudentTest
	add Date DateTime,
    add Mark Float;
    
 insert into Student values(1,'Nguyen Hong Ha',20);
 insert into Student values(2,'Truong Ngoc Ha',30);
 insert into Student values(3,'Tuan Minh',25);
 insert into Student values(4,'Dan Truong',22);
 

 
 insert into Test values(1,'EPC');
 insert into Test values(2,'DWMX');
 insert into Test values(3,'SQL1');
 insert into Test values(4,'SQL2');
 
insert into StudentTest values(1,1,'2006-07-17 00:00:00',8);

insert into StudentTest values(2,1,'2006-07-18 00:00:00',5);
insert into StudentTest values(3,1,'2006-07-19 00:00:00',7);
insert into StudentTest values(1,2,'2006-07-17 00:00:00',7);
insert into StudentTest values(2,2,'2006-07-18 00:00:00',4);
insert into StudentTest values(3,2,'2006-07-19 00:00:00',2);
insert into StudentTest values(1,3,'2006-07-17 00:00:00',10);
insert into StudentTest values(3,3,'2006-07-18 00:00:00',1);

-- 2
alter table student
add CONSTRAINT check_StudentAge CHECK ((Age>=15 AND Age <=55));

insert into Student values(5,'Test',14);


alter table student
	add check(Age >= 15 and Age <=55);
    
ALTER TABLE studenttest
	ALTER Mark SET DEFAULT 0; 
    
ALTER TABLE test
	add unique (name);

ALTER TABLE test
	DROP INDEX Name; 
-- 3.	Hiển thị danh sách các học viên đã tham gia thi, các môn thi được thi bởi các học 
-- viên đó, điểm thi và ngày thi giống như hình sau:
select s.name,t.name,mark,date
from (StudentTest as st left join student as s on st.RN = s.RN)
     left join test as t on st.testId = t.testId;  
 -- 4    
select *
from Student
where RN not in(select RN from studenttest);
-- 5
select s.name,t.name,mark,date
from (StudentTest as st left join student as s on st.RN = s.RN)
     left join test as t on st.testId = t.testId
 where st.mark <=4;
 
 -- 6
select  s.name,avg(mark)
from (StudentTest as st left join student as s on st.RN = s.RN)
     left join test as t on st.testId = t.testId
group by s.name
order by avg(st.mark) desc;
-- 7
select  s.name,avg(mark)
from (StudentTest as st left join student as s on st.RN = s.RN)
     left join test as t on st.testId = t.testId
group by s.name
order by avg(st.mark) desc
limit 1;

-- 8
select  t.name,max(mark)
from (StudentTest as st inner join test as t on st.TestId = t.TestId)
group by t.name;
-- 9
select s.name, t.name
from (StudentTest as st right join student as s on st.RN = s.RN)
     left join test as t on st.testId = t.testId;  

-- 10
SET SQL_SAFE_UPDATES = 0; -- Turn OFF "Safe Update Mode" temporary
UPDATE Student
set age = CASE WHEN age > 0 THEN (age +1) ELSE 0 END;

SET SQL_SAFE_UPDATES = 0;
UPDATE Student
set age = age+1;
-- 11
alter table student
add status varchar(10);
-- 12
SET SQL_SAFE_UPDATES = 0; 
UPDATE Student
set status = CASE WHEN age < 30 THEN 'Young'ELSE 'Old' END;
-- 13
select s.name,t.name,mark,date
from (StudentTest as st left join student as s on st.RN = s.RN)
     left join test as t on st.testId = t.testId
Order by date;    

-- 14 
select s.name,max(s.age),avg(st.mark)
from (StudentTest as st left join student as s on st.RN = s.RN)
     left join test as t on st.testId = t.testId
 where s.name like 'T%'
 group by s.name
 having avg(mark) > 4.5;
 -- 15
-- Hiển thị các thông tin sinh viên (Mã, tên, tuổi, điểm trung bình, xếp hạng).
-- Trong đó, xếp hạng dựa vào điểm trung bình của học viên, điểm trung bình cao nhất thì xếp hạng 1.
set @temp := 0;
select RN,x.name,Age,Mark,@temp := @temp +1 as 'Top'
from(
		select s.RN,s.name,s.Age,avg(mark) as Mark
		from (StudentTest as st inner join student as s on st.RN = s.RN)
			 inner join test as t on st.testId = t.testId
		group by s.name
		order by avg(mark) desc) as x; -- order by chạy sau cùng

set @temp := 0;
select s.RN,s.name,s.Age,avg(mark),@temp := @temp +1 as 'Top'
from (StudentTest as st inner join student as s on st.RN = s.RN)
	 inner join test as t on st.testId = t.testId
group by s.name
order by avg(mark) desc;


-- 16
ALTER TABLE student 
	MODIFY Name varchar(8000) NOT NULL;
    
-- 17
select * from student;
SET SQL_SAFE_UPDATES = 0; -- Turn OFF "Safe Update Mode" temporary
update student
set Name =  case when age > 20 then concat('Old',Name) else concat('Young',Name) end; 

-- 18
delete from test where TestId not in (select TestId from Studenttest);

-- 19
delete from studenttest where mark < 5;
select * from studenttest;


