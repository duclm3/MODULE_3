ALTER TABLE customers ADD INDEX idx_customerNumber(customerNumber);
EXPLAIN SELECT * FROM customers WHERE customerNumber = 175;

ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';

ALTER TABLE customers DROP INDEX idx_full_name;


-- procedure
DELIMITER //
CREATE PROCEDURE findAllCustomers()

BEGIN

  SELECT * FROM customers;

END //
DELIMITER ;
call findAllCustomers();

DROP PROCEDURE IF EXISTS findAllCustomers

DELIMITER //
CREATE PROCEDURE findAllCustomers()
BEGIN
   SELECT *  FROM customers where customerNumber = 175;
END //
DELIMITER ; -- Khoảng trắng và dấu ;

-- GetCustomersCountByCity


DROP PROCEDURE IF EXISTS GetCustomersCountByCity
DELIMITER //
CREATE PROCEDURE GetCustomersCountByCity
(  IN  in_city VARCHAR(50),OUT total INT)
BEGIN
	SELECT COUNT(customerNumber)
    INTO total -- new table total
    FROM customers
    WHERE city = in_city;
END //
DELIMITER ;

CALL GetCustomersCountByCity('Lyon',@total);
SELECT @total;
select * from total;

-- SELECT INTO # INSERT INTO
SET @Ttotal = null;
SELECT customerNumber
INTO @Ttotal  -- new table total
FROM customers;
select @Ttotal;

-- SetCounter
DELIMITER //
CREATE PROCEDURE SetCounter(INOUT counter INT,IN inc INT
)
BEGIN
    SET counter = counter + inc;
END//
DELIMITER ;

SET @counter = 1;
CALL SetCounter(@counter,1); -- 2
CALL SetCounter(@counter,1); -- 3
CALL SetCounter(@counter,5); -- 8
SELECT @counter; -- 8

-- VIEW
CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';
SELECT * FROM customer_views;
DROP VIEW customer_views;

