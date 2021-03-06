USE [master]
GO
/****** Object:  Database [DCBMS]    Script Date: 1/16/2017 1:27:39 AM ******/
CREATE DATABASE [DCBMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DCBMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DCBMS.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DCBMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DCBMS_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DCBMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DCBMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DCBMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DCBMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DCBMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DCBMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DCBMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [DCBMS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DCBMS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DCBMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DCBMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DCBMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DCBMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DCBMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DCBMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DCBMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DCBMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DCBMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DCBMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DCBMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DCBMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DCBMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DCBMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DCBMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DCBMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DCBMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DCBMS] SET  MULTI_USER 
GO
ALTER DATABASE [DCBMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DCBMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DCBMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DCBMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DCBMS]
GO
/****** Object:  Table [dbo].[bill_info]    Script Date: 1/16/2017 1:27:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bill_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bill_id] [varchar](32) NOT NULL,
	[bill_total] [decimal](18, 0) NOT NULL,
	[bill_paid] [decimal](18, 0) NOT NULL,
	[bill_due] [decimal](18, 0) NOT NULL,
	[bill_date] [date] NOT NULL,
	[patient_mobile] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[patient_info]    Script Date: 1/16/2017 1:27:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patient_info](
	[patient_id] [int] IDENTITY(1,1) NOT NULL,
	[patient_name] [varchar](64) NOT NULL,
	[patient_dob] [date] NOT NULL,
	[patient_mobile] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[patient_mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[test_info]    Script Date: 1/16/2017 1:27:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bill_id] [varchar](32) NOT NULL,
	[test_date] [date] NOT NULL,
	[test_name] [varchar](64) NOT NULL,
	[test_fee] [decimal](18, 0) NOT NULL,
	[test_type_name] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[test_setup]    Script Date: 1/16/2017 1:27:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test_setup](
	[test_id] [int] IDENTITY(1,1) NOT NULL,
	[test_name] [varchar](64) NOT NULL,
	[test_fee] [decimal](18, 0) NOT NULL,
	[test_type_name] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[test_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[test_type_setup]    Script Date: 1/16/2017 1:27:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test_type_setup](
	[test_type_id] [int] IDENTITY(1,1) NOT NULL,
	[test_type_name] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[test_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[bill_info] ON 

INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (78, N'DCB-1', CAST(1200 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0x333C0B00 AS Date), N'01832264272')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1083, N'DCB-10', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x533C0B00 AS Date), N'01234567891')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1084, N'DCB-11', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x533C0B00 AS Date), N'018322642624')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1085, N'DCB-12', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x533C0B00 AS Date), N'5675675756')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1086, N'DCB-13', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x533C0B00 AS Date), N'0177676767')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1087, N'DCB-14', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x533C0B00 AS Date), N'01753333333')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1088, N'DCB-15', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01831111111')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1089, N'DCB-16', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'011111111111')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1090, N'DCB-17', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'0111111111118')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1091, N'DCB-18', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'6765756756')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1092, N'DCB-19', CAST(200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'55556556676')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (79, N'DCB-2', CAST(1300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1300 AS Decimal(18, 0)), CAST(0x3D3C0B00 AS Date), N'01755477600')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1093, N'DCB-20', CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'567676766')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1094, N'DCB-21', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'878787878')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1095, N'DCB-22', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'343433434')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1096, N'DCB-23', CAST(200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'9067878446')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1097, N'DCB-24', CAST(500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'3545454545')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1098, N'DCB-25', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'4567746577')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1099, N'DCB-26', CAST(500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1100, N'DCB-27', CAST(1200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01832264272')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1101, N'DCB-28', CAST(500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1102, N'DCB-29', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (80, N'DCB-3', CAST(500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(0x4D3C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1103, N'DCB-30', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01755477600')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1104, N'DCB-31', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1105, N'DCB-32', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1106, N'DCB-33', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1107, N'DCB-34', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01832264272')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1108, N'DCB-35', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01759200340')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1109, N'DCB-36', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01755477600')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1110, N'DCB-37', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01759200340')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1111, N'DCB-38', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01755477600')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1112, N'DCB-39', CAST(1500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1500 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01755477600')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (81, N'DCB-4', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x523C0B00 AS Date), N'0183226111')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1113, N'DCB-40', CAST(500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01755477600')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1114, N'DCB-41', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1115, N'DCB-42', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1116, N'DCB-43', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1117, N'DCB-44', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01832264272')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1118, N'DCB-45', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x543C0B00 AS Date), N'01755477600')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1119, N'DCB-46', CAST(2000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2000 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1120, N'DCB-47', CAST(700 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(700 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01759200340')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1121, N'DCB-48', CAST(200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1122, N'DCB-49', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1078, N'DCB-5', CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0x533C0B00 AS Date), N'01832264272')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1123, N'DCB-50', CAST(200 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01759200340')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1124, N'DCB-51', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1125, N'DCB-52', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1126, N'DCB-53', CAST(500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01793574440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1127, N'DCB-54', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01759200340')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1128, N'DCB-55', CAST(500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'0183226111')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1129, N'DCB-56', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01793574440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1130, N'DCB-57', CAST(500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1131, N'DCB-58', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01759200340')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1132, N'DCB-59', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01759200340')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1079, N'DCB-6', CAST(2000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2000 AS Decimal(18, 0)), CAST(0x533C0B00 AS Date), N'01999999999')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1133, N'DCB-60', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01759200340')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1134, N'DCB-61', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01759200340')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1135, N'DCB-62', CAST(500 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01756353440')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1136, N'DCB-63', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01759200340')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1137, N'DCB-64', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x573C0B00 AS Date), N'01759200340')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1080, N'DCB-7', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x533C0B00 AS Date), N'01700000000')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1081, N'DCB-8', CAST(300 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), CAST(0x533C0B00 AS Date), N'01655544433')
INSERT [dbo].[bill_info] ([id], [bill_id], [bill_total], [bill_paid], [bill_due], [bill_date], [patient_mobile]) VALUES (1082, N'DCB-9', CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(0x533C0B00 AS Date), N'01712345678')
SET IDENTITY_INSERT [dbo].[bill_info] OFF
SET IDENTITY_INSERT [dbo].[patient_info] ON 

INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1083, N'Farid Hosain', CAST(0x543C0B00 AS Date), N'011111111111')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1084, N'Farid Hosain', CAST(0x543C0B00 AS Date), N'0111111111118')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1077, N'Arif', CAST(0x533C0B00 AS Date), N'01234567891')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1075, N'Razu Ahmed', CAST(0x533C0B00 AS Date), N'01655544433')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1074, N'Sotun', CAST(0x533C0B00 AS Date), N'01700000000')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1076, N'Razu Ahmed', CAST(0x533C0B00 AS Date), N'01712345678')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1081, N'Razu Ahmed', CAST(0x533C0B00 AS Date), N'01753333333')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (74, N'Farid Hosain', CAST(0x523C0B00 AS Date), N'01755477600')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (75, N'Razu Ahmed', CAST(0x523C0B00 AS Date), N'01756353440')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1094, N'Razu Ahmed', CAST(0x543C0B00 AS Date), N'01759200340')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1080, N'Sotun', CAST(0x533C0B00 AS Date), N'0177676767')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1095, N'Shafiqul Islam', CAST(0x573C0B00 AS Date), N'01793574440')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1082, N'Razu Ahmed', CAST(0x543C0B00 AS Date), N'01831111111')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (77, N'Shafiqul Islam', CAST(0x523C0B00 AS Date), N'0183226111')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1078, N'Arif', CAST(0x533C0B00 AS Date), N'018322642624')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (73, N'Arif', CAST(0x621B0B00 AS Date), N'01832264272')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1073, N'Razu Ahmed', CAST(0x533C0B00 AS Date), N'01999999999')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1089, N'Sotun', CAST(0x543C0B00 AS Date), N'343433434')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1092, N'Razu Ahmed', CAST(0x543C0B00 AS Date), N'3545454545')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1093, N'Razu Ahmed', CAST(0x543C0B00 AS Date), N'4567746577')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1086, N'jhgjhgjhgj', CAST(0x543C0B00 AS Date), N'55556556676')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1079, N'Razu Ahmed', CAST(0x533C0B00 AS Date), N'5675675756')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1087, N'Razu Ahmed', CAST(0x543C0B00 AS Date), N'567676766')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1085, N'Razu Ahmed', CAST(0x543C0B00 AS Date), N'6765756756')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1088, N'Shafiqul Islam', CAST(0x543C0B00 AS Date), N'878787878')
INSERT [dbo].[patient_info] ([patient_id], [patient_name], [patient_dob], [patient_mobile]) VALUES (1091, N'Sotun', CAST(0x543C0B00 AS Date), N'9067878446')
SET IDENTITY_INSERT [dbo].[patient_info] OFF
SET IDENTITY_INSERT [dbo].[test_info] ON 

INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (78, N'DCB-1', CAST(0x333C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (79, N'DCB-1', CAST(0x333C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (80, N'DCB-2', CAST(0x3D3C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (81, N'DCB-2', CAST(0x3D3C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (82, N'DCB-3', CAST(0x4D3C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (83, N'DCB-3', CAST(0x4D3C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (84, N'DCB-4', CAST(0x523C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1078, N'DCB-5', CAST(0x533C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1079, N'DCB-6', CAST(0x533C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1080, N'DCB-6', CAST(0x533C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1081, N'DCB-6', CAST(0x533C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1082, N'DCB-6', CAST(0x533C0B00 AS Date), N'X-Ray LS Spine', CAST(500 AS Decimal(18, 0)), N'X-Ray')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1083, N'DCB-7', CAST(0x533C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1084, N'DCB-8', CAST(0x533C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1085, N'DCB-9', CAST(0x533C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1086, N'DCB-10', CAST(0x533C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1087, N'DCB-11', CAST(0x533C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1088, N'DCB-12', CAST(0x533C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1089, N'DCB-13', CAST(0x533C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1090, N'DCB-14', CAST(0x533C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1091, N'DCB-15', CAST(0x543C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1092, N'DCB-16', CAST(0x543C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1093, N'DCB-17', CAST(0x543C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1094, N'DCB-18', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1095, N'DCB-19', CAST(0x543C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1096, N'DCB-20', CAST(0x543C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1097, N'DCB-20', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1098, N'DCB-21', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1099, N'DCB-22', CAST(0x543C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1100, N'DCB-23', CAST(0x543C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1101, N'DCB-24', CAST(0x543C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1102, N'DCB-24', CAST(0x543C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1103, N'DCB-25', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1104, N'DCB-26', CAST(0x543C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1105, N'DCB-26', CAST(0x543C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1106, N'DCB-27', CAST(0x543C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1107, N'DCB-27', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1108, N'DCB-28', CAST(0x543C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1109, N'DCB-28', CAST(0x543C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1110, N'DCB-29', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1111, N'DCB-30', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1112, N'DCB-31', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1113, N'DCB-32', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1114, N'DCB-33', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1115, N'DCB-34', CAST(0x543C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1116, N'DCB-35', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1117, N'DCB-36', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1118, N'DCB-37', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1119, N'DCB-38', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1120, N'DCB-39', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1121, N'DCB-39', CAST(0x543C0B00 AS Date), N'X-Ray LS Spine', CAST(500 AS Decimal(18, 0)), N'X-Ray')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1122, N'DCB-40', CAST(0x543C0B00 AS Date), N'X-Ray LS Spine', CAST(500 AS Decimal(18, 0)), N'X-Ray')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1123, N'DCB-41', CAST(0x543C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1124, N'DCB-42', CAST(0x543C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1125, N'DCB-43', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1126, N'DCB-44', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1127, N'DCB-45', CAST(0x543C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1128, N'DCB-46', CAST(0x573C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1129, N'DCB-46', CAST(0x573C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1130, N'DCB-46', CAST(0x573C0B00 AS Date), N'X-Ray LS Spine', CAST(500 AS Decimal(18, 0)), N'X-Ray')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1131, N'DCB-46', CAST(0x573C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1132, N'DCB-47', CAST(0x573C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1133, N'DCB-47', CAST(0x573C0B00 AS Date), N'X-Ray LS Spine', CAST(500 AS Decimal(18, 0)), N'X-Ray')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1134, N'DCB-48', CAST(0x573C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1135, N'DCB-49', CAST(0x573C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1136, N'DCB-50', CAST(0x573C0B00 AS Date), N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1137, N'DCB-51', CAST(0x573C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1138, N'DCB-52', CAST(0x573C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1139, N'DCB-53', CAST(0x573C0B00 AS Date), N'X-Ray LS Spine', CAST(500 AS Decimal(18, 0)), N'X-Ray')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1140, N'DCB-54', CAST(0x573C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1141, N'DCB-55', CAST(0x573C0B00 AS Date), N'X-Ray LS Spine', CAST(500 AS Decimal(18, 0)), N'X-Ray')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1142, N'DCB-56', CAST(0x573C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1143, N'DCB-57', CAST(0x573C0B00 AS Date), N'X-Ray LS Spine', CAST(500 AS Decimal(18, 0)), N'X-Ray')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1144, N'DCB-58', CAST(0x573C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1145, N'DCB-59', CAST(0x573C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1146, N'DCB-60', CAST(0x573C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1147, N'DCB-61', CAST(0x573C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1148, N'DCB-62', CAST(0x573C0B00 AS Date), N'X-Ray LS Spine', CAST(500 AS Decimal(18, 0)), N'X-Ray')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1149, N'DCB-63', CAST(0x573C0B00 AS Date), N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_info] ([id], [bill_id], [test_date], [test_name], [test_fee], [test_type_name]) VALUES (1150, N'DCB-64', CAST(0x573C0B00 AS Date), N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
SET IDENTITY_INSERT [dbo].[test_info] OFF
SET IDENTITY_INSERT [dbo].[test_setup] ON 

INSERT [dbo].[test_setup] ([test_id], [test_name], [test_fee], [test_type_name]) VALUES (4, N'Blood Test', CAST(200 AS Decimal(18, 0)), N'Blood')
INSERT [dbo].[test_setup] ([test_id], [test_name], [test_fee], [test_type_name]) VALUES (3, N'Laser Hair Removal', CAST(1000 AS Decimal(18, 0)), N'Skin')
INSERT [dbo].[test_setup] ([test_id], [test_name], [test_fee], [test_type_name]) VALUES (2, N'Urine CS-200', CAST(300 AS Decimal(18, 0)), N'Urine')
INSERT [dbo].[test_setup] ([test_id], [test_name], [test_fee], [test_type_name]) VALUES (1, N'X-Ray LS Spine', CAST(500 AS Decimal(18, 0)), N'X-Ray')
SET IDENTITY_INSERT [dbo].[test_setup] OFF
SET IDENTITY_INSERT [dbo].[test_type_setup] ON 

INSERT [dbo].[test_type_setup] ([test_type_id], [test_type_name]) VALUES (1, N'Blood')
INSERT [dbo].[test_type_setup] ([test_type_id], [test_type_name]) VALUES (2, N'Skin')
INSERT [dbo].[test_type_setup] ([test_type_id], [test_type_name]) VALUES (3, N'X-Ray')
INSERT [dbo].[test_type_setup] ([test_type_id], [test_type_name]) VALUES (4, N'Urine')
INSERT [dbo].[test_type_setup] ([test_type_id], [test_type_name]) VALUES (5, N'Kidney')
SET IDENTITY_INSERT [dbo].[test_type_setup] OFF
/****** Object:  Index [UQ__bill_inf__3213E83E39C3C602]    Script Date: 1/16/2017 1:27:39 AM ******/
ALTER TABLE [dbo].[bill_info] ADD UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__patient___4D5CE47707A0403A]    Script Date: 1/16/2017 1:27:39 AM ******/
ALTER TABLE [dbo].[patient_info] ADD UNIQUE NONCLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__test_set__F3FF1C0362F8A1F7]    Script Date: 1/16/2017 1:27:39 AM ******/
ALTER TABLE [dbo].[test_setup] ADD UNIQUE NONCLUSTERED 
(
	[test_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [testSetupKey]    Script Date: 1/16/2017 1:27:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [testSetupKey] ON [dbo].[test_setup]
(
	[test_name] ASC,
	[test_fee] ASC,
	[test_type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__test_typ__56DCFA20A4B39101]    Script Date: 1/16/2017 1:27:39 AM ******/
ALTER TABLE [dbo].[test_type_setup] ADD UNIQUE NONCLUSTERED 
(
	[test_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bill_info]  WITH CHECK ADD  CONSTRAINT [fk_Bill_Patient] FOREIGN KEY([patient_mobile])
REFERENCES [dbo].[patient_info] ([patient_mobile])
GO
ALTER TABLE [dbo].[bill_info] CHECK CONSTRAINT [fk_Bill_Patient]
GO
ALTER TABLE [dbo].[test_info]  WITH CHECK ADD  CONSTRAINT [fk_TestInfo_Bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill_info] ([bill_id])
GO
ALTER TABLE [dbo].[test_info] CHECK CONSTRAINT [fk_TestInfo_Bill]
GO
ALTER TABLE [dbo].[test_info]  WITH CHECK ADD  CONSTRAINT [fk_TestInfo_TestSetup] FOREIGN KEY([test_name], [test_fee], [test_type_name])
REFERENCES [dbo].[test_setup] ([test_name], [test_fee], [test_type_name])
GO
ALTER TABLE [dbo].[test_info] CHECK CONSTRAINT [fk_TestInfo_TestSetup]
GO
ALTER TABLE [dbo].[test_setup]  WITH CHECK ADD  CONSTRAINT [fk_Test_TestType] FOREIGN KEY([test_type_name])
REFERENCES [dbo].[test_type_setup] ([test_type_name])
GO
ALTER TABLE [dbo].[test_setup] CHECK CONSTRAINT [fk_Test_TestType]
GO
USE [master]
GO
ALTER DATABASE [DCBMS] SET  READ_WRITE 
GO
