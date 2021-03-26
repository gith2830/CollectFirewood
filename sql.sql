USE [master]
GO
/****** Object:  Database [CollectFirewood]    Script Date: 2021/3/26 1:54:54 ******/
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
/****** Object:  Table [dbo].[Admins]    Script Date: 2021/3/26 1:54:54 ******/
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
/****** Object:  Table [dbo].[Classifys]    Script Date: 2021/3/26 1:54:54 ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 2021/3/26 1:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(10000,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Content] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 2021/3/26 1:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[UserId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
 CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 2021/3/26 1:54:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(10000,1) NOT NULL,
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
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupportProjects]    Script Date: 2021/3/26 1:54:54 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2021/3/26 1:54:54 ******/
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

INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11001, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11002, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11003, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11004, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11005, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11006, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11007, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11008, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11009, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11010, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11011, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11012, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11013, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11014, 10015, 10003, N'给萨嘎萨嘎萨嘎')
INSERT [dbo].[Comments] ([Id], [UserId], [ProjectId], [Content]) VALUES (11015, 10015, 10003, N'给萨嘎萨嘎萨嘎')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId]) VALUES (10003, 10008, N'【大卫咖啡】国家首个电商咖啡', 1, 10000.0000, 10000.0000, CAST(N'2021-09-08' AS Date), 57, N'21213214215123', N'/Material/咖啡厅.jpg', 0, 10030)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId]) VALUES (10006, 10003, N'【大卫电影院】国家首个电商电影院', 0, 3300.0000, 80000.0000, CAST(N'2021-12-01' AS Date), 58, N'噶啥的噶', N'/Material/电影院.jpg', 0, 10030)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId]) VALUES (10007, 10000, N'【大卫相声】国家首个电商相声院', 1, 3900.0000, 10000.0000, CAST(N'2021-06-08' AS Date), 27, N'21213214215123', N'/Material/相声.jpg', 0, 10016)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId]) VALUES (10008, 10010, N'【大卫咖啡】国家首个电商咖啡', 0, 4200.0000, 15000.0000, CAST(N'2021-07-09' AS Date), 36, N'21213214215123', N'/Material/咖啡厅.jpg', 0, 10015)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId]) VALUES (10010, 10009, N'嘀嘀陪玩(游戏)，你玩了吗？', 1, 4800.0000, 10000.0000, CAST(N'2021-11-11' AS Date), 88, N'嘀嘀陪玩(游戏)，你玩了吗？众多大神代你上分，陪你嗨皮!!!!', N'/Material/嘀嘀陪玩.jpg', 0, 10017)
INSERT [dbo].[Projects] ([Id], [ClassifyId], [ProjectName], [State], [CurrentMoney], [Goal], [Deadline], [LikeCount], [Content], [CoverImg], [PublishState], [OwnerId]) VALUES (10011, 10001, N'快装-快速装修', 0, 60000.0000, 150000.0000, CAST(N'2021-07-06' AS Date), 92, N'快装-快速装修', N'/Material/快装快修.jpg', 0, 10018)
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
SET IDENTITY_INSERT [dbo].[SupportProjects] ON 

INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11001, 10015, 10003, 4535.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11002, 10015, 10003, 4535.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11003, 10015, 10003, 4535.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11004, 10015, 10003, 4535.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11005, 10015, 10003, 4535.0000)
INSERT [dbo].[SupportProjects] ([Id], [UserId], [ProjectId], [Money]) VALUES (11006, 10015, 10003, 4535.0000)
SET IDENTITY_INSERT [dbo].[SupportProjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10015, N'user', N'普通用户', N'f9c293c789e0f1a7cf6d2a81e26d80a2', N'男', N'12345678910', N'广西南宁', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10016, N'gsagsad', N'gsdgsadg', N'92a77e36e19b2da150122e82b85c3dc3', N'男', N'31412421512', N'广西北海', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10017, N'dsagasdg', N'sadgsadg', N'df124b71e53ff9e1005ffae84862cc7b', N'女', N'2151254124', N'湖北武汉', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10018, N'gadsgsdag', N'sdgsag', N'ecccb20fda49fd57cc1b03c3fbb8fbf0', N'女', N'2134124521', N'浙江温州', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10019, N'124214', N'dfasdf', N'21047572ce70dc600a5be4a6cf2821d8', N'女', N'124214', N'北京', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10020, N'12452154', N'dsafsdfas', N'b41f1d6cd8d2004749a912ba75d88f18', N'女', N'3124', N'广东深圳', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10021, N'fsdafsdaf', N'sdfasd', N'1d4cff431f3b6c4914a4a4a53ae5156b', N'男', N'2143124', N'广东北海', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10022, N'gsdagsad', N'dsafdsaf', N'4e274141c2a825e35f174552587782bf', N'男', N'1421412', N'广东东莞', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10023, N'fsadfsad', N'fsadfsda', N'446741a27715d014123a10d813874531', N'女', N'5421', N'广东广州', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10025, N'admin', N'admin', N'a586b65934faa493b68ca70df149e5ee', N'男', N'18978834486', N'山东济南', N'', N'/Material/人.png', NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Nickname], [Pwd], [Sex], [Phone], [Address], [Url], [UserPic], [Description]) VALUES (10030, N'lsl', N'listening', N'9f05b617878c89b529edf5b73f69b822', N'男', N'17877121290', N'广西贵港', N'', N'/Material/人.png', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_CurrentMoney]  DEFAULT ((0)) FOR [CurrentMoney]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_PublishState]  DEFAULT ((0)) FOR [PublishState]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UserPic]  DEFAULT (N'/Material/人.png') FOR [UserPic]
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
