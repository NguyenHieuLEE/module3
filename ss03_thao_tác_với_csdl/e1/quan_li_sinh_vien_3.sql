use `QuanLySinhVien`;
select * from student;

-- lấy tất cả các tên học sinh có chữ 'h' trong tên 
select s.studentName  from student s
where studentName like '%h%';

-- Hiển thị thông tin lớp học bắt đầu từ tháng 12 
select className , startDate from class 
where startDate like '%-12-%';

-- hiển thị tất cả các môn học có credit trongg khoảng từ 3-5
select subName , credit from subject 
where credit >= 3 and credit <= 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student 
set ClassID = 2
where studentname = 'Hung' ;
-- Hiển thị các thông tin: StudentName, SubName, Mark. 
select * from student;
SELECT  StudentName, SubName,Mark 
FROM mark,student,`subject`
WHERE student.studentId=mark.studentId and `subject`.SubId=mark.SubId
ORDER BY mark DESC,StudentName ASC;

