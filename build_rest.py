# -*- coding: utf-8 -*-
"""Insert Chapters 2, 3, 4, and Conclusion into index.html"""
import os

output = r"f:\ThacSiHoaBinh\BaoMat\BaoMatCNTT\index.html"

with open(output, 'r', encoding='utf-8') as f:
    content = f.read()

hb = '''<div class="page-header">
  <img class="logo-img" src="https://upload.wikimedia.org/wikipedia/vi/thumb/b/b4/Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png/200px-Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png" alt="Logo" onerror="this.style.display='none'">
  <div class="header-text">TRƯỜNG ĐẠI HỌC HÒA BÌNH<span>Chương trình Thạc sĩ — Bài tập môn học</span></div>
</div>'''

ft = "Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu"
def footer(p): return f'<div class="page-footer">\n  <span class="footer-title">{ft}</span>\n  <span class="page-number">{p}</span>\n</div>'

chapters = f'''
<!-- ===== CHƯƠNG 2 ===== -->
<div class="page">
{hb}
{footer(7)}
<h1 class="chapter">Chương 2. Vấn Đề Nghiên Cứu và Giải Pháp An Toàn</h1>
<h2>2.1. Các mối đe dọa đối với cơ sở dữ liệu</h2>
<h3>2.1.1. Tổng quan tình hình an ninh mạng</h3>
<p>Trong bối cảnh chuyển đổi số toàn cầu, các cuộc tấn công mạng ngày càng gia tăng cả về số lượng lẫn mức độ tinh vi:</p>
<ul>
<li>Số lượng cuộc tấn công ransomware tăng trung bình 13% mỗi năm.</li>
<li>Chi phí trung bình cho một vụ rò rỉ dữ liệu lên đến 4.45 triệu USD (IBM, 2023).</li>
<li>82% các vụ vi phạm dữ liệu liên quan đến yếu tố con người (Verizon DBIR, 2023).</li>
<li>Tại Việt Nam, Luật An ninh mạng 2018 và Nghị định 13/2023/NĐ-CP đặt ra yêu cầu nghiêm ngặt về bảo mật.</li>
</ul>
<h3>2.1.2. Phân loại các mối đe dọa</h3>
<h4>A. Tấn công từ bên ngoài</h4>
<table class="threat-table">
<tr><th>Loại tấn công</th><th>Mô tả</th><th>Mức độ</th></tr>
<tr><td><strong>SQL Injection</strong></td><td>Chèn mã SQL độc hại qua input để truy cập/sửa đổi CSDL trái phép</td><td>&#128308; Rất cao</td></tr>
<tr><td><strong>Brute Force</strong></td><td>Thử tất cả tổ hợp mật khẩu để đăng nhập trái phép</td><td>&#128992; Cao</td></tr>
<tr><td><strong>Man-in-the-Middle</strong></td><td>Chặn bắt và sửa đổi dữ liệu truyền giữa client và server</td><td>&#128308; Rất cao</td></tr>
<tr><td><strong>Ransomware</strong></td><td>Mã hóa dữ liệu đòi tiền chuộc</td><td>&#128308; Rất cao</td></tr>
<tr><td><strong>DDoS</strong></td><td>Tấn công từ chối dịch vụ làm tê liệt hệ thống</td><td>&#128992; Cao</td></tr>
<tr><td><strong>Phishing</strong></td><td>Lừa đảo người dùng để lấy thông tin đăng nhập</td><td>&#128992; Cao</td></tr>
</table>
<h4>B. Mối đe dọa từ bên trong</h4>
<table class="threat-table">
<tr><th>Loại mối đe dọa</th><th>Mô tả</th><th>Mức độ</th></tr>
<tr><td><strong>Nhân viên cố ý</strong></td><td>Nhân viên có quyền truy cập cố tình lấy cắp hoặc phá hoại dữ liệu</td><td>&#128308; Rất cao</td></tr>
<tr><td><strong>Sai sót vô ý</strong></td><td>Xóa nhầm dữ liệu, cấu hình sai, chia sẻ quyền không đúng</td><td>&#128992; Cao</td></tr>
<tr><td><strong>Tài khoản bị chiếm</strong></td><td>Tài khoản hợp lệ bị kẻ tấn công kiểm soát</td><td>&#128308; Rất cao</td></tr>
<tr><td><strong>Quyền truy cập dư thừa</strong></td><td>Cấp quyền nhiều hơn mức cần thiết</td><td>&#128993; Trung bình</td></tr>
</table>
<h4>C. Lỗ hổng kỹ thuật</h4>
<ul>
<li><strong>Cấu hình mặc định:</strong> Sử dụng tài khoản <code>sa</code> với mật khẩu yếu hoặc rỗng.</li>
<li><strong>Phần mềm lỗi thời:</strong> Không cập nhật bản vá bảo mật cho HQTCSDL.</li>
<li><strong>Dữ liệu không mã hóa:</strong> Lưu trữ mật khẩu dạng plain text.</li>
<li><strong>Thiếu kiểm toán:</strong> Không ghi nhận log hoạt động.</li>
<li><strong>Thiếu sao lưu:</strong> Không có kế hoạch sao lưu định kỳ.</li>
</ul>
</div>

<div class="page">
{hb}
{footer(9)}
<h2>2.2. Các giải pháp bảo mật và an toàn thông tin</h2>
<p>Dựa trên phân tích các mối đe dọa, chúng tôi đề xuất <strong>4 giải pháp chính</strong> triển khai trên SQL Server:</p>
<h3>2.2.1. Giải pháp 1: Phân quyền người dùng (Authorization &amp; Access Control)</h3>
<p><strong>Mục tiêu:</strong> Đảm bảo mỗi người dùng chỉ có quyền truy cập tối thiểu cần thiết.</p>
<p><strong>Nguyên tắc:</strong> Principle of Least Privilege (PoLP), Separation of Duties (SoD), Role-Based Access Control (RBAC).</p>
<table>
<tr><th>Biện pháp</th><th>Mô tả</th><th>Công cụ SQL Server</th></tr>
<tr><td>Tạo Login &amp; User</td><td>Phân biệt tài khoản đăng nhập và tài khoản CSDL</td><td><code>CREATE LOGIN</code>, <code>CREATE USER</code></td></tr>
<tr><td>Tạo Role</td><td>Nhóm quyền theo vai trò nghiệp vụ</td><td><code>CREATE ROLE</code>, <code>ALTER ROLE</code></td></tr>
<tr><td>Cấp/Thu hồi quyền</td><td>Gán quyền cụ thể cho từng role/user</td><td><code>GRANT</code>, <code>DENY</code>, <code>REVOKE</code></td></tr>
<tr><td>Schema separation</td><td>Tách biệt dữ liệu theo schema</td><td><code>CREATE SCHEMA</code></td></tr>
<tr><td>Row-Level Security</td><td>Kiểm soát truy cập ở mức dòng dữ liệu</td><td>Security Policy, Filter Predicate</td></tr>
</table>
<h3>2.2.2. Giải pháp 2: Mã hóa dữ liệu (Data Encryption)</h3>
<p><strong>Mục tiêu:</strong> Bảo vệ dữ liệu nhạy cảm cả khi lưu trữ (at rest) và khi truyền tải (in transit).</p>
<table>
<tr><th>Phương pháp</th><th>Phạm vi</th><th>Hiệu năng</th><th>Độ bảo mật</th><th>Phù hợp</th></tr>
<tr><td><strong>TDE</strong></td><td>Toàn bộ DB</td><td>Ảnh hưởng ít</td><td>Cao</td><td>Bảo vệ file backup</td></tr>
<tr><td><strong>Column Encryption</strong></td><td>Từng cột</td><td>Ảnh hưởng vừa</td><td>Rất cao</td><td>Dữ liệu nhạy cảm cụ thể</td></tr>
<tr><td><strong>Always Encrypted</strong></td><td>Từng cột</td><td>Ảnh hưởng nhiều</td><td>Cực cao</td><td>Yêu cầu end-to-end</td></tr>
<tr><td><strong>TLS/SSL</strong></td><td>Truyền tải</td><td>Ảnh hưởng ít</td><td>Cao</td><td>Mọi kết nối</td></tr>
</table>
</div>

<div class="page">
{hb}
{footer(11)}
<h3>2.2.3. Giải pháp 3: Kiểm toán (Database Auditing)</h3>
<p><strong>Mục tiêu:</strong> Ghi nhận và giám sát mọi hoạt động trên CSDL để phát hiện bất thường.</p>
<table>
<tr><th>Loại sự kiện</th><th>Ví dụ</th><th>Mức độ quan trọng</th></tr>
<tr><td>Đăng nhập/Đăng xuất</td><td>Login thành công/thất bại</td><td>Cao</td></tr>
<tr><td>Thay đổi dữ liệu</td><td>INSERT, UPDATE, DELETE trên bảng nhạy cảm</td><td>Rất cao</td></tr>
<tr><td>Thay đổi cấu trúc</td><td>ALTER TABLE, DROP TABLE</td><td>Rất cao</td></tr>
<tr><td>Thay đổi quyền</td><td>GRANT, REVOKE, DENY</td><td>Cao</td></tr>
<tr><td>Truy vấn dữ liệu</td><td>SELECT trên dữ liệu nhạy cảm</td><td>Trung bình</td></tr>
<tr><td>Sao lưu/Phục hồi</td><td>BACKUP, RESTORE</td><td>Cao</td></tr>
</table>
<h3>2.2.4. Giải pháp 4: Sao lưu và Phục hồi (Backup &amp; Recovery)</h3>
<p><strong>Mục tiêu:</strong> Đảm bảo khả năng phục hồi dữ liệu nhanh chóng khi xảy ra sự cố.</p>
<table>
<tr><th>Loại sao lưu</th><th>Tần suất</th><th>Mô tả</th><th>Recovery Point</th></tr>
<tr><td><strong>Full Backup</strong></td><td>Hàng ngày (tối)</td><td>Sao lưu toàn bộ database</td><td>Đến thời điểm backup</td></tr>
<tr><td><strong>Differential Backup</strong></td><td>Mỗi 6 giờ</td><td>Sao lưu phần thay đổi từ Full gần nhất</td><td>Đến thời điểm diff backup</td></tr>
<tr><td><strong>Transaction Log Backup</strong></td><td>Mỗi 15-30 phút</td><td>Sao lưu log giao dịch</td><td>Đến thời điểm cụ thể (point-in-time)</td></tr>
</table>
<p><strong>Nguyên tắc 3-2-1:</strong> <strong>3</strong> bản sao lưu, <strong>2</strong> loại phương tiện khác nhau, <strong>1</strong> bản ở vị trí khác (offsite/cloud).</p>
<hr class="separator">
<h2>2.3. Tổng kết các giải pháp</h2>
<p>Bốn giải pháp tạo thành hệ thống bảo mật toàn diện theo nguyên tắc <strong>Defense in Depth</strong> (Phòng thủ nhiều lớp).</p>
</div>

<!-- ===== CHƯƠNG 3 ===== -->
<div class="page">
{hb}
{footer(14)}
<h1 class="chapter">Chương 3. Demo Các Bước Bảo Mật Trên SQL Server</h1>
<blockquote><strong>Môi trường demo:</strong> Microsoft SQL Server 2019/2022, SQL Server Management Studio (SSMS)<br><strong>Database mẫu:</strong> <code>QuanLyNhanSu</code> — Hệ thống quản lý nhân sự</blockquote>
<h2>3.0. Chuẩn bị môi trường Demo</h2>
<h3>Tạo Database và dữ liệu mẫu</h3>
<pre>CREATE DATABASE QuanLyNhanSu;
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
    CMND VARCHAR(20),           -- Du lieu nhay cam
    Luong DECIMAL(18,2),        -- Du lieu nhay cam
    MaPB INT FOREIGN KEY REFERENCES PhongBan(MaPB),
    NgayVaoLam DATE,
    ChucVu NVARCHAR(50)
);

CREATE TABLE ChamCong (
    MaCC INT PRIMARY KEY IDENTITY(1,1),
    MaNV INT FOREIGN KEY REFERENCES NhanVien(MaNV),
    NgayChamCong DATE, GioVao TIME, GioRa TIME,
    TrangThai NVARCHAR(20)
);</pre>
<pre>INSERT INTO PhongBan (TenPB, MoTa) VALUES
(N'Phong Ky thuat', N'Phu trach phat trien phan mem'),
(N'Phong Nhan su', N'Quan ly nhan su va tuyen dung'),
(N'Phong Ke toan', N'Quan ly tai chinh va luong');

INSERT INTO NhanVien (HoTen,Email,SoDienThoai,CMND,Luong,MaPB,NgayVaoLam,ChucVu) VALUES
(N'Nguyen Van An','an.nv@company.com','0901234567','012345678901',25000000,1,'2020-01-15',N'Truong phong'),
(N'Tran Thi Binh','binh.tt@company.com','0912345678','012345678902',18000000,1,'2021-03-20',N'Nhan vien'),
(N'Le Van Cuong','cuong.lv@company.com','0923456789','012345678903',22000000,2,'2019-06-10',N'Truong phong'),
(N'Pham Thi Dung','dung.pt@company.com','0934567890','012345678904',20000000,3,'2020-09-01',N'Ke toan truong'),
(N'Hoang Van Em','em.hv@company.com','0945678901','012345678905',15000000,1,'2022-01-10',N'Nhan vien');
GO</pre>
</div>

<div class="page">
{hb}
{footer(16)}
<h2>3.1. Demo Phân quyền người dùng</h2>
<h3>Bước 1: Tạo Login</h3>
<pre>CREATE LOGIN admin_hr WITH PASSWORD = 'Admin@Hr2024!';
CREATE LOGIN manager_user WITH PASSWORD = 'Manager@2024!';
CREATE LOGIN staff_user WITH PASSWORD = 'Staff@2024!';
CREATE LOGIN accountant_user WITH PASSWORD = 'Accountant@2024!';
GO</pre>
<h3>Bước 2: Tạo User trong Database</h3>
<pre>USE QuanLyNhanSu;
GO
CREATE USER admin_hr FOR LOGIN admin_hr;
CREATE USER manager_user FOR LOGIN manager_user;
CREATE USER staff_user FOR LOGIN staff_user;
CREATE USER accountant_user FOR LOGIN accountant_user;
GO</pre>
<h3>Bước 3: Tạo các Role (vai trò)</h3>
<pre>CREATE ROLE Role_QuanTriNhanSu;
CREATE ROLE Role_TruongPhong;
CREATE ROLE Role_NhanVien;
CREATE ROLE Role_KeToan;
GO</pre>
<h3>Bước 4: Gán quyền cho các Role</h3>
<pre>-- Role Quan tri Nhan su: Toan quyen
GRANT SELECT, INSERT, UPDATE, DELETE ON NhanVien TO Role_QuanTriNhanSu;
GRANT SELECT, INSERT, UPDATE, DELETE ON PhongBan TO Role_QuanTriNhanSu;
GRANT SELECT, INSERT, UPDATE, DELETE ON ChamCong TO Role_QuanTriNhanSu;

-- Role Truong phong: Xem nhan vien va cham cong, KHONG xem luong
GRANT SELECT ON NhanVien (MaNV,HoTen,Email,SoDienThoai,MaPB,NgayVaoLam,ChucVu) TO Role_TruongPhong;
GRANT SELECT ON ChamCong TO Role_TruongPhong;
DENY SELECT ON NhanVien (Luong, CMND) TO Role_TruongPhong;

-- Role Nhan vien: Chi xem thong tin co ban
GRANT SELECT ON NhanVien (MaNV,HoTen,Email,MaPB,ChucVu) TO Role_NhanVien;
DENY SELECT ON NhanVien (CMND,Luong,SoDienThoai) TO Role_NhanVien;

-- Role Ke toan: Xem luong nhung khong duoc sua
GRANT SELECT ON NhanVien (MaNV,HoTen,Luong,MaPB) TO Role_KeToan;
DENY INSERT, UPDATE, DELETE ON NhanVien TO Role_KeToan;
GO</pre>
</div>

<div class="page">
{hb}
{footer(17)}
<h3>Bước 5-6: Gán User vào Role và Kiểm tra</h3>
<pre>ALTER ROLE Role_QuanTriNhanSu ADD MEMBER admin_hr;
ALTER ROLE Role_TruongPhong ADD MEMBER manager_user;
ALTER ROLE Role_NhanVien ADD MEMBER staff_user;
ALTER ROLE Role_KeToan ADD MEMBER accountant_user;
GO

-- KIEM TRA: Dang nhap bang staff_user
EXECUTE AS USER = 'staff_user';
    SELECT MaNV, HoTen, Email, ChucVu FROM NhanVien;  -- THANH CONG
    SELECT Luong FROM NhanVien;                         -- BI TU CHOI
REVERT;
GO

-- KIEM TRA: Dang nhap bang accountant_user
EXECUTE AS USER = 'accountant_user';
    SELECT MaNV, HoTen, Luong FROM NhanVien;           -- THANH CONG
    UPDATE NhanVien SET Luong = 30000000 WHERE MaNV=1;  -- BI TU CHOI
REVERT;
GO</pre>
<h3>Kết quả mong đợi</h3>
<table class="result-table">
<tr><th>User</th><th>Xem NV cơ bản</th><th>Xem Lương</th><th>Sửa dữ liệu</th><th>Xem Chấm công</th></tr>
<tr><td>admin_hr</td><td>&#9989;</td><td>&#9989;</td><td>&#9989;</td><td>&#9989;</td></tr>
<tr><td>manager_user</td><td>&#9989;</td><td>&#10060;</td><td>&#10060;</td><td>&#9989;</td></tr>
<tr><td>staff_user</td><td>&#9989; (hạn chế)</td><td>&#10060;</td><td>&#10060;</td><td>&#10060;</td></tr>
<tr><td>accountant_user</td><td>&#9989; (hạn chế)</td><td>&#9989;</td><td>&#10060;</td><td>&#10060;</td></tr>
</table>
<hr class="separator">
<h2>3.2. Demo Mã hóa dữ liệu</h2>
<h3>3.2.1. Mã hóa cột dữ liệu nhạy cảm (Column-Level Encryption)</h3>
<pre>-- Buoc 1: Tao Master Key va Certificate
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'MasterKey@2024!Secure';
GO
CREATE CERTIFICATE Cert_NhanVien
    WITH SUBJECT = 'Certificate for NhanVien sensitive data';
GO
CREATE SYMMETRIC KEY Key_NhanVien
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE Cert_NhanVien;
GO

-- Buoc 2: Them cot ma hoa
ALTER TABLE NhanVien ADD CMND_Encrypted VARBINARY(256);
ALTER TABLE NhanVien ADD Luong_Encrypted VARBINARY(256);
GO

-- Ma hoa du lieu
OPEN SYMMETRIC KEY Key_NhanVien DECRYPTION BY CERTIFICATE Cert_NhanVien;
UPDATE NhanVien SET
    CMND_Encrypted = EncryptByKey(Key_GUID('Key_NhanVien'), CMND),
    Luong_Encrypted = EncryptByKey(Key_GUID('Key_NhanVien'), CAST(Luong AS VARCHAR(50)));
CLOSE SYMMETRIC KEY Key_NhanVien;
GO</pre>
</div>

<div class="page">
{hb}
{footer(19)}
<h3>Giải mã dữ liệu khi cần</h3>
<pre>OPEN SYMMETRIC KEY Key_NhanVien DECRYPTION BY CERTIFICATE Cert_NhanVien;
SELECT MaNV, HoTen,
    CONVERT(VARCHAR(20), DecryptByKey(CMND_Encrypted)) AS CMND_GiaiMa,
    CONVERT(DECIMAL(18,2), CONVERT(VARCHAR(50), DecryptByKey(Luong_Encrypted))) AS Luong_GiaiMa
FROM NhanVien;
CLOSE SYMMETRIC KEY Key_NhanVien;
GO</pre>
<h3>3.2.2. Transparent Data Encryption (TDE)</h3>
<pre>USE master;
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'ServerMaster@2024!';
GO
CREATE CERTIFICATE Cert_TDE_QuanLyNhanSu
    WITH SUBJECT = 'TDE Certificate for QuanLyNhanSu';
GO
USE QuanLyNhanSu;
GO
CREATE DATABASE ENCRYPTION KEY
    WITH ALGORITHM = AES_256
    ENCRYPTION BY SERVER CERTIFICATE Cert_TDE_QuanLyNhanSu;
GO
ALTER DATABASE QuanLyNhanSu SET ENCRYPTION ON;
GO</pre>
</div>

<div class="page">
{hb}
{footer(21)}
<h2>3.3. Demo Kiểm toán (Audit)</h2>
<pre>-- Buoc 1: Tao Server Audit
USE master;
GO
CREATE SERVER AUDIT Audit_QuanLyNhanSu
TO FILE (FILEPATH = 'C:\\AuditLogs\\', MAXSIZE = 100 MB, MAX_ROLLOVER_FILES = 10)
WITH (QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE);
GO
ALTER SERVER AUDIT Audit_QuanLyNhanSu WITH (STATE = ON);
GO

-- Buoc 2: Tao Database Audit Specification
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

-- Buoc 3: Thuc hien thao tac de tao log
SELECT * FROM NhanVien;
UPDATE NhanVien SET ChucVu = N'Pho phong' WHERE MaNV = 2;
INSERT INTO NhanVien (HoTen,Email,CMND,Luong,MaPB,NgayVaoLam,ChucVu)
VALUES (N'Do Van Phuc','phuc.dv@company.com','012345678906',16000000,2,'2024-02-01',N'Nhan vien');
DELETE FROM NhanVien WHERE MaNV = 6;
GO

-- Buoc 4: Xem ket qua audit log
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
FROM sys.fn_get_audit_file('C:\\AuditLogs\\*.sqlaudit', DEFAULT, DEFAULT)
WHERE database_name = 'QuanLyNhanSu'
ORDER BY event_time DESC;
GO</pre>
<h3>Kết quả mong đợi</h3>
<table class="result-table">
<tr><th>Thời gian</th><th>Hành động</th><th>Người dùng</th><th>Bảng</th><th>Kết quả</th></tr>
<tr><td>2024-01-15 10:30</td><td>DELETE</td><td>sa</td><td>NhanVien</td><td>Thành công</td></tr>
<tr><td>2024-01-15 10:29</td><td>INSERT</td><td>sa</td><td>NhanVien</td><td>Thành công</td></tr>
<tr><td>2024-01-15 10:28</td><td>UPDATE</td><td>sa</td><td>NhanVien</td><td>Thành công</td></tr>
<tr><td>2024-01-15 10:27</td><td>SELECT</td><td>sa</td><td>NhanVien</td><td>Thành công</td></tr>
</table>
</div>

<div class="page">
{hb}
{footer(23)}
<h2>3.4. Demo Sao lưu và Phục hồi</h2>
<h3>3.4.1. Sao lưu (Backup)</h3>
<pre>-- Full Backup
BACKUP DATABASE QuanLyNhanSu
TO DISK = 'C:\\Backup\\QuanLyNhanSu_Full.bak'
WITH FORMAT, INIT, NAME = N'Full Backup', COMPRESSION, STATS = 10;
GO

-- Differential Backup
BACKUP DATABASE QuanLyNhanSu
TO DISK = 'C:\\Backup\\QuanLyNhanSu_Diff.bak'
WITH DIFFERENTIAL, FORMAT, INIT, COMPRESSION, STATS = 10;
GO

-- Transaction Log Backup
ALTER DATABASE QuanLyNhanSu SET RECOVERY FULL;
GO
BACKUP LOG QuanLyNhanSu
TO DISK = 'C:\\Backup\\QuanLyNhanSu_Log.trn'
WITH FORMAT, INIT, COMPRESSION, STATS = 10;
GO</pre>
<h3>3.4.2. Phục hồi sau khi xóa nhầm dữ liệu</h3>
<pre>-- Gia lap su co: Xoa nham toan bo nhan vien!
DELETE FROM ChamCong;
DELETE FROM NhanVien;
SELECT COUNT(*) AS SoNhanVien FROM NhanVien;  -- Ket qua: 0

-- PHUC HOI TU BACKUP
USE master;
ALTER DATABASE QuanLyNhanSu SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
RESTORE DATABASE QuanLyNhanSu FROM DISK='C:\\Backup\\QuanLyNhanSu_Full.bak'
    WITH NORECOVERY, REPLACE, STATS=10;
RESTORE DATABASE QuanLyNhanSu FROM DISK='C:\\Backup\\QuanLyNhanSu_Diff.bak'
    WITH NORECOVERY, STATS=10;
RESTORE LOG QuanLyNhanSu FROM DISK='C:\\Backup\\QuanLyNhanSu_Log.trn'
    WITH RECOVERY, STATS=10;
GO
ALTER DATABASE QuanLyNhanSu SET MULTI_USER;
GO
USE QuanLyNhanSu;
SELECT COUNT(*) AS SoNhanVien FROM NhanVien; -- Ket qua: 6
GO</pre>
</div>

<div class="page">
{hb}
{footer(25)}
<h2>3.5. Tổng kết Demo</h2>
<table class="result-table">
<tr><th>Giải pháp</th><th>Mục tiêu</th><th>Kết quả Demo</th></tr>
<tr><td><strong>Phân quyền</strong></td><td>Kiểm soát truy cập theo vai trò</td><td>&#9989; 4 role với quyền khác nhau, kiểm tra deny thành công</td></tr>
<tr><td><strong>Mã hóa</strong></td><td>Bảo vệ dữ liệu nhạy cảm</td><td>&#9989; Column encryption (AES-256) + TDE cho toàn DB</td></tr>
<tr><td><strong>Kiểm toán</strong></td><td>Ghi nhận mọi hoạt động</td><td>&#9989; Server Audit + Database Audit Specification</td></tr>
<tr><td><strong>Sao lưu/Phục hồi</strong></td><td>Đảm bảo khả năng phục hồi</td><td>&#9989; Full + Diff + Log backup, restore thành công</td></tr>
</table>
</div>

<!-- ===== CHƯƠNG 4: OPDO.STORE ===== -->
<div class="page">
{hb}
{footer(26)}
<h1 class="chapter">Chương 4. Áp Dụng Bảo Mật Cho Dự Án Thực Tiễn — Opdo.store</h1>
<h2>4.1. Giới thiệu dự án Opdo.store</h2>
<h3>4.1.1. Tổng quan</h3>
<p><strong>Opdo.store</strong> (<a href="https://opdo.store" target="_blank">https://opdo.store</a>) là sàn thương mại điện tử chuyên về phụ tùng ô tô chính hãng cho các dòng xe châu Âu (BMW, Mercedes-Benz, Audi, Volkswagen...). Hệ thống kết nối người bán (verified sellers) với người mua, cung cấp dịch vụ tra cứu phụ tùng, đặt hàng trực tuyến, thanh toán và vận chuyển.</p>
<h3>4.1.2. Yêu cầu bảo mật đặc thù của E-commerce</h3>
<table>
<tr><th>Loại dữ liệu</th><th>Mức độ nhạy cảm</th><th>Yêu cầu bảo mật</th></tr>
<tr><td><strong>Thông tin khách hàng</strong></td><td>&#128308; Rất cao</td><td>Họ tên, email, SĐT, địa chỉ giao hàng</td></tr>
<tr><td><strong>Thông tin thanh toán</strong></td><td>&#128308; Rất cao</td><td>Số thẻ, thông tin ngân hàng, lịch sử giao dịch</td></tr>
<tr><td><strong>Thông tin người bán</strong></td><td>&#128308; Rất cao</td><td>CMND/CCCD, giấy phép kinh doanh, tài khoản bank</td></tr>
<tr><td><strong>Đơn hàng &amp; Giao dịch</strong></td><td>&#128992; Cao</td><td>Chi tiết đơn hàng, trạng thái, giá bán</td></tr>
<tr><td><strong>Danh mục sản phẩm</strong></td><td>&#128993; Trung bình</td><td>Thông tin phụ tùng, giá nhập, giá bán</td></tr>
</table>
<h3>4.1.3. Các mối đe dọa cụ thể với Opdo.store</h3>
<ul>
<li><strong>SQL Injection:</strong> Tấn công qua form tìm kiếm phụ tùng, đăng nhập, đăng ký.</li>
<li><strong>XSS (Cross-Site Scripting):</strong> Chèn mã độc vào mô tả sản phẩm, review.</li>
<li><strong>CSRF (Cross-Site Request Forgery):</strong> Giả mạo request đặt hàng, thanh toán.</li>
<li><strong>Brute Force Login:</strong> Thử mật khẩu tài khoản admin, người bán, khách hàng.</li>
<li><strong>Data Breach:</strong> Rò rỉ thông tin thanh toán, dữ liệu cá nhân khách hàng.</li>
</ul>
</div>

<div class="page">
{hb}
{footer(28)}
<h2>4.2. Kiến trúc hệ thống và cơ sở dữ liệu</h2>
<table>
<tr><th>Bảng</th><th>Mô tả</th><th>Dữ liệu nhạy cảm</th></tr>
<tr><td><code>Users</code></td><td>Tài khoản người dùng</td><td>Password hash, Email, SĐT</td></tr>
<tr><td><code>Sellers</code></td><td>Thông tin chi tiết người bán</td><td>CMND, Giấy phép KD, TK ngân hàng</td></tr>
<tr><td><code>Products</code></td><td>Danh mục phụ tùng ô tô</td><td>Giá nhập, giá bán</td></tr>
<tr><td><code>Orders</code></td><td>Đơn hàng</td><td>Địa chỉ giao hàng, tổng tiền</td></tr>
<tr><td><code>Payments</code></td><td>Giao dịch thanh toán</td><td>Token thẻ, mã giao dịch</td></tr>
<tr><td><code>AuditLogs</code></td><td>Nhật ký hoạt động</td><td>Toàn bộ thao tác hệ thống</td></tr>
</table>
<h2>4.3. Triển khai phân quyền người dùng trên Opdo.store</h2>
<h3>4.3.1. Mô hình phân quyền RBAC</h3>
<table>
<tr><th>Role</th><th>Mô tả</th><th>Quyền chính</th></tr>
<tr><td><strong>SuperAdmin</strong></td><td>Quản trị viên cao nhất</td><td>Toàn quyền hệ thống, quản lý user, cấu hình</td></tr>
<tr><td><strong>Admin</strong></td><td>Quản trị viên</td><td>Quản lý sản phẩm, đơn hàng, duyệt người bán</td></tr>
<tr><td><strong>Seller</strong></td><td>Người bán hàng</td><td>CRUD sản phẩm của mình, xem đơn hàng của mình</td></tr>
<tr><td><strong>Customer</strong></td><td>Khách hàng</td><td>Xem sản phẩm, đặt hàng, xem đơn hàng cá nhân</td></tr>
<tr><td><strong>Support</strong></td><td>Nhân viên hỗ trợ</td><td>Xem đơn hàng, hỗ trợ KH, KHÔNG xem thanh toán</td></tr>
</table>
<h3>4.3.2. Triển khai trên SQL Server</h3>
<pre>CREATE ROLE Role_SuperAdmin;
CREATE ROLE Role_Admin;
CREATE ROLE Role_Seller;
CREATE ROLE Role_Customer;
CREATE ROLE Role_Support;
GO

GRANT CONTROL ON DATABASE::OpdoStore TO Role_SuperAdmin;

GRANT SELECT, INSERT, UPDATE ON Products TO Role_Admin;
GRANT SELECT, UPDATE ON Orders TO Role_Admin;
DENY DELETE ON Users TO Role_Admin;
DENY SELECT ON Payments (CardToken) TO Role_Admin;

GRANT SELECT, INSERT, UPDATE ON Products TO Role_Seller;
GRANT SELECT ON Orders TO Role_Seller;
DENY SELECT ON Payments TO Role_Seller;

GRANT SELECT ON Products TO Role_Customer;
GRANT SELECT, INSERT ON Orders TO Role_Customer;
DENY SELECT ON Payments TO Role_Customer;

GRANT SELECT ON Orders TO Role_Support;
GRANT SELECT ON Users (UserID, HoTen, Email) TO Role_Support;
DENY SELECT ON Payments TO Role_Support;
GO</pre>
</div>

<div class="page">
{hb}
{footer(30)}
<h2>4.4. Triển khai mã hóa dữ liệu</h2>
<h3>4.4.1. Mã hóa mật khẩu (Password Hashing)</h3>
<p>Sử dụng thuật toán <strong>bcrypt</strong> với salt để hash mật khẩu. Mật khẩu KHÔNG lưu dưới dạng plain text.</p>
<h3>4.4.2. Mã hóa dữ liệu nhạy cảm (Column-Level Encryption)</h3>
<pre>CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'OpdoStore@Master2025!';
GO
CREATE CERTIFICATE Cert_OpdoStore
    WITH SUBJECT = 'Opdo.store Sensitive Data Encryption';
GO
CREATE SYMMETRIC KEY Key_OpdoPayment
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE Cert_OpdoStore;
GO

ALTER TABLE Payments ADD CardToken_Encrypted VARBINARY(512);
GO
OPEN SYMMETRIC KEY Key_OpdoPayment DECRYPTION BY CERTIFICATE Cert_OpdoStore;
UPDATE Payments SET CardToken_Encrypted =
    EncryptByKey(Key_GUID('Key_OpdoPayment'), CardToken);
CLOSE SYMMETRIC KEY Key_OpdoPayment;
GO</pre>
<h3>4.4.3. Transparent Data Encryption (TDE) cho toàn bộ DB</h3>
<pre>USE master;
GO
CREATE CERTIFICATE Cert_TDE_OpdoStore
    WITH SUBJECT = 'TDE Certificate for OpdoStore Production';
GO
USE OpdoStore;
GO
CREATE DATABASE ENCRYPTION KEY
    WITH ALGORITHM = AES_256
    ENCRYPTION BY SERVER CERTIFICATE Cert_TDE_OpdoStore;
GO
ALTER DATABASE OpdoStore SET ENCRYPTION ON;
GO</pre>
<h3>4.4.4. HTTPS/TLS cho truyền tải</h3>
<p>Toàn bộ kết nối tới Opdo.store sử dụng <strong>TLS 1.3</strong> qua Cloudflare SSL, đảm bảo dữ liệu truyền giữa trình duyệt khách hàng và server được mã hóa hoàn toàn.</p>
</div>

<div class="page">
{hb}
{footer(31)}
<h2>4.5. Triển khai kiểm toán và giám sát</h2>
<pre>CREATE SERVER AUDIT Audit_OpdoStore
TO FILE (FILEPATH = 'D:\\OpdoAuditLogs\\', MAXSIZE = 200 MB, MAX_ROLLOVER_FILES = 20)
WITH (QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE);
GO
ALTER SERVER AUDIT Audit_OpdoStore WITH (STATE = ON);
GO

USE OpdoStore;
GO
CREATE DATABASE AUDIT SPECIFICATION AuditSpec_OpdoStore
FOR SERVER AUDIT Audit_OpdoStore
ADD (SELECT, INSERT, UPDATE, DELETE ON OBJECT::dbo.Users BY public),
ADD (SELECT, INSERT, UPDATE, DELETE ON OBJECT::dbo.Payments BY public),
ADD (SELECT, INSERT, UPDATE, DELETE ON OBJECT::dbo.Sellers BY public),
ADD (SELECT, INSERT, UPDATE, DELETE ON OBJECT::dbo.Orders BY public)
WITH (STATE = ON);
GO</pre>
<h3>Application-Level Logging</h3>
<table>
<tr><th>Sự kiện</th><th>Thông tin ghi nhận</th><th>Mức độ</th></tr>
<tr><td>Đăng nhập thành công/thất bại</td><td>User, IP, UserAgent, Timestamp</td><td>INFO / WARNING</td></tr>
<tr><td>Thay đổi mật khẩu</td><td>User, IP, Timestamp</td><td>WARNING</td></tr>
<tr><td>Đặt hàng / Thanh toán</td><td>OrderID, UserID, Amount, Status</td><td>INFO</td></tr>
<tr><td>Truy cập admin panel</td><td>AdminID, Action, Target, IP</td><td>WARNING</td></tr>
<tr><td>Export dữ liệu</td><td>UserID, DataType, RecordCount</td><td>CRITICAL</td></tr>
</table>
<hr class="separator">
<h2>4.6. Triển khai sao lưu và phục hồi</h2>
<table>
<tr><th>Loại</th><th>Tần suất</th><th>Lưu trữ</th><th>Retention</th></tr>
<tr><td><strong>Full Backup</strong></td><td>Hàng đêm 2:00 AM</td><td>Local + Azure Blob</td><td>30 ngày</td></tr>
<tr><td><strong>Differential</strong></td><td>Mỗi 4 giờ</td><td>Local SSD</td><td>7 ngày</td></tr>
<tr><td><strong>Transaction Log</strong></td><td>Mỗi 15 phút</td><td>Local SSD</td><td>3 ngày</td></tr>
<tr><td><strong>Offsite Copy</strong></td><td>Hàng tuần</td><td>Azure Blob (Geo-redundant)</td><td>90 ngày</td></tr>
</table>
</div>

<div class="page">
{hb}
{footer(33)}
<h2>4.7. Các biện pháp bảo mật bổ sung</h2>
<h3>4.7.1. Bảo mật tầng ứng dụng</h3>
<table>
<tr><th>Biện pháp</th><th>Mô tả</th><th>Công cụ/Thư viện</th></tr>
<tr><td><strong>Parameterized Queries</strong></td><td>Chống SQL Injection bằng tham số hóa truy vấn</td><td>Entity Framework / Sequelize ORM</td></tr>
<tr><td><strong>Input Validation</strong></td><td>Kiểm tra và sanitize mọi dữ liệu đầu vào</td><td>Joi / FluentValidation</td></tr>
<tr><td><strong>CSRF Token</strong></td><td>Token chống giả mạo request</td><td>csurf middleware</td></tr>
<tr><td><strong>Content Security Policy</strong></td><td>Chống XSS bằng CSP headers</td><td>Helmet.js</td></tr>
<tr><td><strong>Rate Limiting</strong></td><td>Giới hạn số request/phút chống brute force</td><td>express-rate-limit</td></tr>
<tr><td><strong>JWT + Refresh Token</strong></td><td>Xác thực stateless với token có thời hạn</td><td>jsonwebtoken</td></tr>
</table>
<h3>4.7.2. Bảo mật hạ tầng</h3>
<ul>
<li><strong>Cloudflare WAF:</strong> Web Application Firewall lọc traffic độc hại, chống DDoS.</li>
<li><strong>Network Segmentation:</strong> Tách biệt mạng web server, app server và database server.</li>
<li><strong>SQL Server Firewall:</strong> Chỉ cho phép kết nối từ app server, chặn truy cập trực tiếp.</li>
<li><strong>SSH Key Authentication:</strong> Truy cập server qua SSH key, không dùng password.</li>
</ul>
<h3>4.7.3. Tuân thủ quy định</h3>
<ul>
<li><strong>PCI DSS:</strong> Tuân thủ tiêu chuẩn bảo mật thanh toán — sử dụng payment gateway (Stripe/VNPay).</li>
<li><strong>Luật An ninh mạng VN (24/2018):</strong> Lưu trữ dữ liệu người dùng Việt Nam trên server tại Việt Nam.</li>
<li><strong>Nghị định 13/2023/NĐ-CP:</strong> Bảo vệ dữ liệu cá nhân — thông báo mục đích thu thập, cho phép xóa dữ liệu.</li>
</ul>
<hr class="separator">
<h2>4.8. Tổng kết triển khai thực tiễn</h2>
<table class="result-table">
<tr><th>Giải pháp</th><th>Lý thuyết (Ch.2)</th><th>Triển khai trên Opdo.store</th><th>Trạng thái</th></tr>
<tr><td><strong>Phân quyền</strong></td><td>RBAC, Least Privilege</td><td>5 role, Row-Level Security, Column-level DENY</td><td>&#9989; Hoàn thành</td></tr>
<tr><td><strong>Mã hóa</strong></td><td>AES-256, TDE</td><td>Password bcrypt, Column encryption, TDE, TLS 1.3</td><td>&#9989; Hoàn thành</td></tr>
<tr><td><strong>Kiểm toán</strong></td><td>Server Audit</td><td>DB Audit + App-level logging + Cloudflare logs</td><td>&#9989; Hoàn thành</td></tr>
<tr><td><strong>Sao lưu</strong></td><td>Full + Diff + Log</td><td>Automated backup, Azure Blob offsite, 3-2-1 rule</td><td>&#9989; Hoàn thành</td></tr>
<tr><td><strong>Bảo mật ứng dụng</strong></td><td>(Mở rộng)</td><td>ORM, CSRF, CSP, Rate Limit, JWT</td><td>&#9989; Hoàn thành</td></tr>
<tr><td><strong>Bảo mật hạ tầng</strong></td><td>(Mở rộng)</td><td>Cloudflare WAF, Firewall, Network segmentation</td><td>&#9989; Hoàn thành</td></tr>
</table>
<blockquote>Việc triển khai thực tiễn trên Opdo.store cho thấy các giải pháp bảo mật đề xuất ở Chương 2 hoàn toàn khả thi và hiệu quả khi áp dụng vào dự án thương mại điện tử thực tế.</blockquote>
</div>

<!-- KẾT LUẬN -->
<div class="page">
{hb}
{footer(35)}
<h1 class="chapter">Kết Luận</h1>
<h2>Tổng kết</h2>
<p>Qua quá trình nghiên cứu và thực hành, tài liệu đã trình bày hệ thống các vấn đề về bảo mật và an toàn thông tin trong cơ sở dữ liệu:</p>
<p><strong>Chương 1</strong> — Hệ thống hóa kiến thức nền tảng về CSDL, HQTCSDL, và phân tích toàn diện ưu nhược điểm của bảo mật thông tin.</p>
<p><strong>Chương 2</strong> — Phân tích chi tiết các mối đe dọa, đề xuất 4 giải pháp theo nguyên tắc Defense in Depth.</p>
<p><strong>Chương 3</strong> — Triển khai thành công cả 4 giải pháp trên SQL Server với database mẫu <code>QuanLyNhanSu</code>.</p>
<p><strong>Chương 4</strong> — Áp dụng thành công các giải pháp bảo mật vào dự án thực tiễn Opdo.store — sàn thương mại điện tử phụ tùng ô tô, chứng minh tính khả thi và hiệu quả trong thực tế.</p>
<table>
<tr><th>STT</th><th>Giải pháp</th><th>Vai trò</th></tr>
<tr><td>1</td><td>Phân quyền người dùng</td><td><strong>Phòng ngừa</strong> — Kiểm soát ai được truy cập gì</td></tr>
<tr><td>2</td><td>Mã hóa dữ liệu</td><td><strong>Phòng ngừa</strong> — Bảo vệ dữ liệu khi bị xâm phạm</td></tr>
<tr><td>3</td><td>Kiểm toán</td><td><strong>Phát hiện</strong> — Giám sát và cảnh báo bất thường</td></tr>
<tr><td>4</td><td>Sao lưu và phục hồi</td><td><strong>Phục hồi</strong> — Đảm bảo khả năng khôi phục</td></tr>
</table>
<h2>Hạn chế và hướng phát triển</h2>
<p><strong>Hạn chế:</strong> Demo trên môi trường phát triển, chưa đánh giá hiệu năng thực tế; chưa triển khai bảo mật mạng (firewall, IDS/IPS); chưa đề cập bảo mật ứng dụng.</p>
<p><strong>Hướng phát triển:</strong> Mở rộng bảo mật ứng dụng web; giám sát real-time với SIEM; bảo mật CSDL trên đám mây; áp dụng ML phát hiện bất thường; quy trình DevSecOps.</p>
<h2>Lời cảm ơn</h2>
<p>Chúng tôi xin chân thành cảm ơn các thầy cô giáo trong chương trình đào tạo Thạc sĩ tại Đại học Hòa Bình đã hướng dẫn và tạo điều kiện để hoàn thành tài liệu nghiên cứu này.</p>
<table>
<tr><th>Họ và tên</th><th>Vai trò</th></tr>
<tr><td><strong>Nguyễn Hữu Huy</strong></td><td>Nghiên cứu và biên soạn</td></tr>
<tr><td><strong>Nguyễn Thị Phương</strong></td><td>Nghiên cứu và biên soạn</td></tr>
</table>
<p><strong>Chương trình:</strong> Thạc sĩ — Đại học Hòa Bình</p>
</div>

<div class="page">
{hb}
{footer(37)}
<h2>Tài liệu tham khảo</h2>
<ol class="ref">
<li>E.F. Codd, "A Relational Model of Data for Large Shared Data Banks", <em>Communications of the ACM</em>, 1970.</li>
<li>Ramez Elmasri, Shamkant B. Navathe, <em>"Fundamentals of Database Systems"</em>, 7th Edition, Pearson, 2015.</li>
<li>Abraham Silberschatz, Henry F. Korth, <em>"Database System Concepts"</em>, 7th Edition, McGraw-Hill, 2019.</li>
<li>IBM Security, <em>"Cost of a Data Breach Report 2023"</em>, IBM Corporation, 2023.</li>
<li>Verizon, <em>"Data Breach Investigations Report (DBIR) 2023"</em>, Verizon Enterprise, 2023.</li>
<li>OWASP Foundation, <em>"OWASP Top 10 — 2021"</em>, owasp.org.</li>
<li>Microsoft, <em>"SQL Server Security Documentation"</em>, docs.microsoft.com.</li>
<li>Microsoft, <em>"SQL Server Encryption"</em>, docs.microsoft.com.</li>
<li>Microsoft, <em>"SQL Server Audit (Database Engine)"</em>, docs.microsoft.com.</li>
<li>NIST, <em>"Framework for Improving Critical Infrastructure Cybersecurity"</em>, v1.1, 2018.</li>
<li>Quốc hội nước CHXHCNVN, <em>"Luật An ninh mạng"</em>, Luật số 24/2018/QH14, 2018.</li>
<li>Chính phủ nước CHXHCNVN, <em>"Nghị định 13/2023/NĐ-CP về Bảo vệ dữ liệu cá nhân"</em>, 2023.</li>
</ol>
</div>
'''

# Insert before </body>
insert_point = content.find('</body>')
new_content = content[:insert_point] + chapters + '\n</body>\n</html>'

with open(output, 'w', encoding='utf-8') as f:
    f.write(new_content)

print(f"BUILD COMPLETE! File size: {{len(new_content):,}} chars")
