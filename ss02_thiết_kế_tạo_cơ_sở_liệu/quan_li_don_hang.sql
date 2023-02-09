create database quanlydonhang;
use quanlydonhang;

create table phieuxuat
(
sopx int auto_increment primary key,
ngayxuat datetime
);

create table vattu
(
mavtu int auto_increment primary key,
tenvtu varchar(50)
);

create table chitietphieuxuat
(
sopx int,
mavtu int,
dgxuat float,
slxuat int,
primary key(sopx,mavtu),
foreign key(sopx) references phieuxuat(sopx),
foreign key(mavtu) references vattu(mavtu)
);

create table phieunhap
(
sopn int auto_increment primary key,
ngaynhap datetime
);

create table chitietphieunhap
(
sopn int,
mavtu int,
dgnhap float,
slnhap int,
primary key(sopn,mavtu),
foreign key(sopn) references phieunhap(sopn),
foreign key(mavtu) references vattu(mavtu)
);

create table nhacc
(
mancc int auto_increment primary key,
tenncc varchar(50),
diachi varchar(100),
sdt varchar(11)
);

create table dondh
(sodh int primary key auto_increment,
ngaydh datetime,
mancc int,
foreign key(mancc) references nhacc(mancc)
);

create table chitietdondathang
(
sodh int,
mavtu int,
primary key(sodh,mavtu),
foreign key(sodh) references dondh(sodh),
foreign key(mavtu) references vattu(mavtu)
);