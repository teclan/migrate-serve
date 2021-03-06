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
/****** Object:  StoredProcedure [dbo].[sp_loadZoneType]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_loadZoneType]    Script Date: 03/26/2016 11:36:34 ******/
--创建存储过程: 加载防区类型、防区位置
CREATE     PROCEDURE [dbo].[sp_loadZoneType]
    @uid varchar(50) = 0,		--uid
    @Mnumber varchar(50) = 0,	--模块号
    @Dnumber varchar(50) = 0	--防区号
as

DECLARE @sql nvarchar(4000)

SET @sql = 'SELECT dbo.FModule.Mnumber AS 模块编号, dbo.FModule.Model AS 模块型号, 
                          dbo.Defence.Dnumber AS 防区编号, dbo.DefenceType.Dname AS 探测器类型, 
                          dbo.Defence.Dsite AS 防区位置, dbo.Defence.Ddetector AS 探测器型号, 
                          dbo.Defence.Dcount AS 探测器数量
                    FROM dbo.FacilityModule INNER JOIN
                          dbo.AlarmFacility ON dbo.FacilityModule.Aid = dbo.AlarmFacility.Aid INNER JOIN
                          dbo.FModule ON dbo.FacilityModule.Mid = dbo.FModule.Mid INNER JOIN
                          dbo.Defence ON dbo.FModule.Mid = dbo.Defence.Mid INNER JOIN
                          dbo.DefenceType ON dbo.Defence.Dtypeid = dbo.DefenceType.DTid INNER JOIN
                          dbo.UserFacility ON dbo.AlarmFacility.Aid = dbo.UserFacility.Fic
                    WHERE (dbo.UserFacility.Uid = ''' + @uid + ''') and 
                          (dbo.Defence.Dnumber = ''' + @Dnumber + ''') AND                
                          (dbo.FModule.Mnumber = ''' + @Mnumber + ''')'

exec(@sql)
GO
/****** Object:  StoredProcedure [dbo].[sp_loadUserBasicByuserPay]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_loadUserBasicByuserPay]    Script Date: 03/26/2016 11:36:34 ******/
--创建存储过程: 查询用户基本信息
CREATE     PROCEDURE [dbo].[sp_loadUserBasicByuserPay]
    
as

DECLARE @sql nvarchar(4000)

SET @sql = 'SELECT dbo.UserBasic.Uid, dbo.UserBasic.GroupNum AS 分组编号, 
                                      dbo.UserBasic.Unumber AS 用户编号, dbo.UserBasic.Uname AS 用户名称, 
                                      dbo.UserBasic.Utype AS 用户类型, dbo.UserBasic.Uaddress AS 用户地址, 
                                      dbo.UserBasic.UnetState, dbo.UserBasic.Ustate, dbo.UserBasic.Utest, 
                                      dbo.UserBasic.UsendMsg, dbo.UserBasic.Uschedule,
                                      dbo.AlarmFacility.AlastTime,b.PServiceTime as ServiceTime,dbo.UserBasic.CheckBFOver
                                FROM dbo.UserBasic INNER JOIN
                                      dbo.UserFacility ON dbo.UserBasic.Uid = dbo.UserFacility.Uid INNER JOIN
                                      dbo.AlarmFacility ON dbo.UserFacility.Fic = dbo.AlarmFacility.Aid	left join
                                      (select *from UserPay where UserPay.Pid in(select max(Pid) from UserPay group by PUid)) b on b.Puid=UserBasic.Uid'

exec(@sql)
GO
/****** Object:  StoredProcedure [dbo].[sp_loadNewAlarmLog]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_loadNewAlarmLog]    Script Date: 03/26/2016 11:36:34 ******/
--创建存储过程: 加载未处理报警事件
CREATE     PROCEDURE [dbo].[sp_loadNewAlarmLog]
    @tablename  varchar(50) = 0   --报警事件表名
as

DECLARE @sql nvarchar(4000)

SET @sql = 'SELECT top 10 Aid,Cid, Unumber AS 用户编号, GroupNumber AS 用户分组, Uname AS 用户名称, 
                                                  Uaddress AS 用户地址, FacilityModule AS 模块, FacilityDefence AS 防区, Dtype as 防区类型,
                                                  Dsite AS 探测器位置, EventRemark AS 事件描述, assistRemark AS 辅助信息, 
                                                  receiveTEL AS 接收源, alarmClassify AS 归类处理, handleContent AS 处理内容, 
                                                  occurrenceTime AS 发生时间, receiveTime AS 接警时间, handleTime AS 处警时间, 
                                                  Contacter AS 联系人, Ctel AS 联系电话, administrator AS 值班人员
                                            FROM ' + @tablename + ' WHERE (handleFlg=1) order by Aid desc '
exec(@sql)
GO
/****** Object:  StoredProcedure [dbo].[sp_loadAlarmLogDoing]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_loadAlarmLogDoing]    Script Date: 03/26/2016 11:36:34 ******/
--创建存储过程: 加载未处理报警事件
CREATE     PROCEDURE [dbo].[sp_loadAlarmLogDoing]
    @tablename  varchar(50) = 0   --报警事件表名
as

DECLARE @sql nvarchar(4000)

SET @sql = 'SELECT top 10 Aid,Cid, Unumber AS 用户编号, GroupNumber AS 用户分组, Uname AS 用户名称, 
                                                  Uaddress AS 用户地址, FacilityModule AS 模块, FacilityDefence AS 防区, Dtype as 防区类型,
                                                  Dsite AS 探测器位置, EventRemark AS 事件描述, assistRemark AS 辅助信息, 
                                                  receiveTEL AS 接收源, alarmClassify AS 归类处理, handleContent AS 处理内容, 
                                                  occurrenceTime AS 发生时间, receiveTime AS 接警时间, handleTime AS 处警时间, 
                                                  Contacter AS 联系人, Ctel AS 联系电话, administrator AS 值班人员
                                            FROM ' + @tablename + ' WHERE (handleFlg=2) order by Aid desc '
exec(@sql)
GO
/****** Object:  StoredProcedure [dbo].[sp_loadAlarmLogCount]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_loadAlarmLogCount]    Script Date: 03/26/2016 11:36:34 ******/
--创建存储过程: 加载事件已处理条数
CREATE PROCEDURE [dbo].[sp_loadAlarmLogCount]
    @tablename  varchar(50) = 0   --报警事件表名
as

DECLARE @sql nvarchar(4000)

SET @sql = 'Select Count(0) From ' + @tablename + ' WHERE (handleFlg = 0)'

exec(@sql)
GO
/****** Object:  StoredProcedure [dbo].[sp_insertAlarmlog]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_insertAlarmlog]    Script Date: 03/26/2016 11:36:34 ******/
--创建存储过程: 插入报警事件
CREATE PROCEDURE [dbo].[sp_insertAlarmlog]
@tablename nvarchar(50),
@unumber nvarchar(50),
@GroupNumber nvarchar(50),
@uname nvarchar(50), 
@uaddress nvarchar(200), 
@facilitymodule nvarchar(50), 
@facilitydefence nvarchar(50), 
@dsite nvarchar(50), 
@eventremark nvarchar(50),
@assistremark nvarchar(50),
@receivetel nvarchar(50), 
@alarmclassify nvarchar(50), 
@occurrencetime nvarchar(50), 
@receivetime nvarchar(50), 
@handletime nvarchar(50), 
@handlecontent nvarchar(50),
@contacter nvarchar(50),
@ctel nvarchar(50), 
@administrator nvarchar(50), 
@Cid nvarchar(50), 
@Dtype nvarchar(50), 
@alarmContent nvarchar(200), 
@RecordPath nvarchar(200), 
@TCPalarmContent nvarchar(200),
@handleFlg nvarchar(50)

AS
DECLARE @sql nvarchar(4000)
SET @sql = 'insert into ' + @tablename + '(unumber,GroupNumber,uname,uaddress,
				facilitymodule,facilitydefence,dsite,eventremark,assistremark,
				receivetel,alarmclassify,occurrencetime,receivetime,handletime,
				handlecontent,contacter,ctel,administrator,Cid,Dtype,alarmContent,
				RecordPath,TCPalarmContent,handleFlg)
			values('+ @unumber + ',' + @GroupNumber + ',' + @uname + ',' + @uaddress + ',' +
				 @facilitymodule + ',' + @facilitydefence + ',' + @dsite + ',' + @eventremark + ',' +
				 @assistremark + ',' + @receivetel + ',' + @alarmclassify + ',' + @occurrencetime + ',' + 
				 @receivetime + ',' + @handletime + ',' + @handlecontent + ',' + @contacter + ',' + 
				 @ctel + ',' + @administrator + ',' + @Cid + ',' + @Dtype + ',' + @alarmContent + ',' +
				 @RecordPath + ',' + @TCPalarmContent +','+@handleFlg +')'

--print @sql

exec(@sql)
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
/****** Object:  StoredProcedure [dbo].[sp_updateUserLastReportTime]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_updateUserLastReportTime]    Script Date: 03/26/2016 11:36:34 ******/
--创建存储过程: 更新用户最后上报时间
CREATE     PROCEDURE [dbo].[sp_updateUserLastReportTime]
    
    @group  varchar(50) = 0,  --中心分组号
    @number  varchar(50) = 0   --用户编号
as

update UserBasic set LastReportTime= getDate() where (dbo.UserBasic.GroupNum = @group) AND (dbo.UserBasic.Unumber = @number);
GO
/****** Object:  StoredProcedure [dbo].[sp_updateUserArmTime]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_updateUserArmTime]    Script Date: 03/26/2016 11:36:34 ******/
--创建存储过程: 更新用户布撤防时间
CREATE     PROCEDURE [dbo].[sp_updateUserArmTime]
    
    @group  varchar(50) = 0,  --中心分组号
    @number  varchar(50) = 0   --用户编号
as

update UserBasic set ArmTime= getDate() where (dbo.UserBasic.GroupNum = @group) AND (dbo.UserBasic.Unumber = @number);
GO
/****** Object:  StoredProcedure [dbo].[sp_updatestate]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_updatestate]    Script Date: 03/26/2016 11:36:34 ******/
--创建存储过程: 更新布撤防状态
CREATE     PROCEDURE [dbo].[sp_updatestate]
    
    @group  varchar(50) = 0,   --中心分组号
    @number  varchar(50) = 0,  --用户编号
    @state varchar(50) = 0     -- 布撤防状态
as

update UserBasic set Ustate = @state where (dbo.UserBasic.GroupNum = @group) AND (dbo.UserBasic.Unumber = @number);
GO
/****** Object:  StoredProcedure [dbo].[sp_updateNetstate]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_updateNetstate]    Script Date: 03/26/2016 11:36:34 ******/
--创建存储过程: 更新网络状态
CREATE     PROCEDURE [dbo].[sp_updateNetstate]
    
    @group  varchar(50) = 0,   --中心分组号
    @number  varchar(50) = 0,  --用户编号
    @state varchar(50) = 0     -- 网络状态
as

update UserBasic set Unetstate = @state where (dbo.UserBasic.GroupNum = @group) AND (dbo.UserBasic.Unumber = @number);
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
/****** Object:  StoredProcedure [dbo].[sp_updateCheckBFOver]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_updateCheckBFOver]    Script Date: 03/26/2016 11:36:34 ******/
--创建存储过程: 更新检测布防超期标记
CREATE     PROCEDURE [dbo].[sp_updateCheckBFOver]
    
    @group  varchar(50) = 0,   --中心分组号
    @number  varchar(50) = 0,  --用户编号
    @Flg int = 0               -- 检测布防超期标记
as

update UserBasic set CheckBFOver = @Flg where (dbo.UserBasic.GroupNum = @group) AND (dbo.UserBasic.Unumber = @number);
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUserlastTime]    Script Date: 01/18/2018 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUserlastTime]    Script Date: 03/26/2016 11:36:34 ******/
CREATE     PROCEDURE [dbo].[sp_UpdateUserlastTime]
    
    @group  varchar(50) = 0,  --每页大小
    @number  varchar(50) = 0   --第几页
    
as

declare @aid int

SELECT @aid =dbo.AlarmFacility.Aid
                                        FROM dbo.UserBasic INNER JOIN
                                              dbo.UserFacility ON dbo.UserBasic.Uid = dbo.UserFacility.Uid INNER JOIN
                                              dbo.AlarmFacility ON dbo.UserFacility.Fic = dbo.AlarmFacility.Aid
                                        WHERE (dbo.UserBasic.GroupNum = @group) AND (dbo.UserBasic.Unumber = @number);
       
update AlarmFacility set AlastTime= getDate() where Aid=@aid ;
GO
/****** Object:  Default [DF__WXSetting__Port__778AC167]    Script Date: 01/18/2018 18:04:18 ******/
ALTER TABLE [dbo].[WXSetting] ADD  DEFAULT ('0') FOR [Port]
GO
/****** Object:  Default [DF_viewConfig_Vcount]    Script Date: 01/18/2018 18:04:18 ******/
ALTER TABLE [dbo].[viewConfig] ADD  CONSTRAINT [DF_viewConfig_Vcount]  DEFAULT ((1)) FOR [Vflag]
GO
/****** Object:  Default [DF__viewConfi__Cente__797309D9]    Script Date: 01/18/2018 18:04:18 ******/
ALTER TABLE [dbo].[viewConfig] ADD  DEFAULT ('0') FOR [CenterID]
GO
/****** Object:  Default [DF__userListC__Cente__7A672E12]    Script Date: 01/18/2018 18:04:18 ******/
ALTER TABLE [dbo].[userListColor] ADD  DEFAULT ('0') FOR [CenterID]
GO
/****** Object:  Default [DF__adminUser__Cente__73BA3083]    Script Date: 01/18/2018 18:04:18 ******/
ALTER TABLE [dbo].[adminUser] ADD  DEFAULT ('0') FOR [CenterID]
GO
/****** Object:  Default [DF__adminUser__IsUse__74AE54BC]    Script Date: 01/18/2018 18:04:18 ******/
ALTER TABLE [dbo].[adminUser] ADD  DEFAULT ('1') FOR [IsUser]
GO
/****** Object:  Default [DF__ContactID__是否显示__5F7E2DAC]    Script Date: 01/18/2018 18:04:18 ******/
ALTER TABLE [dbo].[ContactID] ADD  DEFAULT ('1') FOR [是否显示]
GO
/****** Object:  Default [DF__Contacter__CPwd__75A278F5]    Script Date: 01/18/2018 18:04:18 ******/
ALTER TABLE [dbo].[Contacter] ADD  DEFAULT ('0') FOR [CPwd]
GO
/****** Object:  Default [DF_Contacter_Crandom]    Script Date: 01/18/2018 18:04:18 ******/
ALTER TABLE [dbo].[Contacter] ADD  CONSTRAINT [DF_Contacter_Crandom]  DEFAULT (rand()) FOR [Crandom]
GO
/****** Object:  Default [DF__ServerInf__Cente__6477ECF3]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[ServerInfo] ADD  DEFAULT ('0') FOR [CenterID]
GO
/****** Object:  Default [DF_SerialPortInfo_StrueOffalse]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SerialPortInfo] ADD  CONSTRAINT [DF_SerialPortInfo_StrueOffalse]  DEFAULT ((0)) FOR [StrueOffalse]
GO
/****** Object:  Default [DF__SerialPor__SErro__66603565]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SerialPortInfo] ADD  DEFAULT ('0') FOR [SError]
GO
/****** Object:  Default [DF__SerialPor__Cente__6754599E]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SerialPortInfo] ADD  DEFAULT ('0') FOR [CenterID]
GO
/****** Object:  Default [DF__SerialPor__SType__5CA1C101]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SerialPortInfo] ADD  DEFAULT ('0') FOR [SType]
GO
/****** Object:  Default [DF__PayType__CenterI__6FB49575]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[PayType] ADD  DEFAULT ('0') FOR [CenterID]
GO
/****** Object:  Default [DF_messageTo_Mflag]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[messageTo] ADD  CONSTRAINT [DF_messageTo_Mflag]  DEFAULT ((0)) FOR [Mflag]
GO
/****** Object:  Default [DF_MessageLog_Mdate]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[MessageLog] ADD  CONSTRAINT [DF_MessageLog_Mdate]  DEFAULT (getdate()) FOR [Mdate]
GO
/****** Object:  Default [DF_home_HStatus]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[home] ADD  CONSTRAINT [DF_home_HStatus]  DEFAULT ((2)) FOR [HStatus]
GO
/****** Object:  Default [DF_ClientInfo_Cname]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[ClientInfo] ADD  CONSTRAINT [DF_ClientInfo_Cname]  DEFAULT (N'未命名客户端') FOR [Cname]
GO
/****** Object:  Default [DF_ClientInfo_Cflag]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[ClientInfo] ADD  CONSTRAINT [DF_ClientInfo_Cflag]  DEFAULT ((0)) FOR [Cflag]
GO
/****** Object:  Default [DF__camera__ChannelS__6D0D32F4]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[camera] ADD  DEFAULT ('1') FOR [ChannelSum]
GO
/****** Object:  Default [DF__AlarmLogB__Polic__55F4C372]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLogBak_Auto_2017_05_22_12_27_41] ADD  DEFAULT ('无') FOR [PoliceContent]
GO
/****** Object:  Default [DF__AlarmLogB__handl__56E8E7AB]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLogBak_Auto_2017_05_22_12_27_41] ADD  DEFAULT ('0') FOR [handleFlg]
GO
/****** Object:  Default [DF_AlarmLogBak_GroupNumber]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLogBak] ADD  CONSTRAINT [DF_AlarmLogBak_GroupNumber]  DEFAULT ('000000') FOR [GroupNumber]
GO
/****** Object:  Default [DF__AlarmLogB__Polic__1B9317B3]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLogBak] ADD  CONSTRAINT [DF__AlarmLogB__Polic__1B9317B3]  DEFAULT ('无') FOR [PoliceContent]
GO
/****** Object:  Default [DF__AlarmLogB__handl__6FE99F9F]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLogBak] ADD  DEFAULT ('0') FOR [handleFlg]
GO
/****** Object:  Default [DF__AlarmLog___Polic__7FEAFD3E]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog_805186] ADD  DEFAULT ('无') FOR [PoliceContent]
GO
/****** Object:  Default [DF__AlarmLog___handl__00DF2177]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog_805186] ADD  DEFAULT ('0') FOR [handleFlg]
GO
/****** Object:  Default [DF__AlarmLog___Polic__7908F585]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog_506606] ADD  DEFAULT ('无') FOR [PoliceContent]
GO
/****** Object:  Default [DF__AlarmLog___handl__79FD19BE]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog_506606] ADD  DEFAULT ('0') FOR [handleFlg]
GO
/****** Object:  Default [DF__AlarmLog___Polic__59C55456]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog_409267Bak_Auto] ADD  DEFAULT ('无') FOR [PoliceContent]
GO
/****** Object:  Default [DF__AlarmLog___handl__5AB9788F]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog_409267Bak_Auto] ADD  DEFAULT ('0') FOR [handleFlg]
GO
/****** Object:  Default [DF__AlarmLog___Polic__339FAB6E]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog_409267] ADD  DEFAULT ('无') FOR [PoliceContent]
GO
/****** Object:  Default [DF__AlarmLog___handl__3493CFA7]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog_409267] ADD  DEFAULT ('0') FOR [handleFlg]
GO
/****** Object:  Default [DF__AlarmLog___Polic__03BB8E22]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog_409261] ADD  DEFAULT ('无') FOR [PoliceContent]
GO
/****** Object:  Default [DF__AlarmLog___handl__04AFB25B]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog_409261] ADD  DEFAULT ('0') FOR [handleFlg]
GO
/****** Object:  Default [DF__AlarmLog___Polic__44CA3770]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog_409192] ADD  DEFAULT ('无') FOR [PoliceContent]
GO
/****** Object:  Default [DF__AlarmLog___handl__45BE5BA9]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog_409192] ADD  DEFAULT ('0') FOR [handleFlg]
GO
/****** Object:  Default [DF_AlarmLog_GroupNumber]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog] ADD  CONSTRAINT [DF_AlarmLog_GroupNumber]  DEFAULT ('000000') FOR [GroupNumber]
GO
/****** Object:  Default [DF__AlarmLog__Police__1A9EF37A]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog] ADD  CONSTRAINT [DF__AlarmLog__Police__1A9EF37A]  DEFAULT ('无') FOR [PoliceContent]
GO
/****** Object:  Default [DF__AlarmLog__handle__72C60C4A]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmLog] ADD  DEFAULT ('0') FOR [handleFlg]
GO
/****** Object:  Default [DF_SystemConfig_ScenterName]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SystemConfig] ADD  CONSTRAINT [DF_SystemConfig_ScenterName]  DEFAULT (N'神眼联网接警中心V3') FOR [ScenterName]
GO
/****** Object:  Default [DF_SystemConfig_SalarmSound]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SystemConfig] ADD  CONSTRAINT [DF_SystemConfig_SalarmSound]  DEFAULT ((60)) FOR [SalarmSound]
GO
/****** Object:  Default [DF_SystemConfig_SalarmShow]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SystemConfig] ADD  CONSTRAINT [DF_SystemConfig_SalarmShow]  DEFAULT ((60)) FOR [SalarmShow]
GO
/****** Object:  Default [DF_SystemConfig_Sonline]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SystemConfig] ADD  CONSTRAINT [DF_SystemConfig_Sonline]  DEFAULT ((0)) FOR [Sonline]
GO
/****** Object:  Default [DF_SystemConfig_SMapLatLng]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SystemConfig] ADD  CONSTRAINT [DF_SystemConfig_SMapLatLng]  DEFAULT (N'30.6692190011853, 104.066276550293') FOR [SMapLatLng]
GO
/****** Object:  Default [DF_SystemConfig_SMapLevel]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SystemConfig] ADD  CONSTRAINT [DF_SystemConfig_SMapLevel]  DEFAULT ((4)) FOR [SMapLevel]
GO
/****** Object:  Default [DF_SystemConfig_SallView]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SystemConfig] ADD  CONSTRAINT [DF_SystemConfig_SallView]  DEFAULT ((0)) FOR [SallView]
GO
/****** Object:  Default [DF_SystemConfig_SMapType]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SystemConfig] ADD  CONSTRAINT [DF_SystemConfig_SMapType]  DEFAULT ((0)) FOR [SMapType]
GO
/****** Object:  Default [DF_SystemConfig_SSubCenterPort]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SystemConfig] ADD  CONSTRAINT [DF_SystemConfig_SSubCenterPort]  DEFAULT ((0)) FOR [SSubCenterPort]
GO
/****** Object:  Default [DF__SystemCon__SSubC__03F0984C]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SystemConfig] ADD  DEFAULT ('0') FOR [SSubCenterNum]
GO
/****** Object:  Default [DF__SystemCon__AreaC__04E4BC85]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SystemConfig] ADD  DEFAULT ('000000000000') FOR [AreaCode]
GO
/****** Object:  Default [DF__SystemCon__Cente__05D8E0BE]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SystemConfig] ADD  DEFAULT ('0') FOR [CenterID]
GO
/****** Object:  Default [DF_SysLog_SdateTime]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SysLog] ADD  CONSTRAINT [DF_SysLog_SdateTime]  DEFAULT (getdate()) FOR [SdateTime]
GO
/****** Object:  Default [DF__SysLog__CenterID__07C12930]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[SysLog] ADD  DEFAULT ('0') FOR [CenterID]
GO
/****** Object:  Default [DF_AlarmFacility_AlastTime]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmFacility] ADD  CONSTRAINT [DF_AlarmFacility_AlastTime]  DEFAULT (getdate()) FOR [AlastTime]
GO
/****** Object:  Default [DF_AlarmFacility_AinstallDate]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmFacility] ADD  CONSTRAINT [DF_AlarmFacility_AinstallDate]  DEFAULT (getdate()) FOR [AinstallDate]
GO
/****** Object:  Default [DF__AlarmFaci__remot__05A3D694]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmFacility] ADD  DEFAULT ('') FOR [remoteType]
GO
/****** Object:  Default [DF_Defence_Dimg]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[Defence] ADD  CONSTRAINT [DF_Defence_Dimg]  DEFAULT (N'\\Defence\\default.png') FOR [Dimg]
GO
/****** Object:  Default [DF_UserBasic_GroupNum]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  CONSTRAINT [DF_UserBasic_GroupNum]  DEFAULT ('000000') FOR [GroupNum]
GO
/****** Object:  Default [DF_UserBasic_UDefenceImage]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  CONSTRAINT [DF_UserBasic_UDefenceImage]  DEFAULT (N'no pic.jpg') FOR [UDefenceImage]
GO
/****** Object:  Default [DF_UserBasic_UnetState]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  CONSTRAINT [DF_UserBasic_UnetState]  DEFAULT (N'离线') FOR [UnetState]
GO
/****** Object:  Default [DF_UserBasic_Ustate]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  CONSTRAINT [DF_UserBasic_Ustate]  DEFAULT (N'未知') FOR [Ustate]
GO
/****** Object:  Default [DF_UserBasic_Utest]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  CONSTRAINT [DF_UserBasic_Utest]  DEFAULT ((24)) FOR [Utest]
GO
/****** Object:  Default [DF_UserBasic_Uarrest]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  CONSTRAINT [DF_UserBasic_Uarrest]  DEFAULT ((0)) FOR [Uarrest]
GO
/****** Object:  Default [DF_UserBasic_UsendMsg]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  CONSTRAINT [DF_UserBasic_UsendMsg]  DEFAULT ((0)) FOR [UsendMsg]
GO
/****** Object:  Default [DF_UserBasic_CameraID]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  CONSTRAINT [DF_UserBasic_CameraID]  DEFAULT ((0)) FOR [CameraID]
GO
/****** Object:  Default [DF_UserBasic_VideoStream_1]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  CONSTRAINT [DF_UserBasic_VideoStream_1]  DEFAULT ((1)) FOR [VideoStream]
GO
/****** Object:  Default [DF_UserBasic_VideoStart_1]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  CONSTRAINT [DF_UserBasic_VideoStart_1]  DEFAULT ((2300)) FOR [VideoStart]
GO
/****** Object:  Default [DF_UserBasic_VideoEnd_1]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  CONSTRAINT [DF_UserBasic_VideoEnd_1]  DEFAULT ((700)) FOR [VideoEnd]
GO
/****** Object:  Default [DF__UserBasic__UDefe__1332DBDC]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  DEFAULT ('1') FOR [UDefenceImageAuto]
GO
/****** Object:  Default [DF__UserBasic__AreaC__14270015]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  DEFAULT ('000000000000') FOR [AreaCode]
GO
/****** Object:  Default [DF__UserBasic__Cente__151B244E]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  DEFAULT ('0') FOR [CenterID]
GO
/****** Object:  Default [DF__UserBasic__ShowA__5D95E53A]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  DEFAULT ('0') FOR [ShowAllVideo]
GO
/****** Object:  Default [DF__UserBasic__PayTy__5E8A0973]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic] ADD  DEFAULT ('0') FOR [PayType]
GO
/****** Object:  ForeignKey [FK_AlarmFacility_Construct]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmFacility]  WITH CHECK ADD  CONSTRAINT [FK_AlarmFacility_Construct] FOREIGN KEY([Cid])
REFERENCES [dbo].[Construct] ([Cid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[AlarmFacility] CHECK CONSTRAINT [FK_AlarmFacility_Construct]
GO
/****** Object:  ForeignKey [FK_AlarmFacility_Fmodel]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[AlarmFacility]  WITH CHECK ADD  CONSTRAINT [FK_AlarmFacility_Fmodel] FOREIGN KEY([Tid])
REFERENCES [dbo].[Fmodel] ([Tid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[AlarmFacility] CHECK CONSTRAINT [FK_AlarmFacility_Fmodel]
GO
/****** Object:  ForeignKey [FK_ClientMessage_ClientInfo]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[ClientMessage]  WITH CHECK ADD  CONSTRAINT [FK_ClientMessage_ClientInfo] FOREIGN KEY([Cid])
REFERENCES [dbo].[ClientInfo] ([Cid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientMessage] CHECK CONSTRAINT [FK_ClientMessage_ClientInfo]
GO
/****** Object:  ForeignKey [FK_ClientMessage_messageTo]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[ClientMessage]  WITH CHECK ADD  CONSTRAINT [FK_ClientMessage_messageTo] FOREIGN KEY([Mid])
REFERENCES [dbo].[messageTo] ([Mid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientMessage] CHECK CONSTRAINT [FK_ClientMessage_messageTo]
GO
/****** Object:  ForeignKey [FK_Defence_DefenceType]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[Defence]  WITH CHECK ADD  CONSTRAINT [FK_Defence_DefenceType] FOREIGN KEY([Dtypeid])
REFERENCES [dbo].[DefenceType] ([DTid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Defence] CHECK CONSTRAINT [FK_Defence_DefenceType]
GO
/****** Object:  ForeignKey [FK_UserBasic_AlarmSubstation]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserBasic]  WITH NOCHECK ADD  CONSTRAINT [FK_UserBasic_AlarmSubstation] FOREIGN KEY([Sid])
REFERENCES [dbo].[AlarmSubstation] ([Sid])
GO
ALTER TABLE [dbo].[UserBasic] CHECK CONSTRAINT [FK_UserBasic_AlarmSubstation]
GO
/****** Object:  ForeignKey [FK_UserFacility_AlarmFacility]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserFacility]  WITH NOCHECK ADD  CONSTRAINT [FK_UserFacility_AlarmFacility] FOREIGN KEY([Fic])
REFERENCES [dbo].[AlarmFacility] ([Aid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserFacility] CHECK CONSTRAINT [FK_UserFacility_AlarmFacility]
GO
/****** Object:  ForeignKey [FK_UserFacility_UserBasic]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserFacility]  WITH NOCHECK ADD  CONSTRAINT [FK_UserFacility_UserBasic] FOREIGN KEY([Uid])
REFERENCES [dbo].[UserBasic] ([Uid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserFacility] CHECK CONSTRAINT [FK_UserFacility_UserBasic]
GO
/****** Object:  ForeignKey [FK_UserContacter_Contacter]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserContacter]  WITH CHECK ADD  CONSTRAINT [FK_UserContacter_Contacter] FOREIGN KEY([Cid])
REFERENCES [dbo].[Contacter] ([Cid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserContacter] CHECK CONSTRAINT [FK_UserContacter_Contacter]
GO
/****** Object:  ForeignKey [FK_UserContacter_UserBasic]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[UserContacter]  WITH NOCHECK ADD  CONSTRAINT [FK_UserContacter_UserBasic] FOREIGN KEY([Uid])
REFERENCES [dbo].[UserBasic] ([Uid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserContacter] CHECK CONSTRAINT [FK_UserContacter_UserBasic]
GO
/****** Object:  ForeignKey [FK_FacilityModule_AlarmFacility]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[FacilityModule]  WITH NOCHECK ADD  CONSTRAINT [FK_FacilityModule_AlarmFacility] FOREIGN KEY([Aid])
REFERENCES [dbo].[AlarmFacility] ([Aid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacilityModule] CHECK CONSTRAINT [FK_FacilityModule_AlarmFacility]
GO
/****** Object:  ForeignKey [FK_FacilityModule_FModule]    Script Date: 01/18/2018 18:04:19 ******/
ALTER TABLE [dbo].[FacilityModule]  WITH CHECK ADD  CONSTRAINT [FK_FacilityModule_FModule] FOREIGN KEY([Mid])
REFERENCES [dbo].[FModule] ([Mid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FacilityModule] CHECK CONSTRAINT [FK_FacilityModule_FModule]
GO
