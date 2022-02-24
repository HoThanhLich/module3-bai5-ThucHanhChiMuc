DELIMITER //
create procedure findAllCustomer()
begin
select * from customers;
end //
DELIMITER ;
call findAllCustomer();
DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomer`//
CREATE PROCEDURE findAllCustomer()
BEGIN
SELECT * FROM customers where customerNumber = 175;
end //
DELIMITER ;
