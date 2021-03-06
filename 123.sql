USE [master]
GO
/****** Object:  Database [CollectFirewood]    Script Date: 2021/4/5 13:23:47 ******/
CREATE DATABASE [CollectFirewood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CollectFirewood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CollectFirewood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CollectFirewood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CollectFirewood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CollectFirewood] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CollectFirewood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CollectFirewood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CollectFirewood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CollectFirewood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CollectFirewood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CollectFirewood] SET ARITHABORT OFF 
GO
ALTER DATABASE [CollectFirewood] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CollectFirewood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CollectFirewood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CollectFirewood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CollectFirewood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CollectFirewood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CollectFirewood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CollectFirewood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CollectFirewood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CollectFirewood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CollectFirewood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CollectFirewood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CollectFirewood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CollectFirewood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CollectFirewood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CollectFirewood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CollectFirewood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CollectFirewood] SET RECOVERY FULL 
GO
ALTER DATABASE [CollectFirewood] SET  MULTI_USER 
GO
ALTER DATABASE [CollectFirewood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CollectFirewood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CollectFirewood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CollectFirewood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CollectFirewood] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CollectFirewood] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CollectFirewood] SET QUERY_STORE = OFF
GO
USE [CollectFirewood]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 2021/4/5 13:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[Id] [int] IDENTITY(10000,1) NOT NULL,
	[AdminName] [nvarchar](16) NOT NULL,
	[Pwd] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classifys]    Script Date: 2021/4/5 13:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classifys](
	[Id] [int] IDENTITY(10000,1) NOT NULL,
	[ClassifyName] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_Classify] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 2021/4/5 13:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(10000,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Content] [nvarchar](1024) NOT NULL,
	[SendTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LaunchInfo]    Script Date: 2021/4/5 13:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaunchInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProjectId] [int] NULL,
	[TrueName] [nchar](10) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[BankName] [nvarchar](50) NULL,
	[Branch] [nvarchar](50) NULL,
	[BankCard] [nchar](20) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_LaunchInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 2021/4/5 13:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[UserId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 2021/4/5 13:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassifyId] [int] NOT NULL,
	[ProjectName] [nvarchar](32) NOT NULL,
	[State] [int] NOT NULL,
	[CurrentMoney] [money] NULL,
	[Goal] [money] NOT NULL,
	[Deadline] [date] NOT NULL,
	[LikeCount] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CoverImg] [nvarchar](64) NULL,
	[PublishState] [int] NULL,
	[OwnerId] [int] NULL,
	[Address] [nvarchar](50) NULL,
	[Return] [nvarchar](max) NULL,
	[ReturnMiddle] [nvarchar](max) NULL,
	[ReturnMax] [nvarchar](max) NULL,
	[ReturnTime] [int] NULL,
	[Freight] [money] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupportProjects]    Script Date: 2021/4/5 13:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupportProjects](
	[Id] [int] IDENTITY(10000,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Money] [money] NOT NULL,
 CONSTRAINT [PK_SupportProjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2021/4/5 13:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(10000,1) NOT NULL,
	[UserName] [nvarchar](16) NOT NULL,
	[Nickname] [nvarchar](32) NULL,
	[Pwd] [nvarchar](32) NOT NULL,
	[Sex] [nvarchar](2) NOT NULL,
	[Phone] [nvarchar](16) NULL,
	[Address] [nvarchar](64) NULL,
	[Url] [nvarchar](128) NULL,
	[UserPic] [nvarchar](512) NULL,
	[Description] [nvarchar](512) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([Id], [AdminName], [Pwd]) VALUES (10097, N'admin', N'f9c293c789e0f1a7cf6d2a81e26d80a2')
INSERT [dbo].[Admins] ([Id], [AdminName], [Pwd]) VALUES (10098, N'admin1', N'21232f297a57a5a743894a0e4a801fc3')
INSERT [dbo].[Admins] ([Id], [AdminName], [Pwd]) VALUES (10099, N'admin2', N'21232f297a57a5a743894a0e4a801fc3')
INSERT [dbo].[Admins] ([Id], [AdminName], [Pwd]) VALUES (10100, N'admin3', N'21232f297a57a5a743894a0e4a801fc3')
INSERT [dbo].[Admins] ([Id], [AdminName], [Pwd]) VALUES (10101, N'admin4', N'fc1ebc848e31e0a68e868432225e3c82')
INSERT [dbo].[Admins] ([Id], [AdminName], [Pwd]) VALUES (10102, N'admin5', N'f1c5098d0ba78caf670b747af58cb67c')
INSERT [dbo].[Admins] ([Id], [AdminName], [Pwd]) VALUES (10103, N'fasdfsad', N'2ab2f7e46f8d088173976146df2a0c52')
INSERT [dbo].[Admins] ([Id], [AdminName], [Pwd]) VALUES (10104, N'sdgsadg', N'26d35d3b200bf36b1d8144fe11d904ff')
INSERT [dbo].[Admins] ([Id], [AdminName], [Pwd]) VALUES (10105, N'sdagsadg', N'e6ccce98d9c5bcaf832fd17d732ede06')
INSERT [dbo].[Admins] ([Id], [AdminName], [Pwd]) VALUES (10106, N'sdagsdag', N'd7a31fccca6ec0e8b5dbc285aca33a51')
INSERT [dbo].[Admins] ([Id], [AdminName], [Pwd]) VALUES (10107, N'sdagsadg', N'862bbfe137e695270fd0c356a5e31021')
INSERT [dbo].[Admins] ([Id], [AdminName], [Pwd]) VALUES (10108, N'sgsadg', N'1906c859952e12c6c2da7b78db911616')
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Classifys] ON 

INSERT [dbo].[Classifys] ([Id], [ClassifyName]) VALUES (10000, N'科技')
INSERT [dbo].[Classifys] ([Id], [ClassifyName]) VALUES (10001, N'艺术')
INSERT [dbo].[Classifys] ([Id], [ClassifyName]) VALUES (10002, N'设计')
INSERT [dbo].[Classifys] ([Id], [ClassifyName]) VALUES (10003, N'音乐')
INSERT [dbo].[Classifys] ([Id], [ClassifyName]) VALUES (10004, N'影视')
INSERT [dbo].[Classifys] ([Id], [ClassifyName]) VALUES (10005, N'出版')
INSERT [dbo].[Classifys] ([Id], [ClassifyName]) VALUES (10006, N'动漫')
INSERT [dbo].[Classifys] ([Id], [ClassifyName]) VALUES (10007, N'公益')
INSERT [dbo].[Classifys] ([Id], [ClassifyName]) VALUES (10008, N'公开课')
INSERT [dbo].[Classifys] ([Id], [ClassifyName]) VALUES (10009, N'农业')
INSERT [dbo].[Classifys] ([Id], [ClassifyName]) VALUES (10010, N'苏州站')
INSERT [dbo].[Classifys] ([Id], [ClassifyName]) VALUES (10011, N'其他')
SET IDENTITY_INSERT [dbo].[Classifys] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content], [SendTime]) VALUES (10002, 10030, 10006, N'这个项目不错', N'2021/3/28 3:02:08')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content], [SendTime]) VALUES (10005, 10030, 10003, N'猫屎就很nice', N'2021/4/1 0:04:04')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content], [SendTime]) VALUES (10006, 10035, 10006, N'不错啊', N'2021/4/1 16:56:36')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content], [SendTime]) VALUES (10007, 10036, 10036, N'我也很爱学习呀', N'2021/4/5 12:57:53')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[LaunchInfo] ON 

INSERT [dbo].[LaunchInfo] ([id], [UserId], [ProjectId], [TrueName], [PhoneNumber], [BankName], [Branch], [BankCard], [Address]) VALUES (3, 10030, 10035, N'李圣林       ', N'17877121290', N'中国银行', N'不错的分行', N'0341631646164       ', N'广西南宁')
INSERT [dbo].[LaunchInfo] ([id], [UserId], [ProjectId], [TrueName], [PhoneNumber], [BankName], [Branch], [BankCard], [Address]) VALUES (4, 10030, 10038, N'李圣林       ', N'17877121290', N'中国银行', N'不错的分行', N'0341631646164       ', N'广西南宁')
INSERT [dbo].[LaunchInfo] ([id], [UserId], [ProjectId], [TrueName], [PhoneNumber], [BankName], [Branch], [BankCard], [Address]) VALUES (5, 10030, 10040, N'李圣林       ', N'17877121290', N'中国人民银行', N'中国人民银行分行', N'10991841771099184177', N'广西贵港')
INSERT [dbo].[LaunchInfo] ([id], [UserId], [ProjectId], [TrueName], [PhoneNumber], [BankName], [Branch], [BankCard], [Address]) VALUES (6, 10036, 10041, N'李圣林       ', N'17877121290', N'中国人民银行', N'中国人民银行分行', N'10991841771099184177', N'广西贵港')
SET IDENTITY_INSERT [dbo].[LaunchInfo] OFF
GO
INSERT [dbo].[Likes] ([UserId], [ProjectId]) VALUES (10030, 10011)
INSERT [dbo].[Likes] ([UserId], [ProjectId]) VALUES (10030, 10006)
INSERT [dbo].[Likes] ([UserId], [ProjectId]) VALUES (10035, 10006)
INSERT [dbo].[Likes] ([UserId], [ProjectId]) VALUES (10036, 10036)
INSERT [dbo].[Likes] ([UserId], [ProjectId]) VALUES (10030, 10035)
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10003, 10000, N'猫印咖啡', 3, 10000.0000, 10000.0000, CAST(N'2021-04-04' AS Date), 58, N'  猫印咖啡（meowinn coffee）是世纪华欧餐饮管理（北京）有限公司旗下的宠物主题咖啡西餐连锁品牌，将欧洲咖啡与西餐的精髓集于一身，并升华、发挥到极致。

         猫印咖啡填补了中国宠物主题咖啡西餐连锁品牌的空白，从空间、功能及体验等不同角度出发，将猫咪的悠然自得与都市人向往的宁静与安逸相结合，打造以宠物为主题的复合型文化空间，“咖啡+”的概念也因此而生。我们重新定义你的生活，为你守护简单的快乐，寻找印象中的“美好记忆”，打造自由的“Third places”(第三空间)。这里是家的另一半，是精神能够获得栖息的地方！', N'/Material/咖啡厅.jpg', 0, 10030, N'山东济南', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 10, 5.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10006, 10001, N'万达电影院', 0, 9700.0000, 80000.0000, CAST(N'2021-07-07' AS Date), 61, N'万达电影院线成立于2005年，隶属于万达集团，目前已经发展成为 “统一品牌，统一经营，统一供片，统一管理”的高标准现代化院线体系，是中国排名第一的院线，拥有五星级影城50家，400块银幕，占有全国15%的票房份额。2010年将开业21家影城，新增200块银幕，使影城总数达到71家，银幕达到600块，占有全国18%的票房份额，成为亚洲排名第一的院线。到2012年将开业110家以上的影城，拥有银幕1000块，年收入30亿元，成为全球排名前八的电影院线。', N'/Material/电影院.jpg', 1, 10030, N'浙江湖州', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 10, 4.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10007, 10002, N'【大卫相声】国家首个电商相声院', 3, 4400.0000, 10000.0000, CAST(N'2021-04-04' AS Date), 27, N'德云社是中国的大型专业相声社团，全称北京德云社文化传播有限公司，成立于1996年。 [28]  曾经名为北京相声大会，2003年更名为德云社。以“让相声回归剧场”，做“真正的相声”为要旨。2011年7月3日，德云社在北展剧场开辟新形式，用方言以及话剧和相声混搭方式表演相声剧等，为观众演绎从清朝、民国到新中国成立后的各种风格流派的相声。
“德云社”是以弘扬中华民族文化、培养曲艺人才、服务大众为主旨的曲艺演出团体。社团最初由著名相声演员张文顺（已故）、郭德纲、李菁（退出）于1996年创建，经历了二十六年的风雨历程实属艰辛，但是值得欣慰的是经过郭德纲先生和众多位新老相声演员的不懈努力，德云社正在逐步走向辉煌。德云社所属的“北京相声大会”每周都在天桥乐茶园等地演出五、六场。
北京德云社以天桥剧场为总部，在北京还有三里屯剧场、三庆园剧场、新街口剧场、广德楼剧场和湖广会馆剧场，以及东北的黑龙江德云社、吉林长春德云社，位于南方的南京德云社。还有首个海外分社德云社墨尔本分社。 [1]  这也是中国相声社团跨出国门在海外建立的首个分支机构。
2020年6月，德云社与齐鲁工业大学计划合作成立德云学院。 [2]', N'/Material/相声.jpg', 1, 10016, N'广东广州', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 10, 3.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10008, 10003, N'【大卫咖啡】国家首个电商咖啡', 0, 4200.0000, 15000.0000, CAST(N'2021-12-01' AS Date), 36, N'咖啡店又称之为咖啡馆。最早的咖啡馆叫做“Kaveh Kanes”,是在麦加建成的。尽管最初是出于一种宗教目的，但很快这些地方就成了下棋、闲聊、唱歌、跳舞和欣赏音乐的中心。从麦加开始，咖啡馆又遍及亚丁、梅迪纳（Medina）和开罗（Cairo）。咖啡馆是人们休闲、商务交流的场所。普遍认为，人类首次在非洲发现咖啡。亚洲人浮士德内罗尼的《不知道睡觉的修道院》里记载了这个故事：埃塞俄比亚的牧羊少年发现自己的羊群吃了灌木上的红色果实之后，兴奋不已地不肯回家。他以为羊群中毒了，但是几个小时之后，羊群恢复正常。少年自己尝了一口这个果实，顿时倦意全消。他把这个发现告诉周围的人，夜晚需要长时间静修的基督教修士们开始把它当成日常食用的提神食品。', N'/Material/咖啡厅.jpg', 1, 10015, N'广西柳州', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 10, 5.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10010, 10004, N'嘀嘀陪玩(游戏)，你玩了吗？', 0, 4800.0000, 10000.0000, CAST(N'2021-08-06' AS Date), 88, N'比心陪练 [1]  是一款 “游戏陪练”+“技能分享”的游戏陪练App， [1]  于2014年正式上线。
数年来，专注并深耕游戏陪练，获IDG资本投资。 [2]  其服务包括：线上游戏陪练和其它娱乐技能品类。 [1]  现比心用户超过5000万，大神陪练师超600万。 [3]  2020年7月，比心陪练平台公布《六周年数据报告》，2020年上半年比心平台新增的“游戏陪练大神”中，三四线城市占比增至48%，超过95万人。 [4] 
2020年8月20日，人民网刊文《本网调查：“比心陪练”平台“深夜服务”涉黄严重》称，发现比心陪练APP上有陪练师向玩家兜售涉黄服务；8月21日，比心陪练回应被指涉黄称，已采取账号冻结、列入黑名单风控系统等措施。 [5]', N'/Material/嘀嘀陪玩.jpg', 1, 10017, N'广西南宁', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 10, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10011, 10005, N'广西中庭装饰工程集团有限责任公司', 0, 60000.0000, 150000.0000, CAST(N'2021-09-17' AS Date), 92, N'广西中庭装饰工程集团有限责任公司成立于2010年，主要经营，建筑装饰设计、园林景观设计、市政公用工程、建筑装修装饰工程；销售：电子产品、五金交电、办公用品、电脑耗材、工艺品、建筑装饰材料。 [1]  广西中庭装饰工程集团有限责任公司,是广西建筑装饰协会住宅装修分会常务理事单位', N'/Material/快装快修.jpg', 1, 10018, N'广西贵港', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 10, 1.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10016, 10006, N'我超爱学习', 3, 5000.0000, 15000.0000, CAST(N'2021-04-04' AS Date), 0, N'我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习', N'/Material/~SL37@}CY3Q(W8WY$PJPXIP.png', 1, 10030, N'广西南宁江南区', N'赏你奥里给300吨', N'赏你奥里给500吨', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 10, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10017, 10007, N'猫印咖啡', 1, 10000.0000, 10000.0000, CAST(N'2021-04-29' AS Date), 58, N'  猫印咖啡（meowinn coffee）是世纪华欧餐饮管理（北京）有限公司旗下的宠物主题咖啡西餐连锁品牌，将欧洲咖啡与西餐的精髓集于一身，并升华、发挥到极致。', N'/Material/咖啡厅.jpg', 1, 10030, N'浙江湖州', N'赏你奥里给300吨', N'赏你奥里给300吨', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 0, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10020, 10008, N'万达电影院', 0, 3400.0000, 80000.0000, CAST(N'2021-07-07' AS Date), 59, N'万达电影院线成立于2005年，隶属于万达集团，目前已经发展成为 “统一品牌，统一经营，统一供片，统一管理”的高标准现代化院线体系，是中国排名第一的院线，拥有五星级影城50家，400块银幕，占有全国15%的票房份额。2010年将开业21家影城，新增200块银幕，使影城总数达到71家，银幕达到600块，占有全国18%的票房份额，成为亚洲排名第一的院线。到2012年将开业110家以上的影城，拥有银幕1000块，年收入30亿元，成为全球排名前八的电影院线。', N'/Material/电影院.jpg', 1, 10030, N'浙江湖州', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会', N'赏你奥里给300吨', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 0, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10022, 10009, N'【大卫相声】国家首个电商相声院', 0, 4400.0000, 10000.0000, CAST(N'2021-05-09' AS Date), 27, N'德云社是中国的大型专业相声社团，全称北京德云社文化传播有限公司，成立于1996年。 [28]  曾经名为北京相声大会，2003年更名为德云社。以“让相声回归剧场”，做“真正的相声”为要旨。2011年7月3日，德云社在北展剧场开辟新形式，用方言以及话剧和相声混搭方式表演相声剧等，为观众演绎从清朝、民国到新中国成立后的各种风格流派的相声。', N'/Material/咖啡厅.jpg', 1, 10016, N'浙江湖州', N'赏你赏你奥里给300吨奥里给300吨', N'赏你奥里给300吨', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 0, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10025, 10010, N'【大卫咖啡】国家首个电商咖啡', 0, 4200.0000, 15000.0000, CAST(N'2021-12-01' AS Date), 36, N'咖啡店又称之为咖啡馆。最早的咖啡馆叫做“Kaveh Kanes”,是在麦加建成的。尽管最初是出于一种宗教目的，但很快这些地方就成了下棋、闲聊、唱歌、跳舞和欣赏音乐的中心。从麦加开始，咖啡馆又遍及亚丁、梅迪纳（Medina）和开罗（Cairo）。咖啡馆是人们休闲、商务交流的场所。普遍认为，人类首次在非洲发现咖啡。亚洲人浮士德内罗尼的《不知道睡觉的修道院》里记载了这个故事：埃塞俄比亚的牧羊少年发现自己的羊群吃了灌木上的红色果实之后，兴奋不已地不肯回家。他以为羊群中毒了，但是几个小时之后，羊群恢复正常。少年自己尝了一口这个果实，顿时倦意全消。他把这个发现告诉周围的人，夜晚需要长时间静修的基督教修士们开始把它当成日常食用的提神食品。', N'/Material/咖啡厅.jpg', 1, 10015, N'广西柳州', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会', N'赏你奥里给300吨', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 0, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10027, 10011, N'嘀嘀陪玩(游戏)，你玩了吗？', 0, 4800.0000, 10000.0000, CAST(N'2021-08-06' AS Date), 88, N'比心陪练 [1]  是一款 “游戏陪练”+“技能分享”的游戏陪练App， [1]  于2014年正式上线。', N'/Material/咖啡厅.jpg', 1, 10017, N'浙江湖州', N'NULL赏你奥里给300吨', N'赏你奥里给300吨', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 0, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10030, 10001, N'广西中庭装饰工程集团有限责任公司', 0, 60000.0000, 150000.0000, CAST(N'2021-09-17' AS Date), 92, N'广西中庭装饰工程集团有限责任公司成立于2010年，主要经营，建筑装饰设计、园林景观设计、市政公用工程、建筑装修装饰工程；销售：电子产品、五金交电、办公用品、电脑耗材、工艺品、建筑装饰材料。 [1]  广西中庭装饰工程集团有限责任公司,是广西建筑装饰协会住宅装修分会常务理事单位', N'/Material/快装快修.jpg', 1, 10018, N'广西贵港', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会', N'赏你奥里给300吨', N'1.一次树屋入住服务。（众筹结束后市场价格为800-1000元）2.“爪哇国”“护照”一本（可以优惠参与树屋“爪哇国”的各项活动，如音乐节，沙龙，手工等）3.优先获得暑假带薪实习机会4.可优先获得下栋树屋众筹机会
', 0, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10032, 10002, N'我超爱学习', 0, 1500.0000, 15000.0000, CAST(N'2021-07-05' AS Date), 0, N'我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习', N'/Material/~SL37@}CY3Q(W8WY$PJPXIP.png', 1, 10030, N'广西南宁江南区', N'赏你奥里给300吨', N'赏你奥里给500吨', N'System.Web.UI.WebControls.TextBox', 10, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10035, 10003, N'星空不错啊', 0, 2400.0000, 50000.0000, CAST(N'2021-07-10' AS Date), 1, N'今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊', N'/Material/星空.jpg', 1, 10030, N'广西南宁', N'奥里给X1', N'奥里给X120', N'奥里给X200', 12, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10036, 10000, N'我超爱学习', 3, 7700.0000, 15000.0000, CAST(N'2021-04-05' AS Date), 1, N'我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习我超爱学习', N'/Material/~SL37@}CY3Q(W8WY$PJPXIP.png', 1, 10030, N'广西南宁江南区', N'赏你奥里给300吨', N'赏你奥里给500吨', N'System.Web.UI.WebControls.TextBox', 10, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10037, 10007, N'星空不错啊', 0, 2000.0000, 50000.0000, CAST(N'2021-07-10' AS Date), 0, N'今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊今晚的夜空真的很美啊', N'/Material/星空.jpg', 1, 10030, N'广西南宁', N'奥里给X1', N'奥里给X120', N'奥里给X200', 12, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10038, 10000, N'来一起蕉个朋友', 3, 8000.0000, 50000.0000, CAST(N'2021-04-04' AS Date), 0, N'来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友', N'/Material/下载.png', 1, 10030, N'广西南宁', N'来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友', N'来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友来一起蕉个朋友', N'来一起蕉个朋友来一起蕉个朋友', 3, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10040, 10000, N'编译器', 0, 0.0000, 25000.0000, CAST(N'2021-07-13' AS Date), 0, N'不错的编译器', N'/Material/K[0U~7N1S{HOZ9UAPO5XWB6.png', 1, 10030, N'广西南宁江南区', N'奥里给', N'奥里给', N'奥里给', 12, 0.0000)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId], [Address], [Return], [ReturnMiddle], [ReturnMax], [ReturnTime], [Freight]) VALUES (10041, 10007, N'一个相当不错的远程连接软件', 0, 0.0000, 86000.0000, CAST(N'2021-07-14' AS Date), 0, N'一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件一个相当不错的远程连接软件', N'/Material/7V7BLJBGZCPR}4[ZQ_Y}7JN.png', 1, 10036, N'广西南宁江南区', N'奥里给X2', N'奥里给X4', N'奥里给X6', 10, 0.0000)
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
SET IDENTITY_INSERT [dbo].[SupportProjects] ON 

INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11001, 10015, 10003, 400.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11002, 10015, 10003, 1200.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11003, 10015, 10003, 1800.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11004, 10015, 10003, 400.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11005, 10015, 10003, 5100.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11006, 10015, 10003, 300.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11007, 10030, 10007, 1000.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11008, 10030, 10007, 1200.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11009, 10030, 10007, 5000.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11010, 10030, 10007, 2800.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11011, 10030, 10007, 3200.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11012, 10030, 10006, 5100.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11013, 10035, 10006, 1200.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11014, 10030, 10016, 5000.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11015, 10030, 10038, 8000.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11016, 10036, 10036, 5000.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11017, 10036, 10036, 300.0000)
SET IDENTITY_INSERT [dbo].[SupportProjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10015, N'user', N'普通用户', N'f9c293c789e0f1a7cf6d2a81e26d80a2', N'男', N'12345678910', N'广西南宁', N'', N'/Material/人.png', N'')
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10016, N'gsagsad', N'gsdgsadg', N'92a77e36e19b2da150122e82b85c3dc3', N'男', N'31412421512', N'广西北海', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10017, N'dsagasdg', N'sadgsadg', N'df124b71e53ff9e1005ffae84862cc7b', N'女', N'2151254124', N'湖北武汉', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10018, N'gadsgsdag', N'sdgsag', N'ecccb20fda49fd57cc1b03c3fbb8fbf0', N'女', N'2134124521', N'浙江温州', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10019, N'124214', N'dfasdf', N'21047572ce70dc600a5be4a6cf2821d8', N'女', N'124214', N'北京', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10020, N'12452154', N'dsafsdfas', N'b41f1d6cd8d2004749a912ba75d88f18', N'女', N'3124', N'广东深圳', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10021, N'fsdafsdaf', N'sdfasd', N'1d4cff431f3b6c4914a4a4a53ae5156b', N'男', N'2143124', N'广东北海', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10022, N'gsdagsad', N'dsafdsaf', N'4e274141c2a825e35f174552587782bf', N'男', N'1421412', N'广东东莞', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10023, N'fsadfsad', N'fsadfsda', N'446741a27715d014123a10d813874531', N'女', N'5421', N'广东广州', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10025, N'admin', N'admin', N'a586b65934faa493b68ca70df149e5ee', N'男', N'18978834486', N'山东济南', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10030, N'lsl', N'listening', N'e10adc3949ba59abbe56e057f20f883e', N'女', N'17877121290', N'广西南宁', N'', N'/Material/星空.jpg', N'我是穷光蛋穷到吃土')
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10031, N'lfr', N'MuZi', N'18b049cc8d8535787929df716f9f4e68', N'女', N'17877121290', N'尚未填写', N'', N'/Material/人.png', N'这个人很懒，什么都没有留下')
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10032, N'userone', N'userone', N'74be16979710d4c4e7c6647856088456', N'女', N'17877121290', N'尚未填写', N'', N'/Material/人.png', N'这个人很懒，什么都没有留下')
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10033, N'aaa', N'aaa', N'd4fbb7d8d5603db43ac2094f5955787c', N'女', N'17877121290', N'尚未填写', N'', N'/Material/人.png', N'这个人很懒，什么都没有留下')
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10034, N'bbb', N'bbb', N'c1c25df8f8f22eefed0ef135c19b8394', N'男', N'123456789', N'尚未填写', N'', N'/Material/人.png', N'这个人很懒，什么都没有留下')
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10035, N'ccc', N'lishenglin555', N'202cb962ac59075b964b07152d234b70', N'女', N'17877121290', N'广西贵港', N'', N'/Material/人.png', N'asdasdasdasda')
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10036, N'Fu', N'abcd', N'202cb962ac59075b964b07152d234b70', N'女', N'17877121290', N'广西南宁', N'', N'/Material/7V7BLJBGZCPR}4[ZQ_Y}7JN.png', N'这个人很懒，什么都没有留下')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_State]  DEFAULT ((0)) FOR [State]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_CurrentMoney]  DEFAULT ((0)) FOR [CurrentMoney]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_LikeCount]  DEFAULT ((0)) FOR [LikeCount]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_PublishState]  DEFAULT ((0)) FOR [PublishState]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_ReturnTime]  DEFAULT ((0)) FOR [ReturnTime]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_Freight]  DEFAULT ((0)) FOR [Freight]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserPic]  DEFAULT (N'/Material/人.png') FOR [UserPic]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Description]  DEFAULT (N'这个人很懒什么都没留下') FOR [Description]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Projects]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[LaunchInfo]  WITH CHECK ADD  CONSTRAINT [FK_LaunchInfo_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[LaunchInfo] CHECK CONSTRAINT [FK_LaunchInfo_Users]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Projects]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Users]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Project_Classifys] FOREIGN KEY([ClassifyId])
REFERENCES [dbo].[Classifys] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Project_Classifys]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Projects] FOREIGN KEY([Id])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Projects]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Users] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Users]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Users1] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Users1]
GO
ALTER TABLE [dbo].[SupportProjects]  WITH CHECK ADD  CONSTRAINT [FK_SupportProjects_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[SupportProjects] CHECK CONSTRAINT [FK_SupportProjects_Projects]
GO
ALTER TABLE [dbo].[SupportProjects]  WITH CHECK ADD  CONSTRAINT [FK_SupportProjects_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[SupportProjects] CHECK CONSTRAINT [FK_SupportProjects_Users]
GO
USE [master]
GO
ALTER DATABASE [CollectFirewood] SET  READ_WRITE 
GO
