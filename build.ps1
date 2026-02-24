$outputFile = "f:\ThacSiHoaBinh\BaoMat\BaoMatCNTT\index.html"

$part1 = @'
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</title>
<style>

:root {
  --page-w: 210mm;
  --page-h: 297mm;
  --margin-top: 25mm;
  --margin-bottom: 20mm;
  --margin-left: 30mm;
  --margin-right: 20mm;
  --primary: #1a237e;
  --primary-light: #3949ab;
  --accent: #c62828;
  --bg-light: #f5f7fa;
}

* { margin:0; padding:0; box-sizing:border-box; }

/* ===== SCREEN VIEW: show A4 pages ===== */
body {
  font-family: 'Times New Roman', Times, serif;
  font-size: 13pt;
  line-height: 1.8;
  color: #1a1a1a;
  background: #e0e0e0;
}

.page {
  width: var(--page-w);
  min-height: var(--page-h);
  background: #fff;
  margin: 20px auto;
  padding: var(--margin-top) var(--margin-right) var(--margin-bottom) var(--margin-left);
  box-shadow: 0 4px 20px rgba(0,0,0,0.15);
  position: relative;
  overflow: hidden;
}

/* Header bar */
.page-header {
  position: absolute;
  top: 0; left: 0; right: 0;
  height: 18mm;
  display: flex;
  align-items: center;
  padding: 3mm var(--margin-right) 3mm var(--margin-left);
  border-bottom: 2px solid var(--primary);
  background: #fff;
}
.page-header .logo-img {
  height: 12mm;
  margin-right: 8px;
}
.page-header .header-text {
  font-size: 9pt;
  color: var(--primary);
  font-weight: 500;
  line-height: 1.3;
}
.page-header .header-text span {
  display: block;
  font-size: 8pt;
  color: #555;
  font-weight: 400;
}

/* Footer bar */
.page-footer {
  position: absolute;
  bottom: 0; left: 0; right: 0;
  height: 12mm;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 2mm var(--margin-right) 2mm var(--margin-left);
  border-top: 1.5px solid var(--primary);
  background: #fff;
  font-size: 9pt;
  color: #555;
}
.page-footer .footer-title {
  font-style: italic;
}
.page-footer .page-number {
  font-weight: 600;
  color: var(--primary);
}

/* ===== COVER PAGE ===== */
.cover-page {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: calc(var(--page-h) - 10mm);
  text-align: center;
  padding: 0;
}
.cover-page .page-header,
.cover-page .page-footer { display: none; }
.page.cover-container { padding: 0; }
.page.cover-container .page-header,
.page.cover-container .page-footer { display: none; }

.cover-border {
  border: 3px double var(--primary);
  margin: 15mm;
  padding: 20mm 15mm;
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: calc(var(--page-h) - 40mm);
}
.cover-university { font-size: 16pt; color: var(--primary); font-weight: 700; text-transform: uppercase; letter-spacing: 1.5px; }
.cover-program { font-size: 12pt; color: #555; margin-top: 4px; }
.cover-logo { width: 80px; height: 80px; margin: 25px 0; }
.cover-logo img { width: 100%; height: 100%; object-fit: contain; }
.cover-divider { width: 60%; height: 3px; background: linear-gradient(90deg, transparent, var(--primary), transparent); margin: 15px 0; }
.cover-subject { font-size: 12pt; color: var(--accent); font-weight: 500; text-transform: uppercase; letter-spacing: 2px; margin: 15px 0 5px; }
.cover-title { font-size: 24pt; color: var(--primary); font-weight: 700; text-transform: uppercase; letter-spacing: 2px; line-height: 1.4; margin: 10px 0; }
.cover-subtitle { font-size: 13pt; color: #333; font-weight: 400; margin: 5px 0 30px; line-height: 1.5; }
.cover-info { margin-top: 30px; font-size: 12pt; }
.cover-info p { margin: 5px 0; }
.cover-info .label { color: #555; }
.cover-info .value { font-weight: 600; color: #1a1a1a; }
.cover-year { font-size: 14pt; font-weight: 700; color: var(--primary); margin-top: 30px; letter-spacing: 3px; }

/* ===== TOC PAGE ===== */
.toc { padding-top: 5mm; }
.toc-title { font-size: 18pt; color: var(--primary); text-align: center; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 20px; font-weight: 700; }
.toc-list { list-style: none; padding: 0; }
.toc-list > li { margin: 8px 0; font-size: 12pt; font-weight: 600; color: var(--primary); display: flex; justify-content: space-between; align-items: baseline; border-bottom: 1px dotted #ccc; padding-bottom: 4px; }
.toc-list > li > .toc-page { font-weight: 400; color: #555; min-width: 25px; text-align: right; }
.toc-sub { list-style: none; padding-left: 20px; margin: 3px 0; }
.toc-sub li { font-weight: 400; font-size: 11pt; color: #333; display: flex; justify-content: space-between; border-bottom: 1px dotted #eee; padding: 2px 0; }
.toc-sub li .toc-page { color: #777; }

/* ===== CONTENT STYLES ===== */
h1.chapter {
  font-size: 18pt;
  color: var(--primary);
  text-transform: uppercase;
  letter-spacing: 1.5px;
  text-align: center;
  padding: 8px 0 12px;
  border-bottom: 3px solid var(--primary);
  margin: 0 0 20px;
}
h2 { font-size: 14pt; color: #283593; margin: 22px 0 10px; border-left: 4px solid #283593; padding-left: 12px; }
h3 { font-size: 12pt; color: #303f9f; margin: 16px 0 8px; }
h4 { font-size: 11pt; color: #3949ab; margin: 12px 0 6px; }
p { margin: 6px 0; text-align: justify; }
ul, ol { margin: 6px 0 6px 22px; }
li { margin: 3px 0; }

table { width: 100%; border-collapse: collapse; margin: 10px 0; font-size: 11pt; }
th { background: var(--primary); color: #fff; padding: 7px 8px; text-align: left; font-weight: 500; font-size: 10.5pt; }
td { padding: 6px 8px; border: 1px solid #ddd; }
tr:nth-child(even) { background: #f5f5f5; }

pre {
  background: #1e1e2e;
  color: #cdd6f4;
  padding: 12px 14px;
  border-radius: 6px;
  font-family: Consolas, 'Courier New', monospace;
  font-size: 9.5pt;
  line-height: 1.5;
  overflow-x: auto;
  margin: 8px 0;
  white-space: pre-wrap;
  word-wrap: break-word;
}
code { font-family: Consolas, 'Courier New', monospace; font-size: 10pt; }
p code { background: #e8eaf6; padding: 1px 4px; border-radius: 3px; color: var(--primary); }

blockquote { border-left: 4px solid var(--primary); padding: 8px 14px; background: #e8eaf6; margin: 10px 0; font-size: 11pt; }

.diagram { background: #eceff1; border: 1px solid #b0bec5; padding: 12px; border-radius: 4px; font-family: Consolas, 'Courier New', monospace; font-size: 10pt; white-space: pre; margin: 10px 0; line-height: 1.4; overflow-x: auto; }

.result-table th { background: #2e7d32; }
.threat-table td:last-child { font-weight: 500; }
strong { color: var(--primary); }
.separator { border: none; border-top: 2px solid var(--primary); margin: 20px 0; }
.stars { color: #f9a825; letter-spacing: 1px; }
.ref { font-size: 10.5pt; color: #444; }
.ref li { margin: 4px 0; }

/* ===== PRINT STYLES ===== */
@media print {
  body { background: #fff; }
  .page {
    width: auto;
    min-height: auto;
    margin: 0;
    padding: 0;
    box-shadow: none;
    page-break-after: always;
  }
  .page:last-child { page-break-after: auto; }
  .page-header, .page-footer { display: none !important; }
  
  @page {
    size: A4;
    margin: 20mm 20mm 18mm 30mm;
    @top-center {
      content: "ĐẠI HỌC HÒA BÌNH";
      font-size: 9pt;
      color: #1a237e;
    }
    @bottom-left {
      content: "Bảo mật và An toàn Thông tin trong CSDL";
      font-size: 8pt;
      font-style: italic;
      color: #555;
    }
    @bottom-right {
      content: counter(page);
      font-size: 9pt;
      font-weight: bold;
      color: #1a237e;
    }
  }
  @page :first { @top-center { content: none; } @bottom-left { content: none; } @bottom-right { content: none; } }

  pre { white-space: pre-wrap !important; word-wrap: break-word !important; font-size: 9pt; }
  table { page-break-inside: avoid; }
  h1, h2, h3 { page-break-after: avoid; }
}
</style>
</head>
<body>

<!-- ===== TRANG BÌA ===== -->
<div class="page cover-container">
<div class="cover-border">
  <p class="cover-university">Trường Đại học Hòa Bình</p>
  <p class="cover-program">Chương trình đào tạo Thạc sĩ</p>
  <div class="cover-logo">
    <img src="https://upload.wikimedia.org/wikipedia/vi/thumb/b/b4/Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png/200px-Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png" alt="Logo Đại học Hòa Bình" onerror="this.outerHTML='<div style=&quot;font-size:48pt;color:#1a237e&quot;>🛡️</div>'">
  </div>
  <div class="cover-divider"></div>
  <p class="cover-subject">Bài tập môn học</p>
  <h1 class="cover-title">Bảo mật và An toàn<br>Thông tin trong<br>Cơ sở Dữ liệu</h1>
  <p class="cover-subtitle">Nghiên cứu các giải pháp bảo mật cơ sở dữ liệu<br>và demo thực hành trên Microsoft SQL Server</p>
  <div class="cover-divider"></div>
  <div class="cover-info">
    <p><span class="label">Người thực hiện:</span></p>
    <p><span class="value">Nguyễn Hữu Huy</span></p>
    <p><span class="value">Nguyễn Thị Phương</span></p>
  </div>
  <p class="cover-year">— 2025 —</p>
</div>
</div>

<!-- ===== MỤC LỤC ===== -->
<div class="page">
<div class="page-header">
  <img class="logo-img" src="https://upload.wikimedia.org/wikipedia/vi/thumb/b/b4/Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png/200px-Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png" alt="Logo" onerror="this.style.display='none'">
  <div class="header-text">TRƯỜNG ĐẠI HỌC HÒA BÌNH<span>Chương trình Thạc sĩ — Bài tập môn học</span></div>
</div>
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">i</span>
</div>
<div class="toc">
<h2 class="toc-title">Mục Lục</h2>
<ul class="toc-list">
  <li>Chương 1. Cơ sở lý thuyết <span class="toc-page">1</span></li>
  <ul class="toc-sub">
    <li>1.1. Cơ sở dữ liệu <span class="toc-page">1</span></li>
    <li>1.2. Hệ quản trị cơ sở dữ liệu <span class="toc-page">3</span></li>
    <li>1.3. Phân tích ưu nhược điểm của bảo mật thông tin <span class="toc-page">5</span></li>
  </ul>
  <li>Chương 2. Vấn đề nghiên cứu và giải pháp an toàn <span class="toc-page">7</span></li>
  <ul class="toc-sub">
    <li>2.1. Các mối đe dọa đối với cơ sở dữ liệu <span class="toc-page">7</span></li>
    <li>2.2. Các giải pháp bảo mật và an toàn thông tin <span class="toc-page">9</span></li>
    <li>2.3. Tổng kết các giải pháp <span class="toc-page">13</span></li>
  </ul>
  <li>Chương 3. Demo các bước bảo mật trên SQL Server <span class="toc-page">14</span></li>
  <ul class="toc-sub">
    <li>3.0. Chuẩn bị môi trường Demo <span class="toc-page">14</span></li>
    <li>3.1. Demo Phân quyền người dùng <span class="toc-page">16</span></li>
    <li>3.2. Demo Mã hóa dữ liệu <span class="toc-page">19</span></li>
    <li>3.3. Demo Kiểm toán (Audit) <span class="toc-page">21</span></li>
    <li>3.4. Demo Sao lưu và Phục hồi <span class="toc-page">23</span></li>
    <li>3.5. Tổng kết Demo <span class="toc-page">25</span></li>
  </ul>
  <li>Chương 4. Áp dụng bảo mật cho dự án thực tiễn — Opdo.store <span class="toc-page">26</span></li>
  <ul class="toc-sub">
    <li>4.1. Giới thiệu dự án Opdo.store <span class="toc-page">26</span></li>
    <li>4.2. Kiến trúc hệ thống và CSDL <span class="toc-page">27</span></li>
    <li>4.3. Triển khai phân quyền người dùng <span class="toc-page">28</span></li>
    <li>4.4. Triển khai mã hóa dữ liệu <span class="toc-page">30</span></li>
    <li>4.5. Triển khai kiểm toán và giám sát <span class="toc-page">31</span></li>
    <li>4.6. Triển khai sao lưu và phục hồi <span class="toc-page">32</span></li>
    <li>4.7. Các biện pháp bảo mật bổ sung <span class="toc-page">33</span></li>
    <li>4.8. Tổng kết triển khai thực tiễn <span class="toc-page">34</span></li>
  </ul>
  <li>Kết luận <span class="toc-page">35</span></li>
  <li>Tài liệu tham khảo <span class="toc-page">37</span></li>
</ul>
</div>
</div>

<!-- ===== CHƯƠNG 1 ===== -->
<div class="page">
<div class="page-header">
  <img class="logo-img" src="https://upload.wikimedia.org/wikipedia/vi/thumb/b/b4/Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png/200px-Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png" alt="Logo" onerror="this.style.display='none'">
  <div class="header-text">TRƯỜNG ĐẠI HỌC HÒA BÌNH<span>Chương trình Thạc sĩ — Bài tập môn học</span></div>
</div>
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">1</span>
</div>

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
<div class="page-header">
  <img class="logo-img" src="https://upload.wikimedia.org/wikipedia/vi/thumb/b/b4/Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png/200px-Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png" alt="Logo" onerror="this.style.display='none'">
  <div class="header-text">TRƯỜNG ĐẠI HỌC HÒA BÌNH<span>Chương trình Thạc sĩ — Bài tập môn học</span></div>
</div>
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">3</span>
</div>

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

<h3>1.2.3. Kiến trúc 3 mức của HQTCSDL (ANSI/SPARC)</h3>
<div class="diagram">┌─────────────────────────────────────┐
│      Mức ngoài (External Level)     │
│   Các khung nhìn (Views) của        │
│   từng nhóm người dùng              │
├─────────────────────────────────────┤
│      Mức khái niệm (Conceptual)     │
│   Mô tả toàn bộ cấu trúc logic     │
│   của CSDL                          │
├─────────────────────────────────────┤
│      Mức trong (Internal Level)      │
│   Cấu trúc lưu trữ vật lý          │
│   trên đĩa                          │
└─────────────────────────────────────┘</div>

<h3>1.2.4. Các HQTCSDL phổ biến</h3>
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
<div class="page-header">
  <img class="logo-img" src="https://upload.wikimedia.org/wikipedia/vi/thumb/b/b4/Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png/200px-Logo_%C4%90H_H%C3%B2a_B%C3%ACnh.png" alt="Logo" onerror="this.style.display='none'">
  <div class="header-text">TRƯỜNG ĐẠI HỌC HÒA BÌNH<span>Chương trình Thạc sĩ — Bài tập môn học</span></div>
</div>
<div class="page-footer">
  <span class="footer-title">Bảo mật và An toàn Thông tin trong Cơ sở Dữ liệu</span>
  <span class="page-number">5</span>
</div>

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
'@

[System.IO.File]::WriteAllText($outputFile, $part1, [System.Text.UTF8Encoding]::new($false))
Write-Host "Part 1 done (Cover + TOC + Ch1)"
