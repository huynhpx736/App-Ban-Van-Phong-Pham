USE [master]
GO
/****** Object:  Database [quanlybanhang]    Script Date: 6/25/2023 8:13:08 PM ******/
CREATE DATABASE [quanlybanhang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quanlybanhang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\quanlybanhang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quanlybanhang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\quanlybanhang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [quanlybanhang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quanlybanhang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quanlybanhang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quanlybanhang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quanlybanhang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quanlybanhang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quanlybanhang] SET ARITHABORT OFF 
GO
ALTER DATABASE [quanlybanhang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quanlybanhang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quanlybanhang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quanlybanhang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quanlybanhang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quanlybanhang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quanlybanhang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quanlybanhang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quanlybanhang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quanlybanhang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quanlybanhang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quanlybanhang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quanlybanhang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quanlybanhang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quanlybanhang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quanlybanhang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quanlybanhang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quanlybanhang] SET RECOVERY FULL 
GO
ALTER DATABASE [quanlybanhang] SET  MULTI_USER 
GO
ALTER DATABASE [quanlybanhang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quanlybanhang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quanlybanhang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quanlybanhang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quanlybanhang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quanlybanhang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'quanlybanhang', N'ON'
GO
ALTER DATABASE [quanlybanhang] SET QUERY_STORE = OFF
GO
USE [quanlybanhang]
GO
/****** Object:  User [xuanhuynh]    Script Date: 6/25/2023 8:13:08 PM ******/
CREATE USER [xuanhuynh] FOR LOGIN [xuanhuynh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [xh]    Script Date: 6/25/2023 8:13:08 PM ******/
CREATE USER [xh] FOR LOGIN [xh] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [xuanhuynh]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [xuanhuynh]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [xuanhuynh]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [xuanhuynh]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [xuanhuynh]
GO
ALTER ROLE [db_datareader] ADD MEMBER [xuanhuynh]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [xuanhuynh]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [xuanhuynh]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [xuanhuynh]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 6/25/2023 8:13:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaHang] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [decimal](9, 3) NOT NULL,
	[GiamGia] [float] NULL,
	[ThanhTien] [decimal](9, 3) NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietQuyenHan]    Script Date: 6/25/2023 8:13:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietQuyenHan](
	[MaChiTietQH] [nvarchar](50) NOT NULL,
	[MaQuyenHan] [nvarchar](50) NULL,
	[ChucNang] [nvarchar](100) NULL,
	[ChoPhep] [bit] NULL,
 CONSTRAINT [PK_ChiTietQuyenHan] PRIMARY KEY CLUSTERED 
(
	[MaChiTietQH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 6/25/2023 8:13:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[MaKH] [nvarchar](50) NULL,
	[NgayTao] [smalldatetime] NULL,
	[GhiChu] [nvarchar](255) NULL,
	[GiamGia] [float] NULL,
	[TienCongThem] [decimal](9, 3) NULL,
 CONSTRAINT [PK_HoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 6/25/2023 8:13:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](50) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[MaNhomKh] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](3) NULL,
 CONSTRAINT [PK_KhachHang_1] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatHang]    Script Date: 6/25/2023 8:13:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatHang](
	[MaHang] [nvarchar](50) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
	[GiaNhap] [decimal](9, 1) NULL,
	[GiaBanLe] [decimal](9, 1) NULL,
	[DonViTinh] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](100) NULL,
	[Anh] [nvarchar](255) NULL,
	[NgayKhoiTao] [date] NULL,
 CONSTRAINT [PK_MatHang] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/25/2023 8:13:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [nvarchar](50) NOT NULL,
	[TenNhanVien] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[NgayLamViec] [date] NULL,
	[LuongCoBan] [decimal](18, 3) NULL,
	[PhuCap] [decimal](18, 3) NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomKH]    Script Date: 6/25/2023 8:13:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomKH](
	[MaNhomKH] [nvarchar](50) NOT NULL,
	[TenNhomkh] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](255) NULL,
 CONSTRAINT [PK_NhomKH] PRIMARY KEY CLUSTERED 
(
	[MaNhomKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 6/25/2023 8:13:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaNhanVien] [nvarchar](50) NOT NULL,
	[MaQuyenHan] [nvarchar](50) NOT NULL,
	[HoatDong] [bit] NULL,
 CONSTRAINT [PK_PhanQuyen_1] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenHan]    Script Date: 6/25/2023 8:13:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenHan](
	[MaQuyenHan] [nvarchar](50) NOT NULL,
	[TenQuyenHan] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyenHan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'07KPTQ/0000001', N'SP001', 1, CAST(23000.000 AS Decimal(9, 3)), NULL, CAST(23000.000 AS Decimal(9, 3)))
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'07KPTQ/0000002', N'SP003', 2, CAST(24000.000 AS Decimal(9, 3)), NULL, CAST(48000.000 AS Decimal(9, 3)))
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'07KPTQ/0000003', N'SP003', 1, CAST(24000.000 AS Decimal(9, 3)), NULL, CAST(24000.000 AS Decimal(9, 3)))
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'07KPTQ/0000004', N'SP002', 1, CAST(80000.000 AS Decimal(9, 3)), NULL, CAST(80000.000 AS Decimal(9, 3)))
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'07KPTQ/0000005', N'SP004', 2, CAST(4500.000 AS Decimal(9, 3)), NULL, CAST(9000.000 AS Decimal(9, 3)))
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'07KPTQ/0000006', N'SP001', 2, CAST(3000.000 AS Decimal(9, 3)), NULL, CAST(6000.000 AS Decimal(9, 3)))
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'07KPTQ/0000006', N'SP005', 1, CAST(12000.000 AS Decimal(9, 3)), NULL, CAST(12000.000 AS Decimal(9, 3)))
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'07KPTQ/0000007', N'SP001', 1, CAST(3000.000 AS Decimal(9, 3)), NULL, CAST(3000.000 AS Decimal(9, 3)))
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaHang], [SoLuong], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'07KPTQ/0000007', N'SP005', 2, CAST(12000.000 AS Decimal(9, 3)), NULL, CAST(24000.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'0.23888938617168343', N'QUANLY', N'thêm', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'0.8123129050050137', N'QUANLY', N'nhập file', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'0.8277671630984618', N'NHANVIEN', N'thêm', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'0.9708548023719465', N'NHANVIEN', N'quản lý nhân viên', 0)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'1.543489257307682', N'NHANVIEN', N'sửa', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'1.7790180803003341', N'QUANLY', N'xuất file', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'2.281803868678743', N'QUANLY', N'xóa', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'2.537418116275595', N'NHANVIEN', N'bán hàng', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'2.7088534912034987', N'NHANVIEN', N'nhập file', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'3.2244212705870314', N'QUANLY', N'bán hàng', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'3.2438435312266742', N'QUANLY', N'sửa', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'6.1325031902630425', N'NHANVIEN', N'xuất file', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'7.038574866770175', N'NHANVIEN', N'xóa', 0)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'7.618401679855977', N'QUANLY', N'quản lý nhân viên', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'ct001', N'admin', N'bán hàng', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'ct002', N'admin', N'xóa', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'ct003', N'admin', N'nhập file', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'ct004', N'admin', N'xuất file', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'ct005', N'admin', N'quản lý nhân viên', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'ct006', N'admin', N'sửa', 1)
INSERT [dbo].[ChiTietQuyenHan] ([MaChiTietQH], [MaQuyenHan], [ChucNang], [ChoPhep]) VALUES (N'ct007', N'admin', N'thêm', 1)
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayTao], [GhiChu], [GiamGia], [TienCongThem]) VALUES (N'07KPTQ/0000001', N'NV01', N'KH002', CAST(N'2023-03-08T06:37:00' AS SmallDateTime), N'', 0, CAST(0.000 AS Decimal(9, 3)))
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayTao], [GhiChu], [GiamGia], [TienCongThem]) VALUES (N'07KPTQ/0000002', N'admin', N'KH001', CAST(N'2023-03-08T06:38:00' AS SmallDateTime), N'', 0, CAST(0.000 AS Decimal(9, 3)))
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayTao], [GhiChu], [GiamGia], [TienCongThem]) VALUES (N'07KPTQ/0000003', N'NV01', N'KH001', CAST(N'2023-03-09T10:04:00' AS SmallDateTime), N'', 0, CAST(0.000 AS Decimal(9, 3)))
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayTao], [GhiChu], [GiamGia], [TienCongThem]) VALUES (N'07KPTQ/0000004', N'NV01', N'KH004', CAST(N'2023-03-09T10:06:00' AS SmallDateTime), N'', 0, CAST(0.000 AS Decimal(9, 3)))
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayTao], [GhiChu], [GiamGia], [TienCongThem]) VALUES (N'07KPTQ/0000005', N'NV02', N'KH003', CAST(N'2023-03-09T10:13:00' AS SmallDateTime), N'', 0, CAST(0.000 AS Decimal(9, 3)))
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayTao], [GhiChu], [GiamGia], [TienCongThem]) VALUES (N'07KPTQ/0000006', N'admin', NULL, CAST(N'2023-03-09T10:20:00' AS SmallDateTime), N'', 0, CAST(0.000 AS Decimal(9, 3)))
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayTao], [GhiChu], [GiamGia], [TienCongThem]) VALUES (N'07KPTQ/0000007', N'NV02', N'KH005', CAST(N'2023-03-10T01:56:00' AS SmallDateTime), N'', 0, CAST(0.000 AS Decimal(9, 3)))
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [MaNhomKh], [GioiTinh]) VALUES (N'KH001', N'Mai Thanh Hải', N'Quận 9, HCM', N'0702365263', N'NKH01', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [MaNhomKh], [GioiTinh]) VALUES (N'KH002', N'Hồ Thành Lợi', N'Thủ Đức, HCM', N'0369490351', N'NKH02', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [MaNhomKh], [GioiTinh]) VALUES (N'KH003', N'Trần Đình Trọng', N'Quận 9, HCM', N'0875645868', N'NKH01', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [MaNhomKh], [GioiTinh]) VALUES (N'KH004', N'Dương Hoa', N'Quận 1, HCM', N'0702385653', N'NKH04', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [MaNhomKh], [GioiTinh]) VALUES (N'KH005', N'Hồ Đức Nguyên', N'Quận 9, HCM', N'0863623568', N'NKH03', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [MaNhomKh], [GioiTinh]) VALUES (N'KH006', N'Hoang Thiên', N'Quận 2, HCM', N'0958415638', N'NKH02', NULL)
GO
INSERT [dbo].[MatHang] ([MaHang], [TenHang], [GiaNhap], [GiaBanLe], [DonViTinh], [GhiChu], [Anh], [NgayKhoiTao]) VALUES (N'SP001', N'Bút bi', CAST(2000.0 AS Decimal(9, 1)), CAST(3000.0 AS Decimal(9, 1)), N'cây', N'', N'mine\AK_T6681.JPG', CAST(N'2023-03-04' AS Date))
INSERT [dbo].[MatHang] ([MaHang], [TenHang], [GiaNhap], [GiaBanLe], [DonViTinh], [GhiChu], [Anh], [NgayKhoiTao]) VALUES (N'SP002', N'Khay đựng hồ sơ', CAST(75000.0 AS Decimal(9, 1)), CAST(80000.0 AS Decimal(9, 1)), N'cái', N'', N'Imager_products\z2483337491080_fb14e66db6bd6a073ad59fa9559969dc.jpg', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[MatHang] ([MaHang], [TenHang], [GiaNhap], [GiaBanLe], [DonViTinh], [GhiChu], [Anh], [NgayKhoiTao]) VALUES (N'SP003', N'Sổ tay mini', CAST(2000.0 AS Decimal(9, 1)), CAST(24000.0 AS Decimal(9, 1)), N'quyển', N'', N'', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[MatHang] ([MaHang], [TenHang], [GiaNhap], [GiaBanLe], [DonViTinh], [GhiChu], [Anh], [NgayKhoiTao]) VALUES (N'SP004', N'Thước kẻ WinQ 30cm', CAST(4000.0 AS Decimal(9, 1)), CAST(4500.0 AS Decimal(9, 1)), N'cây', N'', N'Imager_products\Thước-kẻ-WinQ-30cm.jpg', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[MatHang] ([MaHang], [TenHang], [GiaNhap], [GiaBanLe], [DonViTinh], [GhiChu], [Anh], [NgayKhoiTao]) VALUES (N'SP005', N'Bút xóa cây', CAST(10000.0 AS Decimal(9, 1)), CAST(12000.0 AS Decimal(9, 1)), N'cây', N'', N'Imager_products\Bút-xoá-cây-TL-CP05.jpg', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[MatHang] ([MaHang], [TenHang], [GiaNhap], [GiaBanLe], [DonViTinh], [GhiChu], [Anh], [NgayKhoiTao]) VALUES (N'SP006', N'Ghim giấy inox', CAST(30000.0 AS Decimal(9, 1)), CAST(32000.0 AS Decimal(9, 1)), N'cái', N'', N'Imager_products\GHIM_GIAY_INOX_HT.png', CAST(N'2023-03-09' AS Date))
GO
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Email], [NgayLamViec], [LuongCoBan], [PhuCap], [MatKhau], [DienThoai]) VALUES (N'admin', N'Trần Văn Giàu', N'quận 9, HCM', N'vangiau92@gmail.com', NULL, CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'123', N'0395689433')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Email], [NgayLamViec], [LuongCoBan], [PhuCap], [MatKhau], [DienThoai]) VALUES (N'NV01', N'Phan Xuân Huynh', N'Quận 9, HCM', N'xuanhuynhmc@gmail.com', CAST(N'2023-01-17' AS Date), CAST(2500000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'12345', N'0865070736')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Email], [NgayLamViec], [LuongCoBan], [PhuCap], [MatKhau], [DienThoai]) VALUES (N'NV02', N'Trần Ngọc Khánh Văn', N'Quận 9, HCM', N'khanhvan@gmail.com', CAST(N'2023-01-14' AS Date), CAST(2000000.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'123', N'0702363863')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Email], [NgayLamViec], [LuongCoBan], [PhuCap], [MatKhau], [DienThoai]) VALUES (N'NV03', N'Bùi Nguyễn Minh  Quân', N'Quận 1,HCM', N'quannb@gmail.com', CAST(N'2023-02-13' AS Date), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'234', N'0265345626')
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [DiaChi], [Email], [NgayLamViec], [LuongCoBan], [PhuCap], [MatKhau], [DienThoai]) VALUES (N'NV08', N'Nguyen van A', N'97 man thien, hiep phu, q9, hcm', N'khanhvanx@gmail.com', CAST(N'2023-03-10' AS Date), CAST(0.000 AS Decimal(18, 3)), CAST(0.000 AS Decimal(18, 3)), N'123', N'0123456789')
GO
INSERT [dbo].[NhomKH] ([MaNhomKH], [TenNhomkh], [GhiChu]) VALUES (N'NKH01', N'Sinh viên', N'')
INSERT [dbo].[NhomKH] ([MaNhomKH], [TenNhomkh], [GhiChu]) VALUES (N'NKH02', N'Người thường', N'')
INSERT [dbo].[NhomKH] ([MaNhomKH], [TenNhomkh], [GhiChu]) VALUES (N'NKH03', N'Khách hàng có phiếu ưu đãi', N'')
INSERT [dbo].[NhomKH] ([MaNhomKH], [TenNhomkh], [GhiChu]) VALUES (N'NKH04', N'Doanh nghiệp', N'')
GO
INSERT [dbo].[PhanQuyen] ([MaNhanVien], [MaQuyenHan], [HoatDong]) VALUES (N'admin', N'admin', 1)
INSERT [dbo].[PhanQuyen] ([MaNhanVien], [MaQuyenHan], [HoatDong]) VALUES (N'NV01', N'QUANLY', 1)
INSERT [dbo].[PhanQuyen] ([MaNhanVien], [MaQuyenHan], [HoatDong]) VALUES (N'NV02', N'NHANVIEN', 1)
INSERT [dbo].[PhanQuyen] ([MaNhanVien], [MaQuyenHan], [HoatDong]) VALUES (N'NV03', N'NHANVIEN', 0)
INSERT [dbo].[PhanQuyen] ([MaNhanVien], [MaQuyenHan], [HoatDong]) VALUES (N'NV08', N'QUANLY', 1)
GO
INSERT [dbo].[QuyenHan] ([MaQuyenHan], [TenQuyenHan]) VALUES (N'admin', N'admin')
INSERT [dbo].[QuyenHan] ([MaQuyenHan], [TenQuyenHan]) VALUES (N'NHANVIEN', N'Nhân viên bán hàng')
INSERT [dbo].[QuyenHan] ([MaQuyenHan], [TenQuyenHan]) VALUES (N'QUANLY', N'Nhân viên quản lý')
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDonBan] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDonBan] ([MaHD])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDonBan]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_MatHang] FOREIGN KEY([MaHang])
REFERENCES [dbo].[MatHang] ([MaHang])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_MatHang]
GO
ALTER TABLE [dbo].[ChiTietQuyenHan]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietQuyenHan_QuyenHan] FOREIGN KEY([MaQuyenHan])
REFERENCES [dbo].[QuyenHan] ([MaQuyenHan])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ChiTietQuyenHan] CHECK CONSTRAINT [FK_ChiTietQuyenHan_QuyenHan]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBan_KhachHang1] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDonBan_KhachHang1]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBan_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDonBan_NhanVien]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_NhomKH] FOREIGN KEY([MaNhomKh])
REFERENCES [dbo].[NhomKH] ([MaNhomKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_NhomKH]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_ChoPhep_QuyenHan] FOREIGN KEY([MaQuyenHan])
REFERENCES [dbo].[QuyenHan] ([MaQuyenHan])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_ChoPhep_QuyenHan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_NhanVien]
GO
USE [master]
GO
ALTER DATABASE [quanlybanhang] SET  READ_WRITE 
GO
