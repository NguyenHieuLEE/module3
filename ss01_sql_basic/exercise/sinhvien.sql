create database student_management;
use student_management;
create table SinhVien(
	Id varchar(10) primary key,
    `name` varchar(50),
    age int,
    country text
);
insert into SinhVien values
('SV02', 'Hieu', 22,'VietNam');
select * from sinhvien;
create table Class(
	Id varchar(10) primary key,
    name varchar(50)
);
insert into Class values
('SV01', 'Hieu');
select * from class;

create table Teacher(
    Id varchar(10) primary key,
    name varchar(50),
    age int,
    chucVu text
    );
insert into Teacher values
('SV01','Hoa',30,'tutor');
select * from teacher;