select productCode, productName, buyprice, quantityInStock from products
where buyprice > 56.76 and quantityInStock > 10;

SELECT productCode,productName, buyprice, textDescription
FROM products
INNER JOIN productlines
ON products.productline = productlines.productline
WHERE buyprice > 56.76 AND buyprice < 95.59;

select productCode, productName, buyprice, quantityInStock, productVendor, productLine 
from products 
where productLine = 'Classic Cars' or productVendor = 'Min Lin Diecast';

select customers.customerNumber, customerName, phone, paymentDate, amount from customers
inner join payments
on customers.customerNumber = payments.customerNumber
where city = 'Las Vegas';

select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers
left join orders
on customers.customerNumber = orders.customerNumber ;

select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers LEFT JOIN orders
on customers.customerNumber = orders.customerNumber
where orderNumber is null;

select status from orders 
group by status;

select status, COUNT(*) as 'So luong status'
from orders
group by status;

select customerNumber, COUNT(*) as 'So luong status'
from orders
group by customerNumber;

select orderNumber,max(orderLineNumber) 
from orderdetails
group by orderNumber;

select productCode,sum(orderLineNumber)
from orderdetails
group by productCode;

select productCode,orderLineNumber
from orderdetails
ORDER BY productCode;

select * from orderdetails;


select status, sum(quantityOrdered * priceEach) as amount
from orders 
inner join orderdetails on orders.ordernumber = orderdetails.ordernumber
group by status;

select year(orderDate) as year, sum(quantityOrdered * priceEach) as total
from orders 
inner join orderdetails on orders.orderNumber = orderdetails.orderNumber
where status = 'shipped'
group by year
having year > 2003


