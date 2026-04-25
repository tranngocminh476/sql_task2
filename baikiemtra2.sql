--  Tạo Database
CREATE DATABASE [QuanLyCuaHangPho_K235480106050];
GO

USE [QuanLyCuaHangPho_K235480106050];
GO
-- Tạo bảng [DanhMucMonAn]
CREATE TABLE [DanhMucMonAn] (
    [MonAnId] INT IDENTITY(1,1) PRIMARY KEY, -- PK: Khóa chính, tự động tăng
    [TenMonAn] NVARCHAR(100) NOT NULL,       -- Chuỗi Unicode
    [GiaTien] MONEY NOT NULL,                -- Kiểu tiền tệ
    [LoaiMonAn] NVARCHAR(50),
    CONSTRAINT [CK_GiaTien_Duong] CHECK ([GiaTien] > 0) -- CK: Ràng buộc giá tiền phải lớn hơn 0
);

--  Tạo bảng [KhachHang]
CREATE TABLE [KhachHang] (
    [KhachHangId] INT IDENTITY(1,1) PRIMARY KEY, -- PK: Khóa chính
    [HoTen] NVARCHAR(100) NOT NULL,
    [SoDienThoai] VARCHAR(15),
    [NgayDangKy] DATE DEFAULT GETDATE(),         -- Kiểu ngày tháng
    [DiemTichLuy] INT DEFAULT 0,
    CONSTRAINT [CK_DiemTichLuy_KhongAm] CHECK ([DiemTichLuy] >= 0) -- CK: Điểm tích lũy không được âm
);

--  Tạo bảng [HoaDon]
CREATE TABLE [HoaDon] (
    [HoaDonId] INT IDENTITY(1,1) PRIMARY KEY, -- PK: Khóa chính
    [KhachHangId] INT,                        -- FK: Khóa ngoại liên kết với bảng KhachHang
    [NgayLap] DATETIME DEFAULT GETDATE(),
    [TongTien] MONEY DEFAULT 0,
    [TrangThaiThanhToan] BIT DEFAULT 1,       -- Kiểu logic (0: Chưa thanh toán, 1: Đã thanh toán)
    CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY ([KhachHangId]) 
        REFERENCES [KhachHang]([KhachHangId]) -- Thiết lập FK
);




--  DỮ LIỆU TEST
INSERT INTO [KhachHang] ([HoTen], [SoDienThoai], [DiemTichLuy]) 
VALUES (N'Nguyễn Văn A', '0911111111', 120), 
       (N'Trần Thị B', '0922222222', 60), 
       (N'Lê Văn C', '0933333333', 10);

INSERT INTO [DanhMucMonAn] ([TenMonAn], [GiaTien], [LoaiMonAn]) 
VALUES (N'Phở Bò Tái', 40000, N'Món nước'), 
       (N'Phở Gà Đùi', 50000, N'Món nước'), 
       (N'Phở Đặc Biệt', 70000, N'Món nước');


INSERT INTO [HoaDon] ([KhachHangId], [TongTien]) VALUES (1, 150000), (1, 100000), (1, 50000), (1, 80000), (1, 90000);
INSERT INTO [HoaDon] ([KhachHangId], [TongTien]) VALUES (2, 40000), (2, 50000);
GO



-- Hàm Scalar Function
CREATE FUNCTION [fn_TinhTienGiamGia] (@DiemTichLuy INT, @TongTien MONEY)
RETURNS MONEY
AS
BEGIN
    DECLARE @GiamGia MONEY;
    IF @DiemTichLuy > 100
        SET @GiamGia = @TongTien * 0.1;
    ELSE IF @DiemTichLuy > 50
        SET @GiamGia = @TongTien * 0.05;
    ELSE
        SET @GiamGia = 0;
    RETURN @GiamGia;
END;
GO

SELECT [HoTen], [DiemTichLuy], 
       dbo.[fn_TinhTienGiamGia]([DiemTichLuy], 100000) AS [SoTienDuocGiam]
FROM [KhachHang];




-- Hàm Inline Table-Valued Function
CREATE FUNCTION [fn_LocMonAnTheoGia] (@GiaMin MONEY, @GiaMax MONEY)
RETURNS TABLE
AS
RETURN (
    SELECT [TenMonAn], [GiaTien], [LoaiMonAn]
    FROM [DanhMucMonAn]
    WHERE [GiaTien] BETWEEN @GiaMin AND @GiaMax
);
GO

SELECT * FROM dbo.[fn_LocMonAnTheoGia](30000, 60000);




-- Hàm Multi-statement Table-Valued Function
CREATE FUNCTION [fn_BaoCaoPhanLoaiKhachHang]()
RETURNS @BangKetQua TABLE (
    [TenKhachHang] NVARCHAR(100),
    [SoDonHang] INT,
    [PhanLoai] NVARCHAR(50)
)
AS
BEGIN
    INSERT INTO @BangKetQua
    SELECT k.[HoTen], COUNT(h.[HoaDonId]), 
           CASE 
               WHEN COUNT(h.[HoaDonId]) >= 5 THEN N'Thân thiết'
               WHEN COUNT(h.[HoaDonId]) BETWEEN 1 AND 4 THEN N'Tiềm năng'
               ELSE N'Mới'
           END
    FROM [KhachHang] k
    LEFT JOIN [HoaDon] h ON k.[KhachHangId] = h.[KhachHangId]
    GROUP BY k.[HoTen];
    
    RETURN;
END;
GO

SELECT * FROM dbo.[fn_BaoCaoPhanLoaiKhachHang]();




-- Store Procedure có INSERT/UPDATE
CREATE PROCEDURE [sp_ThemHoaDonMoi]
    @MaKhachHang INT,
    @TongTienHoaDon MONEY
AS
BEGIN
    
    IF @TongTienHoaDon < 0
    BEGIN
        PRINT N'Lỗi: Tổng tiền hóa đơn không thể là số âm!';
        RETURN; -- Dừng thực thi ngay lập tức
    END

    -- Kiểm tra logic 2: Khách hàng phải tồn tại
    IF NOT EXISTS (SELECT 1 FROM [KhachHang] WHERE [KhachHangId] = @MaKhachHang)
    BEGIN
        PRINT N'Lỗi: Không tìm thấy Mã khách hàng này trong hệ thống!';
        RETURN;
    END

    -- Nếu qua được các bước kiểm tra, tiến hành INSERT
    INSERT INTO [HoaDon] ([KhachHangId], [NgayLap], [TongTien], [TrangThaiThanhToan])
    VALUES (@MaKhachHang, GETDATE(), @TongTienHoaDon, 1);
    
    PRINT N'Đã thêm hóa đơn thành công!';
END;
GO

--Store Procedure có sử dụng tham số OUTPUT
CREATE PROCEDURE [sp_TinhDoanhThuTheoNgay]
    @NgayCanTinh DATE,
    @DoanhThu MONEY OUTPUT -- Khai báo tham số này dùng để trả dữ liệu ra
AS
BEGIN
    -- Tính tổng tiền các hóa đơn trong ngày được yêu cầu
    SELECT @DoanhThu = SUM([TongTien])
    FROM [HoaDon]
    WHERE CAST([NgayLap] AS DATE) = @NgayCanTinh;

    -- Nếu ngày đó không bán được gì (kết quả là NULL), thì gán bằng 0
    SET @DoanhThu = ISNULL(@DoanhThu, 0);
END;
GO

DECLARE @DoanhThuHomNay MONEY; 

EXEC [sp_TinhDoanhThuTheoNgay] @NgayCanTinh = '2026-04-23', @DoanhThu = @DoanhThuHomNay OUTPUT;

SELECT @DoanhThuHomNay AS [Tổng Doanh Thu Trong Ngày];


--Store Procedure trả về một tập kết quả (Result set) từ lệnh SELECT
CREATE PROCEDURE [sp_LichSuAnUongCuaKhach]
    @SoDienThoai VARCHAR(15) 
AS
BEGIN
    SELECT 
        k.[KhachHangId],
        k.[HoTen],
        k.[SoDienThoai],
        h.[HoaDonId],
        h.[NgayLap],
        h.[TongTien]
    FROM [KhachHang] k
    INNER JOIN [HoaDon] h ON k.[KhachHangId] = h.[KhachHangId]
    WHERE k.[SoDienThoai] = @SoDienThoai
    ORDER BY h.[NgayLap] DESC; 
END;
GO

-- Truyền số điện thoại của một khách hàng có trong DB
EXEC [sp_LichSuAnUongCuaKhach] @SoDienThoai = '0911111111';



-- Trigger tự động
CREATE TRIGGER [trg_TuDongCongDiemTichLuy]
ON [HoaDon]
AFTER INSERT
AS
BEGIN
    
    UPDATE k
    SET k.[DiemTichLuy] = k.[DiemTichLuy] + (i.[TongTien] / 10000)
    FROM [KhachHang] k
    INNER JOIN inserted i ON k.[KhachHangId] = i.[KhachHangId];
    
    PRINT N'Trigger đã kích hoạt: Tự động cộng điểm tích lũy cho khách hàng!';
END;
GO

-- 1. Xem điểm ban đầu của khách hàng số 1
SELECT [KhachHangId], [HoTen], [DiemTichLuy] FROM [KhachHang] WHERE [KhachHangId] = 1;
-- 2. Thêm một hóa đơn mới cho khách hàng số 1 trị giá 50.000đ (Sẽ được cộng 5 điểm)
INSERT INTO [HoaDon] ([KhachHangId], [TongTien], [NgayLap])
VALUES (1, 50000, GETDATE());
-- 3. Xem lại điểm, sẽ thấy điểm đã tự động tăng lên 5
SELECT [KhachHangId], [HoTen], [DiemTichLuy] FROM [KhachHang] WHERE [KhachHangId] = 1;



-- Tạo 2 bảng nháp và thêm dữ liệu mồi
CREATE TABLE [BangA] (Id INT, TrangThai NVARCHAR(50));
CREATE TABLE [BangB] (Id INT, TrangThai NVARCHAR(50));
INSERT INTO [BangA] VALUES (1, N'Bình thường');
INSERT INTO [BangB] VALUES (1, N'Bình thường');
GO
-- Trigger 1: Cập nhật A thì tự động cập nhật B
CREATE TRIGGER [trg_A_Update_B]
ON [BangA]
AFTER UPDATE
AS
BEGIN
    UPDATE [BangB] SET [TrangThai] = N'Bị A thay đổi' WHERE Id = 1;
END;
GO
-- Trigger 2: Cập nhật B thì tự động cập nhật lại A
CREATE TRIGGER [trg_B_Update_A]
ON [BangB]
AFTER UPDATE
AS
BEGIN
    UPDATE [BangA] SET [TrangThai] = N'Bị B thay đổi' WHERE Id = 1;
END;
GO
-- Chỉ cần 1 mồi lửa này sẽ làm hệ thống sụp đổ (Gây vòng lặp)
UPDATE [BangA] SET [TrangThai] = N'Bắt đầu kích hoạt vòng lặp' WHERE Id = 1;



-- script sử dụng CURSOR 
ALTER TABLE [KhachHang] ADD [LoaiKhachHang] NVARCHAR(50);
GO;

SET STATISTICS TIME ON;
GO

PRINT N'--- BẮT ĐẦU CHẠY  ---';

--  Khai báo các biến để hứng dữ liệu từng dòng
DECLARE @MaKH INT;
DECLARE @Diem INT;

-- Khai báo CURSOR
DECLARE cur_PhanLoaiKhach CURSOR FOR 
    SELECT [KhachHangId], [DiemTichLuy] FROM [KhachHang];

--  Mở CURSOR và nạp dòng đầu tiên
OPEN cur_PhanLoaiKhach;
FETCH NEXT FROM cur_PhanLoaiKhach INTO @MaKH, @Diem;

-- Vòng lặp duyệt từng dòng (@@FETCH_STATUS = 0 nghĩa là vẫn còn dữ liệu)
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Xử lý logic riêng cho bản ghi đang xét
    IF @Diem > 100
        UPDATE [KhachHang] SET [LoaiKhachHang] = N'VIP' WHERE [KhachHangId] = @MaKH;
    ELSE IF @Diem > 50
        UPDATE [KhachHang] SET [LoaiKhachHang] = N'Thân thiết' WHERE [KhachHangId] = @MaKH;
    ELSE
        UPDATE [KhachHang] SET [LoaiKhachHang] = N'Thường' WHERE [KhachHangId] = @MaKH;

    
    FETCH NEXT FROM cur_PhanLoaiKhach INTO @MaKH, @Diem;
END;


CLOSE cur_PhanLoaiKhach;
DEALLOCATE cur_PhanLoaiKhach;
GO


-- không dùng CURSOR
SET STATISTICS TIME ON;
GO
PRINT N'--- BẮT ĐẦU CHẠY BẰNG CÂU LỆNH T-SQL SET-BASED ---';

UPDATE [KhachHang]
SET [LoaiKhachHang] = CASE 
                        WHEN [DiemTichLuy] > 100 THEN N'VIP'
                        WHEN [DiemTichLuy] > 50 THEN N'Thân thiết'
                        ELSE N'Thường'
                      END;

SET STATISTICS TIME OFF;
GO

-- VD lệnh không dùng cursor
SELECT EXEC sp_GuiTinNhanZalo([SoDienThoai], [HoTen]) FROM [KhachHang];