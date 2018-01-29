USE [master]
GO
/****** Object:  Database [AlarmCenterV63]    Script Date: 01/18/2018 18:04:16 ******/
CREATE DATABASE [AlarmCenterV63] ON  PRIMARY 
( NAME = N'AlarmCenterV63_Data', FILENAME = N'D:\AlarmCenterV6.3\Data\AlarmCenterV63.MDF' , SIZE = 320832KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'AlarmCenterV63_Log', FILENAME = N'D:\AlarmCenterV6.3\Data\AlarmCenterV63_1.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AlarmCenterV63] SET COMPATIBILITY_LEVEL = 80
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlarmCenterV63].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [AlarmCenterV63] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [AlarmCenterV63] SET ANSI_NULLS OFF
GO
ALTER DATABASE [AlarmCenterV63] SET ANSI_PADDING OFF
GO
ALTER DATABASE [AlarmCenterV63] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [AlarmCenterV63] SET ARITHABORT OFF
GO
ALTER DATABASE [AlarmCenterV63] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [AlarmCenterV63] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [AlarmCenterV63] SET AUTO_SHRINK ON
GO
ALTER DATABASE [AlarmCenterV63] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [AlarmCenterV63] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [AlarmCenterV63] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [AlarmCenterV63] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [AlarmCenterV63] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [AlarmCenterV63] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [AlarmCenterV63] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [AlarmCenterV63] SET  DISABLE_BROKER
GO
ALTER DATABASE [AlarmCenterV63] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [AlarmCenterV63] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [AlarmCenterV63] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [AlarmCenterV63] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [AlarmCenterV63] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [AlarmCenterV63] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [AlarmCenterV63] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [AlarmCenterV63] SET  READ_WRITE
GO
ALTER DATABASE [AlarmCenterV63] SET RECOVERY SIMPLE
GO
ALTER DATABASE [AlarmCenterV63] SET  MULTI_USER
GO
ALTER DATABASE [AlarmCenterV63] SET PAGE_VERIFY NONE
GO
ALTER DATABASE [AlarmCenterV63] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlarmCenterV63', N'ON'
GO
USE [AlarmCenterV63]
GO
/****** Object:  Table [dbo].[WXSetting]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WXSetting](
	[WID] [int] IDENTITY(1,1) NOT NULL,
	[IsUse] [int] NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[Pwd] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](50) NOT NULL,
	[Token] [nvarchar](50) NOT NULL,
	[Port] [int] NOT NULL,
	[FirstLine] [nvarchar](50) NULL,
	[LastLine] [nvarchar](50) NULL,
	[PlatName] [nvarchar](50) NULL,
	[AreaCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_WXSetting] PRIMARY KEY CLUSTERED 
(
	[WID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO[Unumber]
/****** Object:  Table [dbo].[WarrantyInfo]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarrantyInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [int] NOT NULL,
	[WarrantyNo] [nvarchar](50) NOT NULL,
	[WarrantyName] [nvarchar](50) NULL,
	[WarrantyDescription] [nvarchar](1000) NULL,
	[CreatTime] [nvarchar](50) NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[MoneyCNY] [float] NULL,
	[Wuser] [nvarchar](50) NULL,
 CONSTRAINT [PK_WarrantyInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[viewConfig]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[viewConfig](
	[VID] [int] IDENTITY(1,1) NOT NULL,
	[Vflag] [int] NOT NULL,
	[Vcontent] [nvarchar](50) NOT NULL,
	[CenterID] [int] NOT NULL,
 CONSTRAINT [PK_viewConfig] PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPay]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPay](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[PUid] [int] NOT NULL,
	[PayTime] [datetime] NULL,
	[PayAmount] [float] NOT NULL,
	[PayOrder] [nvarchar](50) NULL,
	[PServiceTime] [datetime] NULL,
	[PayTotal] [float] NOT NULL,
	[PRemark] [nvarchar](50) NULL,
	[PChannel] [nvarchar](50) NULL,
	[Puser] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserPay] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户资料表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPay', @level2type=N'COLUMN',@level2name=N'PUid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缴费时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPay', @level2type=N'COLUMN',@level2name=N'PayTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缴费金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPay', @level2type=N'COLUMN',@level2name=N'PayAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缴费票据号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPay', @level2type=N'COLUMN',@level2name=N'PayOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务截止时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPay', @level2type=N'COLUMN',@level2name=N'PServiceTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缴费总额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPay', @level2type=N'COLUMN',@level2name=N'PayTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserPay', @level2type=N'COLUMN',@level2name=N'PRemark'
GO
/****** Object:  Table [dbo].[userListColor]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userListColor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[color_type] [nvarchar](50) NOT NULL,
	[BackColor] [int] NOT NULL,
	[ForeColor] [int] NOT NULL,
	[CenterID] [int] NOT NULL,
 CONSTRAINT [PK_userListColor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userFunction]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userFunction](
	[UFid] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [int] NOT NULL,
	[Fid] [int] NOT NULL,
 CONSTRAINT [PK_userFunction] PRIMARY KEY CLUSTERED 
(
	[UFid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userCamera]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userCamera](
	[UCid] [int] IDENTITY(1,1) NOT NULL,
	[Cid] [int] NOT NULL,
	[GNum] [nvarchar](50) NOT NULL,
	[UNum] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userCamera] PRIMARY KEY CLUSTERED 
(
	[UCid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmergencyWarningType]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyWarningType](
	[Tid] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[grade] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmergencyWarningType] PRIMARY KEY CLUSTERED 
(
	[Tid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmergencyWarningLog]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyWarningLog](
	[Lid] [int] IDENTITY(1,1) NOT NULL,
	[SendID] [int] NULL,
	[TimeNum] [int] NULL,
	[SendTime] [nvarchar](50) NULL,
	[SendMark] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmergencyWarningLog] PRIMARY KEY CLUSTERED 
(
	[Lid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmergencyWarningGrade]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyWarningGrade](
	[Gid] [int] IDENTITY(1,1) NOT NULL,
	[Grade] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmergencyWarningGrade] PRIMARY KEY CLUSTERED 
(
	[Gid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmergencyWarning]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyWarning](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[IsUse] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[GradeID] [int] NULL,
	[Area] [int] NULL,
	[CreatTime] [nvarchar](50) NULL,
	[StartDate] [nvarchar](50) NULL,
	[EndDate] [nvarchar](50) NULL,
	[StartTime1] [nvarchar](50) NULL,
	[EndTime1] [nvarchar](50) NULL,
	[AgainTimes1] [int] NULL,
	[StartTime2] [nvarchar](50) NULL,
	[EndTime2] [nvarchar](50) NULL,
	[AgainTimes2] [int] NULL,
	[StartTime3] [nvarchar](50) NULL,
	[EndTime3] [nvarchar](50) NULL,
	[AgainTimes3] [int] NULL,
	[StartTime4] [nvarchar](50) NULL,
	[EndTime4] [nvarchar](50) NULL,
	[AgainTimes4] [int] NULL,
	[Mark] [nvarchar](200) NULL,
 CONSTRAINT [PK_RemotePlaySound] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DefenceType]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefenceType](
	[DTid] [int] IDENTITY(1,1) NOT NULL,
	[Dname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DefenceType] PRIMARY KEY CLUSTERED 
(
	[DTid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[advert]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advert](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[ACompany] [nvarchar](200) NULL,
	[AContacts] [nvarchar](50) NULL,
	[ATelnumber] [nvarchar](50) NULL,
	[AAddress] [nvarchar](200) NULL,
	[AText] [text] NULL,
	[AEndTime] [datetime] NULL,
	[logo_url] [nvarchar](200) NULL,
	[NewInfo] [text] NULL,
	[NoPic1] [nvarchar](200) NULL,
	[NoPic2] [nvarchar](200) NULL,
	[NoPic3] [nvarchar](200) NULL,
	[NoPic4] [nvarchar](200) NULL,
	[NoPic5] [nvarchar](200) NULL,
 CONSTRAINT [PK_advert] PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'advert', @level2type=N'COLUMN',@level2name=N'ACompany'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'advert', @level2type=N'COLUMN',@level2name=N'AContacts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'advert', @level2type=N'COLUMN',@level2name=N'ATelnumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'advert', @level2type=N'COLUMN',@level2name=N'AAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'广告内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'advert', @level2type=N'COLUMN',@level2name=N'AText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'到期日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'advert', @level2type=N'COLUMN',@level2name=N'AEndTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'logo url地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'advert', @level2type=N'COLUMN',@level2name=N'logo_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最新资讯' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'advert', @level2type=N'COLUMN',@level2name=N'NewInfo'
GO
/****** Object:  Table [dbo].[adminUser]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adminUser](
	[Uid] [int] IDENTITY(1,1) NOT NULL,
	[Uname] [nvarchar](50) NOT NULL,
	[Ualias] [nvarchar](50) NULL,
	[Upwd] [nvarchar](50) NOT NULL,
	[UlastTime] [datetime] NOT NULL,
	[UAddTime] [datetime] NOT NULL,
	[CenterID] [int] NOT NULL,
	[IsUser] [int] NOT NULL,
 CONSTRAINT [PK_adminUser] PRIMARY KEY CLUSTERED 
(
	[Uid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactID]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactID](
	[事件代码] [nvarchar](50) NULL,
	[事件描述] [nvarchar](50) NULL,
	[辅助信息] [nvarchar](50) NULL,
	[是否发声] [bit] NOT NULL,
	[提示声音] [nvarchar](50) NULL,
	[前景颜色] [int] NULL,
	[背景颜色] [int] NULL,
	[监控联动] [bit] NOT NULL,
	[是否显示] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContacterMessage]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContacterMessage](
	[CMid] [int] IDENTITY(1,1) NOT NULL,
	[UCid] [int] NOT NULL,
	[Mid] [int] NOT NULL,
 CONSTRAINT [PK_ContacterMessage] PRIMARY KEY CLUSTERED 
(
	[CMid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacter]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacter](
	[Cid] [int] IDENTITY(1,1) NOT NULL,
	[Contacter] [nvarchar](50) NOT NULL,
	[CPwd] [nvarchar](50) NOT NULL,
	[Ctel] [nvarchar](50) NOT NULL,
	[Crandom] [nvarchar](50) NULL,
 CONSTRAINT [PK_Contacter] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Construct]    Script Date: 01/18/2018 18:04:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Construct](
	[Cid] [int] IDENTITY(1,1) NOT NULL,
	[Ccompany] [nvarchar](50) NULL,
 CONSTRAINT [PK_Construct] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMSConfig]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSConfig](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[Stype] [int] NOT NULL,
	[Suser] [nvarchar](50) NOT NULL,
	[Spwd] [nvarchar](50) NOT NULL,
	[Ssign] [nvarchar](50) NULL,
	[Scom] [nvarchar](50) NULL,
 CONSTRAINT [PK_SMSConfig] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerInfo]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerInfo](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[Sname] [nvarchar](50) NOT NULL,
	[Sip] [nvarchar](50) NOT NULL,
	[Sport] [nvarchar](50) NOT NULL,
	[CenterID] [int] NOT NULL,
 CONSTRAINT [PK_ServerInfo] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerConfig]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerConfig](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[serip] [nvarchar](200) NULL,
	[serport] [int] NULL,
	[mark] [nvarchar](200) NULL,
 CONSTRAINT [PK_ServerConfig] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SerialPortInfo]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SerialPortInfo](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[SserialPortName] [nvarchar](50) NOT NULL,
	[SBaudrate] [nvarchar](50) NOT NULL,
	[SdataBit] [nvarchar](50) NOT NULL,
	[SStopbit] [nvarchar](50) NOT NULL,
	[ScheckSystem] [nvarchar](50) NOT NULL,
	[SserialPort] [text] NULL,
	[Stime] [nvarchar](50) NULL,
	[StrueOffalse] [int] NOT NULL,
	[SGroupNum] [nvarchar](50) NULL,
	[SError] [int] NULL,
	[CenterID] [int] NOT NULL,
	[SType] [int] NOT NULL,
 CONSTRAINT [PK_SerialPortInfo] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RemoteData]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RemoteData](
	[操作符] [nvarchar](50) NULL,
	[长度] [int] NULL,
	[地址] [nvarchar](50) NULL,
	[主机类型] [nvarchar](50) NULL,
	[编程数据] [nvarchar](50) NULL,
	[注释] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RemoteControlLog]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RemoteControlLog](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[userNum] [nvarchar](50) NOT NULL,
	[Contacter] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[Msg] [nvarchar](50) NULL,
	[ControlTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_RemoteControlLog] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayType]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PContent] [nvarchar](200) NOT NULL,
	[PMoneyCNY] [float] NOT NULL,
	[PServiceTime] [nvarchar](50) NOT NULL,
	[PRechargeID] [nvarchar](50) NOT NULL,
	[PMark] [nvarchar](200) NULL,
	[creattime] [nvarchar](50) NULL,
	[savetime] [nvarchar](50) NULL,
	[Enable] [int] NULL,
	[CenterID] [int] NOT NULL,
 CONSTRAINT [PK_PayType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayRecord]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OperatorUser] [nvarchar](50) NULL,
	[Uid] [int] NOT NULL,
	[DevID] [nvarchar](50) NOT NULL,
	[MoneyCNY] [float] NOT NULL,
	[RechargeID] [nvarchar](50) NULL,
	[Pid] [nvarchar](50) NOT NULL,
	[CouponCode] [nvarchar](50) NULL,
	[OrderNumber] [nvarchar](50) NOT NULL,
	[OrderCreateTime] [nvarchar](50) NULL,
	[RechargeContent] [nvarchar](200) NULL,
	[RechargeSubject] [nvarchar](50) NULL,
	[Status] [int] NULL,
	[Channel] [nvarchar](50) NULL,
	[PayFrom] [nvarchar](50) NULL,
	[trade_no] [nvarchar](50) NULL,
	[buyer_email] [nvarchar](50) NULL,
	[gmt_create] [nvarchar](50) NULL,
	[gmt_payment] [nvarchar](50) NULL,
	[notify_time] [nvarchar](50) NULL,
 CONSTRAINT [PK_PayRecord] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatrolSignLog]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatrolSignLog](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[CAccount] [nvarchar](50) NOT NULL,
	[SignInTime] [nvarchar](50) NOT NULL,
	[DeviceNo] [nvarchar](50) NULL,
	[Lng] [nvarchar](50) NULL,
	[Lat] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Remark] [text] NULL,
	[imgpath] [text] NULL,
	[ReceiveTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_SignIn] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatrolGPSLog]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatrolGPSLog](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[CAccount] [nvarchar](50) NOT NULL,
	[Lng] [nvarchar](50) NULL,
	[Lat] [nvarchar](50) NULL,
	[Time] [nvarchar](50) NULL,
	[Alt] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[ReceiveTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_PatrolGPSLog] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatrolAlarmLog]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatrolAlarmLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CAccount] [nvarchar](50) NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[Aid] [int] NOT NULL,
	[CenterMark] [text] NULL,
	[Status] [int] NULL,
	[SendTime] [nvarchar](50) NULL,
	[ArriveTime] [nvarchar](50) NULL,
	[ArriveLng] [nvarchar](50) NULL,
	[ArriveLat] [nvarchar](50) NULL,
	[ArriveAddress] [nvarchar](200) NULL,
	[Arriveimgpath] [text] NULL,
	[ArriveContent] [text] NULL,
	[HandleTime] [nvarchar](50) NULL,
	[HandleContent] [text] NULL,
	[imgpath] [text] NULL,
 CONSTRAINT [PK_PatrolAlarmLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patrol]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patrol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CAccount] [nvarchar](50) NOT NULL,
	[CPwd] [nvarchar](50) NOT NULL,
	[CName] [nvarchar](50) NULL,
	[Ctel] [nvarchar](50) NULL,
	[CHead] [nvarchar](50) NULL,
	[CMark] [nvarchar](50) NULL,
	[CIsUse] [int] NULL,
	[CAddTime] [nvarchar](50) NULL,
	[CenterID] [int] NOT NULL,
	[Permissions] [nvarchar](200) NULL,
 CONSTRAINT [PK_Patrol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[netConfig]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[netConfig](
	[Nid] [int] IDENTITY(1,1) NOT NULL,
	[Nport] [int] NOT NULL,
	[NcheckLine] [int] NOT NULL,
	[Ninterval] [int] NOT NULL,
 CONSTRAINT [PK_netConfig] PRIMARY KEY CLUSTERED 
(
	[Nid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messageTo]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messageTo](
	[Mid] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](50) NOT NULL,
	[Mflag] [int] NOT NULL,
 CONSTRAINT [PK_messageTo] PRIMARY KEY CLUSTERED 
(
	[Mid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageLog]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MessageLog](
	[Mid] [int] IDENTITY(1,1) NOT NULL,
	[Mdate] [datetime] NOT NULL,
	[MsendTel] [nvarchar](50) NOT NULL,
	[MsendState] [nvarchar](50) NOT NULL,
	[Mcontent] [varchar](500) NULL,
	[Muser] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MessageLog] PRIMARY KEY CLUSTERED 
(
	[Mid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MessageAccount]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageAccount](
	[Mid] [int] IDENTITY(1,1) NOT NULL,
	[Muser] [nvarchar](50) NOT NULL,
	[Mpwd] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MessageAccount] PRIMARY KEY CLUSTERED 
(
	[Mid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[home]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[home](
	[Hid] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [int] NOT NULL,
	[Hnumber] [int] NOT NULL,
	[HName] [nvarchar](50) NOT NULL,
	[HLocal] [nvarchar](50) NULL,
	[HType] [nvarchar](50) NOT NULL,
	[HStatus] [int] NULL,
	[HIcon] [nvarchar](50) NULL,
 CONSTRAINT [PK_home] PRIMARY KEY CLUSTERED 
(
	[Hid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户列表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'home', @level2type=N'COLUMN',@level2name=N'Uid'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'home', @level2type=N'COLUMN',@level2name=N'Hnumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'home', @level2type=N'COLUMN',@level2name=N'HName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'home', @level2type=N'COLUMN',@level2name=N'HLocal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'home', @level2type=N'COLUMN',@level2name=N'HType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态：00关闭，01打开，02未知' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'home', @level2type=N'COLUMN',@level2name=N'HStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'home', @level2type=N'COLUMN',@level2name=N'HIcon'
GO
/****** Object:  Table [dbo].[FunTTS]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunTTS](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[IsUse] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[GradeID] [int] NULL,
	[Area] [int] NULL,
	[CreatTime] [nvarchar](50) NULL,
	[StartDate] [nvarchar](50) NULL,
	[EndDate] [nvarchar](50) NULL,
	[StartTime1] [nvarchar](50) NULL,
	[EndTime1] [nvarchar](50) NULL,
	[AgainTimes1] [int] NULL,
	[StartTime2] [nvarchar](50) NULL,
	[EndTime2] [nvarchar](50) NULL,
	[AgainTimes2] [int] NULL,
	[StartTime3] [nvarchar](50) NULL,
	[EndTime3] [nvarchar](50) NULL,
	[AgainTimes3] [int] NULL,
	[StartTime4] [nvarchar](50) NULL,
	[EndTime4] [nvarchar](50) NULL,
	[AgainTimes4] [int] NULL,
	[Mark] [text] NULL,
	[userNumber] [nchar](12) NULL,
	[sendText] [nchar](200) NULL,
	[sendTime] [nchar](50) NULL,
	[areaCode] [nchar](12) NULL,
	[playCnt] [int] NULL,
 CONSTRAINT [PK_FunTTS] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FModule]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FModule](
	[Mid] [int] IDENTITY(1,1) NOT NULL,
	[Mnumber] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Msite] [nvarchar](50) NOT NULL,
	[Mreark] [text] NULL,
 CONSTRAINT [PK_FacilityModel] PRIMARY KEY CLUSTERED 
(
	[Mid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fmodel]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fmodel](
	[Tid] [int] IDENTITY(1,1) NOT NULL,
	[Tname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Fmodel] PRIMARY KEY CLUSTERED 
(
	[Tid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Fid] [int] IDENTITY(1,1) NOT NULL,
	[FUser] [nvarchar](50) NULL,
	[FTel] [nvarchar](50) NULL,
	[FText] [text] NULL,
	[FAddTime] [nvarchar](50) NULL,
	[FHandle] [nvarchar](50) NULL,
	[FHandleContent] [text] NULL,
	[FHandleTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Fid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientInfo]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientInfo](
	[Cid] [int] IDENTITY(1,1) NOT NULL,
	[Cname] [nvarchar](50) NOT NULL,
	[Cgroupnum] [nvarchar](6) NOT NULL,
	[Cdognum] [nvarchar](32) NOT NULL,
	[Cflag] [int] NULL,
	[Cremark] [nvarchar](50) NULL,
	[Contacter] [nvarchar](50) NULL,
	[ContacterTel] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[AlarmLogTable] [nvarchar](50) NULL,
	[MoreCenterID] [nvarchar](200) NULL,
	[MoreCenterMsg] [nvarchar](400) NULL,
 CONSTRAINT [PK_ClientInfo] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[centerFunction]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[centerFunction](
	[Fid] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](50) NOT NULL,
	[Fremark] [nvarchar](500) NULL,
 CONSTRAINT [PK_centerFunction] PRIMARY KEY CLUSTERED 
(
	[Fid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[camera]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[camera](
	[Cid] [int] IDENTITY(1,1) NOT NULL,
	[CMAC] [nvarchar](50) NULL,
	[Cip] [nvarchar](50) NULL,
	[Cuser] [nvarchar](50) NULL,
	[Cpwd] [nvarchar](50) NULL,
	[WebPort] [int] NULL,
	[MediaPort] [int] NULL,
	[MobilePort] [int] NULL,
	[UPNPWebPort] [int] NULL,
	[UPNPMediaPort] [int] NULL,
	[UPNPMobilePort] [int] NULL,
	[Ctype] [int] NULL,
	[Rip] [nvarchar](50) NULL,
	[CloudID] [nvarchar](50) NULL,
	[ChannelSum] [int] NOT NULL,
	[Ver] [nvarchar](50) NULL,
 CONSTRAINT [PK_Camrea] PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外网IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'camera', @level2type=N'COLUMN',@level2name=N'Cip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内网IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'camera', @level2type=N'COLUMN',@level2name=N'Rip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'云ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'camera', @level2type=N'COLUMN',@level2name=N'CloudID'
GO
/****** Object:  Table [dbo].[callRecord]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[callRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[alarmTime] [nvarchar](50) NOT NULL,
	[groupNum] [nvarchar](50) NOT NULL,
	[userNum] [nvarchar](50) NOT NULL,
	[atTime] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[timeLen] [int] NOT NULL,
 CONSTRAINT [PK_callRecord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmSubstation]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlarmSubstation](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[Sname] [nvarchar](50) NOT NULL,
	[IalarmContacter] [nvarchar](50) NOT NULL,
	[Saddress] [nvarchar](50) NOT NULL,
	[STel] [nvarchar](50) NOT NULL,
	[Snumber] [int] NOT NULL,
	[Iprogram] [text] NOT NULL,
 CONSTRAINT [PK_AlarmSubstation] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmLogBak_Auto_2017_05_22_12_27_41]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlarmLogBak_Auto_2017_05_22_12_27_41](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[Unumber] [nvarchar](50) NOT NULL,
	[GroupNumber] [nvarchar](50) NULL,
	[Uname] [nvarchar](50) NOT NULL,
	[Uaddress] [nvarchar](200) NULL,
	[FacilityModule] [nvarchar](50) NOT NULL,
	[FacilityDefence] [nvarchar](50) NOT NULL,
	[Dsite] [nvarchar](50) NOT NULL,
	[EventRemark] [nvarchar](50) NOT NULL,
	[assistRemark] [nvarchar](50) NOT NULL,
	[receiveTEL] [nvarchar](50) NOT NULL,
	[alarmClassify] [nvarchar](50) NULL,
	[occurrenceTime] [nvarchar](50) NOT NULL,
	[receiveTime] [datetime] NOT NULL,
	[handleTime] [datetime] NULL,
	[handleContent] [nvarchar](50) NULL,
	[Contacter] [nvarchar](50) NOT NULL,
	[Ctel] [nvarchar](50) NOT NULL,
	[administrator] [nvarchar](50) NOT NULL,
	[Cid] [nvarchar](50) NOT NULL,
	[AlarmContent] [nvarchar](50) NULL,
	[Dtype] [varchar](50) NULL,
	[PoliceContent] [nvarchar](200) NOT NULL,
	[RecordPath] [nvarchar](200) NULL,
	[TCPalarmContent] [nvarchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[ReachConfirmTime] [datetime] NULL,
	[handleFlg] [int] NULL,
 CONSTRAINT [PK_AlarmLogBak_Auto] PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLogBak_Auto_GroupNumber] ON [dbo].[AlarmLogBak_Auto_2017_05_22_12_27_41] 
(
	[GroupNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLogBak_Auto_handleFlg] ON [dbo].[AlarmLogBak_Auto_2017_05_22_12_27_41] 
(
	[handleFlg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLogBak_Auto_Unumber] ON [dbo].[AlarmLogBak_Auto_2017_05_22_12_27_41] 
(
	[Unumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmLogBak]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlarmLogBak](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[Unumber] [nvarchar](50) NOT NULL,
	[GroupNumber] [nvarchar](50) NULL,
	[Uname] [nvarchar](50) NOT NULL,
	[Uaddress] [varchar](200) NULL,
	[FacilityModule] [nvarchar](50) NOT NULL,
	[FacilityDefence] [nvarchar](50) NOT NULL,
	[Dsite] [nvarchar](50) NOT NULL,
	[EventRemark] [nvarchar](50) NOT NULL,
	[assistRemark] [nvarchar](50) NOT NULL,
	[receiveTEL] [nvarchar](50) NOT NULL,
	[alarmClassify] [nvarchar](50) NULL,
	[occurrenceTime] [nvarchar](50) NOT NULL,
	[receiveTime] [datetime] NOT NULL,
	[handleTime] [datetime] NULL,
	[handleContent] [nvarchar](50) NULL,
	[Contacter] [nvarchar](50) NOT NULL,
	[Ctel] [nvarchar](50) NOT NULL,
	[administrator] [nvarchar](50) NOT NULL,
	[Cid] [nvarchar](50) NOT NULL,
	[AlarmContent] [nvarchar](50) NULL,
	[Dtype] [varchar](50) NULL,
	[PoliceContent] [nvarchar](200) NOT NULL,
	[RecordPath] [nvarchar](200) NULL,
	[TCPalarmContent] [nvarchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[ReachConfirmTime] [datetime] NULL,
	[handleFlg] [int] NULL,
 CONSTRAINT [PK_AlarmLogBak] PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'封装为TCP的警情代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AlarmLogBak', @level2type=N'COLUMN',@level2name=N'TCPalarmContent'
GO
/****** Object:  Table [dbo].[AlarmLog_805186]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlarmLog_805186](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[Unumber] [nvarchar](50) NOT NULL,
	[GroupNumber] [nvarchar](50) NULL,
	[Uname] [nvarchar](50) NOT NULL,
	[Uaddress] [nvarchar](200) NULL,
	[FacilityModule] [nvarchar](50) NOT NULL,
	[FacilityDefence] [nvarchar](50) NOT NULL,
	[Dsite] [nvarchar](50) NOT NULL,
	[EventRemark] [nvarchar](50) NOT NULL,
	[assistRemark] [nvarchar](50) NOT NULL,
	[receiveTEL] [nvarchar](50) NOT NULL,
	[alarmClassify] [nvarchar](50) NULL,
	[occurrenceTime] [nvarchar](50) NOT NULL,
	[receiveTime] [datetime] NOT NULL,
	[handleTime] [datetime] NULL,
	[handleContent] [nvarchar](50) NULL,
	[Contacter] [nvarchar](50) NOT NULL,
	[Ctel] [nvarchar](50) NOT NULL,
	[administrator] [nvarchar](50) NOT NULL,
	[Cid] [nvarchar](50) NOT NULL,
	[AlarmContent] [nvarchar](50) NULL,
	[Dtype] [varchar](50) NULL,
	[PoliceContent] [nvarchar](200) NOT NULL,
	[RecordPath] [nvarchar](200) NULL,
	[TCPalarmContent] [nvarchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[ReachConfirmTime] [datetime] NULL,
	[handleFlg] [int] NULL,
 CONSTRAINT [PK_AlarmLog_805186] PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_805186_GroupNumber] ON [dbo].[AlarmLog_805186] 
(
	[GroupNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_805186_handleFlg] ON [dbo].[AlarmLog_805186] 
(
	[handleFlg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_805186_Unumber] ON [dbo].[AlarmLog_805186] 
(
	[Unumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmLog_506606]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlarmLog_506606](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[Unumber] [nvarchar](50) NOT NULL,
	[GroupNumber] [nvarchar](50) NULL,
	[Uname] [nvarchar](50) NOT NULL,
	[Uaddress] [nvarchar](200) NULL,
	[FacilityModule] [nvarchar](50) NOT NULL,
	[FacilityDefence] [nvarchar](50) NOT NULL,
	[Dsite] [nvarchar](50) NOT NULL,
	[EventRemark] [nvarchar](50) NOT NULL,
	[assistRemark] [nvarchar](50) NOT NULL,
	[receiveTEL] [nvarchar](50) NOT NULL,
	[alarmClassify] [nvarchar](50) NULL,
	[occurrenceTime] [nvarchar](50) NOT NULL,
	[receiveTime] [datetime] NOT NULL,
	[handleTime] [datetime] NULL,
	[handleContent] [nvarchar](50) NULL,
	[Contacter] [nvarchar](50) NOT NULL,
	[Ctel] [nvarchar](50) NOT NULL,
	[administrator] [nvarchar](50) NOT NULL,
	[Cid] [nvarchar](50) NOT NULL,
	[AlarmContent] [nvarchar](200) NULL,
	[Dtype] [varchar](50) NULL,
	[PoliceContent] [nvarchar](200) NOT NULL,
	[RecordPath] [nvarchar](200) NULL,
	[TCPalarmContent] [nvarchar](200) NULL,
	[RecordTime] [datetime] NULL,
	[ReachConfirmTime] [datetime] NULL,
	[handleFlg] [int] NULL,
 CONSTRAINT [PK_AlarmLog_506606] PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_506606_GroupNumber] ON [dbo].[AlarmLog_506606] 
(
	[GroupNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_506606_handleFlg] ON [dbo].[AlarmLog_506606] 
(
	[handleFlg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_506606_Unumber] ON [dbo].[AlarmLog_506606] 
(
	[Unumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmLog_409267Bak_Auto]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlarmLog_409267Bak_Auto](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[Unumber] [nvarchar](50) NOT NULL,
	[GroupNumber] [nvarchar](50) NULL,
	[Uname] [nvarchar](50) NOT NULL,
	[Uaddress] [nvarchar](200) NULL,
	[FacilityModule] [nvarchar](50) NOT NULL,
	[FacilityDefence] [nvarchar](50) NOT NULL,
	[Dsite] [nvarchar](50) NOT NULL,
	[EventRemark] [nvarchar](50) NOT NULL,
	[assistRemark] [nvarchar](50) NOT NULL,
	[receiveTEL] [nvarchar](50) NOT NULL,
	[alarmClassify] [nvarchar](50) NULL,
	[occurrenceTime] [nvarchar](50) NOT NULL,
	[receiveTime] [datetime] NOT NULL,
	[handleTime] [datetime] NULL,
	[handleContent] [nvarchar](50) NULL,
	[Contacter] [nvarchar](50) NOT NULL,
	[Ctel] [nvarchar](50) NOT NULL,
	[administrator] [nvarchar](50) NOT NULL,
	[Cid] [nvarchar](50) NOT NULL,
	[AlarmContent] [nvarchar](50) NULL,
	[Dtype] [varchar](50) NULL,
	[PoliceContent] [nvarchar](200) NOT NULL,
	[RecordPath] [nvarchar](200) NULL,
	[TCPalarmContent] [nvarchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[ReachConfirmTime] [datetime] NULL,
	[handleFlg] [int] NULL,
 CONSTRAINT [PK_AlarmLog_409267Bak_Auto] PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_409267Bak_Auto_GroupNumber] ON [dbo].[AlarmLog_409267Bak_Auto] 
(
	[GroupNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_409267Bak_Auto_handleFlg] ON [dbo].[AlarmLog_409267Bak_Auto] 
(
	[handleFlg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_409267Bak_Auto_Unumber] ON [dbo].[AlarmLog_409267Bak_Auto] 
(
	[Unumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmLog_409267]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlarmLog_409267](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[Unumber] [nvarchar](50) NOT NULL,
	[GroupNumber] [nvarchar](50) NULL,
	[Uname] [nvarchar](50) NOT NULL,
	[Uaddress] [nvarchar](200) NULL,
	[FacilityModule] [nvarchar](50) NOT NULL,
	[FacilityDefence] [nvarchar](50) NOT NULL,
	[Dsite] [nvarchar](50) NOT NULL,
	[EventRemark] [nvarchar](50) NOT NULL,
	[assistRemark] [nvarchar](50) NOT NULL,
	[receiveTEL] [nvarchar](50) NOT NULL,
	[alarmClassify] [nvarchar](50) NULL,
	[occurrenceTime] [nvarchar](50) NOT NULL,
	[receiveTime] [datetime] NOT NULL,
	[handleTime] [datetime] NULL,
	[handleContent] [nvarchar](50) NULL,
	[Contacter] [nvarchar](50) NOT NULL,
	[Ctel] [nvarchar](50) NOT NULL,
	[administrator] [nvarchar](50) NOT NULL,
	[Cid] [nvarchar](50) NOT NULL,
	[AlarmContent] [nvarchar](50) NULL,
	[Dtype] [varchar](50) NULL,
	[PoliceContent] [nvarchar](200) NOT NULL,
	[RecordPath] [nvarchar](200) NULL,
	[TCPalarmContent] [nvarchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[ReachConfirmTime] [datetime] NULL,
	[handleFlg] [int] NULL,
 CONSTRAINT [PK_AlarmLog_409267] PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_409267_GroupNumber] ON [dbo].[AlarmLog_409267] 
(
	[GroupNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_409267_handleFlg] ON [dbo].[AlarmLog_409267] 
(
	[handleFlg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_409267_Unumber] ON [dbo].[AlarmLog_409267] 
(
	[Unumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmLog_409261]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlarmLog_409261](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[Unumber] [nvarchar](50) NOT NULL,
	[GroupNumber] [nvarchar](50) NULL,
	[Uname] [nvarchar](50) NOT NULL,
	[Uaddress] [nvarchar](200) NULL,
	[FacilityModule] [nvarchar](50) NOT NULL,
	[FacilityDefence] [nvarchar](50) NOT NULL,
	[Dsite] [nvarchar](50) NOT NULL,
	[EventRemark] [nvarchar](50) NOT NULL,
	[assistRemark] [nvarchar](50) NOT NULL,
	[receiveTEL] [nvarchar](50) NOT NULL,
	[alarmClassify] [nvarchar](50) NULL,
	[occurrenceTime] [nvarchar](50) NOT NULL,
	[receiveTime] [datetime] NOT NULL,
	[handleTime] [datetime] NULL,
	[handleContent] [nvarchar](50) NULL,
	[Contacter] [nvarchar](50) NOT NULL,
	[Ctel] [nvarchar](50) NOT NULL,
	[administrator] [nvarchar](50) NOT NULL,
	[Cid] [nvarchar](50) NOT NULL,
	[AlarmContent] [nvarchar](50) NULL,
	[Dtype] [varchar](50) NULL,
	[PoliceContent] [nvarchar](200) NOT NULL,
	[RecordPath] [nvarchar](200) NULL,
	[TCPalarmContent] [nvarchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[ReachConfirmTime] [datetime] NULL,
	[handleFlg] [int] NULL,
 CONSTRAINT [PK_AlarmLog_409261] PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_409261_GroupNumber] ON [dbo].[AlarmLog_409261] 
(
	[GroupNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_409261_handleFlg] ON [dbo].[AlarmLog_409261] 
(
	[handleFlg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_409261_Unumber] ON [dbo].[AlarmLog_409261] 
(
	[Unumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmLog_409192Bak2016_09_27_895]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlarmLog_409192Bak2016_09_27_895](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[Unumber] [nvarchar](50) NOT NULL,
	[GroupNumber] [nvarchar](50) NULL,
	[Uname] [nvarchar](50) NOT NULL,
	[Uaddress] [nvarchar](200) NULL,
	[FacilityModule] [nvarchar](50) NOT NULL,
	[FacilityDefence] [nvarchar](50) NOT NULL,
	[Dsite] [nvarchar](50) NOT NULL,
	[EventRemark] [nvarchar](50) NOT NULL,
	[assistRemark] [nvarchar](50) NOT NULL,
	[receiveTEL] [nvarchar](50) NOT NULL,
	[alarmClassify] [nvarchar](50) NULL,
	[occurrenceTime] [nvarchar](50) NOT NULL,
	[receiveTime] [datetime] NOT NULL,
	[handleTime] [datetime] NULL,
	[handleContent] [nvarchar](50) NULL,
	[Contacter] [nvarchar](50) NOT NULL,
	[Ctel] [nvarchar](50) NOT NULL,
	[administrator] [nvarchar](50) NOT NULL,
	[Cid] [nvarchar](50) NOT NULL,
	[AlarmContent] [nvarchar](50) NULL,
	[Dtype] [varchar](50) NULL,
	[PoliceContent] [nvarchar](200) NOT NULL,
	[RecordPath] [nvarchar](200) NULL,
	[TCPalarmContent] [nvarchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[ReachConfirmTime] [datetime] NULL,
	[handleFlg] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AlarmLog_409192]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlarmLog_409192](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[Unumber] [nvarchar](50) NOT NULL,
	[GroupNumber] [nvarchar](50) NULL,
	[Uname] [nvarchar](50) NOT NULL,
	[Uaddress] [nvarchar](200) NULL,
	[FacilityModule] [nvarchar](50) NOT NULL,
	[FacilityDefence] [nvarchar](50) NOT NULL,
	[Dsite] [nvarchar](50) NOT NULL,
	[EventRemark] [nvarchar](50) NOT NULL,
	[assistRemark] [nvarchar](50) NOT NULL,
	[receiveTEL] [nvarchar](50) NOT NULL,
	[alarmClassify] [nvarchar](50) NULL,
	[occurrenceTime] [nvarchar](50) NOT NULL,
	[receiveTime] [datetime] NOT NULL,
	[handleTime] [datetime] NULL,
	[handleContent] [nvarchar](50) NULL,
	[Contacter] [nvarchar](50) NOT NULL,
	[Ctel] [nvarchar](50) NOT NULL,
	[administrator] [nvarchar](50) NOT NULL,
	[Cid] [nvarchar](50) NOT NULL,
	[AlarmContent] [nvarchar](50) NULL,
	[Dtype] [varchar](50) NULL,
	[PoliceContent] [nvarchar](200) NOT NULL,
	[RecordPath] [nvarchar](200) NULL,
	[TCPalarmContent] [nvarchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[ReachConfirmTime] [datetime] NULL,
	[handleFlg] [int] NULL,
 CONSTRAINT [PK_AlarmLog_409192] PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_409192_GroupNumber] ON [dbo].[AlarmLog_409192] 
(
	[GroupNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_409192_handleFlg] ON [dbo].[AlarmLog_409192] 
(
	[handleFlg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_409192_Unumber] ON [dbo].[AlarmLog_409192] 
(
	[Unumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlarmLog]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlarmLog](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[Unumber] [nvarchar](50) NOT NULL,
	[GroupNumber] [nvarchar](50) NULL,
	[Uname] [nvarchar](50) NOT NULL,
	[Uaddress] [varchar](200) NULL,
	[FacilityModule] [nvarchar](50) NOT NULL,
	[FacilityDefence] [nvarchar](50) NOT NULL,
	[Dsite] [nvarchar](50) NOT NULL,
	[EventRemark] [nvarchar](50) NOT NULL,
	[assistRemark] [nvarchar](50) NOT NULL,
	[receiveTEL] [nvarchar](50) NOT NULL,
	[alarmClassify] [nvarchar](50) NULL,
	[occurrenceTime] [nvarchar](50) NOT NULL,
	[receiveTime] [datetime] NOT NULL,
	[handleTime] [datetime] NULL,
	[handleContent] [nvarchar](50) NULL,
	[Contacter] [nvarchar](50) NOT NULL,
	[Ctel] [nvarchar](50) NOT NULL,
	[administrator] [nvarchar](50) NOT NULL,
	[Cid] [nvarchar](50) NOT NULL,
	[AlarmContent] [nvarchar](50) NULL,
	[Dtype] [varchar](50) NULL,
	[PoliceContent] [nvarchar](200) NOT NULL,
	[RecordPath] [nvarchar](200) NULL,
	[TCPalarmContent] [nvarchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[ReachConfirmTime] [datetime] NULL,
	[handleFlg] [int] NULL,
 CONSTRAINT [PK_AlarmLog] PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_GroupNumber] ON [dbo].[AlarmLog] 
(
	[GroupNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_handleContent] ON [dbo].[AlarmLog] 
(
	[handleContent] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_AlarmLog_Unumber] ON [dbo].[AlarmLog] 
(
	[Unumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'封装为TCP的警情代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AlarmLog', @level2type=N'COLUMN',@level2name=N'TCPalarmContent'
GO
/****** Object:  Table [dbo].[TSBLocationInfo]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TSBLocationInfo](
	[No] [int] IDENTITY(1,1) NOT NULL,
	[DevID] [nvarchar](128) NOT NULL,
	[Lng] [real] NOT NULL,
	[Lat] [real] NOT NULL,
	[Title] [nvarchar](128) NOT NULL,
	[Label] [nvarchar](128) NOT NULL,
	[Message] [nvarchar](128) NOT NULL,
	[RecordTime] [datetime] NOT NULL,
 CONSTRAINT [PK_TSBLocationInfo] PRIMARY KEY CLUSTERED 
(
	[No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TSBConfig]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TSBConfig](
	[Tid] [int] IDENTITY(1,1) NOT NULL,
	[TPort] [int] NOT NULL,
	[TTel1] [nvarchar](50) NULL,
	[TTel2] [nvarchar](50) NULL,
 CONSTRAINT [PK_TSBConfig] PRIMARY KEY CLUSTERED 
(
	[Tid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[ScenterName] [nvarchar](50) NOT NULL,
	[SalarmSound] [int] NOT NULL,
	[SalarmShow] [int] NOT NULL,
	[Sonline] [int] NULL,
	[SonlineAlertS] [int] NULL,
	[SonlineAlertE] [int] NULL,
	[SMapLatLng] [nvarchar](50) NOT NULL,
	[SMapLevel] [int] NOT NULL,
	[SImageWall] [nvarchar](200) NULL,
	[SallView] [int] NULL,
	[Salert] [int] NULL,
	[SlocalOrServer] [int] NULL,
	[SMapType] [int] NULL,
	[SSubCenterIp] [nvarchar](50) NULL,
	[SSubCenterPort] [int] NOT NULL,
	[SSubCenterNum] [int] NOT NULL,
	[AreaCode] [nvarchar](12) NULL,
	[CenterID] [int] NOT NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysLog]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysLog](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[SdateTime] [datetime] NULL,
	[SeventType] [nvarchar](50) NULL,
	[Sremark] [nvarchar](100) NULL,
	[Sassist] [nvarchar](100) NULL,
	[Suser] [nvarchar](50) NULL,
	[CenterID] [int] NOT NULL,
 CONSTRAINT [PK_SysLog] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCenterMessage]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCenterMessage](
	[SCid] [int] IDENTITY(1,1) NOT NULL,
	[SCUid] [int] NOT NULL,
	[SCCid] [int] NOT NULL,
	[SCMid] [int] NOT NULL,
 CONSTRAINT [PK_SubCenterMessage] PRIMARY KEY CLUSTERED 
(
	[SCid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_userLogin]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_userLogin]    Script Date: 03/26/2016 11:36:34 ******/
--用户登陆存储过程
CREATE PROCEDURE [dbo].[sp_userLogin]
    @Uname nvarchar(50),
    @Upwd nvarchar(50)
as

select Uid,Uname,Upwd,UlastTime from adminUser where Uname=@Uname and Upwd=@Upwd
GO
/****** Object:  StoredProcedure [dbo].[sp_updateLoginDate]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_updateLoginDate]    Script Date: 03/26/2016 11:36:34 ******/
--更新用户上次登陆时间
CREATE  PROCEDURE [dbo].[sp_updateLoginDate]
@uid int,
@Time datetime

as

update adminUser set UlastTime=@Time where uid=@uid
GO
/****** Object:  Table [dbo].[AlarmFacility]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlarmFacility](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[AlastTime] [datetime] NULL,
	[Tid] [int] NOT NULL,
	[AinstallDate] [datetime] NOT NULL,
	[Asite] [nvarchar](50) NOT NULL,
	[Cid] [int] NULL,
	[Atel] [nvarchar](50) NULL,
	[Acommunication] [nvarchar](50) NOT NULL,
	[TestTime] [nvarchar](50) NOT NULL,
	[remoteType] [nvarchar](50) NULL,
 CONSTRAINT [PK_AlarmFacility] PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientMessage]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientMessage](
	[CMid] [int] IDENTITY(1,1) NOT NULL,
	[Cid] [int] NOT NULL,
	[Mid] [int] NOT NULL,
 CONSTRAINT [PK_ClientMessage] PRIMARY KEY CLUSTERED 
(
	[CMid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Defence]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Defence](
	[Did] [int] IDENTITY(1,1) NOT NULL,
	[Dnumber] [nvarchar](50) NOT NULL,
	[Mid] [int] NOT NULL,
	[Dtypeid] [int] NOT NULL,
	[Dsite] [nvarchar](50) NOT NULL,
	[Ddetector] [nvarchar](50) NOT NULL,
	[Dcount] [int] NOT NULL,
	[Dpoint] [nvarchar](50) NULL,
	[CameraID] [int] NULL,
	[Dimg] [nvarchar](300) NOT NULL,
	[Preset] [int] NULL,
	[Channel] [nvarchar](200) NULL,
 CONSTRAINT [PK_Defence] PRIMARY KEY CLUSTERED 
(
	[Did] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_Defence_CameraID] ON [dbo].[Defence] 
(
	[CameraID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_Defence_Mid] ON [dbo].[Defence] 
(
	[Mid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBasic]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBasic](
	[Uid] [int] IDENTITY(1,1) NOT NULL,
	[GroupNum] [nvarchar](50) NOT NULL,
	[Unumber] [nvarchar](50) NOT NULL,
	[Uname] [nvarchar](50) NOT NULL,
	[Utype] [nvarchar](50) NOT NULL,
	[Uaddress] [nvarchar](200) NOT NULL,
	[Uprincipal] [nvarchar](50) NOT NULL,
	[UpTel] [nvarchar](50) NOT NULL,
	[Sid] [int] NOT NULL,
	[UmapLatLng] [nvarchar](50) NOT NULL,
	[UDefenceImage] [nvarchar](200) NULL,
	[UnetState] [nvarchar](50) NULL,
	[Ustate] [nvarchar](50) NULL,
	[Utest] [int] NULL,
	[Uarrest] [int] NOT NULL,
	[UsendMsg] [int] NOT NULL,
	[Uschedule] [nvarchar](50) NULL,
	[Uremark] [text] NULL,
	[CameraID] [int] NOT NULL,
	[VideoStream] [int] NULL,
	[VideoStart] [nvarchar](50) NULL,
	[VideoEnd] [nvarchar](50) NULL,
	[ServiceTime] [datetime] NULL,
	[CheckBFOver] [int] NULL,
	[UDefenceImageAuto] [int] NULL,
	[HintDays] [int] NULL,
	[AreaCode] [nvarchar](12) NULL,
	[ArmTime] [datetime] NULL,
	[LastReportTime] [datetime] NULL,
	[CenterID] [int] NOT NULL,
	[ShowAllVideo] [int] NULL,
	[PayType] [int] NULL,
	[AlastTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserBasic] PRIMARY KEY CLUSTERED 
(
	[Uid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_UserBasic_CenterID] ON [dbo].[UserBasic] 
(
	[CenterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_UserBasic_GroupNum] ON [dbo].[UserBasic] 
(
	[GroupNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_UserBasic_Uname] ON [dbo].[UserBasic] 
(
	[Uname] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_UserBasic_UnetState] ON [dbo].[UserBasic] 
(
	[UnetState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_UserBasic_Unumber] ON [dbo].[UserBasic] 
(
	[Unumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频码流：0主码流，1辅码流' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserBasic', @level2type=N'COLUMN',@level2name=N'VideoStream'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警弹视频开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserBasic', @level2type=N'COLUMN',@level2name=N'VideoStart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报警弹视频结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserBasic', @level2type=N'COLUMN',@level2name=N'VideoEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务到期日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserBasic', @level2type=N'COLUMN',@level2name=N'ServiceTime'
GO
/****** Object:  Table [dbo].[UserFacility]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFacility](
	[UFid] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [int] NOT NULL,
	[Fic] [int] NOT NULL,
 CONSTRAINT [PK_UserFacility] PRIMARY KEY CLUSTERED 
(
	[UFid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_UserFacility_Uid] ON [dbo].[UserFacility] 
(
	[Uid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserContacter]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserContacter](
	[UCid] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [int] NOT NULL,
	[Cid] [int] NOT NULL,
 CONSTRAINT [PK_UserContacter] PRIMARY KEY CLUSTERED 
(
	[UCid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_UserContacter_Uid] ON [dbo].[UserContacter] 
(
	[Uid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacilityModule]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacilityModule](
	[FMid] [int] IDENTITY(1,1) NOT NULL,
	[Aid] [int] NOT NULL,
	[Mid] [int] NOT NULL,
 CONSTRAINT [PK_FacilityModule] PRIMARY KEY CLUSTERED 
(
	[FMid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PK_FacilityModule_Aid] ON [dbo].[FacilityModule] 
(
	[Aid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO