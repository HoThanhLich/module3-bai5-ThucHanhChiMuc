DELIMITER //
CREATE PROCEDURE getCusById
(IN cusNum INT(11))
BEGIN
SELECT * FROM customers WHERE customerNumber = cusNum;
END//
DELIMITER ;
select * from customers;
CALL getCusById(175);

DELIMITER //
CREATE PROCEDURE getCustomerCountByCity(
    IN in_city varchar(50),
    OUT total INT
)
BEGIN
SELECT COUNT(customerNumber)
into total
from customers
where city = in_city;
end //
delimiter ;
call getCustomerCountByCity('Bridgewater', @total);
select @total;
delimiter //
create procedure SetCounter(
    inout counter int,
    in inc int
)
begin
    set counter = counter + inc;
end //
delimiter ;

set @counter = 1;
call SetCounter(@counter,1);
call SetCounter(@counter,1);
call SetCounter(@counter,1);
select @counter;