use `quanlibanhang`;

select * from customer ;
insert into customer value (1, 'Minh Quan' , 10) , (2, 'Ngọc Anh' , 20), (3, 'Hong Ha' , 50);
select * from  `order`;
insert into `order` value (1,1,'2006-03-21',null),
(2,2,'2006-03-23',null),
(3,1,'2006-03-16',null);
select * from product;
insert into product value(1,'May Giat',3),(2,'Tu Lanh',5),(3,'Dieu Hoa',7),(4,'Quat',1),(5,'Bep Dien',2);
select * from orderdetail;
insert into orderdetail value (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID , oDate , oTotalPrice from `order` ;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select cID,cName,pName from customer, product where customer.cID=product.pID;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select cName from customer c left join `order` o on c.cId = o.cId where o.cId is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice)
select o.oID  as 'Mã Hóa Đơn'  , o.oDate as 'Ngày Đặt Hàng' , sum(pPrice*odQTY) as 'Tổng Giá Tiền' from `order` as o
join orderdetail as d on d.oID = o.oID
join product as p on p.pID = d.pID
group by o.oID;
