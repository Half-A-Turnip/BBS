USE [master]
GO
/****** Object:  Database [BBS]    Script Date: 2017/5/19 22:47:29 ******/
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
/****** Object:  Table [dbo].[accountExpend]    Script Date: 2017/5/19 22:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accountExpend](
	[accountId] [int] IDENTITY(1,1) NOT NULL,
	[accountDay] [date] NOT NULL,
	[acountExpendNum] [nvarchar](50) NOT NULL,
	[account] [int] NOT NULL,
 CONSTRAINT [PK_accountExpend] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[admin]    Script Date: 2017/5/19 22:47:29 ******/
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
/****** Object:  Table [dbo].[adminDays]    Script Date: 2017/5/19 22:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[adminDays](
	[adminDayId] [int] IDENTITY(1,1) NOT NULL,
	[adminId] [int] NOT NULL,
	[adminDays] [varchar](50) NOT NULL,
	[adminIsLeave] [int] NOT NULL,
 CONSTRAINT [PK_adminDays] PRIMARY KEY CLUSTERED 
(
	[adminDayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[adminLeave]    Script Date: 2017/5/19 22:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adminLeave](
	[adminLeaveId] [int] IDENTITY(1,1) NOT NULL,
	[adminId] [int] NOT NULL,
	[adminLeaveDaysStart] [datetime] NOT NULL,
	[adminLeaveResult] [datetime] NOT NULL,
	[adminComeDaysStart] [datetime] NOT NULL,
	[adminLeaveDaysEnd] [datetime] NOT NULL,
	[adminComeDaysEnd] [datetime] NOT NULL,
 CONSTRAINT [PK_adminLeave] PRIMARY KEY CLUSTERED 
(
	[adminLeaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[adminType]    Script Date: 2017/5/19 22:47:29 ******/
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
/****** Object:  Table [dbo].[come]    Script Date: 2017/5/19 22:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[come](
	[comeId] [int] IDENTITY(1,1) NOT NULL,
	[comeIp] [varchar](50) NOT NULL,
	[comeExpend] [varchar](50) NOT NULL,
	[comeTime] [datetime] NOT NULL,
	[comeCan] [int] NOT NULL,
 CONSTRAINT [PK_come] PRIMARY KEY CLUSTERED 
(
	[comeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[expend]    Script Date: 2017/5/19 22:47:29 ******/
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
	[expendAdmin] [varchar](50) NOT NULL,
	[expendInfo] [varchar](500) NOT NULL,
 CONSTRAINT [PK_expend] PRIMARY KEY CLUSTERED 
(
	[expendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sensitive]    Script Date: 2017/5/19 22:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sensitive](
	[sensitiveId] [int] IDENTITY(1,1) NOT NULL,
	[sensitiveName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_sensitive] PRIMARY KEY CLUSTERED 
(
	[sensitiveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[title]    Script Date: 2017/5/19 22:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[title](
	[titleId] [int] IDENTITY(1,1) NOT NULL,
	[titleName] [varchar](50) NOT NULL,
	[titleExpend] [varchar](50) NOT NULL,
	[titleState] [varchar](50) NOT NULL,
	[titleAuthorId] [int] NOT NULL,
	[titleTime] [datetime] NOT NULL,
	[titleBody] [text] NOT NULL,
	[titleReaded] [int] NOT NULL,
	[titleAdminId] [int] NULL,
 CONSTRAINT [PK_title] PRIMARY KEY CLUSTERED 
(
	[titleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[titleState]    Script Date: 2017/5/19 22:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[titleState](
	[titleStateId] [int] IDENTITY(1,1) NOT NULL,
	[titleStateName] [varchar](50) NOT NULL,
	[titleStateNum] [varchar](50) NOT NULL,
 CONSTRAINT [PK_titleState] PRIMARY KEY CLUSTERED 
(
	[titleStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userOnly]    Script Date: 2017/5/19 22:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userOnly](
	[userOnlyid] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[userphone] [decimal](11, 0) NOT NULL,
	[userstatus] [varchar](50) NOT NULL,
	[userpwd] [varchar](50) NOT NULL,
 CONSTRAINT [PK_userP] PRIMARY KEY CLUSTERED 
(
	[userOnlyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userType]    Script Date: 2017/5/19 22:47:29 ******/
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
SET IDENTITY_INSERT [dbo].[accountExpend] ON 

INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (1, CAST(0xC53C0B00 AS Date), N'101', 300)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (2, CAST(0xC63C0B00 AS Date), N'101', 400)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (3, CAST(0xC73C0B00 AS Date), N'101', 800)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (4, CAST(0xC83C0B00 AS Date), N'101', 1000)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (5, CAST(0xC93C0B00 AS Date), N'101', 1100)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (6, CAST(0xC53C0B00 AS Date), N'102', 400)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (7, CAST(0xC63C0B00 AS Date), N'102', 800)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (8, CAST(0xC73C0B00 AS Date), N'102', 900)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (9, CAST(0xC83C0B00 AS Date), N'102', 1200)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (10, CAST(0xC93C0B00 AS Date), N'102', 1300)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (11, CAST(0xC53C0B00 AS Date), N'103', 1000)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (12, CAST(0xC63C0B00 AS Date), N'103', 1100)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (13, CAST(0xC73C0B00 AS Date), N'103', 800)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (14, CAST(0xC83C0B00 AS Date), N'103', 900)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (15, CAST(0xC93C0B00 AS Date), N'103', 1400)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (16, CAST(0xC53C0B00 AS Date), N'104', 1300)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (17, CAST(0xC63C0B00 AS Date), N'104', 1400)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (18, CAST(0xC73C0B00 AS Date), N'104', 1500)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (19, CAST(0xC83C0B00 AS Date), N'104', 1700)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (20, CAST(0xC93C0B00 AS Date), N'104', 1500)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (21, CAST(0xC53C0B00 AS Date), N'105', 600)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (22, CAST(0xC63C0B00 AS Date), N'105', 1200)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (23, CAST(0xC73C0B00 AS Date), N'105', 1400)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (24, CAST(0xC83C0B00 AS Date), N'105', 2100)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (25, CAST(0xC93C0B00 AS Date), N'105', 1800)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (30, CAST(0xCA3C0B00 AS Date), N'102', 3600)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (31, CAST(0xCA3C0B00 AS Date), N'101', 2500)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (32, CAST(0xCA3C0B00 AS Date), N'186', 0)
INSERT [dbo].[accountExpend] ([accountId], [accountDay], [acountExpendNum], [account]) VALUES (33, CAST(0xCA3C0B00 AS Date), N'186', 0)
SET IDENTITY_INSERT [dbo].[accountExpend] OFF
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([adminid], [adminname], [adminpwd], [adminphone], [adminadress], [adminexpend], [status], [adminemail]) VALUES (1, N'zsk', N'zsk123456789', CAST(15669060698 AS Decimal(11, 0)), N'黄山学院', 101, 1, N'1456907177@qq.com')
INSERT [dbo].[admin] ([adminid], [adminname], [adminpwd], [adminphone], [adminadress], [adminexpend], [status], [adminemail]) VALUES (1001, N'zsk1', N'zsk123456', CAST(15669060697 AS Decimal(11, 0)), N'dddd', 102, 2, N'1456907177@qq.com')
INSERT [dbo].[admin] ([adminid], [adminname], [adminpwd], [adminphone], [adminadress], [adminexpend], [status], [adminemail]) VALUES (1002, N'zsk2', N'zsk123456', CAST(15669060699 AS Decimal(11, 0)), N'dddd', 103, 3, N'1456907177@qq.com')
INSERT [dbo].[admin] ([adminid], [adminname], [adminpwd], [adminphone], [adminadress], [adminexpend], [status], [adminemail]) VALUES (1003, N'zsk3', N'zsk123456', CAST(15669060678 AS Decimal(11, 0)), N'dddd', 102, 4, N'1456907177@qq.com')
INSERT [dbo].[admin] ([adminid], [adminname], [adminpwd], [adminphone], [adminadress], [adminexpend], [status], [adminemail]) VALUES (1007, N'zsjkh', N'4567456', CAST(8678 AS Decimal(11, 0)), N'4568546', 101, 5, N'748488@qq.com')
INSERT [dbo].[admin] ([adminid], [adminname], [adminpwd], [adminphone], [adminadress], [adminexpend], [status], [adminemail]) VALUES (1008, N'djkh', N'1574656', CAST(78956165 AS Decimal(11, 0)), N'45453', 102, 5, N'48674564894@qq.com')
INSERT [dbo].[admin] ([adminid], [adminname], [adminpwd], [adminphone], [adminadress], [adminexpend], [status], [adminemail]) VALUES (1013, N'zsk111', N'123456', CAST(15669060698 AS Decimal(11, 0)), N'黄山学院', 101, 2, N'1456907177@qq.com')
INSERT [dbo].[admin] ([adminid], [adminname], [adminpwd], [adminphone], [adminadress], [adminexpend], [status], [adminemail]) VALUES (1014, N'zsk12', N'123456', CAST(15669060677 AS Decimal(11, 0)), N'黄山学院', 101, 3, N'1456907187@qq.com')
INSERT [dbo].[admin] ([adminid], [adminname], [adminpwd], [adminphone], [adminadress], [adminexpend], [status], [adminemail]) VALUES (1015, N'张舒康', N'123456', CAST(15669085698 AS Decimal(11, 0)), N'黄山学院', 101, 2, N'145690777@qq.com')
INSERT [dbo].[admin] ([adminid], [adminname], [adminpwd], [adminphone], [adminadress], [adminexpend], [status], [adminemail]) VALUES (1016, N'画江湖', N'123456', CAST(15488986466 AS Decimal(11, 0)), N'黄', 101, 3, N'4897645@qq.com')
SET IDENTITY_INSERT [dbo].[admin] OFF
INSERT [dbo].[adminType] ([adminTypeid], [statusName]) VALUES (1, N'超级管理员')
INSERT [dbo].[adminType] ([adminTypeid], [statusName]) VALUES (2, N'版区管理员')
INSERT [dbo].[adminType] ([adminTypeid], [statusName]) VALUES (3, N'高级管理员')
INSERT [dbo].[adminType] ([adminTypeid], [statusName]) VALUES (4, N'普通管理员')
INSERT [dbo].[adminType] ([adminTypeid], [statusName]) VALUES (5, N'实习管理员')
SET IDENTITY_INSERT [dbo].[come] ON 

INSERT [dbo].[come] ([comeId], [comeIp], [comeExpend], [comeTime], [comeCan]) VALUES (1, N'192.168.0.1', N'101', CAST(0x0000A76F00CB3F40 AS DateTime), 0)
INSERT [dbo].[come] ([comeId], [comeIp], [comeExpend], [comeTime], [comeCan]) VALUES (2, N'192.168.0.2', N'102', CAST(0x0000A76B00C5C100 AS DateTime), 1)
INSERT [dbo].[come] ([comeId], [comeIp], [comeExpend], [comeTime], [comeCan]) VALUES (3, N'192.168.0.3', N'103', CAST(0x0000A76C00000000 AS DateTime), 1)
INSERT [dbo].[come] ([comeId], [comeIp], [comeExpend], [comeTime], [comeCan]) VALUES (4, N'192.168.0.4', N'104', CAST(0x0000A76D00000000 AS DateTime), 0)
INSERT [dbo].[come] ([comeId], [comeIp], [comeExpend], [comeTime], [comeCan]) VALUES (5, N'192.168.0.5', N'105', CAST(0x0000A76C00000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[come] OFF
SET IDENTITY_INSERT [dbo].[expend] ON 

INSERT [dbo].[expend] ([expendId], [expendName], [expendNum], [expendAdmin], [expendInfo]) VALUES (1, N'测试版区1', N'101', N'zsk', N'我只是一个测试消')
INSERT [dbo].[expend] ([expendId], [expendName], [expendNum], [expendAdmin], [expendInfo]) VALUES (2, N'测试版区2', N'102', N'admin2', N'我就是一个测试数据 你能拿我咋样')
INSERT [dbo].[expend] ([expendId], [expendName], [expendNum], [expendAdmin], [expendInfo]) VALUES (1021, N'测试版区3', N'103', N'zsk', N'我就是一个测试')
INSERT [dbo].[expend] ([expendId], [expendName], [expendNum], [expendAdmin], [expendInfo]) VALUES (1022, N'测试版区4', N'104', N'zsk', N'我就是一个测试')
INSERT [dbo].[expend] ([expendId], [expendName], [expendNum], [expendAdmin], [expendInfo]) VALUES (1023, N'测试版区5', N'105', N'zsk', N'我就是一个测试')
INSERT [dbo].[expend] ([expendId], [expendName], [expendNum], [expendAdmin], [expendInfo]) VALUES (1024, N'测试版区6', N'186', N'zsk', N'测试')
SET IDENTITY_INSERT [dbo].[expend] OFF
SET IDENTITY_INSERT [dbo].[sensitive] ON 

INSERT [dbo].[sensitive] ([sensitiveId], [sensitiveName]) VALUES (2, N'傻恩恩')
INSERT [dbo].[sensitive] ([sensitiveId], [sensitiveName]) VALUES (3, N'傻比')
INSERT [dbo].[sensitive] ([sensitiveId], [sensitiveName]) VALUES (4, N'SB')
INSERT [dbo].[sensitive] ([sensitiveId], [sensitiveName]) VALUES (5, N'你妈妈')
INSERT [dbo].[sensitive] ([sensitiveId], [sensitiveName]) VALUES (6, N'你麻痹')
SET IDENTITY_INSERT [dbo].[sensitive] OFF
SET IDENTITY_INSERT [dbo].[title] ON 

INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (3, N'毕业快要开始的了', N'102', N'105', 1001, CAST(0x0000A77600000000 AS DateTime), N'分散打hi胡覅可视高度副科级电话客服提供哈撒给辅导员跟不上的房价很高好久卡萨丁 ', 122002, 1001)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (4, N'我就是个测试文章', N'103', N'105', 1005, CAST(0x0000A77300000000 AS DateTime), N'个uyasefdgyuastgdfhjkTGyjfasbvjdhftga遇到是不符合静安寺通过发哈少部分待会捐个爱神的箭客服部好久啊是割发代首', 1564561, 1001)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (5, N'我还是个测试的东西 ', N'102', N'104', 1001, CAST(0x0000A76D00000000 AS DateTime), N'45645645646456745维护完全和结果', 56485, 1002)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (7, N'我在来一次测试 我就试试', N'103', N'104', 1012, CAST(0x0000A7C700000000 AS DateTime), N'456489456489', 4546, 1002)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (8, N'啊手机看大概价格', N'101', N'102', 1013, CAST(0x0000A77100000000 AS DateTime), N'多个高哎估计开了个高好久卡萨丁礼金卡谁动了尽快', 45989, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (12, N'asdkjhyih i', N'101', N'101', 1013, CAST(0x0000A77100000000 AS DateTime), N'hgsdagjkgsadjghjstgadhj ', 457896, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (13, N'yhiwqehitgweq ', N'101', N'102', 1013, CAST(0x0000A77100000000 AS DateTime), N'hijsdhjbk ', 455468, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (14, N'hgiuweqouy', N'102', N'102', 1013, CAST(0x0000A77500000000 AS DateTime), N'jhiosdhejok', 41567465, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (15, N'测试html', N'102', N'102', 1001, CAST(0x0000A49C00000000 AS DateTime), N'<p>我就是个测试用例我也不知道我是谢什么的的还睡觉</p><div style="color:red">我是一段红色的字你们喜欢看我吗</div>', 0, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (1011, N'斯蒂芬斯蒂芬', N'101', N'105', 1001, CAST(0x0000A77800000000 AS DateTime), N'<p>似懂非懂思维方式防守打法是电饭锅水电费是的是电饭锅是电饭锅是电饭锅是的</p>', 0, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (1012, N'gdshugfjashdgfhj sd', N'103', N'105', 1001, CAST(0x0000A77800000000 AS DateTime), N'<p>?sdgfasdfijhasdkflnh sdgf?<br></p>', 0, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (1013, N'地方撒地方', N'103', N'105', 1001, CAST(0x0000A77800000000 AS DateTime), N'<p>阿萨是打发斯蒂芬阿什顿发水电费阿什顿发阿什顿发阿什顿发阿什顿发</p>', 0, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (1014, N'发我发誓 ', N'101', N'105', 1001, CAST(0x0000A77800000000 AS DateTime), N'<p>发的发生发斯蒂芬阿什顿发阿什顿发水电费阿什顿发阿萨德</p>', 0, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (1015, N'dsadasdasdasdas', N'101', N'105', 1001, CAST(0x0000A77800000000 AS DateTime), N'<p>asdadasdasdadasdasdasD ASSDF?</p>', 0, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (1016, N'dfwefs', N'102', N'105', 1001, CAST(0x0000A77800000000 AS DateTime), N'<p>dsfsdfasdfasrfwer fsdfcarfwe asdfawqerwe</p>', 0, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (1017, N'dfwefs', N'102', N'105', 1001, CAST(0x0000A77800000000 AS DateTime), N'<p>dsfsdfasdfasrfwer fsdfcarfwe asdfawqerw你妈妈</p>', 0, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (1018, N'到底', N'103', N'105', 1001, CAST(0x0000A77800000000 AS DateTime), N'<p>你妈妈萨达大所多阿萨德按时阿萨德按时</p>', 0, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (1019, N'阿萨德撒', N'101', N'105', 1001, CAST(0x0000A77800000000 AS DateTime), N'<p>阿萨德撒多</p>', 0, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (1020, N'阿萨德撒', N'101', N'105', 1001, CAST(0x0000A77800000000 AS DateTime), N'<p>阿萨德撒多你妈妈</p>', 0, 1)
INSERT [dbo].[title] ([titleId], [titleName], [titleExpend], [titleState], [titleAuthorId], [titleTime], [titleBody], [titleReaded], [titleAdminId]) VALUES (1021, N'阿萨德撒多', N'103', N'105', 1001, CAST(0x0000A77800000000 AS DateTime), N'<p>实打实大所大所阿萨德啊 你妈妈</p>', 0, 1)
SET IDENTITY_INSERT [dbo].[title] OFF
SET IDENTITY_INSERT [dbo].[titleState] ON 

INSERT [dbo].[titleState] ([titleStateId], [titleStateName], [titleStateNum]) VALUES (1, N'未审核', N'101')
INSERT [dbo].[titleState] ([titleStateId], [titleStateName], [titleStateNum]) VALUES (2, N'已审核', N'102')
INSERT [dbo].[titleState] ([titleStateId], [titleStateName], [titleStateNum]) VALUES (3, N'普通', N'103')
INSERT [dbo].[titleState] ([titleStateId], [titleStateName], [titleStateNum]) VALUES (4, N'加精', N'104')
INSERT [dbo].[titleState] ([titleStateId], [titleStateName], [titleStateNum]) VALUES (5, N'置顶', N'105')
SET IDENTITY_INSERT [dbo].[titleState] OFF
SET IDENTITY_INSERT [dbo].[userOnly] ON 

INSERT [dbo].[userOnly] ([userOnlyid], [username], [userphone], [userstatus], [userpwd]) VALUES (1001, N'张勤宝', CAST(15669060697 AS Decimal(11, 0)), N'102', N'156655655655')
INSERT [dbo].[userOnly] ([userOnlyid], [username], [userphone], [userstatus], [userpwd]) VALUES (1005, N'啊啊啊', CAST(456456 AS Decimal(11, 0)), N'103', N'bs123456')
INSERT [dbo].[userOnly] ([userOnlyid], [username], [userphone], [userstatus], [userpwd]) VALUES (1012, N'张总', CAST(15669060699 AS Decimal(11, 0)), N'101', N'123456')
INSERT [dbo].[userOnly] ([userOnlyid], [username], [userphone], [userstatus], [userpwd]) VALUES (1013, N'张', CAST(15888889999 AS Decimal(11, 0)), N'101', N'bs123456')
INSERT [dbo].[userOnly] ([userOnlyid], [username], [userphone], [userstatus], [userpwd]) VALUES (1014, N'1232456', CAST(15669060698 AS Decimal(11, 0)), N'101', N'123456')
SET IDENTITY_INSERT [dbo].[userOnly] OFF
INSERT [dbo].[userType] ([userTypeid], [userStatus], [userACount]) VALUES (101, N'一级', 20)
INSERT [dbo].[userType] ([userTypeid], [userStatus], [userACount]) VALUES (102, N'二级', 60)
INSERT [dbo].[userType] ([userTypeid], [userStatus], [userACount]) VALUES (103, N'三级', 200)
INSERT [dbo].[userType] ([userTypeid], [userStatus], [userACount]) VALUES (104, N'四级', 300)
ALTER TABLE [dbo].[expend]  WITH CHECK ADD  CONSTRAINT [FK_expend_expend] FOREIGN KEY([expendId])
REFERENCES [dbo].[expend] ([expendId])
GO
ALTER TABLE [dbo].[expend] CHECK CONSTRAINT [FK_expend_expend]
GO
USE [master]
GO
ALTER DATABASE [BBS] SET  READ_WRITE 
GO
