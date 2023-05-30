USE [DbComapnyTask]
GO
/****** Object:  Table [dbo].[Categorytbl]    Script Date: 29-05-2023 13:20:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorytbl](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categorytbl] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTbl]    Script Date: 29-05-2023 13:20:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTbl](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_ProductTbl] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorytbl] ON 
GO
INSERT [dbo].[Categorytbl] ([CategoryId], [CategoryName]) VALUES (1, N'
Home & Kitchen')
GO
INSERT [dbo].[Categorytbl] ([CategoryId], [CategoryName]) VALUES (2, N'Beauty & Personal Car')
GO
INSERT [dbo].[Categorytbl] ([CategoryId], [CategoryName]) VALUES (3, N'Toys & games')
GO
SET IDENTITY_INSERT [dbo].[Categorytbl] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTbl] ON 
GO
INSERT [dbo].[ProductTbl] ([ProductId], [ProductName], [CategoryId]) VALUES (2, N'Lipstick', 2)
GO
INSERT [dbo].[ProductTbl] ([ProductId], [ProductName], [CategoryId]) VALUES (3, N'Dinner Set', 1)
GO
INSERT [dbo].[ProductTbl] ([ProductId], [ProductName], [CategoryId]) VALUES (4, N'Powder', 2)
GO
SET IDENTITY_INSERT [dbo].[ProductTbl] OFF
GO
/****** Object:  StoredProcedure [dbo].[SpProduct]    Script Date: 29-05-2023 13:20:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SpProduct]
As
Begin 
 Select P.ProductId,P.ProductName,P.CategoryId,C.CategoryName
 From ProductTbl P
 inner join Categorytbl C on
 C.CategoryId=P.CategoryId
 End
GO
