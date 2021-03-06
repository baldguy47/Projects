USE [master]
GO
/****** Object:  Database [PRJ301E4]    Script Date: 09/11/2021 3:15:36 PM ******/
CREATE DATABASE [PRJ301E4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301E4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301E4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301E4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301E4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301E4] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301E4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301E4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301E4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301E4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301E4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301E4] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301E4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301E4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301E4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301E4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301E4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301E4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301E4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301E4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301E4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301E4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301E4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301E4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301E4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301E4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301E4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301E4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301E4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301E4] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ301E4] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301E4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301E4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301E4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301E4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301E4] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301E4', N'ON'
GO
ALTER DATABASE [PRJ301E4] SET QUERY_STORE = OFF
GO
USE [PRJ301E4]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 09/11/2021 3:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[adminID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NULL,
	[password] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 09/11/2021 3:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[oID] [varchar](32) NOT NULL,
	[dateCreate] [datetime] NULL,
	[cname] [nvarchar](30) NOT NULL,
	[cphone] [varchar](30) NULL,
	[cAddress] [nvarchar](100) NULL,
	[total] [money] NULL,
	[status] [int] NULL,
	[cid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[oID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 09/11/2021 3:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[pid] [varchar](30) NOT NULL,
	[oID] [varchar](32) NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[total] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC,
	[oID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09/11/2021 3:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cateID] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [nvarchar](50) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 09/11/2021 3:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](30) NOT NULL,
	[cphone] [varchar](30) NULL,
	[cAddress] [nvarchar](100) NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varchar](32) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09/11/2021 3:15:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pid] [varchar](30) NOT NULL,
	[pname] [nvarchar](100) NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[image] [varchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[cateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([adminID], [username], [password]) VALUES (14, N'asdqwe', N'123456789')
INSERT [dbo].[admin] ([adminID], [username], [password]) VALUES (17, N'blahblah123123', N'123456qweqwe')
INSERT [dbo].[admin] ([adminID], [username], [password]) VALUES (18, N'newadmind', N'123456xcvzxd')
INSERT [dbo].[admin] ([adminID], [username], [password]) VALUES (20, N'blahblahnew', N'bagesdfsdc')
SET IDENTITY_INSERT [dbo].[admin] OFF
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O01', CAST(N'2021-09-15T14:52:18.140' AS DateTime), N'changeCustomerName', N'1123123142', N'new addresschange', 0.0000, 2, 1)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O02', CAST(N'2021-10-19T14:41:50.517' AS DateTime), N'changeCustomerName', N'123456789', N'new addresschange', 1723.0000, 0, 1)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O03', CAST(N'2021-10-19T15:03:48.573' AS DateTime), N'changeCustomerName', N'123456789', N'new addresschange', 2722.0000, 1, 1)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O04', CAST(N'2021-10-19T22:47:31.680' AS DateTime), N'changeCustomerName', N'123456789', N'address', 3822.0000, 2, 1)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O05', CAST(N'2021-10-19T22:53:22.540' AS DateTime), N'trungngno', N'1234567890', N'badldl', 2223.0000, 0, 1)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O06', CAST(N'2021-10-19T23:03:22.047' AS DateTime), N'trungngno', N'1234567890', N'badldl', 103821.0000, 1, 25)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211024165440', CAST(N'2021-10-24T16:54:40.123' AS DateTime), N'changeCustomerName', N'123456789', N'address', 1723.0000, 1, 1)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211024210058', CAST(N'2021-10-24T21:00:58.137' AS DateTime), N'changeCustomerName', N'123456789', N'address', 1600.0000, 1, 1)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211026083744', CAST(N'2021-10-26T08:37:44.457' AS DateTime), N'changeCustomerName', N'123456789', N'address', 1000.0000, 1, 1)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211026143101', CAST(N'2021-10-26T14:31:01.200' AS DateTime), N'name Customer', N'12334567889', N'bac ninh', 623.0000, 2, 35)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211031170718', CAST(N'2021-10-31T17:07:18.097' AS DateTime), N'trungngoquang', N'03212341233', N'newad', 3015.0000, 2, 45)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211031220557', CAST(N'2021-10-31T22:05:57.730' AS DateTime), N'trung', N'03212341233', N'newad', 10057.0000, 1, 45)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211101224643', CAST(N'2021-11-01T22:46:44.143' AS DateTime), N'newCust', N'03212341233', N'newad', 1969.0000, 1, 45)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211101231902', CAST(N'2021-11-01T23:19:02.640' AS DateTime), N'newCust', N'03212341233', N'newad', 123.0000, 1, 45)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211103175956', CAST(N'2021-11-03T17:59:56.593' AS DateTime), N'newCust', N'03212341233', N'newad', 246.0000, 1, 45)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211103194910', CAST(N'2021-11-03T19:49:10.300' AS DateTime), N'newCust', N'03212341233', N'newad', 123.0000, 1, 45)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211107201956', CAST(N'2021-11-07T20:19:56.287' AS DateTime), N'newCust', N'03212341233', N'newad', 8246.0000, 1, 45)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211107202139', CAST(N'2021-11-07T20:21:39.680' AS DateTime), N'newCust', N'03212341233', N'newad', 923.0000, 1, 45)
INSERT [dbo].[Bill] ([oID], [dateCreate], [cname], [cphone], [cAddress], [total], [status], [cid]) VALUES (N'O20211109140848', CAST(N'2021-11-09T14:08:48.300' AS DateTime), N'trung ngo quang', N'03212341233', N'newad', 1600.0000, 1, 45)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O01', 2, 800.0000, 1600.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O02', 2, 800.0000, 1600.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O04', 2, 800.0000, 1600.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O05', 2, 800.0000, 1600.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O06', 2, 800.0000, 1600.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O20211024165440', 2, 800.0000, 1600.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O20211024210058', 2, 800.0000, 1600.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O20211031170718', 3, 800.0000, 2400.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O20211031220557', 1, 800.0000, 800.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O20211101224643', 2, 800.0000, 1600.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O20211107201956', 10, 800.0000, 8000.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O20211107202139', 1, 800.0000, 800.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P01', N'O20211109140848', 2, 800.0000, 1600.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O02', 1, 123.0000, 123.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O04', 1, 123.0000, 123.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O05', 1, 123.0000, 123.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O20211024165440', 1, 123.0000, 123.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O20211026143101', 1, 123.0000, 123.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O20211031170718', 5, 123.0000, 615.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O20211031220557', 3, 123.0000, 369.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O20211101224643', 3, 123.0000, 369.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O20211101231902', 1, 123.0000, 123.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O20211103175956', 2, 123.0000, 246.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O20211103194910', 1, 123.0000, 123.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O20211107201956', 2, 123.0000, 246.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0111', N'O20211107202139', 1, 123.0000, 123.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0123', N'O02', 2, 2222.0000, 4444.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0123', N'O03', 1, 2222.0000, 2222.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0123', N'O04', 1, 2222.0000, 2222.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0123', N'O06', 1, 2222.0000, 2222.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P0123', N'O20211031220557', 4, 2222.0000, 8888.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P02', N'O02', 1, 500.0000, 500.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P02', N'O03', 1, 500.0000, 500.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P02', N'O04', 1, 500.0000, 500.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P02', N'O05', 1, 500.0000, 500.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P02', N'O20211026083744', 2, 500.0000, 1000.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P02', N'O20211026143101', 1, 500.0000, 500.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P69', N'O06', 1, 99999.0000, 99999.0000)
INSERT [dbo].[BillDetail] ([pid], [oID], [quantity], [price], [total]) VALUES (N'P69', N'O20211026083744', 2, 99999.0000, 1000.0000)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cateID], [cateName], [status]) VALUES (1, N'Hp', 1)
INSERT [dbo].[Category] ([cateID], [cateName], [status]) VALUES (2, N'MSI', 1)
INSERT [dbo].[Category] ([cateID], [cateName], [status]) VALUES (3, N'Apple', 1)
INSERT [dbo].[Category] ([cateID], [cateName], [status]) VALUES (6, N'Headphone', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (1, N'changeCustomerName', N'123456789', N'address', N'username1', N'username1change', 1)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (25, N'trungngno', N'1234567890', N'badldl', N'blahblahsadf', N'123456sdfa', 1)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (34, N'newname', N'1234562890', N'noad', N'blahblah1cxz', N'dzxcasdwqw', 1)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (35, N'name Customer', N'12334567889', N'bac ninh', N'thisisnew', N'thisnised', 1)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (36, N'justAnewDUde', N'0383134058', N'bac giang', N'blahblahcd', N'123456fdasdfew', 1)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (39, N'newCustomerRegistered', N'03831304058', N'189 nc', N'blahblah', N'12345678', 1)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (41, N'dfsdf', N'123412341234', N'asdeed', N'blahblahddd', N'blahblahddd', 1)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (43, N'fdsad', N'123123123123', N'fdsadfsda', N'blahblahcdsd', N'123456789', 1)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (44, N'blahblah', N'123123123123', N'trungng', N'blahblahmnb', N'123456789', 1)
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [cAddress], [username], [password], [status]) VALUES (45, N'newCust', N'03212341233', N'newad', N'blahblah1', N'123456789', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'P01', N'EliteBook G7', 10, 800.0000, N'img/HP-Elitebook.png', N'computer', 1, 1)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'P0111', N'LaserJetPro Printer', 2, 123.0000, N'https://www.hp.com/content/dam/sites/worldwide/homepage/images/LaserJetPro_m404dn.jpg', N'printer', 1, 1)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'P0123', N'MSI GV72', 232, 2222.0000, N'https://laptopaz.vn/media/product/1073_msi_gv72_7rd_i7_thuong.jpg', N'gaming laptop', 1, 2)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'P02', N'Airpod Pro', 4, 500.0000, N'img/MWP22.jpg', N'2nd hand', 1, 3)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'P19', N'Iphone11', 2, 32.0000, N'img/iphone11.jpg', N'dess23', 1, 3)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'P21', N'Iphone 13', 21, 2342.0000, N'img/iphone13.jpg', N'des11', 1, 3)
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateID]) VALUES (N'P69', N'Katana GF76', 1, 99999.0000, N'img/gf96.webp', N'edds', 1, 2)
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__admin__F3DBC572A9244E82]    Script Date: 09/11/2021 3:15:36 PM ******/
ALTER TABLE [dbo].[admin] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__F3DBC572A1751F04]    Script Date: 09/11/2021 3:15:36 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT (getdate()) FOR [dateCreate]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Customer] ([cid])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([oID])
REFERENCES [dbo].[Bill] ([oID])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cateID])
GO
ALTER TABLE [dbo].[admin]  WITH CHECK ADD CHECK  ((len([password])>=(8)))
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD CHECK  ((len([password])>=(8)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD CHECK  (([quantity]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [PRJ301E4] SET  READ_WRITE 
GO
