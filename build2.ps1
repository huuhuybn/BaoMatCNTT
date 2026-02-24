$outputFile = "f:\ThacSiHoaBinh\BaoMat\BaoMatCNTT\index.html"

$headerBlock = @'
<div class="page-header">
  <img class="logo-img" src="https://upload.wikimedia.org/wikipedia/vi/thumb/b/b4/Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png/200px-Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png" alt="Logo" onerror="this.style.display='none'">
  <div class="header-text">TRƯỜNG ĐẠI HỌC HÒA BÌNH<span>Chương trình Thạc sĩ — Bài tập môn học</span></div>
</div>
'@

$part2 = @"

<!-- ===== CHƯƠNG 2 ===== -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">7</span>
</div>

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
<tr><td><strong>SQL Injection</strong></td><td>Chèn mã SQL độc hại qua input để truy cập/sửa đổi CSDL trái phép</td><td>🔴 Rất cao</td></tr>
<tr><td><strong>Brute Force</strong></td><td>Thử tất cả tổ hợp mật khẩu để đăng nhập trái phép</td><td>🟠 Cao</td></tr>
<tr><td><strong>Man-in-the-Middle</strong></td><td>Chặn bắt và sửa đổi dữ liệu truyền giữa client và server</td><td>🔴 Rất cao</td></tr>
<tr><td><strong>Ransomware</strong></td><td>Mã hóa dữ liệu đòi tiền chuộc</td><td>🔴 Rất cao</td></tr>
<tr><td><strong>DDoS</strong></td><td>Tấn công từ chối dịch vụ làm tê liệt hệ thống</td><td>🟠 Cao</td></tr>
<tr><td><strong>Phishing</strong></td><td>Lừa đảo người dùng để lấy thông tin đăng nhập</td><td>🟠 Cao</td></tr>
</table>

<h4>B. Mối đe dọa từ bên trong</h4>
<table class="threat-table">
<tr><th>Loại mối đe dọa</th><th>Mô tả</th><th>Mức độ</th></tr>
<tr><td><strong>Nhân viên cố ý</strong></td><td>Nhân viên có quyền truy cập cố tình lấy cắp hoặc phá hoại dữ liệu</td><td>🔴 Rất cao</td></tr>
<tr><td><strong>Sai sót vô ý</strong></td><td>Xóa nhầm dữ liệu, cấu hình sai, chia sẻ quyền không đúng</td><td>🟠 Cao</td></tr>
<tr><td><strong>Tài khoản bị chiếm</strong></td><td>Tài khoản hợp lệ bị kẻ tấn công kiểm soát</td><td>🔴 Rất cao</td></tr>
<tr><td><strong>Quyền truy cập dư thừa</strong></td><td>Cấp quyền nhiều hơn mức cần thiết</td><td>🟡 Trung bình</td></tr>
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

<!-- Trang tiếp - Giải pháp -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">9</span>
</div>

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
<div class="diagram">┌─────────────────────────────────────────────┐
│     Transparent Data Encryption (TDE)       │
│     Mã hóa toàn bộ database file            │
├─────────────────────────────────────────────┤
│     Column-Level Encryption                  │
│     Mã hóa từng cột dữ liệu nhạy cảm      │
├─────────────────────────────────────────────┤
│     Always Encrypted                         │
│     Mã hóa end-to-end, server không có key  │
├─────────────────────────────────────────────┤
│     Transport Layer Security (TLS/SSL)       │
│     Mã hóa dữ liệu truyền trên mạng       │
└─────────────────────────────────────────────┘</div>
<table>
<tr><th>Phương pháp</th><th>Phạm vi</th><th>Hiệu năng</th><th>Độ bảo mật</th><th>Phù hợp</th></tr>
<tr><td><strong>TDE</strong></td><td>Toàn bộ DB</td><td>Ảnh hưởng ít</td><td>Cao</td><td>Bảo vệ file backup</td></tr>
<tr><td><strong>Column Encryption</strong></td><td>Từng cột</td><td>Ảnh hưởng vừa</td><td>Rất cao</td><td>Dữ liệu nhạy cảm cụ thể</td></tr>
<tr><td><strong>Always Encrypted</strong></td><td>Từng cột</td><td>Ảnh hưởng nhiều</td><td>Cực cao</td><td>Yêu cầu end-to-end</td></tr>
<tr><td><strong>TLS/SSL</strong></td><td>Truyền tải</td><td>Ảnh hưởng ít</td><td>Cao</td><td>Mọi kết nối</td></tr>
</table>
</div>

<!-- Trang tiếp - Giải pháp (tiếp) -->
<div class="page">
$headerBlock
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">11</span>
</div>

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
<div class="diagram">                    ┌─────────────────────┐
                    │   BẢO MẬT CSDL      │
                    └─────────┬───────────┘
           ┌─────────────────┼─────────────────┐
           │                 │                  │
    ┌──────▼──────┐  ┌──────▼──────┐  ┌───────▼───────┐
    │ PHÒNG NGỪA  │  │  PHÁT HIỆN  │  │  PHỤC HỒI    │
    └──────┬──────┘  └──────┬──────┘  └───────┬───────┘
           │                │                  │
    ┌──────▼──────┐  ┌──────▼──────┐  ┌───────▼───────┐
    │ Phân quyền  │  │ Kiểm toán   │  │ Sao lưu &amp;     │
    │ Mã hóa      │  │ Giám sát    │  │ Phục hồi      │
    └─────────────┘  └─────────────┘  └───────────────┘</div>
<p>Bốn giải pháp tạo thành hệ thống bảo mật toàn diện theo nguyên tắc <strong>Defense in Depth</strong> (Phòng thủ nhiều lớp).</p>
</div>
"@

Add-Content -Path $outputFile -Value $part2 -Encoding UTF8 -NoNewline
Write-Host "Part 2 done (Chapter 2)"
