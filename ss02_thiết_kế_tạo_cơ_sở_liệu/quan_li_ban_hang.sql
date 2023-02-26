create database `quanlibanhang` ;
use quanlibanhang ;

create table customer(
cID varchar(20) not null primary key ,
cName varchar(20) ,
cage int 
);

create table `order`(
oID varchar(20) not null primary key ,
cID varchar(20) ,
oDate datetime ,
oTotalPrice float ,
foreign key (cID) references customer(cID)
);

create table product(
pID varchar(20) not null primary key ,
pName varchar(50) not null ,
pPrice float
);

create table orderDetail(
oID varchar(20) not null,
pID varchar(20) not null,
odQTY varchar(20) not null,
foreign key (oID) references `order`(oID),
foreign key (pID) references product (pID)
);
select * from customer ;