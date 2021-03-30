-- tạo view mới hoặc thay thể 
CREATE OR REPLACE VIEW STUDENT_VIEW AS
SELECT name, age
FROM  student
WHERE age = 21
WITH CHECK OPTION; -- lưu lại các thay đổi khi update hoặc delete bảng chính

select * from student_view;

update student 
set Name = 'Nguyen Hong Ha' 
where RN = 1;

 EXPLAIN SELECT * FROM student; 