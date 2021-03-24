use classicmodels;
select * 
from customers
where customerName = 'Atelier Graphique';

select * 
from customers
where customerName like '%A%'
limit 0,10;

select * 
from customersorderDate
where city in ('Nantes','Las Vegas','Warszawa','NYC')
limit 0,30;

select * 
from orders
where orderNumber between 10100 AND 10110;

select * 
from orders
where orderDate <= '2003-03-03';