USE [master]
GO
/****** Object:  Database [FastWear]    Script Date: 5/31/2022 11:16:40 AM ******/
CREATE DATABASE [FastWear]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FastWear', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FastWear.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FastWear_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FastWear_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FastWear].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FastWear] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FastWear] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FastWear] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FastWear] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FastWear] SET ARITHABORT OFF 
GO
ALTER DATABASE [FastWear] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FastWear] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FastWear] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FastWear] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FastWear] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FastWear] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FastWear] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FastWear] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FastWear] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FastWear] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FastWear] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FastWear] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FastWear] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FastWear] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FastWear] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FastWear] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FastWear] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FastWear] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FastWear] SET  MULTI_USER 
GO
ALTER DATABASE [FastWear] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FastWear] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FastWear] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FastWear] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FastWear] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FastWear]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 5/31/2022 11:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[cart_item_id] [int] NOT NULL,
	[session_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_cart_item_1] PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount]    Script Date: 5/31/2022 11:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount](
	[discount_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[desc] [nvarchar](50) NOT NULL,
	[discount_percent] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_discount] PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 5/31/2022 11:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[order_items_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_order_items] PRIMARY KEY CLUSTERED 
(
	[order_items_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 5/31/2022 11:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] NOT NULL,
	[payment_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_details]    Script Date: 5/31/2022 11:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_details](
	[payment_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[provider] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_payment_details_1] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 5/31/2022 11:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] NOT NULL,
	[discount_id] [int] NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[product_desc] [nvarchar](50) NOT NULL,
	[product_category] [nvarchar](50) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_product_1] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_session]    Script Date: 5/31/2022 11:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_session](
	[session_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_shopping_session_1] PRIMARY KEY CLUSTERED 
(
	[session_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 5/31/2022 11:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[phone_number] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cart_item] ([cart_item_id], [session_id], [product_id], [quantity]) VALUES (1, 1, 1, 55)
INSERT [dbo].[cart_item] ([cart_item_id], [session_id], [product_id], [quantity]) VALUES (2, 2, 2, 45)
INSERT [dbo].[cart_item] ([cart_item_id], [session_id], [product_id], [quantity]) VALUES (3, 3, 3, 67)
INSERT [dbo].[cart_item] ([cart_item_id], [session_id], [product_id], [quantity]) VALUES (4, 4, 4, 89)
INSERT [dbo].[cart_item] ([cart_item_id], [session_id], [product_id], [quantity]) VALUES (5, 5, 5, 41)
GO
INSERT [dbo].[discount] ([discount_id], [name], [desc], [discount_percent]) VALUES (1, N'Shirt', N'Comfortable', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[discount] ([discount_id], [name], [desc], [discount_percent]) VALUES (2, N'Trousers', N'Good Quality', CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[discount] ([discount_id], [name], [desc], [discount_percent]) VALUES (3, N'T-shirt', N'Nice', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[discount] ([discount_id], [name], [desc], [discount_percent]) VALUES (4, N'Shorts', N'Good', CAST(25 AS Decimal(18, 0)))
INSERT [dbo].[discount] ([discount_id], [name], [desc], [discount_percent]) VALUES (5, N'Socks', N'Not bad', CAST(15 AS Decimal(18, 0)))
GO
INSERT [dbo].[order_items] ([order_items_id], [order_id], [product_id]) VALUES (1, 1, 1)
INSERT [dbo].[order_items] ([order_items_id], [order_id], [product_id]) VALUES (2, 2, 2)
INSERT [dbo].[order_items] ([order_items_id], [order_id], [product_id]) VALUES (3, 3, 3)
INSERT [dbo].[order_items] ([order_items_id], [order_id], [product_id]) VALUES (4, 4, 4)
INSERT [dbo].[order_items] ([order_items_id], [order_id], [product_id]) VALUES (5, 5, 5)
GO
INSERT [dbo].[orders] ([order_id], [payment_id], [user_id], [total]) VALUES (1, 1, 1, CAST(49.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([order_id], [payment_id], [user_id], [total]) VALUES (2, 2, 2, CAST(99.99 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([order_id], [payment_id], [user_id], [total]) VALUES (3, 3, 3, CAST(159.99 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([order_id], [payment_id], [user_id], [total]) VALUES (4, 4, 4, CAST(69.99 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([order_id], [payment_id], [user_id], [total]) VALUES (5, 5, 5, CAST(19.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[payment_details] ([payment_id], [order_id], [amount], [provider], [status]) VALUES (1, 1, 143, N'Adidas', N'Available')
INSERT [dbo].[payment_details] ([payment_id], [order_id], [amount], [provider], [status]) VALUES (2, 2, 145, N'Nike', N'Available')
INSERT [dbo].[payment_details] ([payment_id], [order_id], [amount], [provider], [status]) VALUES (3, 3, 523, N'Umbro', N'Transporting')
INSERT [dbo].[payment_details] ([payment_id], [order_id], [amount], [provider], [status]) VALUES (4, 4, 941, N'MatStar', N'Available')
INSERT [dbo].[payment_details] ([payment_id], [order_id], [amount], [provider], [status]) VALUES (5, 5, 290, N'Reebok', N'Available')
GO
INSERT [dbo].[product] ([product_id], [discount_id], [product_name], [product_desc], [product_category], [price]) VALUES (1, 1, N'Shirt', N'Comfortable', N'Shirts', CAST(99.99 AS Decimal(18, 2)))
INSERT [dbo].[product] ([product_id], [discount_id], [product_name], [product_desc], [product_category], [price]) VALUES (2, 2, N'Trousers', N'Good Quality', N'Trousers', CAST(99.99 AS Decimal(18, 2)))
INSERT [dbo].[product] ([product_id], [discount_id], [product_name], [product_desc], [product_category], [price]) VALUES (3, 3, N'T-shirt', N'Nice', N'T-shirts', CAST(29.99 AS Decimal(18, 2)))
INSERT [dbo].[product] ([product_id], [discount_id], [product_name], [product_desc], [product_category], [price]) VALUES (4, 4, N'Shorts', N'Good', N'Shorts', CAST(34.99 AS Decimal(18, 2)))
INSERT [dbo].[product] ([product_id], [discount_id], [product_name], [product_desc], [product_category], [price]) VALUES (5, 5, N'Socks', N'Not bad', N'Socks', CAST(9.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[shopping_session] ([session_id], [user_id], [total]) VALUES (1, 1, CAST(30.00 AS Decimal(18, 2)))
INSERT [dbo].[shopping_session] ([session_id], [user_id], [total]) VALUES (2, 2, CAST(34.99 AS Decimal(18, 2)))
INSERT [dbo].[shopping_session] ([session_id], [user_id], [total]) VALUES (3, 3, CAST(99.99 AS Decimal(18, 2)))
INSERT [dbo].[shopping_session] ([session_id], [user_id], [total]) VALUES (4, 4, CAST(149.99 AS Decimal(18, 2)))
INSERT [dbo].[shopping_session] ([session_id], [user_id], [total]) VALUES (5, 5, CAST(29.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[user] ([user_id], [username], [password], [first_name], [last_name], [address], [phone_number]) VALUES (1, N'RadoFifa', N'radofifa1', N'Radoslav', N'Stoychev', N'Slaveykov', 887698290)
INSERT [dbo].[user] ([user_id], [username], [password], [first_name], [last_name], [address], [phone_number]) VALUES (2, N'Gosho', N'palq123', N'Gosho', N'Ribata', N'Trakiq', 877543279)
INSERT [dbo].[user] ([user_id], [username], [password], [first_name], [last_name], [address], [phone_number]) VALUES (3, N'Pencho', N'galq123', N'Grisha', N'Ganchev', N'Zornica', 823642671)
INSERT [dbo].[user] ([user_id], [username], [password], [first_name], [last_name], [address], [phone_number]) VALUES (4, N'Ivan', N'vanio123', N'Ivan', N'Ivanov', N'Slaveykov', 852361521)
INSERT [dbo].[user] ([user_id], [username], [password], [first_name], [last_name], [address], [phone_number]) VALUES (5, N'Kaloqn', N'kalata123', N'Kaloqn', N'Totev', N'Varna', 857342513)
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FK_cart_item_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FK_cart_item_product]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FK_cart_item_shopping_session] FOREIGN KEY([session_id])
REFERENCES [dbo].[shopping_session] ([session_id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FK_cart_item_shopping_session]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FK_order_items_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FK_order_items_orders]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FK_order_items_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FK_order_items_product]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_payment_details] FOREIGN KEY([payment_id])
REFERENCES [dbo].[payment_details] ([payment_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_payment_details]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_User]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_discount] FOREIGN KEY([discount_id])
REFERENCES [dbo].[discount] ([discount_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_discount]
GO
ALTER TABLE [dbo].[shopping_session]  WITH CHECK ADD  CONSTRAINT [FK_shopping_session_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[shopping_session] CHECK CONSTRAINT [FK_shopping_session_User]
GO
USE [master]
GO
ALTER DATABASE [FastWear] SET  READ_WRITE 
GO
