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


alter table student
add CONSTRAINT check_StudentAge CHECK ((Age>=15 AND Age <=55));

insert into Student values(5,'Test',14);

alter table student
	add check(Age>=18);
    
 insert into student(RN, Name, Age)
 values(21, 'a',14);
 
select * from student where Age = 14;
select * from studenttest;

ALTER TABLE studenttest
ALTER Mark SET DEFAULT 0;

create table Student1
(
	RN int auto_increment primary key,
    Name varchar(20),
    Age tinyint
);
alter table student1
add CHECK (Age>=15 AND Age <=55);

 insert into student1(RN, Name, Age)
 values(21, 'a',14);
 
 alter table student1
add CHECK (Age>=10);

 insert into student1(Age)
 values(5);


    