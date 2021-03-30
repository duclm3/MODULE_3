
-- tìm ra danh sách điểm trong đó không có điêm cao thứ nhất
-- sau đó gộp nhóm theo điểm ,sắp xếp thứ tự giảm dần và lấy limit 1
select diem ,count(id) as 'so luong'
from diem_sv 
where diem not in (select max(diem) from diem_sv)
group by diem
order by diem desc
limit 1;

-- top 5
select diem,SoLuong 
from (
	select diem,count(diem) as SoLuong
	from diem_sv
	group by diem
	order by diem 
	limit 2) as x
limit 1;

create table diem_sv(
	id int,
    diem int
);