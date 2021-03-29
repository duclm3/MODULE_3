CREATE TABLE contacts
( contact_id INT(11) NOT NULL AUTO_INCREMENT,
  last_name VARCHAR(30) NOT NULL,
  first_name VARCHAR(25),
  birthday DATE,
  CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
);
CREATE TABLE suppliers
( supplier_id INT(11) NOT NULL AUTO_INCREMENT,
  supplier_name VARCHAR(50) NOT NULL,
  account_rep VARCHAR(30) NOT NULL DEFAULT 'TBD',
  CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id)
);
-- Để việc quản lý khóa chính được dễ dàng hơn và có hệ thống hơn trong quá trình thao tác thêm, xóa, sửa dữ liệu
-- của khóa chính. Chúng ta sử dụng từ khóa CONSTRAINT để đặt tên cho khóa chính.
-- Nguyên tắc đặt tên cho khóa chính: PK_<tên Table>
DROP TABLE customers, suppliers;

-- Chỉnh sửa kiểu dữ liệu của cột
ALTER TABLE contacts
  ADD ctype varchar(40) NOT NULL
    AFTER contact_id,
  ADD first_name varchar(35) NULL
    AFTER last_name;
    
-- Xoá cột trong bảng
ALTER TABLE suppliers
  DROP COLUMN account_rep;
  
-- Thay đổi tên và kiểu dữ liệu của cộtruncate
ALTER TABLE contacts
  CHANGE COLUMN ctype contact_type 
    varchar(50) NOT NULL;
-- Chỉ thay đổi tên bảng
ALTER TABLE contacts
  RENAME TO people;
  
  
CREATE TABLE users(
   user_id INT AUTO_INCREMENT PRIMARY KEY,
   username VARCHAR(40),
   password VARCHAR(255),
   email VARCHAR(255)
);
CREATE TABLE roles(
   role_id INT AUTO_INCREMENT,
   role_name VARCHAR(50),
   PRIMARY KEY(role_id)
);  
CREATE TABLE userroles(
   user_id INT NOT NULL,
   role_id INT NOT NULL,
   PRIMARY KEY(user_id,role_id),
   FOREIGN KEY(user_id) REFERENCES users(user_id), /*Tạo khoá ngoại sau khi đã tạo trường dữ liệu */
   FOREIGN KEY(role_id) REFERENCES roles(role_id)
);
--   customer_id INT FOREIGN KEY REFERENCES customers(id) /*Vừa tạo trường dữ liệu vừa tạo khoái ngoại*/
