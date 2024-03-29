USE [master]
GO
/****** Object:  Database [BBS]    Script Date: 2017/5/2 11:13:14 ******/
CREATE DATABASE [BBS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BBS', FILENAME = N'D:\程序\sql\MSSQL11.MSSQLSERVER\MSSQL\DATA\BBS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BBS_log', FILENAME = N'D:\程序\sql\MSSQL11.MSSQLSERVER\MSSQL\DATA\BBS_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BBS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BBS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BBS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BBS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BBS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BBS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BBS] SET ARITHABORT OFF 
GO
ALTER DATABASE [BBS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BBS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BBS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BBS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BBS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BBS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BBS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BBS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BBS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BBS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BBS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BBS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BBS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BBS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BBS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BBS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BBS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BBS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BBS] SET RECOVERY FULL 
GO
ALTER DATABASE [BBS] SET  MULTI_USER 
GO
ALTER DATABASE [BBS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BBS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BBS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BBS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BBS', N'ON'
GO
USE [BBS]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 2017/5/2 11:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[adminid] [int] IDENTITY(1,1) NOT NULL,
	[adminname] [nvarchar](50) NOT NULL,
	[adminpwd] [nvarchar](50) NOT NULL,
	[adminphone] [decimal](11, 0) NOT NULL,
	[adminadress] [nvarchar](50) NULL,
	[adminexpend] [int] NOT NULL,
	[status] [int] NULL,
	[adminemail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[adminid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[adminType]    Script Date: 2017/5/2 11:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[adminType](
	[adminTypeid] [int] NOT NULL,
	[statusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_adminType] PRIMARY KEY CLUSTERED 
(
	[adminTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[expend]    Script Date: 2017/5/2 11:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[expend](
	[expendId] [int] IDENTITY(1,1) NOT NULL,
	[expendName] [varchar](50) NOT NULL,
	[expendNum] [varchar](50) NOT NULL,
	[expendCount] [int] NOT NULL,
	[expendAdmin] [varchar](50) NOT NULL,
	[expendInfo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_expend] PRIMARY KEY CLUSTERED 
(
	[expendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 2017/5/2 11:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[userid] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[userpwd] [varchar](50) NOT NULL,
	[userstatus] [varchar](50) NOT NULL,
	[userphone] [varchar](50) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userType]    Script Date: 2017/5/2 11:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userType](
	[userTypeid] [int] NOT NULL,
	[userStatus] [varchar](50) NOT NULL,
	[userACount] [int] NOT NULL,
 CONSTRAINT [PK_userType] PRIMARY KEY CLUSTERED 
(
	[userTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([adminid], [adminname], [adminpwd], [adminphone], [adminadress], [adminexpend], [status], [adminemail]) VALUES (1, N'zsk', N'zsk123456', CAST(15669060698 AS Decimal(11, 0)), N'黄山学院26', 101, 1, N'1456907177@qq.com')
SET IDENTITY_INSERT [dbo].[admin] OFF
INSERT [dbo].[adminType] ([adminTypeid], [statusName]) VALUES (1, N'超级管理员')
INSERT [dbo].[adminType] ([adminTypeid], [statusName]) VALUES (2, N'版区管理员')
INSERT [dbo].[adminType] ([adminTypeid], [statusName]) VALUES (3, N'高级管理员')
INSERT [dbo].[adminType] ([adminTypeid], [statusName]) VALUES (4, N'普通管理员')
INSERT [dbo].[adminType] ([adminTypeid], [statusName]) VALUES (5, N'实习管理员')
SET IDENTITY_INSERT [dbo].[expend] ON 

INSERT [dbo].[expend] ([expendId], [expendName], [expendNum], [expendCount], [expendAdmin], [expendInfo]) VALUES (1, N'测试版区1', N'101', 2500, N'admin1', N'我只是一个测试消息')
INSERT [dbo].[expend] ([expendId], [expendName], [expendNum], [expendCount], [expendAdmin], [expendInfo]) VALUES (2, N'测试版区2', N'102', 3600, N'admin2', N'我就是一个测试数据 你能拿我咋样')
INSERT [dbo].[expend] ([expendId], [expendName], [expendNum], [expendCount], [expendAdmin], [expendInfo]) VALUES (3, N'测试版区3', N'103', 3600, N'admin3', N'都不会接收到很骄傲股东会尽快挂接收到就就肯定很舒服')
SET IDENTITY_INSERT [dbo].[expend] OFF
USE [master]
GO
ALTER DATABASE [BBS] SET  READ_WRITE 
GO
