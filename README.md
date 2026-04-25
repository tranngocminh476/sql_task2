**Chủ đề:** Quản lý Cửa hàng Phở 

**Sinh viên thực hiện:** Trần Ngọc Minh

**Mã sinh viên:** K235480106050

**Mô tả:** Repository này chứa mã nguồn T-SQL và các minh chứng thực hành chi tiết về Database, Function, Store Procedure, Trigger và Cursor.


# Yêu cầu đầu bài:
Phần 1: Thiết kế và Khởi tạo Cấu trúc Dữ liệu 
Sinh viên tự chọn một chủ đề quản lý (Ví dụ: Quản lý thư viện, Quản lý khách sạn, hoặc Quản lý dự án, HOẶC BẤT KỲ BÀI TOÁN QUẢN LÝ NÀO KHÁC).

Tạo một Database mới với tên [Tên dự án]_[MaSV]. //LƯU Ý PHẢI CÓ MÃ SV CÁ NHÂN Ở TÊN CỦA DB ĐÚNG NHƯ YÊU CẦU, vd: QuanLyKhachSan_K123456789

Tạo ít nhất 3 bảng có quan hệ với nhau. Yêu cầu:

Sử dụng đa dạng các kiểu dữ liệu (Số nguyên, số thực, chuỗi ký tự Unicode, ngày tháng, tiền tệ, ...).

Áp dụng đúng quy tắc đặt tên (BướuLạcĐà).

Sử dụng cặp ngoặc [ ] để bọc tên bảng và tên trường trong script khởi tạo.

Có giải thích chỗ nào là PK, chỗ nào là FK, trường nào có ràng buộc cứng CK (ví dụ điểm từ 0..10),...

Phần 2: Xây dựng Function 
Hãy cho biết trong SQL Server có những loại function build_in (hàm có sẵn) nào, nêu 1 vài system function build_in mà em tìm hiểu được (ko cần nhiều, cần đặc sắc theo góc nhìn của em), cho SQL khai thác các hàm đó.

Hàm do người dùng tự viết trong SQL thường mang mục đích gì? Nó có những loại nào? Mỗi loại thường được dùng khi nào? Tại sao có nhiều system function rồi mà vẫn cần tự viết fn riêng?

Viết 01 Scalar Function (Hàm trả về một giá trị): Đưa ra 1 logic cho cơ sở dữ liệu của em, mà cần dùng đến function này. (SV TỰ NGHĨ RA YÊU CẦU CỦA HÀM VÀ VIẾT HÀM GIẢI QUYẾT NÓ)

Sau khi đã có hàm, viết câu lệnh sql khai thác hàm đó.

Viết 01 Inline Table-Valued Function: Trả về danh sách các bản ghi theo một điều kiện lọc cụ thể (SV TỰ NGHĨ RA YÊU CẦU CỦA HÀM VÀ VIẾT HÀM GIẢI QUYẾT NÓ)

Sau khi đã có hàm, viết câu lệnh sql khai thác hàm đó.

Viết 01 Multi-statement Table-Valued Function: Thực hiện xử lý logic phức tạp bên trong (có sử dụng biến bảng) trước khi trả về kết quả. (SV TỰ NGHĨ RA YÊU CẦU CỦA HÀM VÀ VIẾT HÀM GIẢI QUYẾT NÓ)

Sau khi đã có hàm, viết câu lệnh sql khai thác hàm đó.

Phần 3: Xây dựng Store Procedure 
Trong SQL Server có những SP có sẵn nào? nêu 1 vài system sp mà em tìm hiểu được, giải thích cách dùng chúng.

Viết 01 Store Procedure đơn giản để thực hiện lệnh INSERT hoặc UPDATE dữ liệu, có kiểm tra điều kiện logic (SV TỰ NGHĨ RA YÊU CẦU CỦA SP VÀ VIẾT SP GIẢI QUYẾT NÓ)

Viết 01 Store Procedure có sử dụng tham số OUTPUT để trả về một giá trị tính toán (SV TỰ NGHĨ RA YÊU CẦU CỦA SP VÀ VIẾT SP GIẢI QUYẾT NÓ, SP NÀY CÓ DÙNG THAM SỐ LOẠI OUTPUT)

Viết 01 Store Procedure trả về một tập kết quả (Result set) từ lệnh SELECT sau khi đã join nhiều bảng. (SV TỰ NGHĨ RA YÊU CẦU CỦA SP VÀ VIẾT SP GIẢI QUYẾT NÓ)

Phần 4: Trigger và Xử lý logic nghiệp vụ 
Viết 01 Trigger để tự động làm gì đó tại 1 bảng B khi mà dữ liệu thay đổi dữ liệu ở bảng A. Logic giải quyết do sv tự nghĩ ra, sao cho thực tế và thuyết phục.

Thử viết Trigger cho Bảng A : Khi insert thì cập nhật dữ liệu vào bảng B; sau đó viết trigger cho bảng B để khi B được cập nhật thì cập nhật sang bảng A : Quan sát các thông báo (nếu có) của hệ thống, giải thích các thông báo đó (nếu có). Đưa ra nhật xét cuối cùng về tình trạng này.

Phần 5: Cursor và Duyệt dữ liệu 
Viết một đoạn script sử dụng CURSOR để duyệt qua danh sách của 1 câu lệnh SQL dạng SELECT, duyệt qua từng bản ghi, xử lý riêng từng bản ghi (THEO LOGIC SV TỰ ĐẶT RA: SAO CHO HỢP LÝ VÀ THUYẾT PHỤC)

Tìm cách không sử dụng CURSOR để giải quyết bài toán mà em đã dùng CURSOR mới giải quyết được ở trên. thử so sánh tốc độ giữa có dùng cursor và không dùng cursor (nếu cùng kết quả) thì thời gian xử lý cái nào nhanh hơn, cần ảnh chụp màn hình minh chứng.

Nếu vẫn tìm được cách dùng SQL để giải quyết vấn đề mà ko cần CURSOR: thử nghĩ bài toán khác, mà chỉ CURSOR mới giải quyết được, còn SQL rất khó giải quyết đc (theo logic suy nghĩ của em)

---


## Phần 1: Thiết kế và Khởi tạo Cấu trúc Dữ liệu

Cơ sở dữ liệu được thiết kế với tên `[QuanLyCuaHangPho_K235480106050]` gồm 3 bảng có mối quan hệ với nhau, sử dụng đa dạng các kiểu dữ liệu (`INT`, `NVARCHAR`, `MONEY`, `DATE`, `BIT`) và áp dụng các ràng buộc PK, FK, CK.

**1. Khởi tạo Database:**

<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 144310" src="https://github.com/user-attachments/assets/4b0a62e6-56cc-4890-a093-09e8a34ff793" />


 **Chú thích:**  Hiển thị lệnh tạo mới một cơ sở dữ liệu trên SQL Server.


**2. Khởi tạo Cấu trúc Bảng:**
<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 144500" src="https://github.com/user-attachments/assets/012a5d12-ee84-4678-9315-5d1c7ee35680" />

 **Chú thích:**  Hiển thị các lệnh tạo cấu trúc 3 bảng: `DanhMucMonAn`, `KhachHang`, và `HoaDon`.
Định hình cấu trúc lưu trữ, quy định kiểu dữ liệu và thiết lập các ràng buộc (Khóa chính PK, Khóa ngoại FK, Ràng buộc kiểm tra CK như giá tiền > 0, điểm tích lũy >= 0).
 

**3. Thêm Dữ liệu mẫu (Insert Data):**
<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 155829" src="https://github.com/user-attachments/assets/b3c1cb9d-f64d-4092-bb2b-850e609328fb" />

 **Chú thích:**  Chụp lại quá trình chạy lệnh `INSERT INTO`.
Nạp dữ liệu giả lập (khách hàng, món ăn, hóa đơn) vào các bảng để phục vụ cho việc kiểm thử các hàm và thủ tục ở các bước sau.




## Phần 2: Xây dựng Function (Hàm)
**Lý thuyết về Function trong SQL Server:**

**Hàm có sẵn (Built-in Functions):**

SQL Server cung cấp hệ thống hàm phong phú để xử lý dữ liệu nhanh chóng. Có các loại chính:

- Hàm toán học: ROUND(), ABS(), RAND().

- Hàm chuỗi: LEN(), UPPER(), SUBSTRING().

- Hàm ngày tháng: GETDATE(), DATEDIFF(), YEAR().

- Hàm hệ thống đặc sắc: * ISNULL(check_expression, replacement_value): Giúp thay thế giá trị NULL bằng một giá trị mặc định, cực kỳ quan trọng trong tính toán tài chính.

- COALESCE(...): Trả về giá trị không NULL đầu tiên trong danh sách tham số.

**Hàm do người dùng tự viết (User-Defined Functions - UDF):**

- Mục đích: Đóng gói các logic nghiệp vụ lặp đi lặp lại mà các hàm hệ thống không có sẵn (ví dụ: tính thuế, tính điểm thưởng theo quy tắc riêng).

Phân loại:

- Scalar Function: Trả về 1 giá trị đơn duy nhất. Dùng khi cần tính toán một kết quả cụ thể dựa trên các tham số đầu vào.

- Inline Table-Valued Function (iTVF): Trả về một tập kết quả dưới dạng bảng. Chỉ chứa duy nhất một câu lệnh SELECT. Hiệu năng tốt vì SQL Server coi nó như một View có tham số.

- Multi-statement Table-Valued Function (mTVF): Trả về một bảng nhưng chứa nhiều câu lệnh logic phức tạp bên trong (khai báo biến bảng, IF...ELSE, vòng lặp).

Tại sao cần tự viết hàm? Vì hệ thống chỉ cung cấp các công cụ tính toán cơ bản. Mỗi doanh nghiệp có quy tắc riêng (ví dụ: cửa hàng phở có cách tính giảm giá cho khách VIP khác với thư viện tính phí phạt sách), nên UDF giúp chuẩn hóa các quy tắc này.

**1. Scalar Function (Hàm vô hướng):**
<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 155907" src="https://github.com/user-attachments/assets/105d435c-916d-4c9e-948c-630c1debc015" />

 **Chú thích:**   Hiển thị mã nguồn tạo hàm và kết quả gọi hàm vô hướng `fn_TinhTienGiamGia`.
 Giải quyết bài toán tính tiền giảm giá tự động dựa trên điểm tích lũy của khách hàng (Logic: >100 điểm giảm 10%, >50 điểm giảm 5%).
Bảng kết quả hiển thị số tiền được giảm giá hoàn toàn chính xác cho từng khách hàng tương ứng với điểm của họ.

**2. Inline Table-Valued Function (Hàm trả về bảng nội tuyến):**
<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 160637" src="https://github.com/user-attachments/assets/19e09198-18eb-4cbc-8b1d-e1ec4c4ac2b0" />

 **Chú thích:**  Hiển thị quá trình tạo và thực thi hàm `fn_LocMonAnTheoGia`.
Lọc và trả về danh sách các món ăn nằm trong một khoảng giá nhất định do người dùng truyền vào 
Hàm đã lọc đúng các món nước có giá từ 30.000đ đến 60.000đ, loại bỏ các món nằm ngoài khoảng này.

**3. Multi-statement Table-Valued Function (Hàm trả về bảng đa câu lệnh):**
<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 160851" src="https://github.com/user-attachments/assets/2eea82b7-45ed-442c-a523-3f9125b2f805" />

 **Chú thích:**  Hiển thị quá trình xử lý logic đếm số hóa đơn và phân loại khách hàng trong hàm `fn_BaoCaoPhanLoaiKhachHang`.
 Trả về báo cáo thống kê phân loại khách (Thân thiết, Tiềm năng, Mới) sử dụng cấu trúc `CASE WHEN` kết hợp `GROUP BY` và lưu vào biến bảng.
 Bảng kết quả đã đếm chính xác số đơn hàng và gắn nhãn phân loại đúng cho từng khách hàng.



## Phần 3: Xây dựng Store Procedure (Thủ tục lưu trữ)

**Lý thuyết Các System Store Procedure có sẵn trong SQL Server:**

Trong SQL Server, Microsoft cung cấp sẵn một hệ thống các Store Procedure (gọi là System Stored Procedures) thường được lưu trữ trong database master và có tiền tố là sp_. Chúng giúp các lập trình viên và quản trị viên (DBA) quản lý cơ sở dữ liệu dễ dàng hơn.

 Một số System SP đặc sắc và cách dùng:

1. sp_help: Xem thông tin chi tiết của một đối tượng (bảng, view, function...).

- Cách dùng: EXEC sp_help 'KhachHang';

- Ý nghĩa: Nó sẽ hiển thị toàn bộ cấu trúc của bảng KhachHang, bao gồm các cột, kiểu dữ liệu, chiều dài, khóa chính (PK), khóa ngoại (FK) và các ràng buộc (Constraint). Rất tiện lợi khi quên cấu trúc bảng mà không cần mở giao diện thiết kế.

2. sp_rename: Đổi tên các đối tượng (bảng, cột) một cách an toàn.

- Cách dùng: EXEC sp_rename 'KhachHang.SoDienThoai', 'SDT', 'COLUMN';

- Ý nghĩa: Đổi tên cột SoDienThoai thành SDT mà không làm mất dữ liệu bên trong.

3. sp_helptext: Xem mã nguồn (code) của các Function, Store Procedure hoặc View đã được lưu trong CSDL.

- Cách dùng: EXEC sp_helptext 'fn_TinhTienGiamGia';

- Ý nghĩa: In ra toàn bộ script T-SQL mà bạn đã viết cho function ở Phần 2.

**1. Store Procedure kiểm tra điều kiện (INSERT/UPDATE):**
<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 162951" src="https://github.com/user-attachments/assets/ad2badbf-09fd-4c18-ace0-4e43bb3f3990" />

<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 163100" src="https://github.com/user-attachments/assets/cd5ea43a-3937-419e-bb47-4b6474e4ad32" />

<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 163255" src="https://github.com/user-attachments/assets/d3675001-3f06-4131-a785-3cee859e7047" />

 **Chú thích:**  Chụp quá trình thực thi thủ tục `sp_ThemHoaDonMoi` với 2 trường hợp: sai logic (tiền âm) và đúng logic.
 Kiểm tra tính hợp lệ của dữ liệu trước khi INSERT hóa đơn. Bắt buộc tiền phải >= 0 và mã khách hàng phải tồn tại.
 Khi truyền vào `-50000`, thủ tục lập tức chặn lại và in ra câu thông báo lỗi. Khi truyền đúng `45000`, hệ thống báo "Đã thêm hóa đơn thành công!".

**2. Store Procedure sử dụng tham số OUTPUT:**

<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 163922" src="https://github.com/user-attachments/assets/94efb7f1-2c8d-4fdd-978a-10db8d976c2f" />


 **Chú thích:**  Hiển thị quá trình tạo và gọi thủ tục `sp_TinhDoanhThuTheoNgay` có chứa từ khóa `OUTPUT`.
 Tính tổng tiền doanh thu của cửa hàng trong một ngày cụ thể, sau đó gán kết quả vào một biến đầu ra (OUTPUT) thay vì chỉ in trực tiếp.
 Lệnh `SELECT` cuối cùng để in ra thành công giá trị `1725000.00` được trả về từ trong thủ tục ra biến ngoài.

**3. Store Procedure JOIN nhiều bảng trả về Result set:**

<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 164510" src="https://github.com/user-attachments/assets/f53e2a68-710e-4451-8f3b-b6941afdfe83" />

 **Chú thích:**  Hiển thị truy vấn và kết quả của thủ tục `sp_LichSuAnUongCuaKhach`.
 Kết hợp (INNER JOIN) bảng Khách Hàng và bảng Hóa Đơn để xuất ra lịch sử mua hàng chi tiết dựa trên số điện thoại truyền vào.
 Dữ liệu được trích xuất thành công từ nhiều bảng khác nhau, sắp xếp lịch sử mua hàng từ mới nhất đến cũ nhất.


## Phần 4: Trigger và Xử lý logic nghiệp vụ

**1. Trigger xử lý logic nghiệp vụ thực tế:**

**Logic đặt ra:** Cửa hàng phở có chương trình thẻ thành viên. Thay vì nhân viên thu ngân phải tự nhẩm tính và cộng điểm bằng tay, ta sẽ tạo một Trigger trên bảng [HoaDon] (Bảng A). Mỗi khi có một hóa đơn mới được INSERT, Trigger sẽ tự động lấy tổng tiền, chia cho 10.000đ (tương đương 1 điểm) và cộng dồn vào [DiemTichLuy] của khách hàng tương ứng trong bảng [KhachHang] (Bảng B).

<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 170220" src="https://github.com/user-attachments/assets/895dea6b-5602-43aa-b9bf-82601f87a5a3" />

<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 170242" src="https://github.com/user-attachments/assets/98476723-6b37-4c4e-840a-39e0a749f695" />

 **Chú thích:** Hình ảnh mô tả quá trình hoạt động của Trigger tự động cộng điểm tích lũy.
Bắt sự kiện `AFTER INSERT` trên bảng Hóa Đơn. Mỗi khi hóa đơn mới được thêm, Trigger ngầm chia tiền cho 10.000 để quy ra điểm và cộng thẳng vào bảng Khách Hàng.
 Sau khi INSERT hóa đơn 50.000đ, lệnh SELECT kiểm tra lại cho thấy điểm của khách hàng Nguyễn Văn A đã tự động tăng từ 120 lên 125.

**2. Thử nghiệm Cyclic Trigger (Vòng lặp đệ quy):**

<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 170743" src="https://github.com/user-attachments/assets/231647f7-44c6-492a-a627-a68d209b91b5" />

 **Chú thích:** Hình ảnh chụp lại thông báo lỗi màu đỏ của SQL Server khi hệ thống gặp Trigger vòng lặp.
Lệnh UPDATE cố tình tạo ra đệ quy: Bảng A cập nhật gọi Bảng B, Bảng B lại có Trigger cập nhật ngược lại Bảng A.
SQL Server báo lỗi `Msg 217 (Maximum stored procedure, trigger nesting level exceeded limit 32)`. Hệ thống đã chủ động ngắt tiến trình ở chu kỳ thứ 32 để bảo vệ RAM/CPU khỏi vòng lặp vô hạn. Chứng minh rằng tuyệt đối không nên thiết kế Trigger chéo nhau.


## Phần 5: Cursor và Duyệt dữ liệu

**Logic đặt ra:** Cuối năm, Cửa hàng phở Thái Nguyên có chương trình tri ân khách hàng. Quản lý yêu cầu duyệt qua toàn bộ danh sách khách hàng. 
Nếu DiemTichLuy > 100 thì xếp loại 'VIP', nếu từ 50 đến 100 thì xếp loại 'Thân thiết', còn lại là 'Thường'.

**1. Sử dụng CURSOR để giải quyết bài toán:**

<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 172228" src="https://github.com/user-attachments/assets/6db10877-90f7-4163-91ba-c7ff6b11aa46" />

 **Chú thích:** Thể hiện mã lệnh sử dụng vòng lặp CURSOR để duyệt và xếp loại khách hàng kèm theo thời gian thực thi (Execution Times).
Lấy từng dòng trong bảng Khách Hàng ra, dùng lệnh IF/ELSE kiểm tra điểm, sau đó thực hiện lệnh UPDATE riêng lẻ cho từng dòng đó.
Ở tab Messages xuất hiện rất nhiều khối thống kê thời gian. Điều này chứng minh Cursor đang hoạt động theo bản chất quét từng dòng (Row-by-row), làm tốn nhiều tài nguyên bộ nhớ để mở/đóng kết nối liên tục.

**2. Giải quyết không dùng CURSOR (SET-BASED) & So sánh:**

<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 173153" src="https://github.com/user-attachments/assets/36efff82-07cc-4825-a06c-06a030b54e19" />

 **Chú thích:** Thể hiện truy vấn giải quyết cùng bài toán trên nhưng dùng câu lệnh `UPDATE` kết hợp `CASE WHEN`.
Cập nhật toàn bộ bảng dưới dạng một tập hợp (Set-based) trong một thao tác duy nhất mà không cần vòng lặp.
Tab Messages chỉ in ra **đúng 1 khối thời gian thực thi** (với CPU time = 0ms). Kết luận: Xử lý Set-based trong SQL luôn tối ưu và nhanh hơn rất nhiều so với dùng CURSOR.

**3. Khi nào BẮT BUỘC phải dùng CURSOR?**

**Logic đặt ra:** Cửa hàng phở muốn tích hợp một hệ thống gửi tin nhắn SMS/Zalo chăm sóc khách hàng. Yêu cầu là: Duyệt qua toàn bộ danh sách khách hàng, lấy số điện thoại và tên của họ truyền vào một thủ tục có sẵn tên là sp_GuiTinNhanZalo.

<img width="1920" height="1080" alt="Ảnh chụp màn hình 2026-04-23 173804" src="https://github.com/user-attachments/assets/c08163b3-df1e-4773-8f24-5d25686b0c49" />

 **Chú thích:** Hình ảnh mô phỏng một cú pháp sẽ không hợp lệ trong T-SQL thông thường.
SQL Server ném ra lỗi Cú pháp (Incorrect syntax). Ta không thể gọi lệnh `EXEC` bên trong một câu lệnh `SELECT`. Đây chính là lúc **bắt buộc phải dùng CURSOR** để bóc tách từng dữ liệu ra một biến độc lập rồi mới truyền vào Store Procedure được.
