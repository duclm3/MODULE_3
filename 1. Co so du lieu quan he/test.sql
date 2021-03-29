

-- NOT NULL 
-- UNIQUE: Mỗi giá trị là duy nhất
-- CHECK:Kiểm tra dựa vào một điều kiẹn
-- DEFAULT: Quy định giá trị mặc định cho trường(nếu không nhập vào)
-- INDEX: Giúp tăng tốc độ truy vấn dữ liệu

CREATE TABLE t1 (
  -- literal defaults
  i INT         DEFAULT 0,
  c VARCHAR(10) DEFAULT '',
  -- expression defaults
  f FLOAT       DEFAULT (RAND() * RAND()),
  b BINARY(16)  DEFAULT (UUID_TO_BIN(UUID())),
  d DATE        DEFAULT (CURRENT_DATE + INTERVAL 1 YEAR),
  p POINT       DEFAULT (Point(0,0)),
  j JSON        DEFAULT (JSON_ARRAY())

);
drop table t1;