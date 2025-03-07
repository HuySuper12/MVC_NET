USE [master]
GO
/****** Object:  Database [BookManagementDb]    Script Date: 2/10/2025 9:44:32 PM ******/
CREATE DATABASE [BookManagementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookManagementDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\BookManagementDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookManagementDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\BookManagementDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookManagementDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookManagementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookManagementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookManagementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookManagementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookManagementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookManagementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookManagementDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookManagementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookManagementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookManagementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookManagementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookManagementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookManagementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookManagementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookManagementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookManagementDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookManagementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookManagementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookManagementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookManagementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookManagementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookManagementDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookManagementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookManagementDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookManagementDb] SET  MULTI_USER 
GO
ALTER DATABASE [BookManagementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookManagementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookManagementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookManagementDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookManagementDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookManagementDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookManagementDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookManagementDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookManagementDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/10/2025 9:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2/10/2025 9:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/10/2025 9:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/10/2025 9:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/10/2025 9:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/10/2025 9:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/10/2025 9:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2/10/2025 9:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 2/10/2025 9:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] NOT NULL,
	[BookName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[PublicationDate] [datetime] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[BookCategoryId] [int] NOT NULL,
 CONSTRAINT [PK__Book__3DE0C20761C374CD] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCategory]    Script Date: 2/10/2025 9:44:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCategory](
	[BookCategoryId] [int] NOT NULL,
	[BookGenreType] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK__BookCate__6347EC0403F3F40B] PRIMARY KEY CLUSTERED 
(
	[BookCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250203065428_AddIdentityAuthentication', N'8.0.12')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'06596c78-82b1-4164-92ec-319ce0f73af9', N'User', N'USER', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1889b098-cd5e-495b-a274-c27f26cc546d', N'06596c78-82b1-4164-92ec-319ce0f73af9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2b7cff97-4c8b-4717-9353-b2827128f472', N'06596c78-82b1-4164-92ec-319ce0f73af9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9d3ce65c-c5bb-4e01-b616-6c0798318908', N'06596c78-82b1-4164-92ec-319ce0f73af9')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1889b098-cd5e-495b-a274-c27f26cc546d', N'Huynh Nhat Huy (K18 HCM)', N'huyhnse183498@fpt.edu.vn', N'HUYHNSE183498@FPT.EDU.VN', N'huyhnse183498@fpt.edu.vn', N'HUYHNSE183498@FPT.EDU.VN', 0, N'AQAAAAIAAYagAAAAEIIK/r+G4l3KotTA01UG4TbUtlT6/Yt54sxlZc9WS+94Y4Bboai2GC6liNKOvjDfiQ==', N'6MNBO2LWM3DX7XFMYH72NBORL4QUSU7X', N'607b7b61-7d9e-42b8-b5ba-7b702e129566', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2b7cff97-4c8b-4717-9353-b2827128f472', N'Huynh Nhat Huy', N'huy260704@gmail.com', N'HUY260704@GMAIL.COM', N'huy260704@gmail.com', N'HUY260704@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEL4ywQ1RP7UWPtHRYKZRNXPoGzHuEos28AKKhWRkWsiuRaZCPVkNXv9pXXqfsdxSZA==', N'XLJZOLPCPLTBPVZ4GVVYS5HD5WQC4R6N', N'7173cf58-7626-4810-8187-9719ffe71d96', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9d3ce65c-c5bb-4e01-b616-6c0798318908', N'Huynh Nhat Huy', N'huy123@gmail.com', N'HUY123@GMAIL.COM', N'huy123@gmail.com', N'HUY123@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEMA/aeucYnfBCxAKwbbaKj2fbY0T1cB5SRbiXJpKoomLZk1PAV8Hfrd4ZfqcavOlHw==', N'K6S4FD5PGMUGCJBBABYTGNW5ZAJFID4G', N'871d03a6-abe3-47e8-b8c7-60d7761fd4ec', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (0, N'The Handbook Of International Trade And Finance', N'An international trade transaction, no matter how straightforward it may seem at the start, is not completed until delivery has taken place, any other obligations have been fulfilled and the seller has received payment. This may seem obvious; however, even seemingly simple transactions can, and sometimes do, go wrong.', CAST(N'2004-12-31T00:00:00.000' AS DateTime), 21, 49, N'Anders Grath', 2)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (1, N'The Handbook Of International Trade And Finance', N'An international trade transaction, no matter how straightforward it may seem at the start, is not completed until delivery has taken place, any other obligations have been fulfilled and the seller has received payment. This may seem obvious; however, even seemingly simple transactions can, and sometimes do, go wrong.', CAST(N'2005-01-01T00:00:00.000' AS DateTime), 10, 45.99, N'Anders Grath', 2)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (2, N'Snow Cash', N'Hiro lives in a Los Angeles where franchises line the freeway as far as the eye can see. The only relief from the sea of logos is within the autonomous city-states, where law-abiding citizens don’t dare leave their mansions.', CAST(N'2001-01-01T00:00:00.000' AS DateTime), 20, 12.99, N'Neal Stephenson', 3)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (3, N'Contact: A Novel', N'The future is here…in an adventure of cosmic dimension. When a signal is discovered that seems to come from far beyond our solar system, a multinational team of scientists decides to find the source. What follows is an eye-opening journey out to the stars to the most awesome encounter in human history. Who—or what—is out there? Why are they watching us? And what do they want with us?', CAST(N'2019-02-26T00:00:00.000' AS DateTime), 18, 12.99, N'Carl Sagan', 2)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (4, N'The Time Machine', N'The story follows a Victorian scientist, who claims that he has invented a device that enables him to travel through time, and has visited the future, arriving in the year 802,701 in what had once been London.', CAST(N'2021-06-29T00:00:00.000' AS DateTime), 11, 799.99, N'H.G. Wells', 2)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (5, N'Rosewater (The Wormwood Trilogy, 1)', N'Rosewater is a town on the edge. A community formed around the edges of a mysterious alien biodome, its residents comprise the hopeful, the hungry, and the helpless -- people eager for a glimpse inside the dome or a taste of its rumored healing powers.', CAST(N'2018-09-18T00:00:00.000' AS DateTime), 27, 10.49, N'Tade Thompson', 2)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (6, N'The Last Russian Doll', N'A haunting, epic novel about betrayal, revenge, and redemption that follows three generations of Russian women, from the 1917 revolution to the last days of the Soviet Union, and the enduring love story at the center.
', CAST(N'2023-03-14T00:00:00.000' AS DateTime), 21, 19.99, N'Kristen Loesch', 3)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (7, N'The Whip: a novel inspired by the story of Charley Parkhurst', N'The Whip is inspired by the true story of a woman, Charlotte "Charley" Parkhurst (1812-1879) who lived most of her extraordinary life as a man in the old west. As a young woman in Rhode Island, she fell in love with a runaway slave and had his child. The destruction of her family drove her west to California, dressed as a man, to track the killer.
', CAST(N'2011-12-31T00:00:00.000' AS DateTime), 5, 20.71, N'Karen Kondazian', 3)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (8, N'Where the Lost Wander: A Novel', N'In this epic and haunting love story set on the Oregon Trail, a family and their unlikely protector find their way through peril, uncertainty, and loss.', CAST(N'2020-04-28T00:00:00.000' AS DateTime), 12, 8.28, N'Amy Harmon', 3)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (9, N'All the Light We Cannot See: A Novel', N'Winner of the Pulitzer Prize* A New York Times Book Review Top Ten Book* A National Book Award Finalist', CAST(N'2017-04-04T00:00:00.000' AS DateTime), 30, 16.43, N'Anthony Doerr', 3)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (10, N'Dave Ramsey''s Complete Guide To Money', N'Dave Ramsey’s Complete Guide to Money offers the ultra-practical way to learn how money works.', CAST(N'2012-01-01T00:00:00.000' AS DateTime), 7, 12.09, N'Dave Ramsey', 4)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (11, N'How to Manage Your Money When You Don''t Have Any', N'Unlike many personal finance books, How to Manage Your Money When You Don''t Have Any was specifically written for Americans who struggle to make it on a monthly basis. It provides a respectful, no-nonsense look at the difficult realities of our modern economy, along with an easy to follow path toward better financial stability that will give hope to even the most financially strapped households. Created by a financial expert who hasn''t struck it rich, How to Manage Your Money When You Don''t Have Any offers a first hand..', CAST(N'2012-06-07T00:00:00.000' AS DateTime), 3, 11.99, N'Mr Erik Wecks', 4)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (12, N'Clever Girl Finance: Ditch debt, save money and build real wealth', N'Join the ranks of thousands of smart and savvy women who have turned to money expert and author Bola Sokunbi for guidance on ditching debt, saving money, and building real wealth.', CAST(N'2019-06-25T00:00:00.000' AS DateTime), 17, 14.99, N'Bola Sokunbi', 4)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (13, N'Growing Money', N'Colin and Devon are cousins who share the same birthday. On their eighth birthday, their grandpa gifts them two envelopes of money to do anything they like with it.', CAST(N'2023-06-13T00:00:00.000' AS DateTime), 29, 11.99, N'Brandon L Parker', 4)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (14, N'Clever Girl Finance: Learn How Investing Works, Grow Your Money', N'Clever Girl Finance: Learn How Investing Works, Grow Your Money is the leading guide for women who seek to learn the basic foundations of personal investing. In a no-nonsense and straightforward style, this book teaches readers.', CAST(N'2020-10-02T00:00:00.000' AS DateTime), 19, 13.6, N'Bola Sokunbi', 4)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (15, N'Đời Ngắn Đừng Ngủ Dài-Short Life Don’t Sleep Long', N'Mọi lựa chọn đều giá trị. Mọi bước đi đều quan trọng. Cuộc sống vẫn diễn ra theo cách của nó, không phải theo cách của ta. Hãy kiên nhẫn. Tin tưởng.', CAST(N'2023-01-01T00:00:00.000' AS DateTime), 20, 5, N'Robin Sharma', 5)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (16, N'Mình Là Nắng, Việc Của Mình Là Chói Chang-I Am the Sun, My Job Is to Shine Bright', N'Đừng bỏ lỡ những ngày nắng đẹp. Đừng bỏ qua một trái tim mạnh mẽ và luôn tỏa sáng. Hãy rực rỡ theo cách của riêng mình, cho dù bạn là ai đi chăng nữa.', CAST(N'2018-01-01T00:00:00.000' AS DateTime), 20, 4.5, N'Kazuko Watanabe', 5)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (17, N'The Catcher in the Rye', N'The Catcher in the Rye is a classic novel written by J.D. Salinger, first published in 1951. It follows the story of Holden Caulfield, a disenchanted teenage boy, as he narrates his experiences in New York City after being expelled from his prestigious prep school. The book deals with themes of alienation, identity, and the struggles of growing up. Holden is a deeply cynical and troubled individual who rejects the adult world and struggles to find his place in society.', CAST(N'2012-06-05T00:00:00.000' AS DateTime), 10, 19.99, N' J.D. Salinger', 1)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (20, N'The Handbook Of International Trade And Finance', N'ádadsadasdasdsa', CAST(N'2025-02-12T00:00:00.000' AS DateTime), 21, 48.99, N'Anders Grath', 1)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (21, N'ádadasdasd', N'aedsadadsad', CAST(N'2025-02-21T00:00:00.000' AS DateTime), 21, 49, N'ádsdadsadad', 1)
INSERT [dbo].[Book] ([BookId], [BookName], [Description], [PublicationDate], [Quantity], [Price], [Author], [BookCategoryId]) VALUES (30, N'sdasasda', N'eafedfsdfsdfds', CAST(N'2025-02-19T00:00:00.000' AS DateTime), 21, 49, N'dsadasd', 5)
GO
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookGenreType], [Description]) VALUES (1, N'Fiction', N'Fiction is any creative work, chiefly any narrative work, portraying individuals, events, or places that are imaginary, or in ways that are imaginary.')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookGenreType], [Description]) VALUES (2, N'Science Fiction', N'Science fiction is a genre of speculative fiction, which typically deals with imaginative and futuristic concepts such as advanced science and technology, space exploration, time travel, parallel universes, and extraterrestrial life.')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookGenreType], [Description]) VALUES (3, N'Historical Fiction', N'Historical fiction is a literary genre in which the plot takes place in a setting related to the past events, but is fictional.')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookGenreType], [Description]) VALUES (4, N'Finance', N'Finance is a field that deals with the study of investments. It includes the dynamics of assets and liabilities over time under conditions of different degrees of uncertainty and risk. Finance can also be defined as the science of money management. Finance aims to price assets based on their risk level and their expected rate of return.')
INSERT [dbo].[BookCategory] ([BookCategoryId], [BookGenreType], [Description]) VALUES (5, N'Self Help', N'The one that is written with the intention to instruct its readers on solving personal problems')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2/10/2025 9:44:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2/10/2025 9:44:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2/10/2025 9:44:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2/10/2025 9:44:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2/10/2025 9:44:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2/10/2025 9:44:32 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2/10/2025 9:44:32 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Book_BookCategoryId]    Script Date: 2/10/2025 9:44:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Book_BookCategoryId] ON [dbo].[Book]
(
	[BookCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_BookCategory] FOREIGN KEY([BookCategoryId])
REFERENCES [dbo].[BookCategory] ([BookCategoryId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_BookCategory]
GO
USE [master]
GO
ALTER DATABASE [BookManagementDb] SET  READ_WRITE 
GO
