USE [master]
GO
/****** Object:  Database [ESEMKABAKERY]    Script Date: 16/10/2017 15:30:28 ******/
CREATE DATABASE [ESEMKABAKERY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ESEMKABAKERY', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ESEMKABAKERY.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ESEMKABAKERY_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ESEMKABAKERY_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ESEMKABAKERY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ESEMKABAKERY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET ARITHABORT OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ESEMKABAKERY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ESEMKABAKERY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ESEMKABAKERY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ESEMKABAKERY] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ESEMKABAKERY] SET  MULTI_USER 
GO
ALTER DATABASE [ESEMKABAKERY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ESEMKABAKERY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ESEMKABAKERY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ESEMKABAKERY] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ESEMKABAKERY] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ESEMKABAKERY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[EmployeeAddress] [text] NOT NULL,
	[EmployeePhone] [varchar](60) NOT NULL,
	[Status] [char](1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[FoodId] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [varchar](100) NOT NULL,
	[Description] [text] NOT NULL,
	[Price] [int] NOT NULL,
	[Status] [char](1) NOT NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[FoodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IncomingRawMaterialDetail]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomingRawMaterialDetail](
	[IncomingRawMaterialId] [int] NOT NULL,
	[RawMaterialId] [int] NOT NULL,
	[PricePer100Gram] [int] NOT NULL,
	[BestBeforeDate] [datetime] NOT NULL,
	[WeightGram] [int] NOT NULL,
 CONSTRAINT [PK_IncomingRawMaterialDetail] PRIMARY KEY CLUSTERED 
(
	[IncomingRawMaterialId] ASC,
	[RawMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IncomingRawMaterialHeader]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomingRawMaterialHeader](
	[IncomingRawMaterialId] [int] IDENTITY(1,1) NOT NULL,
	[IncomingDate] [datetime] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Description] [text] NOT NULL,
 CONSTRAINT [PK_IncomingRawMaterialHeader] PRIMARY KEY CLUSTERED 
(
	[IncomingRawMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductionDetail]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionDetail](
	[ProductionId] [int] NOT NULL,
	[BatchNumber] [int] IDENTITY(1,1) NOT NULL,
	[FoodId] [int] NOT NULL,
	[ExpiredDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductionDetail_1] PRIMARY KEY CLUSTERED 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductionHeader]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionHeader](
	[ProductionId] [int] IDENTITY(1,1) NOT NULL,
	[ProductionDate] [datetime] NOT NULL,
	[Description] [text] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Status] [char](1) NOT NULL,
 CONSTRAINT [PK_ProductionHeader] PRIMARY KEY CLUSTERED 
(
	[ProductionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RawMaterial]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RawMaterial](
	[RawMaterialId] [int] IDENTITY(1,1) NOT NULL,
	[RawMaterialName] [varchar](100) NOT NULL,
	[Description] [text] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[InputedDate] [datetime] NOT NULL,
	[Status] [char](1) NOT NULL,
 CONSTRAINT [PK_RawMaterial] PRIMARY KEY CLUSTERED 
(
	[RawMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RawMaterialIntake]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RawMaterialIntake](
	[BatchNumber] [int] NOT NULL,
	[RawMaterialId] [int] NOT NULL,
	[IncomingRawMaterialId] [int] NOT NULL,
	[WeightInGram] [int] NOT NULL,
 CONSTRAINT [PK_RawMaterialIntake] PRIMARY KEY CLUSTERED 
(
	[BatchNumber] ASC,
	[RawMaterialId] ASC,
	[IncomingRawMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecipeDetail]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeDetail](
	[RecipeId] [int] NOT NULL,
	[RawMaterialId] [int] NOT NULL,
	[WeightInGram] [int] NOT NULL,
 CONSTRAINT [PK_RecipeDetail] PRIMARY KEY CLUSTERED 
(
	[RecipeId] ASC,
	[RawMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecipeHeader]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeHeader](
	[RecipeId] [int] IDENTITY(1,1) NOT NULL,
	[FoodId] [int] NOT NULL,
	[OutputUnitInPieces] [int] NOT NULL,
	[Description] [text] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Status] [char](1) NOT NULL,
 CONSTRAINT [PK_RecipeHeader] PRIMARY KEY CLUSTERED 
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SellingDetail]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellingDetail](
	[SellingId] [int] NOT NULL,
	[FoodId] [int] NOT NULL,
	[BatchNumber] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_SellingDetail] PRIMARY KEY CLUSTERED 
(
	[SellingId] ASC,
	[FoodId] ASC,
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SellingHeader]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellingHeader](
	[SellingId] [int] IDENTITY(1,1) NOT NULL,
	[SellingDate] [datetime] NOT NULL,
	[Discount] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_SellingHeader] PRIMARY KEY CLUSTERED 
(
	[SellingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[IncomingRawView]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[IncomingRawView]
AS
SELECT        dbo.IncomingRawMaterialDetail.IncomingRawMaterialId, dbo.IncomingRawMaterialDetail.RawMaterialId, dbo.IncomingRawMaterialDetail.PricePer100Gram, dbo.IncomingRawMaterialDetail.BestBeforeDate, 
                         dbo.IncomingRawMaterialDetail.WeightGram, dbo.IncomingRawMaterialHeader.IncomingDate, dbo.IncomingRawMaterialHeader.EmployeeId, dbo.IncomingRawMaterialHeader.Description, 
                         dbo.RawMaterial.RawMaterialName, dbo.RawMaterial.Description AS RawMaterialDesc, dbo.RawMaterial.InputedDate, dbo.RawMaterial.Status, dbo.Employee.EmployeeName
FROM            dbo.IncomingRawMaterialDetail INNER JOIN
                         dbo.IncomingRawMaterialHeader ON dbo.IncomingRawMaterialDetail.IncomingRawMaterialId = dbo.IncomingRawMaterialHeader.IncomingRawMaterialId INNER JOIN
                         dbo.RawMaterial ON dbo.IncomingRawMaterialDetail.RawMaterialId = dbo.RawMaterial.RawMaterialId INNER JOIN
                         dbo.Employee ON dbo.IncomingRawMaterialHeader.EmployeeId = dbo.Employee.EmployeeId

GO
/****** Object:  View [dbo].[RecipeHeaderView]    Script Date: 16/10/2017 15:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RecipeHeaderView]
AS
SELECT        dbo.Food.FoodId, dbo.Food.FoodName, dbo.Food.Description, dbo.Food.Price, dbo.Food.Status, dbo.RecipeHeader.RecipeId, dbo.RecipeHeader.OutputUnitInPieces, dbo.RecipeHeader.Description AS RecipeDesc,
                          dbo.RecipeHeader.EmployeeId, dbo.RecipeHeader.CreatedDate
FROM            dbo.Food INNER JOIN
                         dbo.RecipeHeader ON dbo.Food.FoodId = dbo.RecipeHeader.FoodId

GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeId], [EmployeeName], [Password], [EmployeeAddress], [EmployeePhone], [Status], [Email]) VALUES (1, N'wahaz', N'admin', N'malang', N'086', N'1', N'admin@admin.com')
INSERT [dbo].[Employee] ([EmployeeId], [EmployeeName], [Password], [EmployeeAddress], [EmployeePhone], [Status], [Email]) VALUES (2, N'wildan', N'wildan', N'malang', N'087554', N'1', N'wildan@employee.com')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([FoodId], [FoodName], [Description], [Price], [Status]) VALUES (1, N'Roti Bakar', N'ini roti bakar', 10000, N'1')
INSERT [dbo].[Food] ([FoodId], [FoodName], [Description], [Price], [Status]) VALUES (2, N'Martabak', N'ini martabak bossquuuu', 15000, N'1')
INSERT [dbo].[Food] ([FoodId], [FoodName], [Description], [Price], [Status]) VALUES (3, N'Donat', N'ini donat bunder tengahnya bolong', 3000, N'1')
SET IDENTITY_INSERT [dbo].[Food] OFF
INSERT [dbo].[IncomingRawMaterialDetail] ([IncomingRawMaterialId], [RawMaterialId], [PricePer100Gram], [BestBeforeDate], [WeightGram]) VALUES (2, 1, 10000, CAST(N'2017-10-16T00:00:00.000' AS DateTime), 100)
INSERT [dbo].[IncomingRawMaterialDetail] ([IncomingRawMaterialId], [RawMaterialId], [PricePer100Gram], [BestBeforeDate], [WeightGram]) VALUES (3, 3, 15000, CAST(N'2017-10-16T00:00:00.000' AS DateTime), 100)
SET IDENTITY_INSERT [dbo].[IncomingRawMaterialHeader] ON 

INSERT [dbo].[IncomingRawMaterialHeader] ([IncomingRawMaterialId], [IncomingDate], [EmployeeId], [Description]) VALUES (2, CAST(N'2017-10-12T00:00:00.000' AS DateTime), 1, N'2qefgh')
INSERT [dbo].[IncomingRawMaterialHeader] ([IncomingRawMaterialId], [IncomingDate], [EmployeeId], [Description]) VALUES (3, CAST(N'2017-10-10T00:00:00.000' AS DateTime), 2, N'aaaaaaaaaaaaa')
SET IDENTITY_INSERT [dbo].[IncomingRawMaterialHeader] OFF
SET IDENTITY_INSERT [dbo].[ProductionDetail] ON 

INSERT [dbo].[ProductionDetail] ([ProductionId], [BatchNumber], [FoodId], [ExpiredDate]) VALUES (3, 3, 1, CAST(N'2017-10-20T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductionDetail] ([ProductionId], [BatchNumber], [FoodId], [ExpiredDate]) VALUES (9, 6, 3, CAST(N'2017-10-23T00:00:00.000' AS DateTime))
INSERT [dbo].[ProductionDetail] ([ProductionId], [BatchNumber], [FoodId], [ExpiredDate]) VALUES (10, 7, 2, CAST(N'2017-10-23T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductionDetail] OFF
SET IDENTITY_INSERT [dbo].[ProductionHeader] ON 

INSERT [dbo].[ProductionHeader] ([ProductionId], [ProductionDate], [Description], [EmployeeId], [Status]) VALUES (3, CAST(N'2017-10-10T00:00:00.000' AS DateTime), N'assd', 2, N'1')
INSERT [dbo].[ProductionHeader] ([ProductionId], [ProductionDate], [Description], [EmployeeId], [Status]) VALUES (4, CAST(N'2017-10-16T00:00:00.000' AS DateTime), N'asasasas', 1, N'0')
INSERT [dbo].[ProductionHeader] ([ProductionId], [ProductionDate], [Description], [EmployeeId], [Status]) VALUES (5, CAST(N'2017-10-16T00:00:00.000' AS DateTime), N'asas', 1, N'0')
INSERT [dbo].[ProductionHeader] ([ProductionId], [ProductionDate], [Description], [EmployeeId], [Status]) VALUES (6, CAST(N'2017-10-16T00:00:00.000' AS DateTime), N'aas', 1, N'0')
INSERT [dbo].[ProductionHeader] ([ProductionId], [ProductionDate], [Description], [EmployeeId], [Status]) VALUES (7, CAST(N'2017-10-16T00:00:00.000' AS DateTime), N'assa', 1, N'0')
INSERT [dbo].[ProductionHeader] ([ProductionId], [ProductionDate], [Description], [EmployeeId], [Status]) VALUES (9, CAST(N'2017-10-16T00:00:00.000' AS DateTime), N'asasasasasasasa', 1, N'0')
INSERT [dbo].[ProductionHeader] ([ProductionId], [ProductionDate], [Description], [EmployeeId], [Status]) VALUES (10, CAST(N'2017-10-16T00:00:00.000' AS DateTime), N'aas', 1, N'0')
SET IDENTITY_INSERT [dbo].[ProductionHeader] OFF
SET IDENTITY_INSERT [dbo].[RawMaterial] ON 

INSERT [dbo].[RawMaterial] ([RawMaterialId], [RawMaterialName], [Description], [EmployeeId], [InputedDate], [Status]) VALUES (1, N'Tepung', N'ini tepung', 1, CAST(N'2017-10-13T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[RawMaterial] ([RawMaterialId], [RawMaterialName], [Description], [EmployeeId], [InputedDate], [Status]) VALUES (3, N'Terigu', N'ini terigu', 1, CAST(N'2017-10-13T00:00:00.000' AS DateTime), N'1')
INSERT [dbo].[RawMaterial] ([RawMaterialId], [RawMaterialName], [Description], [EmployeeId], [InputedDate], [Status]) VALUES (4, N'Telur', N'ini telur', 1, CAST(N'2017-10-13T00:00:00.000' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[RawMaterial] OFF
INSERT [dbo].[RecipeDetail] ([RecipeId], [RawMaterialId], [WeightInGram]) VALUES (3, 1, 500)
INSERT [dbo].[RecipeDetail] ([RecipeId], [RawMaterialId], [WeightInGram]) VALUES (3, 4, 200)
INSERT [dbo].[RecipeDetail] ([RecipeId], [RawMaterialId], [WeightInGram]) VALUES (4, 1, 100)
INSERT [dbo].[RecipeDetail] ([RecipeId], [RawMaterialId], [WeightInGram]) VALUES (4, 4, 500)
INSERT [dbo].[RecipeDetail] ([RecipeId], [RawMaterialId], [WeightInGram]) VALUES (5, 1, 1222)
SET IDENTITY_INSERT [dbo].[RecipeHeader] ON 

INSERT [dbo].[RecipeHeader] ([RecipeId], [FoodId], [OutputUnitInPieces], [Description], [EmployeeId], [CreatedDate], [Status]) VALUES (3, 1, 3, N'asasa', 1, CAST(N'2017-10-13T10:49:52.000' AS DateTime), N'1')
INSERT [dbo].[RecipeHeader] ([RecipeId], [FoodId], [OutputUnitInPieces], [Description], [EmployeeId], [CreatedDate], [Status]) VALUES (4, 3, 10, N'asdsdfsrfsf', 1, CAST(N'2017-10-13T10:50:00.000' AS DateTime), N'1')
INSERT [dbo].[RecipeHeader] ([RecipeId], [FoodId], [OutputUnitInPieces], [Description], [EmployeeId], [CreatedDate], [Status]) VALUES (5, 2, 5, N'rferfe', 1, CAST(N'2017-10-16T09:50:51.000' AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[RecipeHeader] OFF
INSERT [dbo].[SellingDetail] ([SellingId], [FoodId], [BatchNumber], [Qty], [Price]) VALUES (4, 1, 3, 3, 30000)
INSERT [dbo].[SellingDetail] ([SellingId], [FoodId], [BatchNumber], [Qty], [Price]) VALUES (4, 2, 7, 5, 75000)
INSERT [dbo].[SellingDetail] ([SellingId], [FoodId], [BatchNumber], [Qty], [Price]) VALUES (4, 3, 6, 2, 6000)
INSERT [dbo].[SellingDetail] ([SellingId], [FoodId], [BatchNumber], [Qty], [Price]) VALUES (5, 1, 3, 3, 30000)
INSERT [dbo].[SellingDetail] ([SellingId], [FoodId], [BatchNumber], [Qty], [Price]) VALUES (5, 2, 7, 2, 30000)
INSERT [dbo].[SellingDetail] ([SellingId], [FoodId], [BatchNumber], [Qty], [Price]) VALUES (5, 3, 6, 1, 3000)
INSERT [dbo].[SellingDetail] ([SellingId], [FoodId], [BatchNumber], [Qty], [Price]) VALUES (6, 1, 3, 2, 20000)
INSERT [dbo].[SellingDetail] ([SellingId], [FoodId], [BatchNumber], [Qty], [Price]) VALUES (6, 2, 7, 1, 15000)
INSERT [dbo].[SellingDetail] ([SellingId], [FoodId], [BatchNumber], [Qty], [Price]) VALUES (6, 3, 6, 3, 9000)
INSERT [dbo].[SellingDetail] ([SellingId], [FoodId], [BatchNumber], [Qty], [Price]) VALUES (7, 1, 3, 2, 20000)
INSERT [dbo].[SellingDetail] ([SellingId], [FoodId], [BatchNumber], [Qty], [Price]) VALUES (7, 2, 7, 4, 60000)
INSERT [dbo].[SellingDetail] ([SellingId], [FoodId], [BatchNumber], [Qty], [Price]) VALUES (7, 3, 6, 1, 3000)
SET IDENTITY_INSERT [dbo].[SellingHeader] ON 

INSERT [dbo].[SellingHeader] ([SellingId], [SellingDate], [Discount], [EmployeeId]) VALUES (4, CAST(N'2017-10-16T00:00:00.000' AS DateTime), 25, 1)
INSERT [dbo].[SellingHeader] ([SellingId], [SellingDate], [Discount], [EmployeeId]) VALUES (5, CAST(N'2017-10-15T00:00:00.000' AS DateTime), 10, 1)
INSERT [dbo].[SellingHeader] ([SellingId], [SellingDate], [Discount], [EmployeeId]) VALUES (6, CAST(N'2017-10-14T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[SellingHeader] ([SellingId], [SellingDate], [Discount], [EmployeeId]) VALUES (7, CAST(N'2017-10-13T00:00:00.000' AS DateTime), 10, 1)
SET IDENTITY_INSERT [dbo].[SellingHeader] OFF
ALTER TABLE [dbo].[IncomingRawMaterialDetail]  WITH CHECK ADD  CONSTRAINT [FK_IncomingRawMaterialDetail_IncomingRawMaterialHeader] FOREIGN KEY([IncomingRawMaterialId])
REFERENCES [dbo].[IncomingRawMaterialHeader] ([IncomingRawMaterialId])
GO
ALTER TABLE [dbo].[IncomingRawMaterialDetail] CHECK CONSTRAINT [FK_IncomingRawMaterialDetail_IncomingRawMaterialHeader]
GO
ALTER TABLE [dbo].[IncomingRawMaterialDetail]  WITH CHECK ADD  CONSTRAINT [FK_IncomingRawMaterialDetail_RawMaterial] FOREIGN KEY([RawMaterialId])
REFERENCES [dbo].[RawMaterial] ([RawMaterialId])
GO
ALTER TABLE [dbo].[IncomingRawMaterialDetail] CHECK CONSTRAINT [FK_IncomingRawMaterialDetail_RawMaterial]
GO
ALTER TABLE [dbo].[IncomingRawMaterialHeader]  WITH CHECK ADD  CONSTRAINT [FK_IncomingRawMaterialHeader_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[IncomingRawMaterialHeader] CHECK CONSTRAINT [FK_IncomingRawMaterialHeader_Employee]
GO
ALTER TABLE [dbo].[ProductionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductionDetail_Food] FOREIGN KEY([FoodId])
REFERENCES [dbo].[Food] ([FoodId])
GO
ALTER TABLE [dbo].[ProductionDetail] CHECK CONSTRAINT [FK_ProductionDetail_Food]
GO
ALTER TABLE [dbo].[ProductionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductionDetail_ProductionHeader] FOREIGN KEY([ProductionId])
REFERENCES [dbo].[ProductionHeader] ([ProductionId])
GO
ALTER TABLE [dbo].[ProductionDetail] CHECK CONSTRAINT [FK_ProductionDetail_ProductionHeader]
GO
ALTER TABLE [dbo].[ProductionHeader]  WITH CHECK ADD  CONSTRAINT [FK_ProductionHeader_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[ProductionHeader] CHECK CONSTRAINT [FK_ProductionHeader_Employee]
GO
ALTER TABLE [dbo].[RawMaterialIntake]  WITH CHECK ADD  CONSTRAINT [FK_RawMaterialIntake_RawMaterial] FOREIGN KEY([RawMaterialId])
REFERENCES [dbo].[RawMaterial] ([RawMaterialId])
GO
ALTER TABLE [dbo].[RawMaterialIntake] CHECK CONSTRAINT [FK_RawMaterialIntake_RawMaterial]
GO
ALTER TABLE [dbo].[RecipeDetail]  WITH CHECK ADD  CONSTRAINT [FK_RecipeDetail_RawMaterial1] FOREIGN KEY([RawMaterialId])
REFERENCES [dbo].[RawMaterial] ([RawMaterialId])
GO
ALTER TABLE [dbo].[RecipeDetail] CHECK CONSTRAINT [FK_RecipeDetail_RawMaterial1]
GO
ALTER TABLE [dbo].[RecipeDetail]  WITH CHECK ADD  CONSTRAINT [FK_RecipeDetail_RecipeHeader] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[RecipeHeader] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeDetail] CHECK CONSTRAINT [FK_RecipeDetail_RecipeHeader]
GO
ALTER TABLE [dbo].[RecipeHeader]  WITH CHECK ADD  CONSTRAINT [FK_RecipeHeader_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[RecipeHeader] CHECK CONSTRAINT [FK_RecipeHeader_Employee]
GO
ALTER TABLE [dbo].[RecipeHeader]  WITH CHECK ADD  CONSTRAINT [FK_RecipeHeader_Food] FOREIGN KEY([FoodId])
REFERENCES [dbo].[Food] ([FoodId])
GO
ALTER TABLE [dbo].[RecipeHeader] CHECK CONSTRAINT [FK_RecipeHeader_Food]
GO
ALTER TABLE [dbo].[SellingDetail]  WITH CHECK ADD  CONSTRAINT [FK_SellingDetail_Food] FOREIGN KEY([FoodId])
REFERENCES [dbo].[Food] ([FoodId])
GO
ALTER TABLE [dbo].[SellingDetail] CHECK CONSTRAINT [FK_SellingDetail_Food]
GO
ALTER TABLE [dbo].[SellingDetail]  WITH CHECK ADD  CONSTRAINT [FK_SellingDetail_ProductionDetail] FOREIGN KEY([BatchNumber])
REFERENCES [dbo].[ProductionDetail] ([BatchNumber])
GO
ALTER TABLE [dbo].[SellingDetail] CHECK CONSTRAINT [FK_SellingDetail_ProductionDetail]
GO
ALTER TABLE [dbo].[SellingDetail]  WITH CHECK ADD  CONSTRAINT [FK_SellingDetail_SellingHeader] FOREIGN KEY([SellingId])
REFERENCES [dbo].[SellingHeader] ([SellingId])
GO
ALTER TABLE [dbo].[SellingDetail] CHECK CONSTRAINT [FK_SellingDetail_SellingHeader]
GO
ALTER TABLE [dbo].[SellingHeader]  WITH CHECK ADD  CONSTRAINT [FK_SellingHeader_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[SellingHeader] CHECK CONSTRAINT [FK_SellingHeader_Employee]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "IncomingRawMaterialDetail"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IncomingRawMaterialHeader"
            Begin Extent = 
               Top = 6
               Left = 291
               Bottom = 136
               Right = 506
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RawMaterial"
            Begin Extent = 
               Top = 6
               Left = 544
               Bottom = 136
               Right = 730
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 768
               Bottom = 136
               Right = 951
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1935
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2355
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'IncomingRawView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'IncomingRawView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'IncomingRawView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Food"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RecipeHeader_1"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RecipeHeaderView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'RecipeHeaderView'
GO
USE [master]
GO
ALTER DATABASE [ESEMKABAKERY] SET  READ_WRITE 
GO
