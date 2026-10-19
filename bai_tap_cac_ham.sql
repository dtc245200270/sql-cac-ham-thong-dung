USE QuanLySinhVien;

-- 1. Hien thi tat ca cac thong tin mon hoc (bang Subject) co credit lon nhat
SELECT *
FROM Subject
WHERE Credit = (SELECT MAX(Credit) FROM Subject);

-- 2. Hien thi cac thong tin mon hoc co diem thi lon nhat
SELECT S.SubId, S.SubName, S.Credit, S.Status, M.Mark
FROM Subject S
JOIN Mark M ON S.SubId = M.SubId
WHERE M.Mark = (SELECT MAX(Mark) FROM Mark);

-- 3. Hien thi cac thong tin sinh vien va diem trung binh giam dan
SELECT S.StudentId, S.StudentName, S.Address, S.Phone, S.Status, S.ClassId, AVG(M.Mark) AS DiemTrungBinh
FROM Student S
LEFT JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName, S.Address, S.Phone, S.Status, S.ClassId
ORDER BY DiemTrungBinh DESC;
