create database testprocedure;
use testprocedure;
create table SumOfAll
(
   Amount int
);
insert into SumOfAll values(100); 
insert into SumOfAll values(330);
insert into SumOfAll values(450); 
insert into SumOfAll values(400);

-- dùng để phân cách bộ nhớ lưu trữ thủ tục Cache và mở ra một ô lưu trữ mới.
drop procedure if exists sp_ChechValue1;
delimiter // 
create procedure sp_ChechValue1(IN value1 int,OUT value2 int)
begin
	set value2=(select Amount from SumOfAll where Amount=value1);
    select 1;
end// -- đóng lại ô lưu trữ
call sp_ChechValue1(300,@isPresent);
select @isPresent;


drop procedure if EXISTS sp_ChechValue2  -- xoá procedure trước khi sửa sau đó mới chạy lại procedure
delimiter // 
create procedure sp_ChechValue2(OUT value2 int)
begin
	set value2 = (select max(Amount) from SumOfAll);
end//
delimiter ;

call sp_ChechValue2(@isPresent);
select @isPresent;




