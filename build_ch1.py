# -*- coding: utf-8 -*-
"""Build script: Assembles the full index.html from parts with correct UTF-8 encoding."""
import os

output = r"f:\ThacSiHoaBinh\BaoMat\BaoMatCNTT\index.html"

# Read the existing file (CSS + cover + TOC written by write_to_file tool)
with open(output, 'r', encoding='utf-8') as f:
    content = f.read()

# We need to insert ALL body content before </body></html>
header_block = '''<div class="page-header">
  <img class="logo-img" src="https://upload.wikimedia.org/wikipedia/vi/thumb/b/b4/Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png/200px-Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png" alt="Logo" onerror="this.style.display='none'">
  <div class="header-text">TRƯỜNG ĐẠI HỌC HÒA BÌNH<span>Chương trình Thạc sĩ — Bài tập môn học</span></div>
</div>'''

footer = lambda title, page: f'''<div class="page-footer">
  <span class="footer-title">{title}</span>
  <span class="page-number">{page}</span>
</div>'''

ft = "Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu"

body_content = f'''
<!-- ===== CHƯƠNG 1 ===== -->
<div class="page">
{header_block}
{footer(ft, 1)}

<h1 class="chapter">Chương 1. Cơ Sở Lý Thuyết</h1>

<h2>1.1. Cơ sở dữ liệu (Database)</h2>
<h3>1.1.1. Khái niệm</h3>
<p>Cơ sở dữ liệu (CSDL) là một tập hợp có tổ chức của các dữ liệu có liên quan với nhau, được lưu trữ trên các thiết bị lưu trữ máy tính, được thiết kế và xây dựng sao cho việc cập nhật, tìm kiếm và khai thác dữ liệu phục vụ cho các mục đích khác nhau của nhiều người dùng một cách dễ dàng và hiệu quả.</p>
<p>Một CSDL có các đặc điểm cơ bản sau:</p>
<ul>
<li><strong>Tính cấu trúc (Structured):</strong> Dữ liệu được tổ chức theo một cấu trúc nhất định, thường là dạng bảng (table) với các hàng (row) và cột (column).</li>
<li><strong>Tính chia sẻ (Shared):</strong> Nhiều người dùng và ứng dụng khác nhau có thể truy cập và sử dụng cùng một CSDL.</li>
<li><strong>Tính toàn vẹn (Integrity):</strong> Dữ liệu phải đảm bảo tính chính xác, nhất quán và đáng tin cậy.</li>
<li><strong>Tính độc lập (Independence):</strong> Dữ liệu được quản lý độc lập với các chương trình ứng dụng sử dụng chúng.</li>
</ul>

<h3>1.1.2. Phân loại cơ sở dữ liệu</h3>
<table>
<tr><th>Loại CSDL</th><th>Đặc điểm</th><th>Ví dụ</th></tr>
<tr><td><strong>CSDL quan hệ (Relational)</strong></td><td>Dữ liệu tổ chức dạng bảng, liên kết qua khóa ngoại</td><td>SQL Server, MySQL, PostgreSQL, Oracle</td></tr>
<tr><td><strong>CSDL NoSQL</strong></td><td>Linh hoạt về cấu trúc, phù hợp dữ liệu phi cấu trúc</td><td>MongoDB, Cassandra, Redis</td></tr>
<tr><td><strong>CSDL phân tán (Distributed)</strong></td><td>Dữ liệu phân tán trên nhiều máy chủ</td><td>Google Spanner, CockroachDB</td></tr>
<tr><td><strong>CSDL đám mây (Cloud)</strong></td><td>Hosted trên nền tảng đám mây</td><td>Azure SQL, Amazon RDS, Google Cloud SQL</td></tr>
<tr><td><strong>CSDL hướng đối tượng</strong></td><td>Lưu trữ dữ liệu dưới dạng đối tượng</td><td>ObjectDB, db4o</td></tr>
</table>

<h3>1.1.3. Mô hình dữ liệu quan hệ</h3>
<p>Mô hình dữ liệu quan hệ (Relational Data Model) do E.F. Codd đề xuất năm 1970, là mô hình phổ biến nhất hiện nay. Trong mô hình này:</p>
<ul>
<li><strong>Quan hệ (Relation):</strong> Được biểu diễn dưới dạng bảng hai chiều.</li>
<li><strong>Thuộc tính (Attribute):</strong> Tên các cột trong bảng, mô tả đặc điểm của thực thể.</li>
<li><strong>Bộ (Tuple):</strong> Mỗi hàng trong bảng, biểu diễn một bản ghi cụ thể.</li>
<li><strong>Khóa chính (Primary Key):</strong> Thuộc tính hoặc tập thuộc tính xác định duy nhất mỗi bộ.</li>
<li><strong>Khóa ngoại (Foreign Key):</strong> Thuộc tính tham chiếu đến khóa chính của bảng khác, tạo liên kết giữa các bảng.</li>
</ul>

<h3>1.1.4. Các ràng buộc toàn vẹn dữ liệu</h3>
<ul>
<li><strong>Ràng buộc miền giá trị (Domain Constraint):</strong> Giới hạn tập giá trị hợp lệ cho một thuộc tính.</li>
<li><strong>Ràng buộc khóa (Key Constraint):</strong> Đảm bảo tính duy nhất của khóa chính.</li>
<li><strong>Ràng buộc toàn vẹn thực thể (Entity Integrity):</strong> Khóa chính không được chứa giá trị NULL.</li>
<li><strong>Ràng buộc toàn vẹn tham chiếu (Referential Integrity):</strong> Giá trị khóa ngoại phải tồn tại trong bảng tham chiếu hoặc là NULL.</li>
</ul>
</div>

<!-- Trang tiếp - HQTCSDL -->
<div class="page">
{header_block}
{footer(ft, 3)}

<h2>1.2. Hệ quản trị cơ sở dữ liệu (DBMS)</h2>
<h3>1.2.1. Khái niệm</h3>
<p>Hệ quản trị cơ sở dữ liệu (HQTCSDL - Database Management System) là phần mềm hệ thống cho phép người dùng định nghĩa, tạo lập, duy trì và kiểm soát truy cập đến cơ sở dữ liệu. HQTCSDL đóng vai trò trung gian giữa người dùng/ứng dụng và dữ liệu vật lý được lưu trữ.</p>

<h3>1.2.2. Các chức năng chính của HQTCSDL</h3>
<ol>
<li><strong>Định nghĩa dữ liệu (Data Definition):</strong> Cho phép tạo, sửa đổi, xóa các cấu trúc dữ liệu bằng ngôn ngữ DDL.</li>
<li><strong>Thao tác dữ liệu (Data Manipulation):</strong> Cho phép thêm, sửa, xóa, truy vấn dữ liệu bằng ngôn ngữ DML.</li>
<li><strong>Kiểm soát truy cập (Access Control):</strong> Quản lý quyền truy cập của người dùng, đảm bảo bảo mật.</li>
<li><strong>Quản lý giao dịch (Transaction Management):</strong> Đảm bảo tính ACID (Atomicity, Consistency, Isolation, Durability).</li>
<li><strong>Sao lưu và phục hồi (Backup &amp; Recovery):</strong> Cung cấp cơ chế bảo vệ dữ liệu khỏi hỏng hóc.</li>
<li><strong>Tối ưu hóa truy vấn (Query Optimization):</strong> Tự động chọn phương án thực thi tối ưu.</li>
</ol>

<h3>1.2.3. Các HQTCSDL phổ biến</h3>
<table>
<tr><th>HQTCSDL</th><th>Nhà phát triển</th><th>Đặc điểm nổi bật</th></tr>
<tr><td><strong>Microsoft SQL Server</strong></td><td>Microsoft</td><td>Tích hợp tốt với hệ sinh thái Microsoft, bảo mật mạnh mẽ</td></tr>
<tr><td><strong>Oracle Database</strong></td><td>Oracle Corp.</td><td>Hiệu năng cao, bảo mật enterprise, hỗ trợ multi-tenant</td></tr>
<tr><td><strong>MySQL</strong></td><td>Oracle Corp.</td><td>Mã nguồn mở, phổ biến cho web, hiệu suất tốt</td></tr>
<tr><td><strong>PostgreSQL</strong></td><td>Cộng đồng</td><td>Mã nguồn mở, tuân thủ chuẩn SQL, hỗ trợ JSON</td></tr>
<tr><td><strong>MongoDB</strong></td><td>MongoDB Inc.</td><td>NoSQL, linh hoạt schema, phù hợp big data</td></tr>
</table>
</div>

<!-- Trang tiếp - Phân tích ưu nhược điểm -->
<div class="page">
{header_block}
{footer(ft, 5)}

<h2>1.3. Phân tích ưu nhược điểm của tính bảo mật thông tin</h2>
<h3>1.3.1. Tổng quan về bảo mật thông tin</h3>
<p>Bảo mật thông tin (Information Security) là tập hợp các biện pháp nhằm bảo vệ thông tin khỏi các truy cập, sử dụng, tiết lộ, sửa đổi hoặc phá hủy trái phép. Ba trụ cột cơ bản của bảo mật thông tin được gọi là <strong>bộ ba CIA</strong>:</p>
<ul>
<li><strong>Tính bảo mật (Confidentiality):</strong> Đảm bảo thông tin chỉ được truy cập bởi những người được ủy quyền.</li>
<li><strong>Tính toàn vẹn (Integrity):</strong> Đảm bảo thông tin không bị sửa đổi trái phép.</li>
<li><strong>Tính sẵn sàng (Availability):</strong> Đảm bảo thông tin luôn sẵn sàng khi cần thiết.</li>
</ul>

<h3>1.3.2. Ưu điểm của việc triển khai bảo mật thông tin</h3>
<table>
<tr><th>STT</th><th>Ưu điểm</th><th>Mô tả chi tiết</th></tr>
<tr><td>1</td><td><strong>Bảo vệ dữ liệu nhạy cảm</strong></td><td>Ngăn chặn rò rỉ thông tin cá nhân, tài chính, bí mật kinh doanh</td></tr>
<tr><td>2</td><td><strong>Kiểm soát truy cập hiệu quả</strong></td><td>Phân quyền rõ ràng theo nguyên tắc least privilege</td></tr>
<tr><td>3</td><td><strong>Phát hiện và ngăn chặn tấn công</strong></td><td>Hệ thống giám sát giúp phát hiện sớm hành vi bất thường</td></tr>
<tr><td>4</td><td><strong>Đảm bảo tính toàn vẹn dữ liệu</strong></td><td>Mã hóa và chữ ký số bảo vệ dữ liệu khỏi thay đổi trái phép</td></tr>
<tr><td>5</td><td><strong>Khả năng phục hồi sau sự cố</strong></td><td>Sao lưu định kỳ giúp giảm thiểu thời gian gián đoạn</td></tr>
<tr><td>6</td><td><strong>Tăng uy tín tổ chức</strong></td><td>Hệ thống bảo mật tốt tạo niềm tin cho khách hàng, đối tác</td></tr>
<tr><td>7</td><td><strong>Tuân thủ quy định pháp luật</strong></td><td>Đáp ứng Luật An ninh mạng, GDPR và các tiêu chuẩn quốc tế</td></tr>
</table>

<h3>1.3.3. Nhược điểm và thách thức</h3>
<table>
<tr><th>STT</th><th>Nhược điểm</th><th>Mô tả chi tiết</th></tr>
<tr><td>1</td><td><strong>Chi phí triển khai cao</strong></td><td>Đầu tư phần cứng, phần mềm và nhân sự chuyên môn đòi hỏi ngân sách lớn</td></tr>
<tr><td>2</td><td><strong>Giảm hiệu năng hệ thống</strong></td><td>Mã hóa, kiểm toán tạo thêm tải cho hệ thống</td></tr>
<tr><td>3</td><td><strong>Phức tạp trong quản trị</strong></td><td>Quản lý chính sách bảo mật đòi hỏi kiến thức chuyên sâu</td></tr>
<tr><td>4</td><td><strong>Ảnh hưởng trải nghiệm người dùng</strong></td><td>Xác thực đa yếu tố có thể gây bất tiện</td></tr>
<tr><td>5</td><td><strong>Khó cân bằng bảo mật và tiện dụng</strong></td><td>Bảo mật quá chặt cản trở năng suất; quá lỏng dễ bị tấn công</td></tr>
<tr><td>6</td><td><strong>Không có giải pháp hoàn hảo</strong></td><td>Luôn tồn tại lỗ hổng zero-day và rủi ro từ con người</td></tr>
<tr><td>7</td><td><strong>Yêu cầu cập nhật liên tục</strong></td><td>Mối đe dọa tiến hóa, đòi hỏi cập nhật và đào tạo thường xuyên</td></tr>
</table>

<h3>1.3.4. Ma trận đánh giá các phương pháp bảo mật</h3>
<table>
<tr><th>Phương pháp</th><th>Bảo mật</th><th>Hiệu năng</th><th>Chi phí</th><th>Độ phức tạp</th></tr>
<tr><td>Phân quyền (Authorization)</td><td class="stars">★★★★☆</td><td class="stars">★★★★★</td><td class="stars">★★★★★</td><td class="stars">★★★☆☆</td></tr>
<tr><td>Mã hóa dữ liệu (Encryption)</td><td class="stars">★★★★★</td><td class="stars">★★★☆☆</td><td class="stars">★★★★☆</td><td class="stars">★★★★☆</td></tr>
<tr><td>Kiểm toán (Auditing)</td><td class="stars">★★★★☆</td><td class="stars">★★★★☆</td><td class="stars">★★★★☆</td><td class="stars">★★★☆☆</td></tr>
<tr><td>Sao lưu &amp; Phục hồi</td><td class="stars">★★★★★</td><td class="stars">★★★★★</td><td class="stars">★★★☆☆</td><td class="stars">★★★☆☆</td></tr>
<tr><td>Tường lửa (Firewall)</td><td class="stars">★★★★☆</td><td class="stars">★★★★☆</td><td class="stars">★★★☆☆</td><td class="stars">★★★★☆</td></tr>
<tr><td>Xác thực đa yếu tố (MFA)</td><td class="stars">★★★★★</td><td class="stars">★★★★☆</td><td class="stars">★★★☆☆</td><td class="stars">★★★★☆</td></tr>
</table>
<blockquote>★★★★★ = Xuất sắc &nbsp;|&nbsp; ★★★★☆ = Tốt &nbsp;|&nbsp; ★★★☆☆ = Trung bình</blockquote>
</div>
'''

# Insert body content before </body>
insert_point = content.find('</body>')
new_content = content[:insert_point] + body_content + '\n</body>\n</html>'

with open(output, 'w', encoding='utf-8') as f:
    f.write(new_content)

print("Part 1 done: Chapter 1 inserted with correct UTF-8")
