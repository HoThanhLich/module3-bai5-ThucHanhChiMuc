create database Demo;
use Demo;
create table Products(
                         Id int not null auto_increment primary key ,
                         productCode varchar(30) not null ,
                         productName varchar(30),
                         productPrice double,
                         productAmount int,
                         productDescription varchar(50),
                         productStatus bit
);
create unique index index_product on Products(productCode);
create unique index index_Name_Price on products(productName,productPrice);
insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES ('MSP1','San pham 1', 1.5, 15,'new',1),
       ('MSP2','San pham 2', 1.2, 15,'old',0),
       ('MSP3','San pham 3', 2.5, 15,'old',1),
       ('MSP4','San pham 4', 1.6, 15,'new',0),
       ('MSP5','San pham 5', 3.5, 15,'new',1);
explain select * from products where productName = 'san pham 3';
select * from products where productName = 'san pham 3';
select * from products where productCode = 'msp3';
delimiter //
create procedure findAllProducts()
begin
select * from products;
end //
delimiter ;
call findAllProducts();

delimiter //
create procedure addProduct(msp varchar(20),tensp varchar(20), gia double, soluong int, mota varchar(20), tinhtrang bit)

begin
insert into products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
values (msp , tensp, gia, soluong, mota, tinhtrang);
end //
delimiter ;
call addProduct('SP6', 'San pham 6',1.6, 15, 'old', 0);

delimiter //
create procedure editProduct(edit_id int, new_Code varchar(20), new_Name varchar(20), new_Price double, new_Amount int,
                             new_Description varchar(20),new_Status bit)
begin
update products set productCode = new_Code, productName = new_Name, productPrice = new_Price, productAmount = new_Amount,
                    productDescription = new_Description, productStatus = new_Status
where Id = edit_id;
end //
delimiter ;

call editProduct(5,'MSP7', 'san pham 7', 2.5,25,'New',0);

delimiter //
create procedure deleteProduct(delete_id int)
begin
delete from products where Id = delete_id;
end //
delimiter ;

call deleteProduct(5);