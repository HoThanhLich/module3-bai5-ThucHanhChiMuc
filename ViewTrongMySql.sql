create view customer_views AS
select customerNumber, customerName, phone
from customers;
select * from customer_views;
create or replace view customer_view AS
select customerNumber, customerName, contactFirstName, contactLastName, phone
from customers
where city = 'Nantes';
