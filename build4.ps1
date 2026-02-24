$outputFile = "f:\ThacSiHoaBinh\BaoMat\BaoMatCNTT\index.html"

$headerBlock = @'
<div class="page-header">
  <img class="logo-img" src="https://upload.wikimedia.org/wikipedia/vi/thumb/b/b4/Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png/200px-Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png" alt="Logo" onerror="this.style.display='none'">
  <div class="header-text">TRƯỜNG ĐẠI HỌC HÒA BÌNH<span>Chương trình Thạc sĩ — Bài tập môn học</span></div>
</div>
'@

$part4 = @"

<!-- Demo Backup & Restore -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">23</span>
</div>

<h2>3.4. Demo Sao lưu và Phục hồi</h2>
<h3>3.4.1. Sao lưu (Backup)</h3>
<pre>
-- Full Backup
BACKUP DATABASE QuanLyNhanSu
TO DISK = 'C:\Backup\QuanLyNhanSu_Full.bak'
WITH FORMAT, INIT, NAME = N'Full Backup', COMPRESSION, STATS = 10;
GO

-- Thêm dữ liệu mới rồi Differential Backup
INSERT INTO NhanVien (HoTen,Email,CMND,Luong,MaPB,NgayVaoLam,ChucVu)
VALUES (N'Vũ Thị Giang','giang.vt@company.com','012345678907',
    17000000,3,'2024-03-01',N'Nhân viên');
GO
BACKUP DATABASE QuanLyNhanSu
TO DISK = 'C:\Backup\QuanLyNhanSu_Diff.bak'
WITH DIFFERENTIAL, FORMAT, INIT, COMPRESSION, STATS = 10;
GO

-- Transaction Log Backup
ALTER DATABASE QuanLyNhanSu SET RECOVERY FULL;
GO
UPDATE NhanVien SET Luong = Luong * 1.1 WHERE MaPB = 1;
GO
BACKUP LOG QuanLyNhanSu
TO DISK = 'C:\Backup\QuanLyNhanSu_Log.trn'
WITH FORMAT, INIT, COMPRESSION, STATS = 10;
GO
</pre>

<h3>3.4.2. Phục hồi sau khi xóa nhầm dữ liệu</h3>
<pre>
-- Giả lập sự cố: Xóa nhầm toàn bộ nhân viên!
DELETE FROM ChamCong;
DELETE FROM NhanVien;
SELECT COUNT(*) AS SoNhanVien FROM NhanVien;  -- Kết quả: 0

-- PHỤC HỒI TỪ BACKUP
USE master;
ALTER DATABASE QuanLyNhanSu SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

RESTORE DATABASE QuanLyNhanSu
    FROM DISK='C:\Backup\QuanLyNhanSu_Full.bak'
    WITH NORECOVERY, REPLACE, STATS=10;
RESTORE DATABASE QuanLyNhanSu
    FROM DISK='C:\Backup\QuanLyNhanSu_Diff.bak'
    WITH NORECOVERY, STATS=10;
RESTORE LOG QuanLyNhanSu
    FROM DISK='C:\Backup\QuanLyNhanSu_Log.trn'
    WITH RECOVERY, STATS=10;
GO

ALTER DATABASE QuanLyNhanSu SET MULTI_USER;
GO
USE QuanLyNhanSu;
SELECT COUNT(*) AS SoNhanVien FROM NhanVien; -- Kết quả: 6 ✅
SELECT * FROM NhanVien;
GO
</pre>

<h3>Kết quả phục hồi</h3>
<table class="result-table">
<tr><th>Bước</th><th>Trạng thái</th><th>Mô tả</th></tr>
<tr><td>Trước phục hồi</td><td>0 nhân viên</td><td>Dữ liệu bị xóa nhầm</td></tr>
<tr><td>Sau Restore Full</td><td>Đang restore...</td><td>DB ở trạng thái RESTORING</td></tr>
<tr><td>Sau Restore Diff</td><td>Đang restore...</td><td>Áp dụng thay đổi mới</td></tr>
<tr><td>Sau Restore Log</td><td>✅ DB Online</td><td>Dữ liệu phục hồi hoàn toàn</td></tr>
<tr><td>Kiểm tra cuối</td><td>6 nhân viên</td><td>Toàn bộ dữ liệu đã phục hồi</td></tr>
</table>
</div>

<!-- Tổng kết Demo -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">25</span>
</div>

<h2>3.5. Tổng kết Demo</h2>
<table class="result-table">
<tr><th>Giải pháp</th><th>Mục tiêu</th><th>Kết quả Demo</th></tr>
<tr><td><strong>Phân quyền</strong></td><td>Kiểm soát truy cập theo vai trò</td><td>✅ 4 role với quyền khác nhau, kiểm tra deny thành công</td></tr>
<tr><td><strong>Mã hóa</strong></td><td>Bảo vệ dữ liệu nhạy cảm</td><td>✅ Column encryption (AES-256) + TDE cho toàn DB</td></tr>
<tr><td><strong>Kiểm toán</strong></td><td>Ghi nhận mọi hoạt động</td><td>✅ Server Audit + Database Audit Specification</td></tr>
<tr><td><strong>Sao lưu/Phục hồi</strong></td><td>Đảm bảo khả năng phục hồi</td><td>✅ Full + Diff + Log backup, restore thành công</td></tr>
</table>

<hr class="separator">

<!-- KẾT LUẬN -->
<h1 class="chapter">Kết Luận</h1>
<h2>Tổng kết</h2>
<p>Qua quá trình nghiên cứu và thực hành, tài liệu đã trình bày hệ thống các vấn đề về bảo mật và an toàn thông tin trong cơ sở dữ liệu:</p>
<p><strong>Chương 1</strong> — Hệ thống hóa kiến thức nền tảng về CSDL, HQTCSDL, và phân tích toàn diện ưu nhược điểm của bảo mật thông tin.</p>
<p><strong>Chương 2</strong> — Phân tích chi tiết các mối đe dọa, đề xuất 4 giải pháp theo nguyên tắc Defense in Depth:</p>
<table>
<tr><th>STT</th><th>Giải pháp</th><th>Vai trò</th></tr>
<tr><td>1</td><td>Phân quyền người dùng</td><td><strong>Phòng ngừa</strong> — Kiểm soát ai được truy cập gì</td></tr>
<tr><td>2</td><td>Mã hóa dữ liệu</td><td><strong>Phòng ngừa</strong> — Bảo vệ dữ liệu khi bị xâm phạm</td></tr>
<tr><td>3</td><td>Kiểm toán</td><td><strong>Phát hiện</strong> — Giám sát và cảnh báo bất thường</td></tr>
<tr><td>4</td><td>Sao lưu và phục hồi</td><td><strong>Phục hồi</strong> — Đảm bảo khả năng khôi phục</td></tr>
</table>
<p><strong>Chương 3</strong> — Triển khai thành công cả 4 giải pháp trên SQL Server với database mẫu <code>QuanLyNhanSu</code>: phân quyền 4 cấp, mã hóa AES-256 + TDE, kiểm toán đầy đủ, sao lưu 3 cấp và phục hồi thành công.</p>
</div>

<!-- Trang cuối - Hạn chế + Tài liệu tham khảo -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">27</span>
</div>

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

<hr class="separator">
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

</body>
</html>
"@

Add-Content -Path $outputFile -Value $part4 -Encoding UTF8 -NoNewline
Write-Host "Part 4 done (Backup, Conclusion, References). BUILD COMPLETE!"
