
create database `demo_product` ;

use demo_product ;

create table product(
ID int primary key,
productCode varchar(30),
productName varchar(40),
productPrice double,
productAmount int,
productDescription varchar(50),
productStatus bit
);

insert into product(ID , productCode , productName , productPrice , productAmount , productDescription ,productStatus )
valueS(1,'BMW999' , 'BMW' ,10000,2,'Black',1  ),
(2,'Audi999' , 'Audi' ,110000,8,'White',0  ),
(3,'Ducati999' , 'Ducati' ,11000,7,'Green',0  ),
(4,'rolls royce 999' , 'rolls royce' ,11000,2,'yewllo',0 ),
(5,'Honda999' , 'Honda' ,11000,3,'Red',1  ),
(6,'mercedes999' , 'Mercedes' ,11000,4,'Pink',1 );

select * from product;
insert into product(ID , productCode , productName , productPrice , productAmount , productDescription ,productStatus )
value
(7,'rolls royce 999' , 'rolls royce' ,11000,2,'yewllo',0 );
update product 
set 
productName = 'rolls royce phantom',
productAmount = 3 ,
productPrice = 100000,
productCode = 'rolls royce 9999' ,
productDescription = 'black'
where ID = 7 ;

-- B3 : index 
explain select * from product where productCode ='rolls royce 999';
create unique index uni_codeProduct on product(productCode);
explain select * from product where productCode ='rolls royce 999';
drop index uni_codeProduct on product;
-- c2 : alter table product add index i_codeProduct (productCode);
-- c2 : alter table product drop index i_codeProduct;

explain select * from product where productName ='Mercedes' and productPrice = 11000;
create index comp_codeProduct on product(productName , productPrice);
explain select * from product where productName ='Mercedes' and productPrice = 11000;
drop index comp_codeProduct on product;

-- B4 : view
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view w_infProduct as
select productCode , productName , productprice , productStatus from product;
-- sử dụng view
select * from product;
select * from w_infProduct;
-- update vs view
update w_infProduct 
set 
productName = 'rolls royce phantom sjc'
where productCode ='rolls royce 999';
-- xóa view
drop view  w_infProduct ;

-- B5 : store procedure
-- | Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product |
delimiter \\
create procedure get_inf()
begin 
select * from product;
end \\
delimiter ;
-- gọi 
call get_inf();

insert into product(ID , productCode , productName , productPrice , productAmount , productDescription ,productStatus )
value
(9,'rolls royce 999' , 'rolls royce' ,11000,2,'yewllo',0 );



-- | Tạo store procedure thêm một sản phẩm mới |
delimiter \\
create procedure add_product(in new_ID int ,in new_productCode varchar(40),
 in new_productName varchar(40),in new_productPrice double,
 in new_productAmount int, in new_productDescription varchar(40) , in new_productStatus bit)
begin
insert into product(ID , productCode , productName , productPrice , productAmount , productDescription ,productStatus )
values(new_ID , new_productCode, new_productName,
 new_productPrice , new_productAmount, 
 new_productDescription,new_productStatus);
end \\
delimiter ;
-- gọi 
call add_product(10,'xxx' , 'UFO' ,11000,2,'yewllo',1);
select * from product;
drop procedure add_product;



-- | Xóa sp theo ID |
delimiter \\
create procedure dele_product (in ID_delete int)
begin 
delete from product where ID = ID_delete;
end \\
delimiter ;
-- gọi
call dele_product(1);
select * from product;



-- | Sửa sp theo ID | 
delimiter \\
create procedure edit_product(in ID_edit int , in productName_edit varchar(40) , in productDescription_edit varchar(40))
begin
update product
set  
productName = productName_edit,
productDescription = productDescription_edit
where ID = ID_edit ;
end \\
delimiter ;
-- gọi
call edit_product(3 , 'đu cả tỷ' , 'đã độ bô');
select * from product;
drop procedure edit_product;