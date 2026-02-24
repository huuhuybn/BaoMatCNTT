$outputFile = "f:\ThacSiHoaBinh\BaoMat\BaoMatCNTT\index.html"

$headerBlock = @'
<div class="page-header">
  <img class="logo-img" src="https://upload.wikimedia.org/wikipedia/vi/thumb/b/b4/Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png/200px-Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png" alt="Logo" onerror="this.style.display='none'">
  <div class="header-text">TRƯỜNG ĐẠI HỌC HÒA BÌNH<span>Chương trình Thạc sĩ — Bài tập môn học</span></div>
</div>
'@

$ch4 = @"

<!-- ===== CHƯƠNG 4: OPDO.STORE ===== -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">26</span>
</div>

<h1 class="chapter">Chương 4. Áp Dụng Bảo Mật Cho Dự Án Thực Tiễn — Opdo.store</h1>

<h2>4.1. Giới thiệu dự án Opdo.store</h2>
<h3>4.1.1. Tổng quan</h3>
<p><strong>Opdo.store</strong> (<a href="https://opdo.store" target="_blank">https://opdo.store</a>) là sàn thương mại điện tử chuyên về phụ tùng ô tô chính hãng cho các dòng xe châu Âu (BMW, Mercedes-Benz, Audi, Volkswagen...). Hệ thống kết nối người bán (verified sellers) với người mua, cung cấp dịch vụ tra cứu phụ tùng, đặt hàng trực tuyến, thanh toán và vận chuyển.</p>

<h3>4.1.2. Yêu cầu bảo mật đặc thù của E-commerce</h3>
<p>Với đặc thù là sàn thương mại điện tử, Opdo.store xử lý nhiều loại dữ liệu nhạy cảm cần được bảo vệ nghiêm ngặt:</p>
<table>
<tr><th>Loại dữ liệu</th><th>Mức độ nhạy cảm</th><th>Yêu cầu bảo mật</th></tr>
<tr><td><strong>Thông tin khách hàng</strong></td><td>🔴 Rất cao</td><td>Họ tên, email, SĐT, địa chỉ giao hàng</td></tr>
<tr><td><strong>Thông tin thanh toán</strong></td><td>🔴 Rất cao</td><td>Số thẻ, thông tin ngân hàng, lịch sử giao dịch</td></tr>
<tr><td><strong>Thông tin người bán</strong></td><td>🔴 Rất cao</td><td>CMND/CCCD, giấy phép kinh doanh, tài khoản bank</td></tr>
<tr><td><strong>Đơn hàng &amp; Giao dịch</strong></td><td>🟠 Cao</td><td>Chi tiết đơn hàng, trạng thái, giá bán</td></tr>
<tr><td><strong>Danh mục sản phẩm</strong></td><td>🟡 Trung bình</td><td>Thông tin phụ tùng, giá nhập, giá bán</td></tr>
<tr><td><strong>Dữ liệu vận hành</strong></td><td>🟡 Trung bình</td><td>Log hệ thống, phân tích truy cập</td></tr>
</table>

<h3>4.1.3. Các mối đe dọa cụ thể với Opdo.store</h3>
<ul>
<li><strong>SQL Injection:</strong> Tấn công qua form tìm kiếm phụ tùng, đăng nhập, đăng ký.</li>
<li><strong>XSS (Cross-Site Scripting):</strong> Chèn mã độc vào mô tả sản phẩm, review.</li>
<li><strong>CSRF (Cross-Site Request Forgery):</strong> Giả mạo request đặt hàng, thanh toán.</li>
<li><strong>Brute Force Login:</strong> Thử mật khẩu tài khoản admin, người bán, khách hàng.</li>
<li><strong>Data Breach:</strong> Rò rỉ thông tin thanh toán, dữ liệu cá nhân khách hàng.</li>
<li><strong>Insider Threat:</strong> Nhân viên truy cập trái phép dữ liệu khách hàng, đơn hàng.</li>
</ul>
</div>

<!-- 4.2 Kiến trúc -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">27</span>
</div>

<h2>4.2. Kiến trúc hệ thống và cơ sở dữ liệu</h2>
<h3>4.2.1. Kiến trúc tổng thể</h3>
<div class="diagram">┌──────────────────────────────────────────────────────┐
│                   INTERNET                           │
│  Khách hàng / Người bán truy cập Opdo.store          │
└────────────────────┬─────────────────────────────────┘
                     │ HTTPS (TLS 1.3)
              ┌──────▼──────┐
              │  Cloudflare │  WAF + DDoS Protection
              │    CDN      │  + SSL Certificate
              └──────┬──────┘
                     │
              ┌──────▼──────┐
              │  Web Server │  Nginx / IIS
              │  (Frontend) │  React.js / Next.js
              └──────┬──────┘
                     │ API Gateway
              ┌──────▼──────┐
              │  App Server │  Node.js / .NET Core
              │  (Backend)  │  REST API + Auth
              └──────┬──────┘
           ┌─────────┼─────────┐
    ┌──────▼──────┐     ┌──────▼──────┐
    │ SQL Server  │     │   Redis     │
    │ (Primary)   │     │  (Cache)    │
    │ + Firewall  │     │ + Session   │
    └──────┬──────┘     └─────────────┘
    ┌──────▼──────┐
    │ SQL Server  │  Backup Server
    │ (Replica)   │  + Offsite Storage
    └─────────────┘</div>

<h3>4.2.2. Mô hình cơ sở dữ liệu chính</h3>
<table>
<tr><th>Bảng</th><th>Mô tả</th><th>Dữ liệu nhạy cảm</th></tr>
<tr><td><code>Users</code></td><td>Tài khoản người dùng (khách hàng, người bán, admin)</td><td>Password hash, Email, SĐT</td></tr>
<tr><td><code>Sellers</code></td><td>Thông tin chi tiết người bán</td><td>CMND, Giấy phép KD, TK ngân hàng</td></tr>
<tr><td><code>Products</code></td><td>Danh mục phụ tùng ô tô</td><td>Giá nhập, giá bán</td></tr>
<tr><td><code>Orders</code></td><td>Đơn hàng</td><td>Địa chỉ giao hàng, tổng tiền</td></tr>
<tr><td><code>Payments</code></td><td>Giao dịch thanh toán</td><td>Token thẻ, mã giao dịch</td></tr>
<tr><td><code>AuditLogs</code></td><td>Nhật ký hoạt động</td><td>Toàn bộ thao tác hệ thống</td></tr>
</table>
</div>

<!-- 4.3 Phân quyền -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">28</span>
</div>

<h2>4.3. Triển khai phân quyền người dùng trên Opdo.store</h2>
<h3>4.3.1. Mô hình phân quyền RBAC</h3>
<p>Áp dụng mô hình <strong>Role-Based Access Control (RBAC)</strong> với 5 vai trò chính:</p>
<table>
<tr><th>Role</th><th>Mô tả</th><th>Quyền chính</th></tr>
<tr><td><strong>SuperAdmin</strong></td><td>Quản trị viên cao nhất</td><td>Toàn quyền hệ thống, quản lý user, cấu hình</td></tr>
<tr><td><strong>Admin</strong></td><td>Quản trị viên</td><td>Quản lý sản phẩm, đơn hàng, duyệt người bán</td></tr>
<tr><td><strong>Seller</strong></td><td>Người bán hàng</td><td>CRUD sản phẩm của mình, xem đơn hàng của mình</td></tr>
<tr><td><strong>Customer</strong></td><td>Khách hàng</td><td>Xem sản phẩm, đặt hàng, xem đơn hàng cá nhân</td></tr>
<tr><td><strong>Support</strong></td><td>Nhân viên hỗ trợ</td><td>Xem đơn hàng, hỗ trợ khách hàng, KHÔNG xem thanh toán</td></tr>
</table>

<h3>4.3.2. Triển khai trên SQL Server</h3>
<pre>
-- Tạo các Role cho Opdo.store
CREATE ROLE Role_SuperAdmin;
CREATE ROLE Role_Admin;
CREATE ROLE Role_Seller;
CREATE ROLE Role_Customer;
CREATE ROLE Role_Support;
GO

-- SuperAdmin: Toàn quyền
GRANT CONTROL ON DATABASE::OpdoStore TO Role_SuperAdmin;

-- Admin: Quản lý sản phẩm, đơn hàng, duyệt seller
GRANT SELECT, INSERT, UPDATE ON Products TO Role_Admin;
GRANT SELECT, UPDATE ON Orders TO Role_Admin;
GRANT SELECT, UPDATE ON Sellers TO Role_Admin;
DENY DELETE ON Users TO Role_Admin;             -- Không được xóa user
DENY SELECT ON Payments (CardToken) TO Role_Admin; -- Không xem thẻ

-- Seller: Chỉ quản lý sản phẩm của mình (Row-Level Security)
GRANT SELECT, INSERT, UPDATE ON Products TO Role_Seller;
GRANT SELECT ON Orders TO Role_Seller;
DENY SELECT ON Users TO Role_Seller;
DENY SELECT ON Payments TO Role_Seller;

-- Customer: Chỉ đọc sản phẩm, quản lý đơn hàng cá nhân
GRANT SELECT ON Products TO Role_Customer;
GRANT SELECT, INSERT ON Orders TO Role_Customer;
DENY SELECT ON Sellers (CMND, BankAccount) TO Role_Customer;
DENY SELECT ON Payments TO Role_Customer;

-- Support: Xem đơn hàng để hỗ trợ, không xem thanh toán
GRANT SELECT ON Orders TO Role_Support;
GRANT SELECT ON Products TO Role_Support;
GRANT SELECT ON Users (UserID, HoTen, Email) TO Role_Support;
DENY SELECT ON Payments TO Role_Support;
DENY UPDATE, DELETE ON Users TO Role_Support;
GO
</pre>

<h3>4.3.3. Row-Level Security cho Seller</h3>
<pre>
-- Mỗi Seller chỉ xem/sửa sản phẩm của mình
CREATE FUNCTION fn_SellerFilter(@SellerID INT)
RETURNS TABLE WITH SCHEMABINDING
AS RETURN
    SELECT 1 AS result
    WHERE @SellerID = CAST(SESSION_CONTEXT(N'SellerID') AS INT)
       OR IS_MEMBER('Role_Admin') = 1
       OR IS_MEMBER('Role_SuperAdmin') = 1;
GO

CREATE SECURITY POLICY SellerProductPolicy
ADD FILTER PREDICATE dbo.fn_SellerFilter(SellerID) ON dbo.Products
WITH (STATE = ON);
GO
</pre>
</div>

<!-- 4.4 Mã hóa -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">30</span>
</div>

<h2>4.4. Triển khai mã hóa dữ liệu</h2>
<h3>4.4.1. Mã hóa mật khẩu (Password Hashing)</h3>
<p>Sử dụng thuật toán <strong>bcrypt</strong> với salt để hash mật khẩu người dùng. Mật khẩu KHÔNG được lưu dưới dạng plain text.</p>
<pre>
-- Ở tầng ứng dụng (Node.js / .NET), mật khẩu được hash trước khi lưu:
-- const hashedPassword = await bcrypt.hash(password, 12);
-- Trong DB chỉ lưu hash value:
ALTER TABLE Users ADD PasswordHash VARCHAR(255) NOT NULL;
ALTER TABLE Users DROP COLUMN Password;  -- Xóa cột plain text cũ
GO
</pre>

<h3>4.4.2. Mã hóa dữ liệu nhạy cảm (Column-Level Encryption)</h3>
<pre>
-- Mã hóa thông tin thanh toán và CMND người bán
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'OpdoStore@Master2025!';
GO
CREATE CERTIFICATE Cert_OpdoStore
    WITH SUBJECT = 'Opdo.store Sensitive Data Encryption';
GO
CREATE SYMMETRIC KEY Key_OpdoPayment
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE Cert_OpdoStore;
GO

-- Mã hóa CardToken trong bảng Payments
ALTER TABLE Payments ADD CardToken_Encrypted VARBINARY(512);
GO
OPEN SYMMETRIC KEY Key_OpdoPayment DECRYPTION BY CERTIFICATE Cert_OpdoStore;
UPDATE Payments SET CardToken_Encrypted =
    EncryptByKey(Key_GUID('Key_OpdoPayment'), CardToken);
CLOSE SYMMETRIC KEY Key_OpdoPayment;
GO

-- Mã hóa CMND và BankAccount của Seller
ALTER TABLE Sellers ADD CMND_Encrypted VARBINARY(256);
ALTER TABLE Sellers ADD BankAccount_Encrypted VARBINARY(256);
GO
OPEN SYMMETRIC KEY Key_OpdoPayment DECRYPTION BY CERTIFICATE Cert_OpdoStore;
UPDATE Sellers SET
    CMND_Encrypted = EncryptByKey(Key_GUID('Key_OpdoPayment'), CMND),
    BankAccount_Encrypted = EncryptByKey(Key_GUID('Key_OpdoPayment'), BankAccount);
CLOSE SYMMETRIC KEY Key_OpdoPayment;
GO
</pre>

<h3>4.4.3. Transparent Data Encryption (TDE) cho toàn bộ DB</h3>
<pre>
-- Bật TDE cho database OpdoStore
USE master;
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
GO
</pre>

<h3>4.4.4. HTTPS/TLS cho truyền tải</h3>
<p>Toàn bộ kết nối tới Opdo.store sử dụng <strong>TLS 1.3</strong> qua Cloudflare SSL, đảm bảo dữ liệu truyền giữa trình duyệt khách hàng và server được mã hóa hoàn toàn.</p>
</div>

<!-- 4.5 Kiểm toán + 4.6 Sao lưu -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">31</span>
</div>

<h2>4.5. Triển khai kiểm toán và giám sát</h2>
<h3>4.5.1. Database Audit cho Opdo.store</h3>
<pre>
-- Tạo Server Audit cho Opdo.store
CREATE SERVER AUDIT Audit_OpdoStore
TO FILE (FILEPATH = 'D:\OpdoAuditLogs\', MAXSIZE = 200 MB,
    MAX_ROLLOVER_FILES = 20)
WITH (QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE);
GO
ALTER SERVER AUDIT Audit_OpdoStore WITH (STATE = ON);
GO

-- Audit tất cả thao tác trên bảng nhạy cảm
USE OpdoStore;
GO
CREATE DATABASE AUDIT SPECIFICATION AuditSpec_OpdoStore
FOR SERVER AUDIT Audit_OpdoStore
ADD (SELECT, INSERT, UPDATE, DELETE
    ON OBJECT::dbo.Users BY public),
ADD (SELECT, INSERT, UPDATE, DELETE
    ON OBJECT::dbo.Payments BY public),
ADD (SELECT, INSERT, UPDATE, DELETE
    ON OBJECT::dbo.Sellers BY public),
ADD (SELECT, INSERT, UPDATE, DELETE
    ON OBJECT::dbo.Orders BY public)
WITH (STATE = ON);
GO
</pre>

<h3>4.5.2. Application-Level Logging</h3>
<p>Ngoài Database Audit, Opdo.store triển khai logging ở tầng ứng dụng:</p>
<table>
<tr><th>Sự kiện</th><th>Thông tin ghi nhận</th><th>Mức độ</th></tr>
<tr><td>Đăng nhập thành công/thất bại</td><td>User, IP, UserAgent, Timestamp</td><td>INFO / WARNING</td></tr>
<tr><td>Thay đổi mật khẩu</td><td>User, IP, Timestamp</td><td>WARNING</td></tr>
<tr><td>Đặt hàng / Thanh toán</td><td>OrderID, UserID, Amount, Status</td><td>INFO</td></tr>
<tr><td>Truy cập admin panel</td><td>AdminID, Action, Target, IP</td><td>WARNING</td></tr>
<tr><td>Export dữ liệu</td><td>UserID, DataType, RecordCount</td><td>CRITICAL</td></tr>
<tr><td>Thêm/Sửa sản phẩm</td><td>SellerID, ProductID, Changes</td><td>INFO</td></tr>
</table>

<hr class="separator">
<h2>4.6. Triển khai sao lưu và phục hồi</h2>
<h3>4.6.1. Chiến lược sao lưu cho Opdo.store</h3>
<table>
<tr><th>Loại</th><th>Tần suất</th><th>Lưu trữ</th><th>Retention</th></tr>
<tr><td><strong>Full Backup</strong></td><td>Hàng đêm 2:00 AM</td><td>Local + Azure Blob</td><td>30 ngày</td></tr>
<tr><td><strong>Differential</strong></td><td>Mỗi 4 giờ</td><td>Local SSD</td><td>7 ngày</td></tr>
<tr><td><strong>Transaction Log</strong></td><td>Mỗi 15 phút</td><td>Local SSD</td><td>3 ngày</td></tr>
<tr><td><strong>Offsite Copy</strong></td><td>Hàng tuần</td><td>Azure Blob (Geo-redundant)</td><td>90 ngày</td></tr>
</table>
<pre>
-- Automated Full Backup hàng đêm
BACKUP DATABASE OpdoStore
TO DISK = 'D:\Backup\OpdoStore_Full_$(Get-Date -Format yyyyMMdd).bak'
WITH FORMAT, INIT, COMPRESSION, CHECKSUM,
    NAME = N'OpdoStore Full Backup',
    STATS = 10;
GO

-- Transaction Log Backup mỗi 15 phút (SQL Agent Job)
BACKUP LOG OpdoStore
TO DISK = 'D:\Backup\Logs\OpdoStore_Log_$(ESCAPE_SQUOTE(STRTDT)).trn'
WITH COMPRESSION, CHECKSUM, STATS = 5;
GO
</pre>
</div>

<!-- 4.7 Biện pháp bổ sung + 4.8 Tổng kết -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">33</span>
</div>

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
<li><strong>Automated Security Scanning:</strong> Quét lỗ hổng định kỳ với OWASP ZAP.</li>
</ul>

<h3>4.7.3. Tuân thủ quy định</h3>
<ul>
<li><strong>PCI DSS:</strong> Tuân thủ tiêu chuẩn bảo mật thanh toán — Opdo.store sử dụng payment gateway (Stripe/VNPay) để không lưu trữ trực tiếp số thẻ tín dụng.</li>
<li><strong>Luật An ninh mạng VN (24/2018):</strong> Lưu trữ dữ liệu người dùng Việt Nam trên server tại Việt Nam.</li>
<li><strong>Nghị định 13/2023/NĐ-CP:</strong> Bảo vệ dữ liệu cá nhân — thông báo mục đích thu thập, cho phép người dùng yêu cầu xóa dữ liệu.</li>
</ul>

<hr class="separator">
<h2>4.8. Tổng kết triển khai thực tiễn</h2>
<table class="result-table">
<tr><th>Giải pháp</th><th>Lý thuyết (Ch.2)</th><th>Triển khai trên Opdo.store</th><th>Trạng thái</th></tr>
<tr><td><strong>Phân quyền</strong></td><td>RBAC, Least Privilege</td><td>5 role, Row-Level Security cho Seller, Column-level DENY</td><td>✅ Hoàn thành</td></tr>
<tr><td><strong>Mã hóa</strong></td><td>AES-256, TDE</td><td>Password bcrypt, Column encryption (CMND, Card), TDE, TLS 1.3</td><td>✅ Hoàn thành</td></tr>
<tr><td><strong>Kiểm toán</strong></td><td>Server Audit</td><td>DB Audit + App-level logging + Cloudflare logs</td><td>✅ Hoàn thành</td></tr>
<tr><td><strong>Sao lưu</strong></td><td>Full + Diff + Log</td><td>Automated backup, Azure Blob offsite, 3-2-1 rule</td><td>✅ Hoàn thành</td></tr>
<tr><td><strong>Bảo mật ứng dụng</strong></td><td>(Mở rộng)</td><td>ORM, CSRF, CSP, Rate Limit, JWT</td><td>✅ Hoàn thành</td></tr>
<tr><td><strong>Bảo mật hạ tầng</strong></td><td>(Mở rộng)</td><td>Cloudflare WAF, Firewall, Network segmentation</td><td>✅ Hoàn thành</td></tr>
</table>
<blockquote>Việc triển khai thực tiễn trên Opdo.store cho thấy các giải pháp bảo mật đề xuất ở Chương 2 hoàn toàn khả thi và hiệu quả khi áp dụng vào dự án thương mại điện tử thực tế. Hệ thống bảo mật đa lớp (Defense in Depth) đảm bảo dữ liệu khách hàng, người bán và giao dịch được bảo vệ toàn diện.</blockquote>
</div>
"@

# Insert Chapter 4 BEFORE the closing tags in build4.ps1 output
# We need to find the </body></html> and inject before it
$currentContent = [System.IO.File]::ReadAllText($outputFile, [System.Text.UTF8Encoding]::new($false))
$insertPoint = $currentContent.LastIndexOf('</body>')
if ($insertPoint -gt 0) {
    $newContent = $currentContent.Substring(0, $insertPoint) + $ch4 + "`n" + $currentContent.Substring($insertPoint)
    [System.IO.File]::WriteAllText($outputFile, $newContent, [System.Text.UTF8Encoding]::new($false))
    Write-Host "Chapter 4 (Opdo.store) inserted successfully!"
} else {
    # Fallback: just append
    Add-Content -Path $outputFile -Value $ch4 -Encoding UTF8 -NoNewline
    Write-Host "Chapter 4 appended (fallback mode)"
}
