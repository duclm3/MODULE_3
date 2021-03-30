create database demo;
use demo;
create table products(
	id int,
    productCode varchar(15),
    productName varchar(70),
    productPrice decimal,
    productAmount smallint,
    productDescription text,
    productStatus varchar(10)
);

set @id := 0;
set @status = 'Enabled';
insert into products
select @id := @id +1 as 'Id',
	   productCode,
       productName,
	   buyPrice,
       quantityInStock,
       productDescription,
       case when @status = 'Enabled' then @status = 'Disable' else @status = 'Enable' end as 'productStatus'
from classicmodels.products;

alter table products
	add unique index (productCode),
	add index (productName,productPrice);
EXPLAIN  select * from products;

create view informationPro as
select productCode,productName,productPrice,productStatus from products;
select * from informationPro;
drop view informationPro;

-- PROCEDURE
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store procedure thêm một sản phẩm mới
-- Tạo store procedure sửa thông tin sản phẩm theo id
-- Tạo store procedure xoá sản phẩm theo id

drop procedure if EXISTS all_Product  -- xoá procedure trước khi sửa sau đó mới chạy lại procedure
-- get all
delimiter // 
create procedure all_Product()
begin
	select * from products;
end//
delimiter ;
call all_Product();

-- insert product
delimiter // 
create procedure insert_Product(in idd int,
								in procode varchar(10),
                                in proname varchar(10),
                                in proprice decimal,
                                in proamout smallint,
                                in prodescription text,
                                in prostatus varchar(10))
begin
	DECLARE EXIT HANDLER FOR 1062
	BEGIN
		SELECT CONCAT('Duplicate key (',idd,')') AS message;
	END;
	insert into products values(idd,procode,proname,proprice,proamout,prodescription,prostatus);
    select 'Insert success'  AS message;
end//
delimiter ;
call insert_Product(2,'test','test',null,null,null,null);
drop procedure if exists insert_Product;

-- update product
drop procedure if EXISTS update_product
delimiter // 
create procedure update_product(in idd int,
								in procode varchar(10),
                                in proname varchar(10),
                                in proprice decimal,
                                in proamout smallint,
                                in prodescription text,
                                in prostatus varchar(10))
begin
	DECLARE EXIT HANDLER FOR sqlexception
	BEGIN
		SELECT "Can't not update" AS message;
	END;
	update products
	set productCode = procode,productName = proname,productPrice = proprice,
		productAmount = proamout,productDescription = prodescription,productStatus = prostatus
	where id = idd;    
    select 'Update success'  AS message;
end//
delimiter ;
call update_product(1,'test','test1',null,null,null,null);

-- delete product
delimiter // 
create procedure delete_product(in idd int)
begin
	DECLARE EXIT HANDLER FOR sqlexception
	BEGIN
		SELECT "Can't not delete" AS message;
	END;
	delete from products
    where id = idd;
    select 'delete success'  AS message;
end//
delimiter ;
call delete_product(12);