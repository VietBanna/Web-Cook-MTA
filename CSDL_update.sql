USE [master]
GO
/****** Object:  Database [Web_Cook]    Script Date: 12/31/2020 3:25:14 PM ******/
CREATE DATABASE [Web_Cook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Web_Cook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLDEV2019\MSSQL\DATA\Web_Cook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Web_Cook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLDEV2019\MSSQL\DATA\Web_Cook_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Web_Cook] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Web_Cook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Web_Cook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Web_Cook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Web_Cook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Web_Cook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Web_Cook] SET ARITHABORT OFF 
GO
ALTER DATABASE [Web_Cook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Web_Cook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Web_Cook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Web_Cook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Web_Cook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Web_Cook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Web_Cook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Web_Cook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Web_Cook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Web_Cook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Web_Cook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Web_Cook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Web_Cook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Web_Cook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Web_Cook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Web_Cook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Web_Cook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Web_Cook] SET RECOVERY FULL 
GO
ALTER DATABASE [Web_Cook] SET  MULTI_USER 
GO
ALTER DATABASE [Web_Cook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Web_Cook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Web_Cook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Web_Cook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Web_Cook] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Web_Cook', N'ON'
GO
ALTER DATABASE [Web_Cook] SET QUERY_STORE = OFF
GO
USE [Web_Cook]
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 12/31/2020 3:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[MaPhanHoi] [bigint] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
	[ID_user] [bigint] NULL,
	[ID_congthuc] [bigint] NULL,
	[ID_blog] [bigint] NULL,
 CONSTRAINT [PK_PhanHoi] PRIMARY KEY CLUSTERED 
(
	[MaPhanHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[ID_user] [bigint] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](200) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[HinhDaiDien] [varchar](100) NULL,
	[Email] [varchar](200) NULL,
	[NgayDangky] [date] NULL,
	[Username] [char](100) NULL,
	[PassWord] [char](100) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[ID_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Review]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Review]
as
select ph.MaPhanHoi,ph.NoiDung,ph.NgayDang,ph.ID_congthuc,ph.ID_blog ,tv.HoTen,tv.HinhDaiDien from PhanHoi as ph, ThanhVien as tv
where ph.ID_user=tv.ID_user
GO
/****** Object:  Table [dbo].[TraLoi_PhanHoi]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraLoi_PhanHoi](
	[MaTraLoi] [bigint] IDENTITY(1,1) NOT NULL,
	[MaPhanHoi] [bigint] NULL,
	[TieuDe] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
	[MaThanhVien] [bigint] NULL,
	[MaNguoiDung] [int] NULL,
 CONSTRAINT [PK_TraLoi_PhanHoi] PRIMARY KEY CLUSTERED 
(
	[MaTraLoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_traloi]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[View_traloi]
as
select Answer.*, tv.HinhDaiDien, tv.HoTen from TraLoi_PhanHoi as Answer, ThanhVien as tv
where tv.ID_user = Answer.MaThanhVien
GO
/****** Object:  Table [dbo].[CongThuc]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongThuc](
	[ID_congthuc] [bigint] IDENTITY(1,1) NOT NULL,
	[TenCongThuc] [nvarchar](max) NULL,
	[AnhMinhHoa] [char](100) NULL,
	[TieuDe] [nvarchar](max) NULL,
	[DoKho] [int] NULL,
	[ThoiGianCB] [int] NULL,
	[ThoiGianNau] [int] NULL,
	[MaLoaiCongThuc] [bigint] NULL,
	[MaNguoiTao] [int] NULL,
	[NgayTao] [date] NULL,
	[MaNguoiChinhSua] [int] NULL,
	[NgayChinhSua] [date] NULL,
	[TopHot] [bit] NULL,
	[TrangThai] [bit] NULL,
	[SLPH] [int] NULL,
	[Video] [char](1000) NULL,
	[LuotXem] [bigint] NULL,
 CONSTRAINT [PK_CongThuc] PRIMARY KEY CLUSTERED 
(
	[ID_congthuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Luu_tru]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luu_tru](
	[ID_congthuc] [bigint] NULL,
	[ID_user] [bigint] NULL,
	[Ngay_luu] [datetime] NULL,
	[ID_save] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_blog] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_save] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Luu_monan]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Luu_monan]
as
select lt.ID_user,lt.ID_congthuc,ct.AnhMinhHoa,ct.TenCongThuc,lt.Ngay_luu from CongThuc ct, Luu_tru lt
where lt.ID_congthuc=ct.ID_congthuc
GO
/****** Object:  View [dbo].[Yeu_thich1]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Yeu_thich1]
as
select lt.ID_user,lt.ID_congthuc,ct.AnhMinhHoa,ct.TenCongThuc,lt.Ngay_luu from Luu_tru lt,CongThuc ct 
where lt.ID_congthuc=ct.ID_congthuc
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[MaBlog] [bigint] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](max) NULL,
	[TenBlog] [nvarchar](max) NULL,
	[AnhMinhHoa] [char](100) NULL,
	[MaNguoiTao] [int] NULL,
	[NgayTao] [date] NULL,
	[MaNguoiChinhSua] [int] NULL,
	[NgayChinhSua] [date] NULL,
	[TopHot] [bit] NULL,
	[TrangThai] [bit] NULL,
	[SLPH] [int] NULL,
	[LuotXem] [bigint] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[MaBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Yeu_thich_blog]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Yeu_thich_blog]
as
select lt.ID_user,blg.MaBlog,blg.AnhMinhHoa,blg.TenBlog, lt.Ngay_luu from Luu_tru lt, Blog blg
where  lt.ID_blog = blg.MaBlog
GO
/****** Object:  View [dbo].[Yeu_thich_mon]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Yeu_thich_mon]
as
select lt.ID_save,lt.ID_user,lt.ID_congthuc,ct.AnhMinhHoa,ct.TenCongThuc,lt.Ngay_luu from Luu_tru lt,CongThuc ct 
where lt.ID_congthuc=ct.ID_congthuc
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[Mã Footer] [bigint] IDENTITY(1,1) NOT NULL,
	[NoiDung] [ntext] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[Mã Footer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioiThieu]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioiThieu](
	[MaGioiThieu] [bigint] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](250) NULL,
	[NoiDung] [ntext] NULL,
	[AnhMinhHoa] [varchar](200) NULL,
	[NgayTao] [date] NULL,
	[NgayDang] [date] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_GioiThieu] PRIMARY KEY CLUSTERED 
(
	[MaGioiThieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiCongThuc]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiCongThuc](
	[MaLoaiCongThuc] [bigint] IDENTITY(1,1) NOT NULL,
	[TenLoaiCT] [nvarchar](200) NULL,
	[TopHot] [bit] NULL,
 CONSTRAINT [PK_LoaiCongThuc] PRIMARY KEY CLUSTERED 
(
	[MaLoaiCongThuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](200) NULL,
	[Password] [varchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [varchar](100) NULL,
	[CapDo] [char](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguyenLieu]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieu](
	[MaNguyenLieu] [bigint] IDENTITY(1,1) NOT NULL,
	[MaCongThuc] [bigint] NULL,
	[TenNguyenLieu] [nvarchar](50) NULL,
	[SoLuong] [nvarchar](50) NULL,
 CONSTRAINT [PK_NguyenLieu] PRIMARY KEY CLUSTERED 
(
	[MaNguyenLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoiDung_Blog]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiDung_Blog](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_blog] [bigint] NULL,
	[TieuDe] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[AnhMinhHoa] [varchar](100) NULL,
 CONSTRAINT [PK_NoiDung_Blog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoiDungCT]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoiDungCT](
	[MaNoiDungCT] [bigint] IDENTITY(1,1) NOT NULL,
	[MaCongThuc] [bigint] NULL,
	[NoiDung] [nvarchar](max) NULL,
	[AnhMinhHoa] [varchar](100) NULL,
 CONSTRAINT [PK_NoiDungCT] PRIMARY KEY CLUSTERED 
(
	[MaNoiDungCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[MaSlider] [bigint] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](100) NULL,
	[NoiDung] [ntext] NULL,
	[AnhMinhHoa] [char](100) NULL,
	[TrangThai] [bit] NULL,
	[Class] [char](100) NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[MaSlider] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TruyCap]    Script Date: 12/31/2020 3:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruyCap](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [date] NULL,
	[SoTruyCap] [int] NULL,
 CONSTRAINT [PK_TruyCao] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([MaBlog], [TieuDe], [TenBlog], [AnhMinhHoa], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [LuotXem]) VALUES (1, N'Trái cây nào cũng tốt và bổ dưỡng, nên ăn loại trái cây nào là sự lựa chọn của mỗi người, tùy theo sở thích, thói quen ăn uống và tùy theo tình trạng kinh tế của từng gia đình.

Tuy nhiên, ăn sao cho đúng cách thì không phải ai cũng chú ý đến. Thực tế cho thấy, rất nhiều người đã hoặc đang mắc sai lầm khi ăn trái cây, tham khảo ngay bài biết dưới đây để thay đổi thói quen ăn uống cho kịp thời nhé!', N'Ăn Trái Cây Lúc Nào Là Tốt Nhất? Những Sai Lầm Khiến Bạn Càng Ăn Càng Tăng Cân Nhanh Chóng', N'antraicay3.jpg                                                                                      ', 18, CAST(N'2020-11-20' AS Date), NULL, NULL, 1, 1, 8, 15)
INSERT [dbo].[Blog] ([MaBlog], [TieuDe], [TenBlog], [AnhMinhHoa], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [LuotXem]) VALUES (12, N'Nấu cơm tưởng chừng như là một việc cực kỳ đơn giản và hầu như ai cũng đều có thể làm được. Tuy nhiên để nấu ra được một nồi cơm ngon, mềm dẻo, không bị quá khô hay quá nhão thì không hề dễ dàng. Với bí quyết và cách nấu cơm ngon này đảm bảo bạn có thể nấu được một nồi cơm dẻo mềm, giúp bữa cơm gia đình ngon lành hơn rất nhiều đó.', N'Cách Nấu Cơm: Làm Sao Để Nấu Cơm Ngon, Dẻo, Không Bị Khô Và Nhão', N'naucom1.jpg                                                                                         ', 2, CAST(N'2020-11-13' AS Date), NULL, NULL, NULL, 1, 3, 12)
INSERT [dbo].[Blog] ([MaBlog], [TieuDe], [TenBlog], [AnhMinhHoa], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [LuotXem]) VALUES (13, N'Nấm Tây Tạng là một sinh vật sống, ăn sữa tươi và sản sinh ra một loại men rất có lợi cho cơ thể.
Hiện nay có một số người cường điệu hóa tác dụng trị bệnh của Kefir, coi như thuốc trị bá bệnh. Có thể có một vài trường hợp khỏi bệnh, nhưng đó chỉ là cá biệt không được theo dõi đầy đủ, chưa thể coi như tính chất chung.', N'Những Sự Thật Mà Chị Em Cần Phải Biết Về Nấm Tây Tạng', N'namtaytang.jpg                                                                                      ', 2, CAST(N'2020-11-13' AS Date), NULL, NULL, 1, 1, 3, 11)
INSERT [dbo].[Blog] ([MaBlog], [TieuDe], [TenBlog], [AnhMinhHoa], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [LuotXem]) VALUES (14, N'Đã từ lâu, người ta biết đến yến sào như một loại cao lương mỹ vị với hàm lượng chất dinh dưỡng cực kỳ cao, rất tốt cho sức khỏe. Nhưng công đoạn sơ chế món ăn này cũng rất cầu kỳ, công phu và tốn nhiều thời gian, khiến cho không ít bà nội trợ ái ngại.', N'3 bước làm sạch lông yến sào nhanh gọn lẹ mà bạn cần phải biết', N'yensao.jpg                                                                                          ', 2, CAST(N'2020-11-13' AS Date), NULL, NULL, NULL, 1, 0, 9)
INSERT [dbo].[Blog] ([MaBlog], [TieuDe], [TenBlog], [AnhMinhHoa], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [LuotXem]) VALUES (15, N'Hầu như người tiêu dùng đều nghĩ Dứa, Thơm hay Khóm đều nói chung một loại quả có vị chua, màu vàng và nhiều mắt. Vậy ba cái tên này thực chất có giống nhau không? Hãy để Cooky giải đáp thắc mắc của bạn nhé!', N'Dứa, Thơm và Khóm có gì khác nhau không?', N'thom.jpg                                                                                            ', 2, CAST(N'2020-11-13' AS Date), NULL, NULL, NULL, 1, 0, 45)
INSERT [dbo].[Blog] ([MaBlog], [TieuDe], [TenBlog], [AnhMinhHoa], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [LuotXem]) VALUES (16, N'Nước mắm là một “thành viên” quan trọng trong bữa ăn của mỗi gia đình. Để mua được một chai nước mắm vừa ngon vừa đảm bảo chất lượng thì đòi hỏi bạn phải "bỏ túi" những bí kíp dưới đây...', N'Cách chọn nước mắm ngon', N'nuocmam.jpg                                                                                         ', 2, CAST(N'2020-11-13' AS Date), NULL, NULL, NULL, 1, 0, 10)
INSERT [dbo].[Blog] ([MaBlog], [TieuDe], [TenBlog], [AnhMinhHoa], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [LuotXem]) VALUES (17, N'Một loại đá có thể làm lạnh nhưng mãi mãi không tan tưởng chừng như chỉ có trong truyện tranh, nhưng trên thực tế, loại đá lạnh vĩnh cửu này rất thịnh hành ở các nước châu Âu và đang dần xuất hiện trên thị trường Việt Nam.', N'Đá vĩnh cửu là gì, mua đá vĩnh cửu ở đâu và loại đá không tan này có an toàn với sức khỏe người dùng?', N'davinhcuu.jpg                                                                                       ', 2, CAST(N'2020-11-13' AS Date), 18, CAST(N'2020-11-15' AS Date), 1, 1, 0, 13)
INSERT [dbo].[Blog] ([MaBlog], [TieuDe], [TenBlog], [AnhMinhHoa], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [LuotXem]) VALUES (18, N'Khi da xuất hiện thâm nám, lão hóa, nhiều nếp nhăn hay mụn, ... thì các chị em có thể áp dụng các cách làm đẹp rất hữu ích bằng rất mướp hương ngay sau đây nhé! Với đặc tính thanh mát, giải nhiệt, cả trái mướp hương và khổ qua đều có thể trở thành phương thuốc làm đẹp hữu hiệu cho phái đẹp với mức giá cực kì bình dân.', N'Mách bạn tuyệt chiêu làm đẹp da với trái mướp hương và khổ qua', N'muophuong3.jpg                                                                                      ', 2, CAST(N'2020-11-13' AS Date), NULL, NULL, NULL, 1, 0, 8)
INSERT [dbo].[Blog] ([MaBlog], [TieuDe], [TenBlog], [AnhMinhHoa], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [LuotXem]) VALUES (19, N'Cá kho được rất nhiều bà nội trợ lựa chọn là món ăn chính trong bữa ăn của gia đình mình. Bởi không chỉ giàu dinh dưỡng mà cá kho còn làm cho bữa cơm trở nên ngon miệng hơn. Nhưng làm sao để kho cá mà không bị tanh? Là câu hỏi mà các bà nội trợ đặt ra mỗi khi muốn trổ tài làm món cá kho. Sau đây chúng tôi sẽ giới thiệu với các bạn mẹo kho cá không bị tanh và thơm ngon nhé!', N'4 bước chuẩn cho các món cá kho không bị tanh', N'cakho.jpg                                                                                           ', 2, CAST(N'2020-11-13' AS Date), NULL, NULL, NULL, 1, 1, 6)
INSERT [dbo].[Blog] ([MaBlog], [TieuDe], [TenBlog], [AnhMinhHoa], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [LuotXem]) VALUES (20, N'Rau luộc là món ăn vô cùng quen thuộc với bữa ăn người Việt Nam. Tuy nhiên rau luộc thông thường không để được lâu, mau nhớt, mềm nhũn, thâm đen sau khi luộc chỉ sau khoảng 15 phút. Bài viết này sẽ chỉ cho bạn cách khắc phục tất cả những hiện tương trên chỉ bằng vài mẹo nhỏ với những nguyên liệu có sẵn trong gian bếp nhà bạn.', N'Cách Luộc Rau Củ Tươi Giòn Xanh Mướt Suốt Nhiều Giờ', N'luocrau.jpg                                                                                         ', 2, CAST(N'2020-11-13' AS Date), NULL, NULL, NULL, 1, 0, 4)
INSERT [dbo].[Blog] ([MaBlog], [TieuDe], [TenBlog], [AnhMinhHoa], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [LuotXem]) VALUES (21, N'Vịt luôn được chọn làm món ăn thường xuyên trong mâm cơm gia đình vì dễ ăn và bổ dưỡng. Tuy nhiên, ai đã từng nếm mùi đau khổ khi nhổ mãi, nhổ hoài không xong lông vịt thì mới thấy rằng món này chẳng dễ sơ chế.', N'Mẹo Làm Sạch Lông Và Khử Mùi Hôi Của Vịt Nhanh Chóng Cho Chị Em Nội Trợ', N'vit.jpg                                                                                             ', 2, CAST(N'2020-11-13' AS Date), NULL, NULL, NULL, 1, 0, 2)
INSERT [dbo].[Blog] ([MaBlog], [TieuDe], [TenBlog], [AnhMinhHoa], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [LuotXem]) VALUES (22, N'Đậu hũ chiên luôn là món ăn được yêu thích không chỉ trong những bữa cơm gia đình mà còn là món khai vị trên bàn nhậu. Để có được những miếng đậu hũ giòn rụm, beo béo không phải ai cũng có thể chiên được mà không bị dính chảo hoặc được giòn bạn cần có một bí quyết chiên. Vậy hãy lưu lại ngay cách chiên đậu hũ giòn ngon này nha.', N'Cách Chiên Đậu Hũ Ngon, Không Bị Dính Chảo Đơn Giản', N'chiendau4.jpg                                                                                       ', 18, CAST(N'2020-11-13' AS Date), NULL, NULL, 0, 1, 0, 5)
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[CongThuc] ON 

INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (3, N'Hamburger', N'r2.jpg                                                                                              ', N'Hamburger là một món ăn được rất nhiều người yêu thích, chính vì thế, hôm nay chúng tôi sẽ hướng dẫn các bạn cách làm bánh hamburger cực ngon ngay tại nhà. Cùng thử làm nhé.', 3, 15, 35, 6, 1, CAST(N'2020-10-11' AS Date), 18, CAST(N'2020-12-31' AS Date), 1, 1, 5, N'SpAsSE2X__o                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 19)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (4, N'Sò điệp nướng', N'sodiep.jpg                                                                                          ', N'Cách làm món sò điệp nướng mỡ hành béo ngậy khó cưỡng từ loại hải sản bổ dưỡng là sò điệp. Sò điệp được biết đến có vị dai ngon, vị ngọt thanh mát rất tốt cho sức khỏe và không chứa quá nhiều đạm. Sò điệp kết hợp cùng mỡ hành và đậu phộng là sự lựa chọn tuyệt vời cho những người yêu thích món ăn có vị thơm ngọt vào hương vị béo tự nhiên. Cùng Mix-MTA thực hiện món ăn này nhé.', 3, 10, 30, 5, 1, CAST(N'2020-10-23' AS Date), 18, CAST(N'2020-11-15' AS Date), 1, 1, 3, N'JWr--36O0WY                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 15)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (5, N'Sandwich', N'r5.jpg                                                                                              ', N'Sandwich trứng mayo là món ăn có cách làm rất đơn giản nhưng mùi vị lại thơm ngon và đầy đủ dinh dưỡng. Những lúc bận rộn không có nhiều thời gian thì các bạn hãy nhớ ngay đến món sandwich trứng mayo này nhé.', 3, 15, 30, 1, 1, CAST(N'2020-10-15' AS Date), 18, CAST(N'2020-12-31' AS Date), 1, 1, 3, N'ro9kT9wp8-c                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 13)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (8, N'Gà Nướng Phô Mai', N'gaphomai.jpg                                                                                        ', N'Còn gì tuyệt vời hơn khi cùng bạn bè, người thân thưởng thức món gà nướng phô mai thơm ngon, nóng hổi, béo ngậy. Tuy có nguồn gốc từ Hàn Quốc nhưng món ăn này lại khá phù hợp với khẩu vị của người Việt, nguyên liệu chế biến lại dễ tìm và cách làm rất đơn giản.', 2, 10, 30, 12, 1, CAST(N'2020-10-19' AS Date), 1, CAST(N'2020-10-22' AS Date), 1, 1, 2, N'F99ZlLba0E8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 9)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (9, N'Thịt Gà Hấp Nấm Hương', N'ghnh.jpg                                                                                            ', N'Thịt gà hấp nấm hương là một món ăn chế biến nhanh với nguyên liệu chủ đạo là gà và nấm hương. Bạn chỉ cần tẩm ướp gia vị theo cách thức trên và hấp chín là đã có một món tuyệt ngon cho bữa cơm gia đình mình.', 4, 10, 35, 12, 1, CAST(N'2020-10-19' AS Date), 18, CAST(N'2020-11-15' AS Date), 1, 1, 1, N'QgHtdhOCaJ8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 11)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (10, N'Bánh Flan Đậu Hũ Non', N'flan.jpg                                                                                            ', N'Bánh flan là món ngọt "vạn người mê", vị béo của trứng hòa cùng hương thơm của đường và cà phê, ăn hoài không ngán.', 4, 15, 30, 3, 1, CAST(N'2020-10-19' AS Date), 18, CAST(N'2020-12-31' AS Date), 1, 1, 1, N'DWr1XjGE2dg                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 1)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (11, N'Bánh kem dâu tây', N'dautay.jpg                                                                                          ', N'Dâu tây là một loại quả được rất nhiều người yêu thích bởi hình dáng và màu sắc của nó nhìn rất bắt mắt, không những vậy mà còn chứa rất nhiều vitamin, đặc biệt là các chị em phụ nữ rất ưa chuộng vì nó có công dụng làm đẹp da và ngăn ngừa lão hóa. Nếu kết hợp trong bánh kem thì sẽ ra sao nhỉ? Chắc rằng các bạn sẽ thích mê cho mà coi. Vậy thì hãy cùng chúng tôi xem cách làm bánh kem dâu tây như thế nào nhé!', 4, 10, 30, 6, 1, CAST(N'2020-10-10' AS Date), NULL, NULL, 0, 1, 0, N'PLu_wfLQECs                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 23)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (12, N'Hoa quả dầm', N'hqd.jpg                                                                                             ', N'Hoa quả dầm là một trong những món ăn vặt thường ngày được rất nhiều người yêu thích, đặc biệt là các bạn trẻ. Với hương vị thơm ngon kết hợp từ nhiều loại hoa quả khác nhau trộn đều trong một món ăn khiến người dùng bị hấp dẫn và thú vị. Đặc biệt là trong những ngày hè nóng nực được thưởng thức một ly hoa quả dầm cùng đá bào thì quá tuyệt vời.', 4, 10, 35, 7, 1, CAST(N'2020-10-10' AS Date), NULL, NULL, 0, 1, 0, N'u2tC98qpnqY                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 46)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (13, N'Macaroon', N'macaron.jpg                                                                                         ', N'Những chiếc bánh Macaron đến từ Pháp – xứ sở của tình yêu trông thật đẹp và hương vị cũng thật thơm ngon khó cưỡng. Tuy nhiên, giá thành của Macaron lại không rẻ chút nào. Cùng Mix-MTA học cách làm bánh Macaron siêu ngon mà lại tiết kiệm được một số tiền kha khá đấy nhé! Bắt đầu thôi nào!', 2, 10, 20, 2, 1, CAST(N'2020-10-10' AS Date), NULL, NULL, 0, 1, 0, N'MFyc72Bfqbs                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 64)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (14, N'Pancake', N'pcake.jpg                                                                                           ', N'Bánh Pancake hay bánh kếp là lựa chọn hoàn hảo cho bữa sáng lười biếng ngày chủ nhật! Dù là người ưa đồ ngọt hay muốn một bữa sáng mặn nóng hổi, bánh pancake đều có thể làm bạn hài lòng! Không yêu cầu nhiều kỹ thuật và nguyên liệu cầu kỳ, cách làm bánh pancake cũng chỉ trong tích tắc nên chẳng nói quá khi bánh pancake được mệnh danh là loại bánh kếp dễ làm nhất quả đất!', 3, 15, 25, 6, 1, CAST(N'2020-10-10' AS Date), 18, CAST(N'2020-12-31' AS Date), 1, 1, 1, N'U9wdoJhMPYY                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 8)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (15, N'Pasta', N'pasta.jpg                                                                                           ', N'Pasta kem nấm là một món ăn kiểu Ý đúng chất béo, thơm và cực hấp dẫn với nấm được xào chín mềm quyện sốt kem béo và bắt mắt, tất cả quyện với sợ mì dai dai trông thật kích thích.', 3, 15, 25, 11, 1, CAST(N'2020-10-10' AS Date), NULL, NULL, 0, 1, 0, N'WjiEcIYuHW0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 6)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (16, N'Bông lan', N'bonglan.jpg                                                                                         ', N'Bánh bông lan không chỉ là một món khoái khẩu của các bé mà còn kích thích dạ dày của người lớn. Các mẹ rất muốn học cách làm bánh bông lan cho con ngay tại nhà để đảm bảo an toàn vệ sinh nhưng không có lấy một dụng cụ làm bánh bông lan.', 3, 14, 25, 6, 1, CAST(N'2020-10-12' AS Date), NULL, NULL, 0, 1, 0, N'gnQYO1INOQ0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 2)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (17, N'Donut', N'donut.jpg                                                                                           ', N'Bánh donut là một loại bánh mì rán rất nổi tiếng của Mỹ, hầu hết trẻ em đều thích chiếc bánh vòng tròn thơm ngon, nhiều màu sắc này. Bánh donut có tạo hình bắt mắt, bánh vàng ươm, thơm, mềm xốp, phủ bên ngoài lớp socola nhiều màu, trang trí thêm cốm màu hay các bánh kẹo khác. Bánh donut là món bánh rất hấp dẫn, cách làm đơn giản, không cầu kỳ lại rất ngon miệng đấy nhé!', 4, 13, 30, 6, 1, CAST(N'2020-10-12' AS Date), NULL, NULL, 0, 1, 0, N'1hr9FsP2Fv0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 15)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (18, N'Nộm thịt gà', N'ga.jpg                                                                                              ', N'Nộm gà xé phay vừa giòn ngon lại dễ làm, thơm mát thích hợp để thưởng thức trong ngày hè. Cách làm nộm gà xé phay vô cùng đơn giản.', 4, 11, 35, 12, 1, CAST(N'2020-10-12' AS Date), NULL, NULL, 0, 1, 0, N'Sbr9nTrbW_M                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 16)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (19, N'Chocolate-tart', N'cclt.jpg                                                                                            ', N'Chuyên mục dành riêng cho cách làm bánh từ Chocolate, Socola tươi – món quà ngọt ngào cho các bạn nghiện hương vị Chocolate.', 3, 14, 35, 6, 1, CAST(N'2020-10-12' AS Date), NULL, NULL, 1, 1, 2, N'7TcCIcE1hr8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 81)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (20, N'Sinh tố mâm xôi', N'r3.jpg                                                                                              ', N'Bạn sẽ bất ngờ với ly sinh tố mâm xôi với lượng nước cao, chất xơ nhiều nên có thể hạn chế được mức độ đường trong máu, và đáp ứng đủ chất xơ cần thiết mỗi ngày cho bạn.', 2, 15, 30, 8, 1, CAST(N'2020-10-12' AS Date), NULL, NULL, 1, 1, 0, N'cdOTa1FLP_0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 11)
INSERT [dbo].[CongThuc] ([ID_congthuc], [TenCongThuc], [AnhMinhHoa], [TieuDe], [DoKho], [ThoiGianCB], [ThoiGianNau], [MaLoaiCongThuc], [MaNguoiTao], [NgayTao], [MaNguoiChinhSua], [NgayChinhSua], [TopHot], [TrangThai], [SLPH], [Video], [LuotXem]) VALUES (21, N'Pizza', N'pizza.jpg                                                                                           ', N'Pizza là một loại bánh đặc trưng cho ẩm thực của đất nước Ý. Có rất nhiều loại bánh pizza khác nhau tại các cửa hàng mà bạn có thể lựa chọn để mua về cho gia đình. Nhưng vào những dịp cuối tuần, tại sao bạn không thử tự tay vào bếp với cách làm pizza thơm ngon, hấp dẫn và đa dạng trong phần nguyên liệu này cho gia đình của mình thưởng thức.', 4, 15, 30, 5, 1, CAST(N'2020-10-12' AS Date), NULL, NULL, 0, 1, 0, N'Lw9figB0EMc                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ', 10)
SET IDENTITY_INSERT [dbo].[CongThuc] OFF
SET IDENTITY_INSERT [dbo].[GioiThieu] ON 

INSERT [dbo].[GioiThieu] ([MaGioiThieu], [TieuDe], [NoiDung], [AnhMinhHoa], [NgayTao], [NgayDang], [TrangThai]) VALUES (1, N'Tìm kiếm công thức dễ dàng hơn', N'Bạn có thể tìm kiếm công thức các món ăn ưa thích một cách nhanh chóng hơn với công cụ tìm kiếm của chúng tôi.', N'pexels-andrea-piacquadio-3771107.jpg', NULL, NULL, 1)
INSERT [dbo].[GioiThieu] ([MaGioiThieu], [TieuDe], [NoiDung], [AnhMinhHoa], [NgayTao], [NgayDang], [TrangThai]) VALUES (2, N'Nấu một món ngon sẽ dễ dàng hơn', N'Chúng tôi sẽ cố gắng từng ngày một với mong muốn tạo ra một sản phẩm có thể giúp cho những đầu bếp bình thường nhất nấu được một món ăn ngon nhất.

Chúng tôi chắc chắn rằng bạn sẽ cảm thấy rất vui khi được tự tay nấu cho một ai đó thưởng thức. Và cảm nhận thành quả của mình đã làm ra', N'pexels-andrea-piacquadio-3771106.jpg', NULL, NULL, 1)
INSERT [dbo].[GioiThieu] ([MaGioiThieu], [TieuDe], [NoiDung], [AnhMinhHoa], [NgayTao], [NgayDang], [TrangThai]) VALUES (3, N'Trở thành đầu bếp chuyên nghiệp', N'Một ngày nào đó bạn sẽ trở nên nổi tiếng với chính những "bí kíp" nấu ăn mà bạn đã tạo ra và chia sẻ chúng

Bạn hoàn toàn có thể trở thành một đầu bếp chuyên nghiệp.', N'pexels-august-de-richelieu-4262010.jpg', NULL, NULL, 1)
INSERT [dbo].[GioiThieu] ([MaGioiThieu], [TieuDe], [NoiDung], [AnhMinhHoa], [NgayTao], [NgayDang], [TrangThai]) VALUES (4, N'Cùng đam mê nấu nướng', N'Cùng một đam mê nấu nướng và ăn uống. Bạn có thể tìm thấy những người cùng sở thích cùng đam mê, kết nối & và chia sẻ kinh nghiệm cho nhau. Mong muốn có thể tạo được một sân chơi thật sự cho người đam mê ẩm thực, đam mê nấu nướng', N'pexels-august-de-richelieu-4259140.jpg', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[GioiThieu] OFF
SET IDENTITY_INSERT [dbo].[LoaiCongThuc] ON 

INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (1, N'Ăn sáng', 0)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (2, N'Ăn vặt', 0)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (3, N'Khai vị', 0)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (4, N'Món chay', 0)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (5, N'Món chính', 0)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (6, N'Bánh', 0)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (7, N'Tốt cho sức khỏe', 0)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (8, N'Thức uống', 0)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (9, N'Salad', 0)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (10, N'Nước chấm', 0)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (11, N'Pasta-Spaghetti', 1)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (12, N'Gà', 1)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (13, N'Snacks', 0)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (14, N'Bún-Mì-Phở', 0)
INSERT [dbo].[LoaiCongThuc] ([MaLoaiCongThuc], [TenLoaiCT], [TopHot]) VALUES (15, N'Lẩu', 0)
SET IDENTITY_INSERT [dbo].[LoaiCongThuc] OFF
SET IDENTITY_INSERT [dbo].[Luu_tru] ON 

INSERT [dbo].[Luu_tru] ([ID_congthuc], [ID_user], [Ngay_luu], [ID_save], [ID_blog]) VALUES (10, 3, CAST(N'2020-12-28T19:22:55.927' AS DateTime), 4, NULL)
INSERT [dbo].[Luu_tru] ([ID_congthuc], [ID_user], [Ngay_luu], [ID_save], [ID_blog]) VALUES (9, 3, CAST(N'2020-12-28T19:26:32.193' AS DateTime), 5, NULL)
INSERT [dbo].[Luu_tru] ([ID_congthuc], [ID_user], [Ngay_luu], [ID_save], [ID_blog]) VALUES (19, 3, CAST(N'2020-12-28T19:43:57.473' AS DateTime), 8, NULL)
INSERT [dbo].[Luu_tru] ([ID_congthuc], [ID_user], [Ngay_luu], [ID_save], [ID_blog]) VALUES (14, 5, CAST(N'2020-12-28T20:20:51.587' AS DateTime), 9, NULL)
INSERT [dbo].[Luu_tru] ([ID_congthuc], [ID_user], [Ngay_luu], [ID_save], [ID_blog]) VALUES (17, 5, CAST(N'2020-12-28T21:56:39.237' AS DateTime), 10, NULL)
INSERT [dbo].[Luu_tru] ([ID_congthuc], [ID_user], [Ngay_luu], [ID_save], [ID_blog]) VALUES (8, 3, CAST(N'2020-12-28T22:32:01.430' AS DateTime), 11, NULL)
INSERT [dbo].[Luu_tru] ([ID_congthuc], [ID_user], [Ngay_luu], [ID_save], [ID_blog]) VALUES (NULL, 5, CAST(N'2020-12-29T10:51:43.007' AS DateTime), 15, 1)
INSERT [dbo].[Luu_tru] ([ID_congthuc], [ID_user], [Ngay_luu], [ID_save], [ID_blog]) VALUES (NULL, 5, CAST(N'2020-12-29T10:51:54.840' AS DateTime), 16, 12)
INSERT [dbo].[Luu_tru] ([ID_congthuc], [ID_user], [Ngay_luu], [ID_save], [ID_blog]) VALUES (NULL, 5, CAST(N'2020-12-29T11:03:51.137' AS DateTime), 20, 13)
INSERT [dbo].[Luu_tru] ([ID_congthuc], [ID_user], [Ngay_luu], [ID_save], [ID_blog]) VALUES (15, 5, CAST(N'2020-12-29T11:04:42.570' AS DateTime), 21, NULL)
INSERT [dbo].[Luu_tru] ([ID_congthuc], [ID_user], [Ngay_luu], [ID_save], [ID_blog]) VALUES (18, 5, CAST(N'2020-12-29T11:05:03.037' AS DateTime), 22, NULL)
INSERT [dbo].[Luu_tru] ([ID_congthuc], [ID_user], [Ngay_luu], [ID_save], [ID_blog]) VALUES (3, 6, CAST(N'2020-12-29T21:14:44.027' AS DateTime), 23, NULL)
SET IDENTITY_INSERT [dbo].[Luu_tru] OFF
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([UserID], [UserName], [Password], [HoTen], [Email], [CapDo]) VALUES (2, N'DangViet', N'12345', N'Bùi Đăng Việt', N'bdv1999@gmail.com', N'Editor                                                                                              ')
INSERT [dbo].[NguoiDung] ([UserID], [UserName], [Password], [HoTen], [Email], [CapDo]) VALUES (3, N'Tutu', N'1234', N'Phạm Công Tú', N'tupc99@gmail.com', N'Editor                                                                                              ')
INSERT [dbo].[NguoiDung] ([UserID], [UserName], [Password], [HoTen], [Email], [CapDo]) VALUES (14, N'ThanhCong', N'12345', N'Nguyễn Thành Công', N'congnt199@gmail.com', N'Editor                                                                                              ')
INSERT [dbo].[NguoiDung] ([UserID], [UserName], [Password], [HoTen], [Email], [CapDo]) VALUES (15, N'PhieuLe', N'12345', N'Lê Văn Phiêu', N'phieulv2010@gmail.com', N'Editor                                                                                              ')
INSERT [dbo].[NguoiDung] ([UserID], [UserName], [Password], [HoTen], [Email], [CapDo]) VALUES (18, N'NamQuach', N'123456', N'Quách Phương Nam', N'namvgt75@gmail.com', N'Admin                                                                                               ')
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
SET IDENTITY_INSERT [dbo].[NguyenLieu] ON 

INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (1, 3, N'Bột làm bánh mì', N'200g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (2, 3, N'sữa tươi không đường', N'150g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (3, 3, N'đường bột', N'60g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (5, 3, N'bột nở', N'1/2 thìa cafe')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (6, 3, N'đường nâu', N'100g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (7, 3, N'hạnh nhân rang chín', N'5g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (11, 8, N'ức gà', N'900g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (13, 9, N'thịt gà', N'500g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (14, 9, N'nấm hương', N'5 củ')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (15, 9, N'rượu trắng', N'15ml')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (16, 9, N'dầu ăn', N'8ml')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (17, 9, N'nước', N'30ml')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (18, 9, N'hành lá', N'1 nhánh')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (19, 9, N'đường trắng', N'5g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (20, 9, N'bột bắp', N'20g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (21, 10, N'trứng gà', N'3 quả')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (22, 10, N'đậu hũ non', N'200g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (23, 10, N'đường trắng', N'200g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (24, 10, N'sữa tươi', N'200ml')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (25, 10, N'vani', N'1 muỗng cafe')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (26, 8, N'muối', N'1 thìa cafe')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (27, 8, N'hành', N'3 nhánh')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (28, 8, N'tỏi', N'3 củ')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (29, 8, N'gừng băm nhỏ', N'10g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (30, 8, N'nước', N'60ml')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (31, 11, N'dâu tây', N'500g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (32, 11, NULL, NULL)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (33, 11, NULL, NULL)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (34, 11, N'đường', N'150g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (35, 11, N'Socola đen, trắng', NULL)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (36, 11, N'bánh bông lan', N'1 ổ')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (37, 11, N'kem phô mai', N'150g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (38, 11, N'kem wipping', N'150g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (39, 11, N'sữa tươi không đường', N'1 chén')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (40, 4, N'sò điệp tươi', N'1kg')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (41, 4, N'hành tím', N'2 củ')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (42, 4, N'tỏi ', N'2 củ')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (43, 4, N'hành lá', N'250g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (44, 4, N'rau răm', N'1 bó')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (45, 4, N'đậu phộng', N'200g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (46, 5, N'trứng gà', N'4 quả')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (47, 5, N'bánh mì gối', N'4 lát')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (48, 5, N'Bắp cải, cà rốt', NULL)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (49, 5, N'Sốt mayonnaise', NULL)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (50, 5, N'Bơ', NULL)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (51, 12, N'dứa ', N'300g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (52, 12, N'dưa hấu', N'300g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (53, 12, N'xoài chín', N'300g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (54, 12, N'mít múi', N'200g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (55, 12, N'dâu tây', N'200g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (56, 12, N'lê ', N'200g')
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (57, 12, N'Bơ', NULL)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (58, 12, N'Sữa tươi không đường', NULL)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (59, 12, N'Sữa chua', NULL)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [MaCongThuc], [TenNguyenLieu], [SoLuong]) VALUES (60, 12, N'Sữa đặc, nước cốt dừa, chanh', NULL)
SET IDENTITY_INSERT [dbo].[NguyenLieu] OFF
SET IDENTITY_INSERT [dbo].[NoiDung_Blog] ON 

INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (1, 1, N'Không ăn trong bữa ăn', N'Ăn trái cây trong bữa ăn sẽ góp phần làm chậm quá trình tiêu hóa của cơ thể. Nếu bạn ăn trái cây với loại thực phẩm khác, trái cây sẽ ở lại trong cơ thể lâu hơn đồng thời gây khó tiêu.

Đường trong trái cây không nên ở lại quá lâu trong dạ dày nếu không sẽ xảy ra quá trình lên men, gây đầy hơi và trướng bụng.', N'antraicay1.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (2, 1, N' Không ăn trái cây trước và sau bữa ăn', N'Nếu ăn trái cây lập tức trước và sau bữa ăn thì đó quả là một sai lầm bởi vừa khiến cơ thể tiêu hóa không đúng cách vừa không hấp thụ được hết các chất dinh dưỡng thiết yếu.Nếu bạn ăn trái cây sau bữa ăn, trái cây sẽ dễ dàng để ngăn chặn dạ dày với thực phẩm khác sẽ dẫn đến đầy hơi, táo bón và các triệu chứng khác. Điều này có thể mang lại ảnh hưởng xấu đến chức năng tiêu hóa.Hoa quả có chứa một số lượng lớn các loại đường, glucose, fructose, sucrose, tinh bột… Do đó, ăn trái cây sau bữa ăn sẽ làm tăng gánh nặng cho dạ dày, ruột và tuyến tụy gây khó khăn cho hệ tiêu hóa.', N'antraicay2.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (3, 1, N'Không ăn trái cây trước khi đi ngủ', N'Ăn trái cây trước khi đi ngủ là thời điểm tồi tệ nhất vì làm tăng lượng đường trong máu và insulin trong cơ thể sẽ làm gián đoạn giấc ngủ của bạn vào ban đêm, giảm năng lượng khi cần thiết.Hơn nữa ăn trái cây trước khi đi ngủ làm tích tụ và dư thừa đường, đây cũng là nguyên nhân khiến cân nặng của bạn tăng không kiểm soát.', N'antraicay3.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (4, 1, N'Nên ăn trái cây vào thời điểm nào?', N'Ăn trái cây giữa các giữa các bữa ăn của bạn cũng được xem là một thói quen tốt bởi vì đó là thời điểm hệ tiêu hóa của bạn hoạt động nhanh chóng và các enzym khác nhau được tiết ra để giúp quá trình này diễn ra dễ dàng hơn.Ăn trái cây giữa các bữa ăn như một bữa ăn nhẹ cũng có thể dẫn đến giảm cân bởi vì nó có thể giúp chống lại những cơn đói, cơn thèm ăn của bạn. Nên ăn trái cây trước hoặc sau 30 phút giữa những bữa ăn để đạt hiệu quả tốt nhất.Hơn nữa, thói quen này còn giúp tiêu hóa tốt hơn, cung cấp chất dinh dưỡng cho cơ thể hiệu quả hơn với chất xơ và đường đơn dồi dào. Những loại trái cây nên ăn giữa các bữa ăn: Trái cây họ cam quýt, quả mọng, dưa hấu, dứa, lựu, táo và xoài.', N'antraicay4.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (20, 12, N'Chọn gạo ngon', N'- Đầu tiên để nấu được cơm ngon, chúng ta cần chọn mua gạo sạch, chất lượng, vào mùa và ngon. Gạo ngon đúng nghĩa là gạo mới, nên chọn gạo theo mùa không nên mua gạo đã để lâu vì như vậy chúng sẽ không còn chất dinh dưỡng, mất đi vị ngọt tự nhiên, không còn mùi thơm vốn có của gạo nữa.

- Khi chọn gạo nên chọn gạo có hạt đều, tròn và bóng.  Không nên chọn gạo bị gãy, nát và có màu vàng, đen vì đó là gạo bị hư, để lâu. Không chọn gạo có màu quá trắng hay bị bạc bụng vì rất có thể đó là gạo được tẩy trắng hoặc xát quá kĩ khiến lớp cám gạo bên ngoài bị bay mất.', N'naucom1.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (21, 12, N'Vo gạo đúng cách', N'- Sau khi đã chọn được gạo ngon, bắt đầu tiến hành vo gạo. Đây cũng là bước quan trọng để gạo khi chín được ngon.

- Cho nước vào nồi cơm đã có gạo, dùng tay nhẹ nhàng vo gạo rồi khuấy đều để cát bụi, vỏ trấu, sạn còn bám trên hạt gạo, chắc nước ra rồi chế nước sạch vào vo thêm 2 đến 3 lần nữa. Thường chúng ta sẽ vo 3 lần để gạo sạch hơn và vẫn giữ được lớp cám gạo bên ngoài. Có nhiều người hay vo gạo rất qua loa một cách nhanh chóng như vậy sẽ không giúp gạo sạch được hết chất bẩn còn sót.', N'naucom2.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (22, 12, N'Ngâm gạo trước khi nấu', N'- Chắc hẵn khi nấu cơm sẽ có rât ít người ngâm gạo rồi mới bắt nấu, một phần vì không có nhiều thời gian và cũng chưa biết đến cách này.
- Khi gạo đã vo xong, chế nước thì ngâm gạo khoảng 15 phút rồi hẵng bắt lên nấu. Như vậy cơm sẽ ngon hơn, dẻo và mềm hơn.', N'naucom6.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (23, 12, N'Nấu cơm với đá lạnh, dầu ăn hoặc sữa', N'- Gạo ngâm xong bạn cho vào vài cục đá lạnh nhỏ, để khoảng 15 phút thì bắt lên nấu bình thường. Đá lạnh sẽ giúp làm chậm quá trình hấp thu nước của gạo, nhờ vậy cơm được dẻo ngon hơn. Đồng thời, đá cũng làm tăng lượng axit amin và ngăn chặn enzym phân hủy chất ngọt trong gạo, giúp hạt cơm vẫn giữ được độ thơm và mang đến hương vị tuyệt vời hơn.
- Bạn cũng có thể nấu cơm với sữa tươi để tăng thêm hương vị cho gạo. Bạn cho sữa và nước theo tỉ lệ 3:1 tức là 3 phần nước 1 phần sữa rồi nấu như bình thường. Khi cơm chín bạn sẽ nghe được mùi thơm của sữa thoang thoảng kèm theo mùi gạo và hạt cơm ăn vào cảm giác được độ mềm dẻo rất đã. Cách này cũng giúp làm gạo cũ biến thành như gạo mới luôn đấy.', N'naucom4.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (24, 12, N'Xới cơm khi chín', N'- Ngay lúc cơm vừa chín tới, bạn mở nắp nồi, dùng đũa xới cơm thật nhẹ nhàng, để khoảng 1 phút cho bớt hơi nước rồi đậy nắp lại để thêm 10 phút nữa là được.', N'naucom5.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (25, 13, N'Nấm Tây Tạng là nấm gì?', N'Nấm sữa Tây Tạng có tên khoa học là Kefir, con nấm này hình dạng như bỏng nẻ gạo, màu vàng bơ, thơm ngậy và sinh sôi hàng ngày, nhất là mùa nóng.
Là “nấm” nhưng nó thuộc nhóm nấm men (men bánh mì, men Kombucha…) và là loại vi khuẩn ăn sữa tươi, sản sinh ra một số loại men có lợi cho cơ thể, giàu khoáng chất, vitamin nhóm B, K, acid folic, phốt pho, carbohydrat, protein, canxi, magie…

Sữa được tạo từ nấm Tây Tạng và sữa chua đều là những sản phẩm sữa lên men và chúng có chứa các vi khuẩn có lợi. Tuy nhiên sữa từ nấm Tây Tạng có chứa các vi khuẩn có lợi mà không được tìm thấy trong sữa chua như Lactobacillus Caucasus, Leuconostoc, Acetobacter species, và Streptococcus species.

Nấm Tây Tạng chứa nhiều men có lợi, chúng có thể kiểm soát và loại bỏ các vi khuẩn gây bệnh khác cho cơ thể. Chúng còn cung cấp nhiều giá trị dinh dưỡng hơn so với sữa chua bằng cách giúp tiêu hóa các thực phẩm mà bạn ăn và luôn giữ cho đường ruột luôn sạch và khỏe mạnh. Do kích thước hạt sữa của nấm Tây Tạng nhỏ hơn so với sữa chua nên nó dễ dàng tiêu hóa hơn.', N'namtaytang1.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (26, 13, N'Thực hư về chuyện nấm Tây Tạng có thể chữa bách bệnh?', N'Hiện nay có nhiều ý kiến khác nhau về loại nấm Tây Tạng (nấm Kefir) phóng đại nó như một thần dược chữa được nhiều bệnh, tuy nhiên các giáo sư tiến sĩ của ĐH Y Dược TP. Hồ Chí Mình đã khuyến cáo, nấm Kefir thực chất chỉ là loại men, chỉ hỗ trợ dinh dưỡng và hỗ trợ một số chứng bệnh nhưng vẫn chưa có công trình nghiên cứu cụ thể nào chứng minh nó có thể chữa được bệnh về tuần hoàn, gan nhiễm mỡ, mỡ trong mau hay ung thư...cả.', N'namtaytang2.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (27, 13, N'Lời khuyên khi sử dụng nấm Tây Tạng (nấm Kefir)', N'Người mới ăn và trẻ từ 1 tuổi trở lên khi ăn sữa chua từ nấm sữa Tây Tạng nên ăn ít một và phải theo dõi sát xem cơ thể dung nạp thế nào. Nếu trẻ bị đau bụng, khó chịu, đi ngoài lỏng thì dừng ăn ngay, vì rất có thể cơ thể trẻ không thích ứng với loại sữa này hoặc độ chua quá cao đã kích ứng dạ dày của trẻ.

Người lớn cũng không nên ăn quá 400ml sữa/ngày, vì độ chua cao, ăn nhiều và ăn liên tục có thể gây khó chịu, nhất là người bị viêm loét dạ dày, nhạy cảm với chất chua. Nên ăn sữa chua nấm Tây Tạng sau khi ăn cơm 30 phút. Không nên ăn khi đói, vì khi đói độ pH trong dạ dày cao, ăn vào các vi khuẩn có lợi trong sữa chua bị tiêu diệt.', N'namtaytang3.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (28, 14, N'Các loại tổ yến thường gặp và cách chọn mua', N'Yến sào là tổ của loài chim yến, được chúng xây nên bằng cách tiết ra nước dãi. Chúng thường làm tổ trên những vách đá hiểm hóc ngoài biển khơi, tránh những loài săn mồi trên không. Ở điều kiện tự nhiên, tổ yến có hình dạng như một cái chén, thân dày, chân cứng gắn chặt vào tường. Tổ yến thường được tìm thấy nhiều ở Việt Nam, Thái Lan, Malaysia và Indonesia.', N'yensao1.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (29, 14, N'Cách làm sạch tổ yến thô', N'Tổ yến thô khi mua về thường vẫn còn lẫn tạp chất chất, đặc biệt các sợi lông yến. Làm sạch tổ yến là một công đoạn quan trọng, nhưng không phải ai cũng làm đúng quy trình và đúng cách. Sơ chế tổ yến cơ bản có 3 bước:

Bước 1: Vệ sinh tạp chất ngoài bề mặt
Nhẹ nhàng chà sạch bề mặt tổ yến bằng bàn chải đánh răng, loại bỏ các bụi bẩn trên bề mặt tổ yến.
Bước 2: Làm mềm tổ yến
Dùng 1 chiếc khăn ẩm để bọc tổ yến lại, bỏ vào một cái hộp kín và bảo quản trong tủ lạnh. Tùy theo từng loại tổ yến mà thời gian ủ khăn ẩm khác nhau, bạch yến thì chỉ cần ủ từ 2-6 giờ, huyết yến ủ khoảng 20 giờ. Nhưng nhìn chung, không ủ chúng quá 24 giờ.
Bước 3: Loại bỏ lông ra khỏi sợi yến
Sau khi tổ yến đã tơi nhẹ và mềm ra, chúng ta tiến hành làm sạch những sợi lông còn sót lại trong tổ. Dùng nhíp chuyên dụng gắp lông ra khỏi tổ yến, còn những sợi lông nhỏ, chúng ta có thể cho tổ yến vào 1 cái rây lỗ nhỏ và rây nhẹ nhàng qua nước sạch nhiều lần.', N'yensao2.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (30, 14, N'Những điều cần lưu ý khi sơ chế và chế biến tổ yến', N'1. Không để tổ yến ngâm trong nước quá lâu, sẽ làm mất hết chất dinh dưỡng cũng như vị ngon tự nhiên của tổ yến
2. Không dùng yến để nấu trực tiếp các món chè, cháo, canh,...Phương pháp chế biến tổ yến tốt nhất là hấp cách thủy. Những món ăn kèm được chế biến riêng và dùng chung với tổ yến sau khi chế biến.
3. Không dùng lò vi sóng để hấp lại yến, dễ làm phá vỡ các vi chất trong yến.', N'yensao3.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (31, 15, N'Điểm chung của Dứa, Thơm và Khóm ', N'Dứa, Thơm hay Khóm là tên gọi khác nhau của một loại quả nhiệt đới với tên khoa học Ananas comosus. Loại quả này có đặc điểm nhiều mắt, thịt màu vàng, vị chua ngọt và có hàm lượng axit hữu cơ cao. Đây còn là nguồn cung cấp mangan, vitamin C và B1 dồi dào, bổ sung nhiều khoáng chất tốt cho cơ thể. ', N'thom2.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (32, 15, N'Phân biệt Dứa, Thơm và Khóm', N'Ở miền Tây và một số tỉnh miền Nam, người dân có sự phân biệt rõ ràng giữa Thơm và Khóm vì đây là hai giống cây khác nhau. Thơm và Khóm được trồng nhiều ở khu vực miền Nam nên họ dễ dàng nhận biết đặc tính riêng của chúng. Còn người miền Bắc gọi chung cả Thơm và Khóm là Dứa. ', N'thom4.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (33, 15, N'Đặc điểm riêng của Thơm', N'Các mắt của thơm thưa và giãn
Lá của thơm không có gai li ti
Trái thơm to hơn, có thể lên đến 3kg
Vị ngọt thanh xen cùng vị chua', N'thom5.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (34, 16, N'Độ đạm ', N'Hàm lượng đạm là thông tin phản ánh chất lượng của nước mắm và nó luôn luôn nằm trên bao bì của sản phẩm. Đây cũng là một mẹo nhanh chóng để bạn phân biệt nước mắm thật hay giả. Một sản phẩm có ghi rõ độ đạm trên nhãn mác chưa hẳn đã là hàng thật, nhưng 1 chai mắm mà ngay đến cả thông số này cũng không có thì chắc chắn là mắm giả hoặc của cơ sở sản xuất kém uy tín và bạn phải tuyệt đối tránh xa.

Dưới đây là thông tin về độ đạm được căn cứ theo Tiêu chuẩn Việt Nam về nước mắm (TCVN 5107:2003):
Độ đạm >30No: Loại đặc biệt.                                 Độ đạm >15No: Loại hạng1.

Độ đạm >25No: Loại thượng hạng.                        Độ đạm >10No: Loại hạng 2.

Như vậy, độ đạm càng cao thì càng quyết định chất lượng của mắm, và bạn hoàn toàn có thể “vượt qua” khâu này bằng cách đọc thật kỹ nhãn mác của nhà sản xuất.', N'nuocmam.jpg                                                                                         ')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (35, 16, N'Về màu sắc', N'Kiểm tra màu sắc của nước mắm hoàn toàn có thể nhìn bằng mắt thường và qua vỏ chai. Nếu thấy màu nước mắm từ vàng, vàng rơm, cánh gián thì có thể yên tâm. Nhưng nếu chai nước mắm có màu xanh xám của nước rau luộc thì k tốt. Muốn kiểm tra thật chuẩn màu của nước mắm, nên để chai nước mắm đối diện với nguồn sáng. Khi kiểm tra, nên lắc chai mạnh, sau đó dốc ngược, để đối diện nguồn sáng, nếu thấy có những cục lởn vởn từ đáy chai rơi xuống, nghĩa là có dấu hiệu kết tủa, tuyệt đối không dùng. Các chất kết tủa này có thể là muối và một số phụ gia khác nhà sản xuất cho thêm trong quá trình đóng gói. Nước mắm đảm bảo phải có độ trong suốt và màu sắc đặc trưng, không kèm theo bất cứ tạp chất nào.', N'nuocmam.jpg                                                                                         ')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (36, 16, N'Mùi vị', N'Nước mắm ngon là khi mở nút chai ra, có mùi thơm dịu, ngọt, bùi. Mở chai nước mắm, lấy một chiếc đũa hoặc quy sạch chấm để nếm thử. Nếu thấy ngay lập tức có vị mặn, loại nước mắm đó độ đạm kém. Ngay lập tức thấy vị chát ở đầu lưỡi, chắc chắn nước mắm đó có sử dụng phụ gia không tốt. Trong trường hợp, thấy mùi thơm đặc trưng, ngọt đậm, dịu xuống cổ họng, chắn chắn đây là nước mắm có độ đạm tốt.', N'nuocmam.jpg                                                                                         ')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (37, 17, N'Đá lạnh vĩnh cửu là gì?', N'Đá lạnh vĩnh cửu là phát minh của Dave Laituri, một nhà thiết kế Mỹ và được biết đến với nhiều tên gọi khác nhau như Cooling Cubes, Scotch Rocks hay Whiskey Stones. Ngay từ khi công bố, đá lạnh vĩnh cửu đã được đón nhận một cách nồng nhiệt rồi nhanh chóng trở nên phổ biến.
Ban đầu, loại đá này được sản xuất riêng cho dòng rượu Whisky, bởi thưởng thức loại rượu này cần một nhiệt độ phù hợp. Vì thế, đá lạnh vĩnh cửu ra đời. Sau đó, người ta không chỉ dùng đá này cho rượu, mà ứng dụng vào nhiều loại đồ uống khác nhau bởi nhiều tính năng tiện lợi của nó.', N'davinhcuu.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (38, 17, N'Đá lạnh vĩnh cửu có thực sự hữu dụng và an toàn hay không?', N'Những buổi đầu được tung ra thị trường, nhiều người vẫn còn nghi ngờ về sự hữu dụng của nó. Loại đá này có thực sự làm lạnh được không?

Câu trả lời là hoàn toàn có. Chúng có thể giữ nhiệt độ ở mức 10 độ C trong vòng 60 phút. Thức uống vẫn được làm lạnh và giữ trọn hương vị nguyên chất. Với 2 - 4 viên đá có thể làm lạnh 1 lít đồ uống trong vòng 5 phút. Như vậy, đá lạnh vĩnh cửu hoàn toàn có thể thay thế đá viên bình thường, không chỉ dùng để uống rượu Whisky mà còn dùng được trong những thức uống quen thuộc khác như cà phê, nước ép, các loại nước mát,...', N'dvc2.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (39, 17, N'Đá lạnh vĩnh cửu và đá lạnh bình thường - loại nào tốt hơn?', N'Không những mang tính thẩm mĩ cao cho các quán bar hay nhà hàng, đá lạnh vĩnh cửu còn mang rất nhiều lợi ích, ứng dụng tốt trong cuộc sống đời thường:

Làm lạnh, không làm cho thức uống bị loãng và mất đi hương vị ban đầu.
Có thể tái sử dụng đá nhiều lần mà không làm giảm chất lượng của đá.
Sạch sẽ, an toàn, đảm bảo đối với sức khỏe.
Không tạo ra hiện tượng tuyết khí khi làm lạnh đá, giúp tủ lạnh được sử dụng lâu bền hơn.', N'dvc3.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (40, 17, N'Cách sử dụng đá lạnh vĩnh cửu', N'Sử dụng đá lạnh vĩnh cửu vô cùng đơn giản. Chỉ cần làm lạnh chúng trong tủ đá trong vòng 2 tiếng trở lên là có thể sử dụng. Sau khi sử dụng, vệ sinh sạch sẽ và để vào ngăn tủ đá để sẵn sàng cho những lần sau.', N'dvc4.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (41, 17, N'Loại đá vĩnh cửu tốt nhất trên thị trường', N'Thời gian giữ lạnh của loại đá này khác nhau tùy vào thương hiệu nhưng nhìn chung, đá lạnh vĩnh cửu chính hãng làm lạnh tốt. Tại Việt Nam, chúng ta có thể tìm mua Circle Joy - một sản phẩm đá lạnh không tan của Xiaomi được làm từ thép không gỉ.', N'dvc5.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (42, 18, N'Lá mướp hương trị thâm nám', N'Ít ai biết rằng, lá mướp vốn thô ráp lại có công dụng tuyệt vời trong việc điều trị mụn trứng cá và đẩy lùi vết nám hiệu quả với tính chua mát thanh nhiệt của nó.', N'muophuong.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (43, 18, N'Nước ép mướp hương làm sáng da', N'Với tính thanh mát, giải độc hiệu quả, nước ép mướp hương có thể mang tới cho phái đẹp làn da sáng mịn như ý.', N'muophuong2.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (44, 18, N'Nước ép mướp hương làm giảm nếp nhăn', N'Đánh bay những nếp rạn chân chim nơi khóe mắt với phái đẹp tuổi 30.
Cách làm:

Sử dụng nước ép của 1 trái mướp non, thêm 2 thìa cafe sữa tươi lạnh và 1 thìa mật ong để tạo thành 1 hỗn hợp sền sệt. Đắp lên mặt trong khoảng 15 – 20 phút rồi rửa lại bằng nước mát.
Do tính khá lành của nguyên liệu, bạn có thể yên tâm thực hiện 2-3 lần/tuần mà không lo bị kích ứng da.', N'muophuong3.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (45, 18, N' Khổ qua (mướp đắng) trị mụn', N'Cũng như mướp hương, khổ qua có công dụng thanh nhiệt, giải độc và đẩy nhanh quá trình trao đổi chất của cơ thể, làm giảm mụn hiệu quả.
Cách làm:

Đầu tiên, bạn dùng nước hoa hồng lau sạch mặt để lấy đi mọi bụi bẩn và thông thoáng lỗ chân lông.
Tiếp tục thái lát mỏng khổ qua rồi đắp lên vùng da bị mụn trong khoảng 15 phút.
Chăm chỉ thực hiện 2 lần/tuần, bạn sẽ nhanh chóng thấy công dụng bất ngờ!', N'muophuong4.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (46, 19, N'Chọn cá', N'Trước tiên các bạn nên chú ý trong việc lựa chọn cá. Tùy vào số lượng ăn của gia đình bạn, bạn có thể chọn mua nguyên con hoặc mua khúc. Nếu bạn mua cả con thì nên chọn những con đang còn sống, bơi trong chậu. Nếu bạn mua khúc thì bạn hãy dùng ngón tay ấn vào thịt cá, nếu thịt rắn chắc, đàn hồi, không để lại vết ấn của ngón tay thì đó là miếng thịt tươi, ngon.', N'chonca.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (47, 19, N'Sơ chế', N'Hãy rửa cá bằng nước vo gạo hoặc bạn có thể xát muối vào cá và rửa bỏ hết máu tanh ở cá. Bạn hãy bóc hết phần màng đen ở bụng của cá và rửa lại thật sạch. Có thể cho thêm vài giọt chanh để làm mất mùi tanh của cá. Sau khi rửa sạch bạn bên để cá ráo nước, đừng cho vào nồi ngay, như vậy cũng sẽ hạn chế được mùi tanh của cá.', N'so-che-ca.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (48, 19, N'Ướp cá', N'Nguyên liệu để ướp cá bao gồm riềng, ớt, thịt ba chỉ, quả mắc mật, nước hàng, dầu ăn, hạt nêm, nước mắm... Khi bạn xếp cá vào nồi để ướp bạn nên để riềng xuống phía dưới cùng, sau đó là một lớp thịt ba chỉ, rồi đến cá, rồi đến một lớp thịt ba chỉ nữa, cuối cùng hãy rải mắc mật lên. Ớt, hạt nêm, nước mắm, dầu ăn, nước màu (nước hàng) hãy rải ở phía trên cùng. Hành bạn hãy phi thơm lên rồi ướp với các nguyên liệu trên.
Để nồi cá kho thơm ngon và chắc thịt thì bạn nên ướp cá với gia vị trong khoảng 2 tiếng đồng hồ.', N'uop-ca.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (49, 19, N'Kho cá', N'Lưu ý rằng khi cho nước vào kho cá thì không nên đổ nước lạnh, mà nên đổ nước đun sôi vào kho để cá không bị tanh. Lưu ý, trong quá trình kho không đảo hoặc trộn cá lên vì như vậy sẽ làm cá nát và mất ngon.

Khi mới đặt nồi cá kho lên bếp thì nên đun lửa thật lớn đến khi nồi cá sôi lên thì hạ lửa nhỏ đến khi cạn nước. Khi nồi cá cạn nước bạn có thể tắt bếp, gắp cá ra đĩa và thưởng thức.', N'khoca.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (50, 20, N'Quy tắc luộc rau đúng cách', N'Có 3 điểm bạn cần nhớ trước khi luộc rau:

Đợi nước sôi già: không nên cho rau vào nước lạnh hoặc nước chưa sôi già. Điều này sẽ kéo dài quá trình chín của rau làm rau củ mềm, không còn giữ được độ giòn. Luộc rau trên lửa lớn giúp giữ được dưỡng chất có trong rau củ. 
Không đậy nắp khi luộc rau: việc làm này sẽ làm hơi nước giữ lại trong nồi, rau củ nhất làm đập bắp, rau mồng tơi,... sẽ nhanh vàng hơn.
Luôn để rau ráo nước sau khi luộc: nhiều bạn có thói quen lấy rau từ nồi và cho vào đĩa trực tiếp bảo quản, phần nước từ rau đọng phía dưới làm rau mau nhớt và hỏng hơn.', N'luocrau1.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (51, 20, N'Thêm muối trắng vào nước luộc rau', N'Cho khoảng 1 muỗng cà phê muối vào nồi nước luộc rau khoảng 1 - 1.5 lít nước. Sau đó đợi nước sôi già thì cho rau vào luộc. Khi rau chín lập tức với ngay ra ngoài, tránh để rau mềm hơn.

Muối có tác đụng làm tăng độ nóng của nước luộc giúp thúc đẩy quá trình chín nhanh của rau, giúp rau xanh mướt. Bên cạnh đó, muối còn làm rau đậm vị hơn.', N'luocrau2.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (52, 20, N'Thêm giấm/ chanh vào nước luộc rau', N'Với 1 -1.5 lít nước luộc rau, bạn cho thêm 2 muỗng cà phê nước cốt chanh/ giấm (gạo, táo,...). Đợi nước sôi nhẹ, bạn cho chanh hoặc giấm vào và đợi nước sôi bùng rồi luộc rau như bình thường.

Nước cốt chanh/ giấm sẽ giúp rau có màu đậm hơn. Nhất là đối với các loại củ quả có màu cam đỏ như rốt, củ đền. Hương chanh cũng giúp rau có hương vị tươi hơn.', N'luocrau3.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (53, 20, N'Thêm dầu ăn vào nước luộc rau', N'Khi nước sôi già, hãy cho thêm 1 muỗng canh dầu ăn vào rồi hãy cho rau củ vào luộc.

Dầu ăn không những giúp rau xanh tươi lâu mà còn làm rau có độ bóng mướt mắt.', N'luocrau4.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (54, 20, N'Ngâm rau vào đá ngay sau khi luộc', N'Thông thường, khi vớt rau ra ngoài, bạn nên cho ngay vào một tô nước đá lạnh khoảng 3 phút.

Điều nài sẽ giúp ngăn quá trình chín của rau củ, làm rau củ giòn và xanh lâu. Để hiệu quả hơn, bạn có thể ngâm rau quả vào nước đá sau khi đã luộc chín rau cũng với 1 trong 3 mẹo nhỏ trên.', N'luocrau5.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (55, 21, N'Chọn mua vịt', N'Khi mua, bạn nên chọn con vịt trưởng thành và béo, ức tròn, da cổ và da bụng dày, mọc đủ lông (điểm mút của hai cánh vừa đủ đan chéo vào nhau). Đây là những con vịt không quá già, quá non vì vậy khi làm lông sẽ rất nhanh, không bị tình trạng nhổ mãi mà không hết lông măng (lông tơ của vịt non), hay vịt quá già sẽ dễ làm trút cả da vịt.', N'vit.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (56, 21, N'Cách làm lông vịt sạch', N'Vì tiện và nhanh chóng, chúng ta thường giao cho các lò mổ để làm sạch. Tuy nhiên, lại rải rác những trường hợp làm lông vịt bằng những hóa chất độc hại rẻ tiền, không có nhãn mác gây ảnh hưởng xấu tới người tiêu dùng.
Có thể làm sạch lông tại nhà là điều mà nhiều chị em nội trợ ao ước bởi sự an toàn. Sau đây là cách vặt lông vịt nhanh mà không sử dụng hóa chất:
- B1: Vịt sau khi cắt tiết xong, bạn hãy nhúng vào chậu nước lạnh cho nước ngấm đều khắp thân và da vịt.
- B2: Sau đó, vớt vịt ra và tưới chút giấm hoặc rượu trắng lên mình vịt khoảng 10 phút trước khi nhúng vào nước ấm, vịt sẽ dễ làm lông hơn.
- B3: Sau khi nhũng giấm hoặc rượu, bạn cho vịt vào nồi nước ấm khoảng 60 độ C, nhúng trong vài phút. Bạn nhổ thử vài sợi lông ở cánh nếu thấy được, bạn vớt vịt ra và tiến hành làm lông. Khi nhổ nhớ miết tay xuống sát da và xuôi theo chiều lông mọc để làm sạch hết phần lông tơ.
- B4: Sau khi làm sạch lông, bạn nên xát muối, gừng và rửa nhiều nước để vịt sạch hơn.', N'vit2.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (57, 21, N'Khử mùi hôi của vịt', N'Sau khi vặt lông xong, chỉ cần bóp vịt thật kỹ với gừng giã nhuyễn hoặc xát với rượu, mùi hôi sẽ không còn. Nhưng nếu trong nhà bạn không có sẵn 2 thứ này thì có một cách đơn giản hơn và cũng rẻ tiền hơn để khử mùi khó chịu của vịt: muối và giấm.', N'vit2.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (58, 21, N'Gợi ý các món ngon từ vịt', N'Vịt kho gừng – Món ăn tưởng chừng như quen thuộc nhưng chẳng kém phần hấp dẫn và đưa cơm. Vịt kho gừng có màu nâu đậm bắt mắt, vì gừng thơm phức át đi mùi tanh của vịt lại thêm phần nước sốt đậm đà ăn cùng cơm nóng là hết ý.
Vịt nấu chao - Khi đã chán với những món ăn hàng ngày, bạn hãy làm mới bữa cơm gia đình vào dịp cuối tuần bằng món vịt nấu chao thơm ngon. Món ăn là sự kết hợp đầy tinh tế của thịt vịt, vị thơm của chao, bùi ngậy của khoai môn hòa quyện đem lại món ăn ngon và kích thích vị giác.', N'vit3.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (59, 22, N'Chọn đậu hũ ngon để chiên', N'- Khi mua đậu hũ để chiên, bạn cần chọn đậu hũ nhà làm và không nên chọn các loại đậu hũ non đã được đóng gói bao bì trong các siêu thị. Vì chúng rất mềm nên dễ bể nát, khi chiên không giòn được, thậm chí còn bị teo nhỏ lại do nước bị rút đi.
- Nên chọn đậu hũ không quá non, phải có độ dai vừa, mềm mịn, không được quá bở như vậy khi chiên không được ngon và rất dễ dính chảo.', N'chiendau.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (60, 22, N'Dùng chảo sạch để chiên', N'- Trước khi bắt đầu tiến hành chiên đậu hũ, bạn cần làm sạch chảo. Chú ý không nên dùng miếng chà nồi bằng sắt vì chúng sẽ khiến chảo bị trầy xước, điều này còn khiến bạn chiên đậu hũ dễ dính chảo hơn.

- Bạn chỉ cần chế nước nóng vào chảo, sau đó dùng miếng bọt biển rửa chén là đã có thể làm sạch chảo rồi đó.

- Tốt nhất bạn nên chọn riêng một chiếc chảo chỉ dùng khi chiên đậu hũ, như vậy sẽ đỡ bị dính chảo hơn và đậu hũ cũng ngon hơn.', N'chiendau1.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (61, 22, N'Làm sạch đậu hũ', N'- Đậu hũ sau khi mua về, rửa sạch với nước, sau đó để ráo nước. Bạn nhớ là để đậu hũ thật khô nhé, vì nếu còn ướt khi chiên sẽ bị bắn dầu đấy và còn khiến chúng dễ dính chảo hơn nữa.', N'chiendau.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (62, 22, N'Mẹo giúp chảo không dính trước khi chiên đậu hũ', N'- Khi đã làm sạch chảo và để chảo khô, trước khi đổ dầu vào chảo, hãy dùng một lát gừng sống rồi sát vào khắp đáy chảo, thành chảo để tạo một lớp màng trơn. Khi đó gừng với dầu kết hợp với nhau sẽ giúp chảo không bị dính.', N'chiendau2.jpg')
INSERT [dbo].[NoiDung_Blog] ([ID], [ID_blog], [TieuDe], [NoiDung], [AnhMinhHoa]) VALUES (63, 22, N'Cách chiên đậu hũ giòn ngon', N'- Khi tiến hành chiên đậu hũ, cần làm nóng chảo trước rồi mới cho dầu ăn vào. Đợi khi dầu nóng mới bắt dầu cho đậu hũ vào chiên. Nếu dầu chưa đủ nóng, khi cho đậu vào sẽ khiến chúng bị dính chảo và khó chiên hơn. Đồng thời, khi dầu nóng sẽ khiến lớp vỏ bên ngoài của đậu hũ được vàng giòn, đẹp mắt hơn.

- Một lưu ý nhỏ, dầu cho vào phải ngập khoảng 1/3 hoặc 1/2 miếng đậu hũ. Bạn nên cho đậu hũ vào lúc dầu vừa nóng sôi bằng cách cho một đôi đũa vào thấy dầu lăn tăn thì lập tức để đậu hũ vào. Không nên đợi dầu bốc khói mới cho vào, như vậy càng khiến đậu hũ nhanh cháy.

- Thêm vào đó, khi chiên không nên để các miếng đậu dính vào nhau vì sẽ rất khó lấy ra và nên chiên ở lửa vừa.', N'chiendau3.jpg')
SET IDENTITY_INSERT [dbo].[NoiDung_Blog] OFF
SET IDENTITY_INSERT [dbo].[NoiDungCT] ON 

INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (1, 3, N'Rây bột mì, đường và muối vào âu, trộn đều. Tiếp tục cho men nở vào trộn đều, tạo một lỗ nhỏ ở giữa âu bột và cho sữa tươi vào.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (2, 3, N'Trộn từ từ đến khi bột thành một khối, dùng máy trộn từ tốc độ thấp rồi tăng dần tốc độ đến khi khối bột trở nên mịn màng. Ở bước này, nếu nhồi bột bằng tay thì cần lưu ý một chút vì bột khá dính nhưng không nên cho nhiều bột áo nếu không sẽ làm bột bị khô. Bột sau khi nhồi không cần đến mức kéo màng mỏng không rách nhưng cần khá mịn màng. Che kín mặt bột và ủ ở nơi ấm áp đến khi bột nở gấp đôi.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (3, 3, N'Nhân bánh: Trộn đều đường, bột quế và các loại hạt đã nghiền nhỏ với nhau. Khi bột đã nở gấp đôi, dùng dầu ăn chống dính 2 tay, sau đó dùng tay túm một phần bột và ngắt dứt khoát cho phần bột ấy đứt. Bước này nếu không quen có thể dùng kéo để cắt bột hoặc cho bột ra mặt bàn rồi dùng miếng cắt bột để cắt hoặc các bạn có thể chia bột bánh thành 7 – 8 phần bằng nhau, chia nhân bánh với số lượng tương tự.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (4, 3, N'Dàn mỏng phần bột sau đó xúc một thìa nhân vào giữa, gói kín lại. Làm lần lượt cho đến hết.
 Lưu ý: chỉ nên dùng một lượng dầu ăn rất vừa phải để chống dính cho tay vì quá nhiều dầu sẽ khiến cho vỏ bánh khó túm lại và dính vào với nhau.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (5, 3, N'Cho dầu vào một cái chảo chống dính tốt, đun ở lửa vừa đến khi dầu nóng thì cho bánh vào. Khi mặt bánh vàng thì lật bánh, sau đó dùng xẻng nấu ăn hoặc một cái thìa ấn cho bánh dẹt ra, tiếp tục rán đến khi 2 mặt bánh vàng. Lưu ý để lửa vừa cho bánh chín rám vàng bên ngoài và chín hết bên trong, rán lửa nhỏ quá sẽ làm vỏ bánh bị dày và dai, ruột bánh còn mùi men; còn nếu rán lửa quá lớn sẽ làm bánh cháy bên ngoài mà trong có thể chưa chín hết. Bánh nên ăn lúc còn nóng, khi vỏ bánh vẫn giòn và nhân đường mật vẫn còn chảy lỏng, nóng hổi, bốc khói.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (6, 8, N'Trộn bột ớt, tương ớt, xì dầu, 30ml dầu thực vật, hạt tiêu, tỏi, si-rô gạo; gừng vào trong một bát. Trộn đều hỗn hợp để hỗn hợp có vị ngọt và cay. Sau đó thêm gà vào và dùng tay trộn cho thật đều.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (7, 8, N'Làm nóng chảo với 15ml dầu thực vật. Sau đó cho bánh gạo vào chiên trong vài phút rồi vớt ra.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (8, 8, N'Cho hỗn hợp thịt gà vào chảo gang, đậy vung lại, đun ở lửa lớn trong 10 phút. Nếu sử dụng chảo chiên bình thường thì chỉ mất 7 – 8 phút. Sau đó, dùng thìa gỗ đảo đều, rồi cho bánh gạo lên bề mặt thịt gà. Tiếp theo, bạn hạ lửa xuống mức thấp nhất. Đậy vung, đun thêm 10 phút hoặc cho đến khi gà chín hoàn toàn.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (9, 9, N'Gà rửa sạch chặt miếng vừa ăn, cho gà vào bát rồi thêm đường, rượu, nước tương, dầu ăn, bột bắp, súp nêm vị gà và nước vào trộn đều. Ướp gà 10 phút. Hành lá thái nhỏ, nấm hương ngâm nở. Thêm nấm hương vào tô gà trộn đêu', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (10, 9, N'Cho gà đã ướp vào thố chịu nhiệt, thêm gừng và đặt vào nồi hấp, đun sôi khoảng 10 phút hoặc hấp cho đến khi gà chín là được. Gà chín rắc chút hành lá lên trên để thêm 1 phút là được.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (11, 9, N'Cách làm thịt gà hấp nấm hương là một món ăn chế biến nhanh với nguyên liệu chủ đạo là gà và nấm hương. Bạn chỉ cần tẩm ướp gia vị theo cách thức trên và hấp chín là đã có một món tuyệt ngon cho bữa cơm gia đình mình.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (12, 10, N'Cho 50gr đường vào nồi cùng lượng nước vừa đủ ngập mặt đường, vặn lửa vừa đến khi nước đường keo lại và chuyển màu cánh gián là được.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (13, 10, N'Nước đường để thật nguội rồi đổ vào khuôn bánh flan, như vậy sẽ giúp tránh tình trạng bánh bị loang lổ màu.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (14, 10, N'Đánh tan trứng và 50gr đường còn lại thật nhẹ nhàng, tránh tạo bọt khí làm rỗ bánh.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (15, 10, N'Xay nhuyễn đậu hũ bằng máy sinh tố rồi trộn đều với trứng. Tiếp theo, cho hỗn hợp trứng vào tô sữa tươi, khuấy đều. Sau khi khuấy, lọc qua rây để loại bỏ phôi trứng và đậu chưa tan được hết.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (16, 10, N'Cuối cùng, cho vani vào, khuấy đều. Đổ bánh vào khuôn, để nghỉ 15 - 30 phút cho các bọt khí vỡ hết.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (17, 10, N'Đặt bánh vào xửng hấp, phủ 2 lớp khăn lên trên để tránh rỗ mặt. Hấp bánh 15 phút, sau đó lật nắp, lau sạch hơi nước bám lên rồi hấp thêm 15 phút nữa. Giờ thì lấy các khay bánh ra, để nguội rồi cho vào tủ lạnh, khi ăn sẽ mát lắm đấy!', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (18, 10, N'Bánh flan đậu hũ non phiên bản mới này vừa lạ, vừa ngon, vừa hấp dẫn như các loại bánh flan thông thường. Nếu bạn là "fan" của bánh flan thì đừng bỏ lỡ nhé!', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (19, 8, N'Trong lúc đun thịt gà, bạn nên làm nóng lò nướng trước ở mức nhiệt trung bình. Khi gà chín, cho phô mai phủ lên trên nồi gà, cho nồi gà vào lò nướng vài phút cho đến khi pho mai tan chảy và sôi lên là được.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (20, 11, N'Dâu bạn sẽ chọn ra những trái nhìn tốt và đẹp mắt để riêng dành để trang trí. Phần còn lại bạn thái nhỏ làm 4 và trộn với đường, để im 1 tiếng.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (21, 11, N'Dâu bạn sẽ chọn ra những trái nhìn tốt và đẹp mắt để riêng dành để trang trí. Phần còn lại bạn thái nhỏ làm 4 và trộn với đường, để im 1 tiếng.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (22, 11, N'Sau đó cho tô dâu nhào đường vào lò vi sóng, quay nóng trong 5 phút. Khi thấy nước dâu đã tiết ra nhiều, bạn chắt bớt nước ra bát riêng, rồi quay tiếp thêm 10-20 phút nữa là xong.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (23, 11, N'Tiếp theo đun ấm sữa tươi rùi hòa tan bột galetin vào, chỉ sữa hơi ấm thôi nha không được để sữa sôi. Hòa tan xong mình đổ vào bát kem wipping, đánh bông lên.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (24, 11, N'Kem phô mát bạn lấy ra cho vào tô khác đánh bông lên, sau đó cho vào tô kem wipping cùng với bát dâu tây đã quay trong lò vi sóng, trộn đều lên.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (25, 11, N'Đặt ổ bánh bông lan vào khuôn rồi phết đều lớp kem dâu lên mặt cho hơi dày và đem vào ngăn mát tủ lạnh khoảng 4-5 tiếng cho đông lại.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (26, 11, N'Khi bánh ủ gần xong, bạn tiếp tục làm thạch dâu bằng cách, cho nước dâu ở bước 1 vào nồi cùng với bột galetin, đun sôi rồi tắt bếp. Bạn cứ khuấy liên tục để hỗn hợp nguội bớt rồi mới chế lên bánh kem và để vào ngăn mát cho đông lại.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (27, 11, N' Trong thời gian chờ bánh đông lại, bạn lấy socola đem đi đun chảy và cho vào khuôn hình để tạo hình mình yêu thích.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (28, 4, N'Hành lá nhặt rửa sạch, thái nhỏ. Hành tím và tỏi bóc vỏ bằm nhỏ.
Cách sơ chế đậu phộng: Đậu phộng đem rang vàng (cho chút muối khi rang để nhanh vàng và không bị cháy), sau đó đem bỏ vỏ, giã thật nhuyễn hoặc vừa tùy theo khẩu vị của bạn. Cuối cùng nhớ trộn chút hạt vừng rang thơm vàng vào đậu phộng giã sẽ thơm và ngon hơn.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (29, 4, N'Cách làm mỡ hành ướp sò điệp: hành tỏi bằm nhỏ cho lên bếp phi thơm (nhớ cho nhiều dầu ăn hơn một chút), sau đó cho hành lá vào đảo đều trong vòng 30 giây thì tắt bếp, thêm chút tiêu bột để hỗn hợp hành thơm hơn.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (30, 4, N'Ướp sò điệp: trước khi nướng trên bếp than thì đem sò ướp cùng chút muối, tiêu đường, bột ngọt và đem lên nướng liền nhé (lưu ý không ướp sò điệp lâu trước khi nướng vì nó sẽ chảy nước tràn ra khỏi vỏ sò).', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (31, 4, N'Nướng sò điệp: nướng sò điệp đến khi phần thịt của sò điệp bắt đầu chín và ra nước thì cho chút mỡ hành làm sẵn từ trước lên vừa đầy con sò. Nướng tới khi sò chín thơm mềm thì rắc đậu phộng cùng vừng giã nhỏ lên trên!', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (32, 4, N'Cách trang trí: Gắp từng con ra đĩa tròn rồi cho dưa chuột thái lát cùng rau răm phía ngoài, có thể kèm theo chén nước mắm ớt và chanh tươi chấm cùng tùy theo khẩu vị từng bạn nhé.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (33, 5, N'Đầu tiên bạn bật bếp đặt chảo lên, đợi chảo nóng rồi thả bơ cho tan ra bạn làm nóng 2 miếng bánh mì cùng bơ để thơm giòn hơn.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (34, 5, N'Tiếp đó cùng sơ chế nguyên liệu bắp cải, cà rốt rửa sạch thái sợi nhỏ rồi trộn với trứng gà nhớ cho thêm chút súp hoặc hạt nêm cho dễ ăn nhé, bạn trộn đều các nguyên liệu đó lên rồi vẫn cái chảo làm nóng bánh mì bạn cho thêm bơ và ít dầu ăn vô dán hỗn hợp trứng trộn rau.', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (35, 5, N'Cuối cùng cho trứng ra và kẹp vào giữa 2 miếng bánh mí và thưởng thức cùng sốt mayonnaise hoặc tương ớt, bạn có thể cho thêm các nguyên liệu khác tùy ý như phô mai, xá xíu,…', NULL)
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (36, 12, N'Thơm: làm sạch, gọt vỏ, cứa các mắt trên quả thơm, bỏ phần cùi bên trong và cắt miếng nhỏ vừa ăn dọc theo khứa thơm. Sau đó trộn thơm với 1 thìa đường để khi ăn miếng thơm sẽ đậm đà, ngon hơn.', N'hqd1.jpg')
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (37, 12, N'Xoài gọt vỏ, rửa sạch, thái miếng hình lập phương. Dưa hấu rửa sạch, gọt vỏ, bạn gọt hết cả phần cùi trắng luôn nhé, bỏ hạt, cắt miếng bằng miếng xoài. Dâu tây rửa sạch cắt bỏ cuống rồi bổ đôi.

', N'hqd2.jpg')
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (38, 12, N'Lê rửa sạch gọt vỏ, bỏ hạt và phần cùi ở giữa, thái hạt lựu.', N'hqd3.jpg')
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (39, 12, N'Mít tách múi, bỏ hạt, thái sợi chỉ.', N'hqd4.jpg')
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (40, 12, N'Bơ rửa sạch, bỏ vỏ thái miếng nhỏ hình vuông.', N'hqd5.jpg')
INSERT [dbo].[NoiDungCT] ([MaNoiDungCT], [MaCongThuc], [NoiDung], [AnhMinhHoa]) VALUES (41, 12, N'Cho tất cả hoa quả đã sơ chế vào cốc sau đó thêm 3 thìa sữa tươi không đường, 2 thìa cà phê sữa đặc, 2 thìa cà phê nước cốt dừa, ½ hộp sữa chua, vài giọt nước cốt chanh, dừa sợi trộn đều lên, màu các loại trái cây sẽ khiến ly sinh tố dầm thêm phần bắt mắt, hấp dẫn (tránh làm nát hoa quả). Cuối cùng rắc chút dừa tươi thái sợi lên trên và trộn đá bào vào là bạn đã có thể thưởng thức được rồi.', NULL)
SET IDENTITY_INSERT [dbo].[NoiDungCT] OFF
SET IDENTITY_INSERT [dbo].[PhanHoi] ON 

INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (7, NULL, N'Bài viết quá hay!', CAST(N'2020-11-11T00:00:00.000' AS DateTime), 1, 3, NULL)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (12, NULL, N'Công thức rất bổ ích', CAST(N'2020-12-30T21:11:01.393' AS DateTime), 5, 3, NULL)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (13, NULL, N'Good!', CAST(N'2020-12-30T21:13:10.343' AS DateTime), 5, 4, NULL)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (14, NULL, N'Good!', CAST(N'2020-12-30T21:14:01.063' AS DateTime), 5, 5, NULL)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (15, NULL, N'Good!', CAST(N'2020-12-30T21:14:52.933' AS DateTime), 5, 8, NULL)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (16, NULL, N'Good!', CAST(N'2020-12-30T21:22:57.153' AS DateTime), 5, 9, NULL)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (17, NULL, N'cứ thế phát huy nhé', CAST(N'2020-12-30T22:23:50.130' AS DateTime), 5, 3, NULL)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (18, NULL, N'Hay!', CAST(N'2020-12-31T07:29:06.747' AS DateTime), 5, NULL, 1)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (19, NULL, N'Được bạn', CAST(N'2020-12-31T07:42:12.720' AS DateTime), 1, NULL, 1)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (20, NULL, N'Làm thêm mấy bài tương tự đi ad', CAST(N'2020-12-31T07:46:25.967' AS DateTime), 5, NULL, 1)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (21, NULL, N'ok', CAST(N'2020-12-31T07:47:28.313' AS DateTime), 5, NULL, 1)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (22, NULL, N'good', CAST(N'2020-12-31T07:49:41.820' AS DateTime), 5, NULL, 1)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (23, NULL, N'Được bạn ơi', CAST(N'2020-12-31T07:51:58.300' AS DateTime), 1, NULL, 12)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (24, NULL, N'làm séc đi bạn', CAST(N'2020-12-31T07:59:57.897' AS DateTime), 1, NULL, 12)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (31, NULL, N'Hay đó', CAST(N'2020-12-31T08:18:19.147' AS DateTime), 8, 19, NULL)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (32, NULL, N'làm séc đi bạn', CAST(N'2020-12-31T08:23:40.603' AS DateTime), 8, NULL, 13)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [ID_user], [ID_congthuc], [ID_blog]) VALUES (33, NULL, N'dfgfhtỵuki', CAST(N'2020-12-31T08:44:16.943' AS DateTime), 8, NULL, 13)
SET IDENTITY_INSERT [dbo].[PhanHoi] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([MaSlider], [TieuDe], [NoiDung], [AnhMinhHoa], [TrangThai], [Class]) VALUES (2, N'Pancake siêu ngon', N'Pancake là loại bánh không yêu cầu nguyên liệu cầu kì, cách làm cũng đơn giản, nhanh và không cần lò nướng nên có vẻ là ứng cử viên sáng giá cho đồ ăn điểm tâm hoặc ăn chơi trong ngày lạnh giá hay mưa gió. Hãy cũng Mix-MTA làm ngay nào.', N'pancake.jpg                                                                                         ', 1, N'single-hero-slide                                                                                   ')
INSERT [dbo].[Slider] ([MaSlider], [TieuDe], [NoiDung], [AnhMinhHoa], [TrangThai], [Class]) VALUES (3, N'Bánh mỳ cho bữa sáng ', N'Không chỉ được biết đến như món ăn sáng phổ biến của người Việt, bánh mì kẹp trứng còn là lựa chọn hoàn hảo cho bạn sau những giờ học tập, làm việc. Cách làm bánh mì kẹp trứng không hề khó mà lại chỉ mất chừng 5 phút nên bạn có thể thực hiện ngay tại nhà. Hãy sẵn sàng năng lượng khởi đầu ngày mới với bánh mì kẹp trứng thơm ngon nhé!', N'bread.jpg                                                                                           ', 1, N'single-hero-slide                                                                                   ')
INSERT [dbo].[Slider] ([MaSlider], [TieuDe], [NoiDung], [AnhMinhHoa], [TrangThai], [Class]) VALUES (4, N'Làm burger ngon tại nhà', N'Nếu là fan của bộ phim hoạt hình vô cùng nổi tiếng những năm 90 “Thủy thủ Popeye”, hẳn bạn vẫn còn nhớ tới anh chàng Wimpy, bạn thân của Popeye, luôn luôn ngập mình trong những chiếc Hamburger. Càng ăn nhiều Hamburger, anh chàng này càng cảm thấy thoải mái hơn. Bạn có ấn tượng như vậy mỗi khi thưởng thức Hamburger không?', N'bg1.jpg                                                                                             ', 1, N'single-hero-slide                                                                                   ')
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[ThanhVien] ON 

INSERT [dbo].[ThanhVien] ([ID_user], [HoTen], [GioiTinh], [HinhDaiDien], [Email], [NgayDangky], [Username], [PassWord]) VALUES (1, N'Nguyễn Ánh', N'Nữ', N'avt.jpg', N'anhhihi@gmail.com', CAST(N'2020-08-30' AS Date), N'AnhDz                                                                                               ', N'123456                                                                                              ')
INSERT [dbo].[ThanhVien] ([ID_user], [HoTen], [GioiTinh], [HinhDaiDien], [Email], [NgayDangky], [Username], [PassWord]) VALUES (2, N'Bùi Thị Loan', N'Nữ', N'btl.jpg', N'loanabc@gmail.com', CAST(N'2020-08-30' AS Date), N'LoanBaby                                                                                            ', N'123456                                                                                              ')
INSERT [dbo].[ThanhVien] ([ID_user], [HoTen], [GioiTinh], [HinhDaiDien], [Email], [NgayDangky], [Username], [PassWord]) VALUES (3, N'Phạm Thị Giang', N'Nữ', N'ptg.jpg', N'gianggiang@gmail.com', CAST(N'2020-09-01' AS Date), N'GGiang                                                                                              ', N'123456                                                                                              ')
INSERT [dbo].[ThanhVien] ([ID_user], [HoTen], [GioiTinh], [HinhDaiDien], [Email], [NgayDangky], [Username], [PassWord]) VALUES (4, N'Phạm Mạnh Cường', N'Nam', N'pmc.jpg', N'cuongsamll@gmail.com', CAST(N'2020-10-12' AS Date), N'CuongSmall                                                                                          ', N'123456                                                                                              ')
INSERT [dbo].[ThanhVien] ([ID_user], [HoTen], [GioiTinh], [HinhDaiDien], [Email], [NgayDangky], [Username], [PassWord]) VALUES (5, N'Vũ Thị Kim Như', N'Nữ', N'knv.jpg', N'nhuct@gmail.com', CAST(N'2020-11-16' AS Date), N'NhuSad                                                                                              ', N'12345                                                                                               ')
INSERT [dbo].[ThanhVien] ([ID_user], [HoTen], [GioiTinh], [HinhDaiDien], [Email], [NgayDangky], [Username], [PassWord]) VALUES (6, N'Vũ Đức Long', N'Nam', N'na.jpg', N'nhunhu@gmail.com', CAST(N'2020-11-16' AS Date), N'LongRamos                                                                                           ', N'1234                                                                                                ')
INSERT [dbo].[ThanhVien] ([ID_user], [HoTen], [GioiTinh], [HinhDaiDien], [Email], [NgayDangky], [Username], [PassWord]) VALUES (7, N'Bùi Đăng Vũ', N'Nam', N'knv2.jpg', N'buidangvu@gmail.com', CAST(N'2020-11-22' AS Date), N'Vuvuvu                                                                                              ', N'1234                                                                                                ')
INSERT [dbo].[ThanhVien] ([ID_user], [HoTen], [GioiTinh], [HinhDaiDien], [Email], [NgayDangky], [Username], [PassWord]) VALUES (8, N'Nguyễn Thị Hà', N'Nữ', N'bdv.jpg', N'hacute@gmail.com', CAST(N'2020-11-22' AS Date), N'HaCute                                                                                              ', N'12345                                                                                               ')
SET IDENTITY_INSERT [dbo].[ThanhVien] OFF
SET IDENTITY_INSERT [dbo].[TraLoi_PhanHoi] ON 

INSERT [dbo].[TraLoi_PhanHoi] ([MaTraLoi], [MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [MaThanhVien], [MaNguoiDung]) VALUES (1, 7, NULL, N'Chuẩn luôn bạn ơi', CAST(N'2020-11-09T11:30:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[TraLoi_PhanHoi] ([MaTraLoi], [MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [MaThanhVien], [MaNguoiDung]) VALUES (2, 7, NULL, N'Hay lắm bạn', CAST(N'2020-11-09T11:31:15.000' AS DateTime), 3, NULL)
INSERT [dbo].[TraLoi_PhanHoi] ([MaTraLoi], [MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [MaThanhVien], [MaNguoiDung]) VALUES (3, 7, NULL, N'Hay lắm bạn', CAST(N'2020-11-09T11:31:15.000' AS DateTime), 3, NULL)
INSERT [dbo].[TraLoi_PhanHoi] ([MaTraLoi], [MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [MaThanhVien], [MaNguoiDung]) VALUES (8, 16, NULL, N'Cố gắng lên nữa nha!', CAST(N'2020-12-30T21:23:27.010' AS DateTime), 5, NULL)
INSERT [dbo].[TraLoi_PhanHoi] ([MaTraLoi], [MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [MaThanhVien], [MaNguoiDung]) VALUES (9, 7, NULL, N'được bạn ơi', CAST(N'2020-12-30T22:21:20.583' AS DateTime), 5, NULL)
INSERT [dbo].[TraLoi_PhanHoi] ([MaTraLoi], [MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [MaThanhVien], [MaNguoiDung]) VALUES (10, 7, NULL, N'ok fine', CAST(N'2020-12-30T22:23:35.013' AS DateTime), 5, NULL)
INSERT [dbo].[TraLoi_PhanHoi] ([MaTraLoi], [MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [MaThanhVien], [MaNguoiDung]) VALUES (11, 7, NULL, N'cảm ơn bạn', CAST(N'2020-12-31T09:14:07.667' AS DateTime), NULL, 2)
INSERT [dbo].[TraLoi_PhanHoi] ([MaTraLoi], [MaPhanHoi], [TieuDe], [NoiDung], [NgayDang], [MaThanhVien], [MaNguoiDung]) VALUES (12, 7, NULL, N'cảm ơn bạn nhiều nhé', CAST(N'2020-12-31T09:16:42.900' AS DateTime), NULL, 2)
SET IDENTITY_INSERT [dbo].[TraLoi_PhanHoi] OFF
SET IDENTITY_INSERT [dbo].[TruyCap] ON 

INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (1, CAST(N'2020-11-16' AS Date), 1)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (2, CAST(N'2020-11-17' AS Date), 1)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (3, CAST(N'2020-11-18' AS Date), 2)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (5, CAST(N'2020-11-19' AS Date), 1)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (9, CAST(N'2020-11-20' AS Date), 6)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (15, CAST(N'2020-11-21' AS Date), 2)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (17, CAST(N'2020-11-22' AS Date), 17)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (23, CAST(N'2020-11-23' AS Date), 7)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (24, CAST(N'2020-11-27' AS Date), 10)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (25, CAST(N'2020-11-30' AS Date), 6)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (26, CAST(N'2020-12-01' AS Date), 2)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (27, CAST(N'2020-12-25' AS Date), 7)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (28, CAST(N'2020-12-28' AS Date), 19)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (29, CAST(N'2020-12-29' AS Date), 17)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (30, CAST(N'2020-12-30' AS Date), 22)
INSERT [dbo].[TruyCap] ([ID], [ThoiGian], [SoTruyCap]) VALUES (31, CAST(N'2020-12-31' AS Date), 29)
SET IDENTITY_INSERT [dbo].[TruyCap] OFF
ALTER TABLE [dbo].[CongThuc]  WITH CHECK ADD  CONSTRAINT [FK_CongThuc_LoaiCongThuc] FOREIGN KEY([MaLoaiCongThuc])
REFERENCES [dbo].[LoaiCongThuc] ([MaLoaiCongThuc])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CongThuc] CHECK CONSTRAINT [FK_CongThuc_LoaiCongThuc]
GO
ALTER TABLE [dbo].[Luu_tru]  WITH CHECK ADD FOREIGN KEY([ID_blog])
REFERENCES [dbo].[Blog] ([MaBlog])
GO
ALTER TABLE [dbo].[Luu_tru]  WITH CHECK ADD FOREIGN KEY([ID_congthuc])
REFERENCES [dbo].[CongThuc] ([ID_congthuc])
GO
ALTER TABLE [dbo].[Luu_tru]  WITH CHECK ADD FOREIGN KEY([ID_user])
REFERENCES [dbo].[ThanhVien] ([ID_user])
GO
ALTER TABLE [dbo].[NguyenLieu]  WITH CHECK ADD  CONSTRAINT [FK_NguyenLieu_CongThuc] FOREIGN KEY([MaCongThuc])
REFERENCES [dbo].[CongThuc] ([ID_congthuc])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[NguyenLieu] CHECK CONSTRAINT [FK_NguyenLieu_CongThuc]
GO
ALTER TABLE [dbo].[NoiDung_Blog]  WITH CHECK ADD  CONSTRAINT [FK_NoiDung_Blog_Blog] FOREIGN KEY([ID_blog])
REFERENCES [dbo].[Blog] ([MaBlog])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[NoiDung_Blog] CHECK CONSTRAINT [FK_NoiDung_Blog_Blog]
GO
ALTER TABLE [dbo].[NoiDungCT]  WITH CHECK ADD  CONSTRAINT [FK_NoiDungCT_CongThuc] FOREIGN KEY([MaCongThuc])
REFERENCES [dbo].[CongThuc] ([ID_congthuc])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[NoiDungCT] CHECK CONSTRAINT [FK_NoiDungCT_CongThuc]
GO
ALTER TABLE [dbo].[PhanHoi]  WITH CHECK ADD  CONSTRAINT [FK_PhanHoi_Blog] FOREIGN KEY([ID_blog])
REFERENCES [dbo].[Blog] ([MaBlog])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[PhanHoi] CHECK CONSTRAINT [FK_PhanHoi_Blog]
GO
ALTER TABLE [dbo].[PhanHoi]  WITH CHECK ADD  CONSTRAINT [FK_PhanHoi_CongThuc] FOREIGN KEY([ID_congthuc])
REFERENCES [dbo].[CongThuc] ([ID_congthuc])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhanHoi] CHECK CONSTRAINT [FK_PhanHoi_CongThuc]
GO
ALTER TABLE [dbo].[PhanHoi]  WITH CHECK ADD  CONSTRAINT [FK_PhanHoi_NguoiDung] FOREIGN KEY([ID_user])
REFERENCES [dbo].[ThanhVien] ([ID_user])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhanHoi] CHECK CONSTRAINT [FK_PhanHoi_NguoiDung]
GO
ALTER TABLE [dbo].[TraLoi_PhanHoi]  WITH CHECK ADD  CONSTRAINT [FK_TraLoi_PhanHoi_NguoiDung] FOREIGN KEY([MaNguoiDung])
REFERENCES [dbo].[NguoiDung] ([UserID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TraLoi_PhanHoi] CHECK CONSTRAINT [FK_TraLoi_PhanHoi_NguoiDung]
GO
ALTER TABLE [dbo].[TraLoi_PhanHoi]  WITH CHECK ADD  CONSTRAINT [FK_TraLoi_PhanHoi_PhanHoi] FOREIGN KEY([MaPhanHoi])
REFERENCES [dbo].[PhanHoi] ([MaPhanHoi])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[TraLoi_PhanHoi] CHECK CONSTRAINT [FK_TraLoi_PhanHoi_PhanHoi]
GO
ALTER TABLE [dbo].[TraLoi_PhanHoi]  WITH CHECK ADD  CONSTRAINT [FK_TraLoi_PhanHoi_ThanhVien] FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[ThanhVien] ([ID_user])
GO
ALTER TABLE [dbo].[TraLoi_PhanHoi] CHECK CONSTRAINT [FK_TraLoi_PhanHoi_ThanhVien]
GO
USE [master]
GO
ALTER DATABASE [Web_Cook] SET  READ_WRITE 
GO
