create database QLBH;
create table customer(
	cid int primary key,
    cname varchar(25),
    cAge tinyint
);

create table orders(
	oid int primary key,
	cid int,
    odate datetime,
    ototalprice int,
    foreign key(cid) references customer(cid)
);
create table product(
	pid int primary key,
    pname varchar(25),
    pprice int
);
create table ordertail(
	oid int,
    pid int,
    odqty int,
	foreign key(oid) references orders(oid),
	foreign key(pid) references product(pid),
    primary key(oid,pid)
);

-- 2
-- oID, oDate, oPrice 
select * from orders order by odate desc;

-- 3
select pname , pprice 
from product
where pprice in (select max(pprice) from product);

-- 4
select c.cname, p.pname
from ((customer as c inner join orders as o on c.cid = o.cid)
		inner join ordertail as odt on o.oid = odt.oid)
			inner join product as p on odt.pid = p.pid;

-- 5
select cname
from customer as c left join orders as o on c.cid = o.cid
where c.cid not in (select cid from orders);

-- 6
select odt.oid,odate,odqty,pname,pprice
from (orders as o inner join ordertail as odt on o.oid = odt.oid)
		inner join product as p on p.pid = odt.pid;
-- 7
select odt.oid,odate,sum(odqty * pprice) as 'Total' 
from (orders as o inner join ordertail as odt on o.oid = odt.oid)
		inner join product as p on p.pid = odt.pid
group by oid;
