USE QuanLySinhVien;
-- Hiển thị số lượng sinh viên ở từng nơi
select Address, COUNT(StudentId) as 'Số lượng học viên'
from Student
group by Address;
-- Tính điểm trung bình các môn học của mỗi học viên,Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15.
SELECT StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY  S.StudentName
HAVING AVG(Mark) > 15;
-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT StudentName, avg(Mark) as 'max_avg_diem'
FROM Student , Mark where Student.StudentId = Mark.StudentId
group by student.studentid
order by avg(Mark) desc 
limit 1;



