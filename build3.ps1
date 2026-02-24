$outputFile = "f:\ThacSiHoaBinh\BaoMat\BaoMatCNTT\index.html"

$headerBlock = @'
<div class="page-header">
  <img class="logo-img" src="https://upload.wikimedia.org/wikipedia/vi/thumb/b/b4/Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png/200px-Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png" alt="Logo" onerror="this.style.display='none'">
  <div class="header-text">TRƯỜNG ĐẠI HỌC HÒA BÌNH<span>Chương trình Thạc sĩ — Bài tập môn học</span></div>
</div>
'@

$part3 = @"

<!-- ===== CHƯƠNG 3 ===== -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">14</span>
</div>

<h1 class="chapter">Chương 3. Demo Các Bước Bảo Mật Trên SQL Server</h1>
<blockquote><strong>Môi trường demo:</strong> Microsoft SQL Server 2019/2022, SQL Server Management Studio (SSMS)<br><strong>Database mẫu:</strong> <code>QuanLyNhanSu</code> — Hệ thống quản lý nhân sự</blockquote>

<h2>3.0. Chuẩn bị môi trường Demo</h2>
<h3>Tạo Database và dữ liệu mẫu</h3>
<pre>
-- TẠO DATABASE VÀ DỮ LIỆU MẪU
CREATE DATABASE QuanLyNhanSu;
GO
USE QuanLyNhanSu;
GO

CREATE TABLE PhongBan (
    MaPB INT PRIMARY KEY IDENTITY(1,1),
    TenPB NVARCHAR(100) NOT NULL,
    MoTa NVARCHAR(500)
);

CREATE TABLE NhanVien (
    MaNV INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    SoDienThoai VARCHAR(15),
    CMND VARCHAR(20),           -- Dữ liệu nhạy cảm
    Luong DECIMAL(18,2),        -- Dữ liệu nhạy cảm
    MaPB INT FOREIGN KEY REFERENCES PhongBan(MaPB),
    NgayVaoLam DATE,
    ChucVu NVARCHAR(50)
);

CREATE TABLE ChamCong (
    MaCC INT PRIMARY KEY IDENTITY(1,1),
    MaNV INT FOREIGN KEY REFERENCES NhanVien(MaNV),
    NgayChamCong DATE, GioVao TIME, GioRa TIME,
    TrangThai NVARCHAR(20)
);
</pre>
<pre>
INSERT INTO PhongBan (TenPB, MoTa) VALUES
(N'Phòng Kỹ thuật', N'Phụ trách phát triển phần mềm'),
(N'Phòng Nhân sự', N'Quản lý nhân sự và tuyển dụng'),
(N'Phòng Kế toán', N'Quản lý tài chính và lương');

INSERT INTO NhanVien (HoTen,Email,SoDienThoai,CMND,Luong,MaPB,NgayVaoLam,ChucVu)
VALUES
(N'Nguyễn Văn An','an.nv@company.com','0901234567',
 '012345678901',25000000,1,'2020-01-15',N'Trưởng phòng'),
(N'Trần Thị Bình','binh.tt@company.com','0912345678',
 '012345678902',18000000,1,'2021-03-20',N'Nhân viên'),
(N'Lê Văn Cường','cuong.lv@company.com','0923456789',
 '012345678903',22000000,2,'2019-06-10',N'Trưởng phòng'),
(N'Phạm Thị Dung','dung.pt@company.com','0934567890',
 '012345678904',20000000,3,'2020-09-01',N'Kế toán trưởng'),
(N'Hoàng Văn Em','em.hv@company.com','0945678901',
 '012345678905',15000000,1,'2022-01-10',N'Nhân viên');
GO
</pre>
</div>

<!-- Demo Phân quyền -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">16</span>
</div>

<h2>3.1. Demo Phân quyền người dùng</h2>
<h3>Bước 1: Tạo Login</h3>
<pre>
CREATE LOGIN admin_hr WITH PASSWORD = 'Admin@Hr2024!';
CREATE LOGIN manager_user WITH PASSWORD = 'Manager@2024!';
CREATE LOGIN staff_user WITH PASSWORD = 'Staff@2024!';
CREATE LOGIN accountant_user WITH PASSWORD = 'Accountant@2024!';
GO
</pre>
<h3>Bước 2: Tạo User trong Database</h3>
<pre>
USE QuanLyNhanSu;
GO
CREATE USER admin_hr FOR LOGIN admin_hr;
CREATE USER manager_user FOR LOGIN manager_user;
CREATE USER staff_user FOR LOGIN staff_user;
CREATE USER accountant_user FOR LOGIN accountant_user;
GO
</pre>
<h3>Bước 3: Tạo các Role (vai trò)</h3>
<pre>
CREATE ROLE Role_QuanTriNhanSu;    -- Quản trị nhân sự: toàn quyền
CREATE ROLE Role_TruongPhong;      -- Trưởng phòng: xem NV phòng mình
CREATE ROLE Role_NhanVien;         -- Nhân viên: chỉ xem thông tin cá nhân
CREATE ROLE Role_KeToan;           -- Kế toán: truy cập thông tin lương
GO
</pre>
<h3>Bước 4: Gán quyền cho các Role</h3>
<pre>
-- Role Quản trị Nhân sự: Toàn quyền
GRANT SELECT, INSERT, UPDATE, DELETE ON NhanVien TO Role_QuanTriNhanSu;
GRANT SELECT, INSERT, UPDATE, DELETE ON PhongBan TO Role_QuanTriNhanSu;
GRANT SELECT, INSERT, UPDATE, DELETE ON ChamCong TO Role_QuanTriNhanSu;

-- Role Trưởng phòng: Xem nhân viên và chấm công, KHÔNG xem lương
GRANT SELECT ON NhanVien (MaNV,HoTen,Email,SoDienThoai,MaPB,
    NgayVaoLam,ChucVu) TO Role_TruongPhong;
GRANT SELECT ON ChamCong TO Role_TruongPhong;
DENY SELECT ON NhanVien (Luong, CMND) TO Role_TruongPhong;

-- Role Nhân viên: Chỉ xem thông tin cơ bản
GRANT SELECT ON NhanVien (MaNV,HoTen,Email,MaPB,ChucVu)
    TO Role_NhanVien;
DENY SELECT ON NhanVien (CMND,Luong,SoDienThoai) TO Role_NhanVien;

-- Role Kế toán: Xem lương nhưng không được sửa
GRANT SELECT ON NhanVien (MaNV,HoTen,Luong,MaPB) TO Role_KeToan;
DENY INSERT, UPDATE, DELETE ON NhanVien TO Role_KeToan;
GO
</pre>
</div>

<!-- Demo Phân quyền (tiếp) -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">17</span>
</div>

<h3>Bước 5-6: Gán User vào Role và Kiểm tra</h3>
<pre>
ALTER ROLE Role_QuanTriNhanSu ADD MEMBER admin_hr;
ALTER ROLE Role_TruongPhong ADD MEMBER manager_user;
ALTER ROLE Role_NhanVien ADD MEMBER staff_user;
ALTER ROLE Role_KeToan ADD MEMBER accountant_user;
GO

-- KIỂM TRA: Đăng nhập bằng staff_user
EXECUTE AS USER = 'staff_user';
    SELECT MaNV, HoTen, Email, ChucVu FROM NhanVien;  -- ✅ THÀNH CÔNG
    SELECT Luong FROM NhanVien;                         -- ❌ BỊ TỪ CHỐI
REVERT;
GO

-- KIỂM TRA: Đăng nhập bằng accountant_user
EXECUTE AS USER = 'accountant_user';
    SELECT MaNV, HoTen, Luong FROM NhanVien;           -- ✅ THÀNH CÔNG
    UPDATE NhanVien SET Luong = 30000000 WHERE MaNV=1;  -- ❌ BỊ TỪ CHỐI
REVERT;
GO
</pre>

<h3>Kết quả mong đợi</h3>
<table class="result-table">
<tr><th>User</th><th>Xem NV cơ bản</th><th>Xem Lương</th><th>Sửa dữ liệu</th><th>Xem Chấm công</th></tr>
<tr><td>admin_hr</td><td>✅</td><td>✅</td><td>✅</td><td>✅</td></tr>
<tr><td>manager_user</td><td>✅</td><td>❌</td><td>❌</td><td>✅</td></tr>
<tr><td>staff_user</td><td>✅ (hạn chế)</td><td>❌</td><td>❌</td><td>❌</td></tr>
<tr><td>accountant_user</td><td>✅ (hạn chế)</td><td>✅</td><td>❌</td><td>❌</td></tr>
</table>

<hr class="separator">
<h2>3.2. Demo Mã hóa dữ liệu</h2>
<h3>3.2.1. Mã hóa cột dữ liệu nhạy cảm (Column-Level Encryption)</h3>
<pre>
-- Bước 1: Tạo Master Key và Certificate
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'MasterKey@2024!Secure';
GO
CREATE CERTIFICATE Cert_NhanVien
    WITH SUBJECT = 'Certificate for NhanVien sensitive data';
GO
CREATE SYMMETRIC KEY Key_NhanVien
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE Cert_NhanVien;
GO

-- Bước 2: Thêm cột mã hóa
ALTER TABLE NhanVien ADD CMND_Encrypted VARBINARY(256);
ALTER TABLE NhanVien ADD Luong_Encrypted VARBINARY(256);
GO

-- Mã hóa dữ liệu
OPEN SYMMETRIC KEY Key_NhanVien
    DECRYPTION BY CERTIFICATE Cert_NhanVien;
UPDATE NhanVien SET
    CMND_Encrypted = EncryptByKey(Key_GUID('Key_NhanVien'), CMND),
    Luong_Encrypted = EncryptByKey(Key_GUID('Key_NhanVien'),
        CAST(Luong AS VARCHAR(50)));
CLOSE SYMMETRIC KEY Key_NhanVien;
GO
</pre>
</div>

<!-- Demo Mã hóa (tiếp) + Audit -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">19</span>
</div>

<h3>Giải mã dữ liệu khi cần</h3>
<pre>
OPEN SYMMETRIC KEY Key_NhanVien DECRYPTION BY CERTIFICATE Cert_NhanVien;
SELECT MaNV, HoTen,
    CONVERT(VARCHAR(20), DecryptByKey(CMND_Encrypted)) AS CMND_GiaiMa,
    CONVERT(DECIMAL(18,2),
        CONVERT(VARCHAR(50), DecryptByKey(Luong_Encrypted))) AS Luong_GiaiMa
FROM NhanVien;
CLOSE SYMMETRIC KEY Key_NhanVien;
GO
</pre>

<h3>3.2.2. Transparent Data Encryption (TDE)</h3>
<pre>
-- Tạo Master Key và Certificate ở mức Server
USE master;
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'ServerMaster@2024!';
GO
CREATE CERTIFICATE Cert_TDE_QuanLyNhanSu
    WITH SUBJECT = 'TDE Certificate for QuanLyNhanSu';
GO

-- Tạo Database Encryption Key và bật TDE
USE QuanLyNhanSu;
GO
CREATE DATABASE ENCRYPTION KEY
    WITH ALGORITHM = AES_256
    ENCRYPTION BY SERVER CERTIFICATE Cert_TDE_QuanLyNhanSu;
GO
ALTER DATABASE QuanLyNhanSu SET ENCRYPTION ON;
GO

-- Kiểm tra trạng thái mã hóa
SELECT db.name AS DatabaseName,
    CASE dek.encryption_state
        WHEN 3 THEN N'Đã mã hóa' ELSE N'Chưa mã hóa'
    END AS TrangThai,
    dek.key_algorithm AS ThuatToan,
    dek.key_length AS DoRongKey
FROM sys.dm_database_encryption_keys dek
JOIN sys.databases db ON dek.database_id = db.database_id;
GO
</pre>
</div>

<!-- Demo Audit -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">21</span>
</div>

<h2>3.3. Demo Kiểm toán (Audit)</h2>
<pre>
-- Bước 1: Tạo Server Audit
USE master;
GO
CREATE SERVER AUDIT Audit_QuanLyNhanSu
TO FILE (
    FILEPATH = 'C:\AuditLogs\',
    MAXSIZE = 100 MB,
    MAX_ROLLOVER_FILES = 10
)
WITH (QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE);
GO
ALTER SERVER AUDIT Audit_QuanLyNhanSu WITH (STATE = ON);
GO

-- Bước 2: Tạo Database Audit Specification
USE QuanLyNhanSu;
GO
CREATE DATABASE AUDIT SPECIFICATION AuditSpec_NhanVien
FOR SERVER AUDIT Audit_QuanLyNhanSu
ADD (SELECT ON OBJECT::dbo.NhanVien BY public),
ADD (INSERT ON OBJECT::dbo.NhanVien BY public),
ADD (UPDATE ON OBJECT::dbo.NhanVien BY public),
ADD (DELETE ON OBJECT::dbo.NhanVien BY public)
WITH (STATE = ON);
GO

-- Bước 3: Thực hiện thao tác để tạo log
SELECT * FROM NhanVien;
UPDATE NhanVien SET ChucVu = N'Phó phòng' WHERE MaNV = 2;
INSERT INTO NhanVien (HoTen,Email,CMND,Luong,MaPB,NgayVaoLam,ChucVu)
VALUES (N'Đỗ Văn Phúc','phuc.dv@company.com','012345678906',
    16000000,2,'2024-02-01',N'Nhân viên');
DELETE FROM NhanVien WHERE MaNV = 6;
GO

-- Bước 4: Xem kết quả audit log
SELECT event_time AS ThoiGian,
    CASE action_id
        WHEN 'SL' THEN 'SELECT' WHEN 'IN' THEN 'INSERT'
        WHEN 'UP' THEN 'UPDATE' WHEN 'DL' THEN 'DELETE'
        ELSE action_id
    END AS HanhDong,
    server_principal_name AS NguoiDung,
    object_name AS TenBang,
    statement AS CauLenhSQL,
    succeeded AS KetQua
FROM sys.fn_get_audit_file('C:\AuditLogs\*.sqlaudit', DEFAULT, DEFAULT)
WHERE database_name = 'QuanLyNhanSu'
ORDER BY event_time DESC;
GO
</pre>

<h3>Kết quả mong đợi</h3>
<table class="result-table">
<tr><th>Thời gian</th><th>Hành động</th><th>Người dùng</th><th>Bảng</th><th>Kết quả</th></tr>
<tr><td>2024-01-15 10:30</td><td>DELETE</td><td>sa</td><td>NhanVien</td><td>Thành công</td></tr>
<tr><td>2024-01-15 10:29</td><td>INSERT</td><td>sa</td><td>NhanVien</td><td>Thành công</td></tr>
<tr><td>2024-01-15 10:28</td><td>UPDATE</td><td>sa</td><td>NhanVien</td><td>Thành công</td></tr>
<tr><td>2024-01-15 10:27</td><td>SELECT</td><td>sa</td><td>NhanVien</td><td>Thành công</td></tr>
</table>
</div>
"@

[System.IO.File]::AppendAllText($outputFile, $part3, [System.Text.UTF8Encoding]::new($false))
Write-Host "Part 3 done (Chapter 3 - Demo)"
