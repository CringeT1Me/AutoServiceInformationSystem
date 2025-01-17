USE [master]
GO
/****** Object:  Database [isip41_nekrasov_samodelkin]    Script Date: 10/27/2023 9:43:22 AM ******/
CREATE DATABASE [isip41_nekrasov_samodelkin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'isip41_nekrasov_samodelkin', FILENAME = N'F:\AutoService\ServiceApp\Resources\Databases\MSSQL\isip41_nekrasov_samodelkin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'isip41_nekrasov_samodelkin_log', FILENAME = N'F:\AutoService\ServiceApp\Resources\Databases\MSSQL\isip41_nekrasov_samodelkin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [isip41_nekrasov_samodelkin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET ARITHABORT OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET  MULTI_USER 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET QUERY_STORE = ON
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [isip41_nekrasov_samodelkin]
GO
/****** Object:  Table [dbo].[товары]    Script Date: 10/27/2023 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[товары](
	[ID_Товара] [int] NOT NULL,
	[НаименованиеТовара] [nvarchar](500) NOT NULL,
	[Категория] [int] NOT NULL,
	[Стоимость] [int] NOT NULL,
	[Характеристики] [nvarchar](255) NULL,
	[Описание] [nvarchar](255) NULL,
	[Вес, г] [int] NULL,
	[Ширина, мм] [int] NULL,
	[Высота , мм] [int] NULL,
	[Длина, мм] [int] NULL,
	[Производитель] [int] NOT NULL,
	[ГлавноеИзображение] [nvarchar](150) NULL,
	[Активен?] [nvarchar](3) NULL,
	[ДополнительныеТовары] [nvarchar](50) NULL,
	[ВторичныеИзображения] [nvarchar](100) NULL,
 CONSTRAINT [PK_товары] PRIMARY KEY CLUSTERED 
(
	[ID_Товара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[история продаж]    Script Date: 10/27/2023 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[история продаж](
	[ID_Продажи] [int] NOT NULL,
	[ID_Товара] [int] NOT NULL,
	[ID_Клиента] [int] NULL,
	[ID_Услуги] [int] NULL,
	[ДатаИВремяПродажи] [smalldatetime] NOT NULL,
	[Количество] [int] NOT NULL,
	[Статус] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_история продаж] PRIMARY KEY CLUSTERED 
(
	[ID_Продажи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[категории товаров]    Script Date: 10/27/2023 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[категории товаров](
	[ID_Категории] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_категории товаров] PRIMARY KEY CLUSTERED 
(
	[ID_Категории] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[производители]    Script Date: 10/27/2023 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[производители](
	[ID_Производителя] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[ДатаНачалаРаботы] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_производители] PRIMARY KEY CLUSTERED 
(
	[ID_Производителя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[sell_history]    Script Date: 10/27/2023 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[sell_history] as Select Товары.ID_Товара as [ID товара], Товары.НаименованиеТовара as [Наименование товара], [Категории товаров].Наименование as [Категория товара], Производители.Наименование AS Производитель, Товары.Стоимость, Товары.Описание, Производители.Наименование, Товары.ДополнительныеТовары as [Дополнительные товары], [Активен?], [История продаж].ДатаИВремяПродажи as [Дата и время продажи], [История продаж].Количество
                            FROM(((Товары
                            INNER JOIN Производители ON Производители.ID_Производителя = Товары.Производитель) 
                            INNER JOIN[История продаж] ON [История продаж].ID_Товара = Товары.ID_Товара)
                            INNER JOIN[Категории товаров] ON [Категории товаров].ID_Категории = Товары.Категория)
GO
/****** Object:  View [dbo].[vw_productdetails]    Script Date: 10/27/2023 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vw_productdetails] AS select distinct 
товары.НаименованиеТовара AS Наименование, 
товары.Стоимость AS Стоимость, 
[товары].[Активен?] AS Активность,
товары.Производитель AS Производитель,
(case товары.ВторичныеИзображения when '' then 0 else ((len(concat('',товары.ВторичныеИзображения)) - len(replace(concat('',товары.ВторичныеИзображения),';',''))) + 1) end) AS [Количество изображений], 
(case товары.ДополнительныеТовары when '' then 0 else ((len(concat('',товары.ДополнительныеТовары)) - len(replace(concat('',товары.ДополнительныеТовары),';',''))) + 1) end) AS [Количество товаров],
max([история продаж].ДатаИВремяПродажи) OVER (PARTITION BY товары.НаименованиеТовара )  AS [Дата последней продажи],
sum([история продаж].Количество) OVER (PARTITION BY товары.НаименованиеТовара )  AS [Объем последних продаж],
(cast(cast(sum([история продаж].Количество)  OVER (PARTITION BY товары.НаименованиеТовара ) as decimal(12,5))   / cast(datediff(YEAR,min([история продаж].ДатаИВремяПродажи) OVER (PARTITION BY товары.НаименованиеТовара ) ,getdate())as decimal(12,5))as decimal(12,5))) AS [Среднее количество продаж в год] 
from (товары left join [история продаж] on(([dbo].[история продаж].ID_Товара = товары.ID_Товара))) 
where datediff(MONTH,[история продаж].ДатаИВремяПродажи,getdate()) > 3 union -- SQLINES LICENSE FOR EVALUATION USE ONLY
 select distinct товары.НаименованиеТовара AS Наименование,
 товары.Стоимость AS Стоимость,товары.[Активен?] AS Активность,
 товары.Производитель AS Производитель,
 (case товары.ВторичныеИзображения when '' then 0 else ((len(concat('',товары.ВторичныеИзображения)) - len(replace(concat('',товары.ВторичныеИзображения),';',''))) + 1) end) AS [Количество изображений],
 (case товары.ДополнительныеТовары when '' then 0 else ((len(concat('',товары.ДополнительныеТовары)) - len(replace(concat('',товары.ДополнительныеТовары),';',''))) + 1) end) AS [Количество товаров],
 NULL , NULL, NULL from (товары left join [история продаж] on(([история продаж].ID_Товара = товары.ID_Товара))) 
 where товары.ID_Товара not in (select [история продаж].ID_Товара from [история продаж])
GO
/****** Object:  Table [dbo].[категории специалистов]    Script Date: 10/27/2023 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[категории специалистов](
	[ID_Категории] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[КоэффицентОплаты] [decimal](2, 2) NOT NULL,
 CONSTRAINT [PK_категории специалистов] PRIMARY KEY CLUSTERED 
(
	[ID_Категории] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[клиенты]    Script Date: 10/27/2023 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[клиенты](
	[ID_клиента] [int] NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[ДатаРождения] [smalldatetime] NOT NULL,
	[Телефон] [nvarchar](20) NOT NULL,
	[ЭлектроннаяПочта] [nvarchar](50) NULL,
	[Пол] [nvarchar](1) NOT NULL,
	[ДатаПервогоПосещения] [smalldatetime] NOT NULL,
	[ФотографияКлиента] [nvarchar](150) NULL,
	[Тег] [int] NOT NULL,
	[Корзина] [nvarchar](150) NULL,
 CONSTRAINT [PK_клиенты] PRIMARY KEY CLUSTERED 
(
	[ID_клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[сотрудники]    Script Date: 10/27/2023 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[сотрудники](
	[ID_Сотрудника] [int] NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[СерияПаспорта] [nvarchar](5) NOT NULL,
	[НомерПаспорта] [nvarchar](6) NOT NULL,
	[КодПодразделения] [nvarchar](7) NOT NULL,
	[Пол] [nvarchar](1) NOT NULL,
	[ДатаРождения] [smalldatetime] NOT NULL,
	[ID_Категории] [int] NOT NULL,
 CONSTRAINT [PK_сотрудники] PRIMARY KEY CLUSTERED 
(
	[ID_Сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[теги]    Script Date: 10/27/2023 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[теги](
	[ID_Тега] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Цвет] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_теги] PRIMARY KEY CLUSTERED 
(
	[ID_Тега] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[услуги]    Script Date: 10/27/2023 9:43:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[услуги](
	[ID_Услуги] [int] NOT NULL,
	[ID_Сотрудника] [int] NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
	[Описание] [nvarchar](255) NOT NULL,
	[Стоимость] [decimal](10, 2) NOT NULL,
	[Скидка] [decimal](3, 2) NULL,
	[Продолжительность, мин] [int] NOT NULL,
	[Фото] [nvarchar](255) NULL,
 CONSTRAINT [PK_услуги] PRIMARY KEY CLUSTERED 
(
	[ID_Услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (1, 9, 1, 1, CAST(N'2019-02-22T15:30:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (2, 94, 1, 1, CAST(N'2019-11-20T17:05:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (3, 40, 1, 1, CAST(N'2019-10-05T17:25:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (4, 92, 1, 1, CAST(N'2019-10-06T15:45:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (5, 7, 1, 1, CAST(N'2019-02-11T18:18:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (6, 8, 1, 1, CAST(N'2019-11-03T19:48:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (7, 80, 1, 1, CAST(N'2019-08-25T09:14:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (8, 46, 1, 1, CAST(N'2019-04-08T19:12:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (9, 32, 1, 1, CAST(N'2019-10-07T18:30:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (10, 81, 1, 1, CAST(N'2019-12-30T13:56:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (11, 97, 1, 1, CAST(N'2019-07-23T13:22:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (12, 63, 1, 1, CAST(N'2019-05-08T16:32:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (13, 28, 1, 1, CAST(N'2019-02-25T18:40:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (14, 70, 1, 1, CAST(N'2019-11-16T16:36:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (15, 13, 1, 1, CAST(N'2019-01-05T14:29:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (16, 12, 1, 1, CAST(N'2019-01-03T14:05:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (17, 41, 1, 1, CAST(N'2019-11-22T08:16:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (18, 55, 1, 1, CAST(N'2019-12-18T15:30:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (19, 56, 1, 1, CAST(N'2019-02-11T13:31:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (20, 82, 1, 1, CAST(N'2019-11-09T14:29:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (21, 99, 1, 1, CAST(N'2019-01-17T09:33:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (22, 74, 1, 1, CAST(N'2019-07-27T12:18:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (23, 2, 1, 1, CAST(N'2019-05-02T14:04:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (24, 36, 1, 1, CAST(N'2019-03-23T12:33:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (25, 98, 1, 1, CAST(N'2019-08-31T10:27:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (26, 54, 1, 1, CAST(N'2019-04-02T15:49:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (27, 89, 1, 1, CAST(N'2019-02-14T16:30:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (28, 3, 1, 1, CAST(N'2019-06-30T15:04:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (29, 58, 1, 1, CAST(N'2019-01-15T10:32:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (30, 23, 1, 1, CAST(N'2019-12-25T09:20:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (31, 42, 1, 1, CAST(N'2019-04-24T17:19:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (32, 89, 1, 1, CAST(N'2019-05-11T16:15:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (33, 16, 1, 1, CAST(N'2019-01-21T13:44:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (34, 99, 1, 1, CAST(N'2019-08-22T09:42:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (35, 90, 1, 1, CAST(N'2019-11-10T17:27:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (36, 67, 1, 1, CAST(N'2019-01-20T17:36:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (37, 19, 1, 1, CAST(N'2019-08-06T10:47:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (38, 84, 1, 1, CAST(N'2019-09-25T09:23:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (39, 56, 1, 1, CAST(N'2019-01-13T15:27:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (40, 74, 1, 1, CAST(N'2019-11-21T15:51:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (41, 53, 1, 1, CAST(N'2019-03-02T09:33:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (42, 39, 1, 1, CAST(N'2019-02-16T08:02:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (43, 16, 1, 1, CAST(N'2019-07-22T17:12:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (44, 49, 1, 1, CAST(N'2019-12-26T19:19:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (45, 29, 1, 1, CAST(N'2019-07-18T08:43:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (46, 48, 1, 1, CAST(N'2019-06-02T19:06:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (47, 47, 1, 1, CAST(N'2019-07-22T10:28:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (48, 80, 1, 1, CAST(N'2019-03-27T19:34:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (49, 49, 1, 1, CAST(N'2019-09-01T17:03:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (50, 84, 1, 1, CAST(N'2019-02-27T17:52:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (51, 88, 1, 1, CAST(N'2019-02-22T15:07:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (52, 29, 1, 1, CAST(N'2019-01-18T14:44:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (53, 93, 1, 1, CAST(N'2019-03-24T18:10:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (54, 36, 1, 1, CAST(N'2019-10-21T10:29:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (55, 68, 1, 1, CAST(N'2019-06-11T09:34:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (56, 33, 1, 1, CAST(N'2019-06-08T14:12:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (57, 86, 1, 1, CAST(N'2019-03-23T09:48:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (58, 29, 1, 1, CAST(N'2019-07-21T08:46:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (59, 82, 1, 1, CAST(N'2019-04-13T12:41:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (60, 79, 1, 1, CAST(N'2019-01-24T16:39:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (61, 95, 1, 1, CAST(N'2019-02-15T13:41:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (62, 2, 1, 1, CAST(N'2019-07-04T17:30:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (63, 10, 1, 1, CAST(N'2019-03-27T18:28:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (64, 14, 1, 1, CAST(N'2019-11-14T08:58:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (65, 5, 1, 1, CAST(N'2019-06-12T10:24:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (66, 48, 1, 1, CAST(N'2019-08-07T18:21:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (67, 34, 1, 1, CAST(N'2019-09-26T16:57:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (68, 47, 1, 1, CAST(N'2019-09-04T08:03:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (69, 68, 1, 1, CAST(N'2019-02-19T08:36:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (70, 71, 1, 1, CAST(N'2019-05-14T16:03:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (71, 12, 1, 1, CAST(N'2019-07-14T09:32:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (72, 21, 1, 1, CAST(N'2019-01-01T08:47:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (73, 93, 1, 1, CAST(N'2019-01-08T10:57:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (74, 68, 1, 1, CAST(N'2019-03-07T17:37:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (75, 14, 1, 1, CAST(N'2019-05-08T16:55:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (76, 11, 1, 1, CAST(N'2019-07-29T09:29:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (77, 88, 1, 1, CAST(N'2019-01-17T18:25:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (78, 22, 1, 1, CAST(N'2019-01-02T08:49:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (79, 30, 1, 1, CAST(N'2019-04-27T12:25:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (80, 27, 1, 1, CAST(N'2019-10-11T16:56:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (81, 66, 1, 1, CAST(N'2019-11-16T13:32:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (82, 18, 1, 1, CAST(N'2019-07-28T10:56:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (83, 91, 1, 1, CAST(N'2019-05-29T13:09:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (84, 66, 1, 1, CAST(N'2019-05-23T12:00:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (85, 19, 1, 1, CAST(N'2019-12-24T10:08:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (86, 16, 1, 1, CAST(N'2019-03-10T08:00:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (87, 85, 1, 1, CAST(N'2019-08-20T18:45:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (88, 53, 1, 1, CAST(N'2019-03-27T12:05:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (89, 66, 1, 1, CAST(N'2019-02-13T13:40:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (90, 7, 1, 1, CAST(N'2019-09-20T08:56:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (91, 54, 1, 1, CAST(N'2019-10-03T12:31:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (92, 98, 1, 1, CAST(N'2019-10-08T12:30:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (93, 18, 1, 1, CAST(N'2019-08-19T10:01:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (94, 93, 1, 1, CAST(N'2019-10-09T18:21:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (95, 15, 1, 1, CAST(N'2019-01-09T17:04:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (96, 12, 1, 1, CAST(N'2019-07-26T13:42:00' AS SmallDateTime), 2, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (97, 38, 1, 1, CAST(N'2019-04-29T18:19:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (98, 18, 1, 1, CAST(N'2019-11-22T14:44:00' AS SmallDateTime), 3, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (99, 87, 1, 1, CAST(N'2019-01-28T08:59:00' AS SmallDateTime), 1, N'Выполнено')
INSERT [dbo].[история продаж] ([ID_Продажи], [ID_Товара], [ID_Клиента], [ID_Услуги], [ДатаИВремяПродажи], [Количество], [Статус]) VALUES (100, 97, 1, 1, CAST(N'2019-05-25T12:03:00' AS SmallDateTime), 3, N'Выполнено')
GO
INSERT [dbo].[категории специалистов] ([ID_Категории], [Наименование], [КоэффицентОплаты]) VALUES (1, N'Слесарь', CAST(0.20 AS Decimal(2, 2)))
GO
INSERT [dbo].[категории товаров] ([ID_Категории], [Наименование]) VALUES (1, N'Моторное масло')
INSERT [dbo].[категории товаров] ([ID_Категории], [Наименование]) VALUES (2, N'Аксессуары')
GO
INSERT [dbo].[клиенты] ([ID_клиента], [ФИО], [ДатаРождения], [Телефон], [ЭлектроннаяПочта], [Пол], [ДатаПервогоПосещения], [ФотографияКлиента], [Тег], [Корзина]) VALUES (1, N'Викторов Павел Алексеевич', CAST(N'2000-09-19T00:00:00' AS SmallDateTime), N'+7(872)728-06-21', N'', N'м', CAST(N'2023-09-28T00:00:00' AS SmallDateTime), N'', 1, N'')
GO
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (1, N'Profix', CAST(N'2017-10-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (2, N'Pierburg', CAST(N'2017-01-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (3, N'Honda', CAST(N'2016-06-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (4, N'Benson', CAST(N'2015-04-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (5, N'Mazda', CAST(N'2018-01-23T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (6, N'Zekkert', CAST(N'2018-03-08T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (7, N'Ferodo', CAST(N'2015-08-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (8, N'Lemforder', CAST(N'2016-11-15T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (9, N'Toyota', CAST(N'2016-06-03T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (10, N'Automega', CAST(N'2016-07-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (11, N'Magneti Marelli', CAST(N'2017-05-27T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (12, N'Nissan', CAST(N'2015-01-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (13, N'Airline', CAST(N'2016-03-26T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (14, N'BILSTEIN', CAST(N'2018-03-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (15, N'Petro-Canada', CAST(N'2017-03-22T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (16, N'Bendix', CAST(N'2015-04-25T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (17, N'Mercedes', CAST(N'2016-03-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (18, N'Mitsubishi', CAST(N'2017-04-23T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (19, N'Motul', CAST(N'2018-01-07T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (20, N'Shell', CAST(N'2016-11-14T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (21, N'Liqui Moly', CAST(N'2015-03-24T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (22, N'Mando', CAST(N'2015-03-24T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (23, N'LUK', CAST(N'2015-12-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (24, N'76', CAST(N'2017-02-03T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (25, N'Kayaba', CAST(N'2016-02-08T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (26, N'Total', CAST(N'2015-03-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (27, N'ASHIKA', CAST(N'2018-06-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (28, N'VAG', CAST(N'2018-05-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (29, N'King Bearings', CAST(N'2016-09-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (30, N'Castrol', CAST(N'2015-04-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (31, N'Hyundai/Kia', CAST(N'2016-01-07T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (32, N'Opel', CAST(N'2015-03-04T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (33, N'Idemitsu', CAST(N'2018-01-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (34, N'Stels', CAST(N'2017-05-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (35, N'BOGE', CAST(N'2016-01-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (36, N'Glaser', CAST(N'2015-12-29T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (37, N'Goodyear', CAST(N'2015-12-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (38, N'Suzuki', CAST(N'2017-05-18T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (39, N'ZIMMERMANN', CAST(N'2017-12-14T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (40, N'Mobil', CAST(N'2016-10-24T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (41, N'OPTIMAL', CAST(N'2016-08-19T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (42, N'ZIC', CAST(N'2015-02-07T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (43, N'Ford', CAST(N'2016-10-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (44, N'General Motors', CAST(N'2016-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (45, N'KASHIYAMA', CAST(N'2015-10-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (46, N'ALСA', CAST(N'2016-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (47, N'Airtex', CAST(N'2015-10-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (48, N'Elf', CAST(N'2016-10-16T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (49, N'BOSCH', CAST(N'2017-06-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[производители] ([ID_Производителя], [Наименование], [ДатаНачалаРаботы]) VALUES (50, N'Lukoil', CAST(N'2017-12-19T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[сотрудники] ([ID_Сотрудника], [ФИО], [СерияПаспорта], [НомерПаспорта], [КодПодразделения], [Пол], [ДатаРождения], [ID_Категории]) VALUES (1, N'Пригожин Сергей Евгеньевич', N'66 39', N'739577', N'749-202', N'м', CAST(N'1949-11-01T00:00:00' AS SmallDateTime), 1)
GO
INSERT [dbo].[теги] ([ID_Тега], [Наименование], [Цвет]) VALUES (1, N'Новый', N'синий')
INSERT [dbo].[теги] ([ID_Тега], [Наименование], [Цвет]) VALUES (2, N'Постоянный', N'зеленый')
INSERT [dbo].[теги] ([ID_Тега], [Наименование], [Цвет]) VALUES (3, N'Проблемный', N'оранжевый')
INSERT [dbo].[теги] ([ID_Тега], [Наименование], [Цвет]) VALUES (4, N'Горячий', N'красный')
GO
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (1, N'Motor Oil KE900-90042-R', 1, 2060, N'', N'Легендарное трио', 0, 0, 0, 0, 12, N'Товары автосервиса\AD00B713.jpg', N'да', N'3;5', N'Товары автосервиса\6CA0BE73.jpg;Товары автосервиса\AD00B713.jpg')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (2, N'Helix Ultra 550046361', 1, 2000, N'', N'lkllk', 0, 0, 0, 0, 43, N'Товары автосервиса\\F310E078.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (3, N'Super 3000 X1 152566', 1, 1820, N'', N'', 0, 0, 0, 0, 40, N'Товары автосервиса\6CA0BE73.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (4, N'Turbo SYN Gasoline 05100-00441', 1, 1870, N'', N'', 0, 0, 0, 0, 31, N'Товары автосервиса\2B009062.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (5, N'Dexos 2 95599405', 1, 1410, N'', N'Описание отсутсвует', 0, 0, 0, 0, 44, N'Товары автосервиса\AD00B713.jpg', N'да', N'4;2', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (6, N'Molygen New Generation 9054', 1, 2670, N'', N'', 0, 0, 0, 0, 21, N'Товары автосервиса\0DF0A8A4.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (7, N'Top Tec 4600 8033', 1, 2580, N'', N'', 0, 0, 0, 0, 21, N'Товары автосервиса\B790A6AA.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (8, N'ENGINE OIL 08880-80375-GO', 1, 2710, N'', N'', 0, 0, 0, 0, 9, N'Товары автосервиса\CC40C869.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (9, N'Mobil 1 ESP 154285', 1, 2890, N'', N'', 0, 0, 0, 0, 40, N'Товары автосервиса\F490E078.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (10, N'Dexos 2 93165557', 1, 1500, N'', N'', 0, 0, 0, 0, 44, N'Товары автосервиса\45908C52.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (11, N'Super 3000 X1 Diesel 152572', 1, 1870, N'', N'', 0, 0, 0, 0, 40, N'Товары автосервиса\B0A0C186.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (12, N'ENGINE OIL MZ 320754', 1, 2140, N'', N'', 0, 0, 0, 0, 18, N'Товары автосервиса\3B70C57C.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (13, N'Genesis Armortech 3148675', 1, 1660, N'', N'', 0, 0, 0, 0, 50, N'Товары автосервиса\C9C0F036.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (14, N'Optimal Synth 3926', 1, 1880, N'', N'', 0, 0, 0, 0, 21, N'Товары автосервиса\EFC05011.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (15, N'Optimal Synth 2293', 1, 2520, N'', N'', 0, 0, 0, 0, 21, N'Товары автосервиса\C310B9F3.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (16, N'Evolution 900 SXR 194878', 1, 2010, N'', N'', 0, 0, 0, 0, 48, N'Товары автосервиса\E320BB7C.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (17, N'Special C G 055 167 M4', 1, 4720, N'', N'', 0, 0, 0, 0, 28, N'Товары автосервиса\6730A31C.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (18, N'Longlife III G 052 195 M2', 1, 1910, N'', N'', 0, 0, 0, 0, 28, N'Товары автосервиса\E5507A37.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (19, N'Special Tec LL 8055', 1, 2420, N'', N'', 0, 0, 0, 0, 21, N'Товары автосервиса\B590AA7B.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (20, N'Dexos 2 19 42 002', 1, 1300, N'', N'', 0, 0, 0, 0, 32, N'Товары автосервиса\23F0848B.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (21, N'Gasoline Fully- Synthetic 30021326-746', 1, 1650, N'', N'', 0, 0, 0, 0, 33, N'Товары автосервиса\27B0C883.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (22, N'Formula F 15595E', 1, 1750, N'', N'', 0, 0, 0, 0, 43, N'Товары автосервиса\5250C855.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (23, N'Zepro Euro Spec SN/CF 1849-004', 1, 2400, N'', N'', 0, 0, 0, 0, 33, N'Товары автосервиса\90D0B807.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (24, N'SN 08880-10705', 1, 2200, N'', N'', 0, 0, 0, 0, 9, N'Товары автосервиса\43909176.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (25, N'Motor Oil KE900-90042', 1, 2020, N'', N'', 0, 0, 0, 0, 12, N'Товары автосервиса\90505D31.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (26, N'Evolution 900 SXR 194839', 1, 2340, N'', N'', 0, 0, 0, 0, 48, N'Товары автосервиса\F8E0B138.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (27, N'SN/GF-5 SN5W30C', 1, 1550, N'', N'', 0, 0, 0, 0, 1, N'Товары автосервиса\5A30A7EE.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (28, N'Evolution 900 SXR 194877', 1, 2470, N'', N'', 0, 0, 0, 0, 48, N'Товары автосервиса\E3A0B18A.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (29, N'Трос буксировочный 12 тонн 54384', 2, 410, N'', N'', 0, 0, 0, 0, 34, N'Товары автосервиса\9750DA76.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (30, N'Molygen New Generation 9042', 1, 2510, N'', N'', 0, 0, 0, 0, 21, N'Товары автосервиса\0D60A8A4.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (31, N'QUARTZ INEO ECS 166252', 1, 1600, N'', N'', 0, 0, 0, 0, 26, N'Товары автосервиса\D0D08F32.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (32, N'Motor Oil KE900-90032-R', 1, 1450, N'', N'', 0, 0, 0, 0, 12, N'Товары автосервиса\54B0795D.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (33, N'Original oil Ultra 8300-77-992', 1, 2770, N'', N'', 0, 0, 0, 0, 5, N'Товары автосервиса\EF80D790.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (34, N'Longlife III G 052 195 M4', 1, 4100, N'', N'', 0, 0, 0, 0, 28, N'Товары автосервиса\D9605006.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (35, N'8100 X-CESS 102870', 1, 3190, N'', N'', 0, 0, 0, 0, 19, N'Товары автосервиса\E9308929.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (36, N'Magnatec A5 15583D', 1, 2220, N'', N'', 0, 0, 0, 0, 30, N'Товары автосервиса\9380C1E7.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (37, N'Щетка для снега со съемным скребком GY000202', 2, 500, N'', N'', 0, 0, 0, 0, 37, N'Товары автосервиса\3760D73F.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (38, N'Magnatec A3/B4 156E9E', 1, 2130, N'', N'', 0, 0, 0, 0, 30, N'Товары автосервиса\92C0C1E7.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (39, N'Dexos 2 19 42 000', 1, 1410, N'', N'', 0, 0, 0, 0, 32, N'Товары автосервиса\2390848B.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (40, N'QUARTZ 9000 FUTURE NFC 171839', 1, 1560, N'', N'', 0, 0, 0, 0, 26, N'Товары автосервиса\D2508F32.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (41, N'Premium DPF Diesel 05200-00120', 1, 1460, N'', N'', 0, 0, 0, 0, 31, N'Товары автосервиса\2D709062.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (42, N'Special G G 052 502 M2', 1, 1820, N'', N'', 0, 0, 0, 0, 28, N'Товары автосервиса\E0D0E079.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (43, N'Ecstar F9000 99M00-22R02-004', 1, 2330, N'', N'', 0, 0, 0, 0, 38, N'Товары автосервиса\21B0E533.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (44, N'Genesis Armortech 1539424', 1, 1710, N'', N'', 0, 0, 0, 0, 50, N'Товары автосервиса\B0F0CB59.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (45, N'Helix Ultra 550046387', 1, 2160, N'', N'', 0, 0, 0, 0, 20, N'Товары автосервиса\F2B0E078.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (46, N'Super 3000 X1 152567', 1, 1550, N'', N'', 0, 0, 0, 0, 40, N'Товары автосервиса\F200BC2F.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (47, N'ENGINE OIL MZ 320753', 1, 1590, N'', N'', 0, 0, 0, 0, 18, N'Товары автосервиса\5BB0C351.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (48, N'Mobil 1 ESP Formula 152621', 1, 2920, N'', N'', 0, 0, 0, 0, 40, N'Товары автосервиса\DC70BEC3.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (49, N'Genuine A000989790211BIFR', 1, 1530, N'', N'', 0, 0, 0, 0, 17, N'Товары автосервиса\2E30E06C.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (50, N'ULTRA 152624', 1, 1940, N'', N'', 0, 0, 0, 0, 40, N'Товары автосервиса\BA30C186.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (51, N'Super 3000 X1 Formula FE 152564', 1, 1890, N'', N'', 0, 0, 0, 0, 40, N'Товары автосервиса\59B0BE73.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (52, N'Zepro Euro Spec SN/CF 1849-001', 1, 1730, N'', N'', 0, 0, 0, 0, 33, N'Товары автосервиса\90A0B807.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (53, N'Helix Ultra 550046367', 1, 1650, N'', N'', 0, 0, 0, 0, 20, N'Товары автосервиса\F2E0E078.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (54, N'QUARTZ 9000 FUTURE NFC 183199', 1, 2040, N'', N'', 0, 0, 0, 0, 26, N'Товары автосервиса\6CE0A012.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (55, N'Dexos 2 93165554', 1, 1380, N'', N'', 0, 0, 0, 0, 44, N'Товары автосервиса\45008C52.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (56, N'Formula F Fuel Economy HC 155D4B', 1, 1450, N'', N'', 0, 0, 0, 0, 43, N'Товары автосервиса\39A0C188.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (57, N'76 08880-803ENGINE OIL-GO', 1, 1630, N'', N'', 0, 0, 0, 0, 9, N'Товары автосервиса\0070C563.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (58, N'QUARTZ 9000 FUTURE NFC 183450', 1, 1660, N'', N'', 0, 0, 0, 0, 26, N'Товары автосервиса\FA90B138.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (59, N'Top Tec 4100 7501', 1, 2580, N'', N'', 0, 0, 0, 0, 21, N'Товары автосервиса\022096CB.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (60, N'Mobil 1 ESP 154279', 1, 1860, N'', N'', 0, 0, 0, 0, 40, N'Товары автосервиса\F460E078.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (61, N'Super 3000 X1 152061', 1, 2010, N'', N'', 0, 0, 0, 0, 40, N'Товары автосервиса\40409946.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (62, N'Super Extra Gasoline 05100-00410', 1, 1230, N'', N'', 0, 0, 0, 0, 31, N'Товары автосервиса\2A109062.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (63, N'Dexos 2 93165556', 1, 1340, N'', N'', 0, 0, 0, 0, 44, N'Товары автосервиса\43E08C52.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (64, N'Leichtlauf Special AA 7516', 1, 2360, N'', N'', 0, 0, 0, 0, 21, N'Товары автосервиса\47E07CB5.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (65, N'Helix HX8 A5/B5 550046777', 1, 1530, N'', N'', 0, 0, 0, 0, 20, N'Товары автосервиса\F160E078.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (66, N'Fuel Economy 08880-80845', 1, 2560, N'', N'', 0, 0, 0, 0, 9, N'Товары автосервиса\23106A35.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (67, N'76 Top Tec 420061', 1, 3440, N'', N'', 0, 0, 0, 0, 21, N'Товары автосервиса\03D096CB.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (68, N'X9 162613', 1, 1530, N'', N'', 0, 0, 0, 0, 42, N'Товары автосервиса\30E0C751.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (69, N'EDGE Professional LL III Titanium FST 157AD6', 1, 1760, N'', N'', 0, 0, 0, 0, 30, N'Товары автосервиса\96E0C1E7.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (70, N'Magnatec A3/B4 156E9D', 1, 1610, N'', N'', 0, 0, 0, 0, 30, N'Товары автосервиса\9290C1E7.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (71, N'Genuine A000989790213BIFR', 1, 2390, N'', N'', 0, 0, 0, 0, 17, N'Товары автосервиса\2E60E06C.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (72, N'Supreme Synthetic MOSYN53C16', 1, 1910, N'', N'', 0, 0, 0, 0, 15, N'Товары автосервиса\69C0CD62.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (73, N'Helix Ultra Pro AM-L 550046353', 1, 2110, N'', N'', 0, 0, 0, 0, 20, N'Товары автосервиса\3DF0E4BC.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (74, N'QUARTZ INEO ECS 151510', 1, 1920, N'', N'', 0, 0, 0, 0, 26, N'Товары автосервиса\8F609ED7.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (75, N'Original oil Ultra 0530-05-TFE', 1, 2930, N'', N'', 0, 0, 0, 0, 5, N'Товары автосервиса\85C04040.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (76, N'QUARTZ 9000 ENERGY HKS 175393', 1, 2830, N'', N'', 0, 0, 0, 0, 26, N'Товары автосервиса\6DD0A012.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (77, N'Ultra LEO-SN 08217-99974', 1, 2980, N'', N'', 0, 0, 0, 0, 3, N'Товары автосервиса\97809225.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (78, N'Special G G 052 502 M4', 1, 3090, N'', N'', 0, 0, 0, 0, 28, N'Товары автосервиса\E0A0E079.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (79, N'Люкс 207465', 1, 1090, N'', N'', 0, 0, 0, 0, 50, N'Товары автосервиса\8E20A863.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (80, N'Жилет светоотражающий взрослый ARW-AV-02', 2, 150, N'', N'', 0, 0, 0, 0, 13, N'Товары автосервиса\D4D0CE67.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (81, N'Premium LF Gasoline 05100-00451', 1, 1620, N'', N'', 0, 0, 0, 0, 31, N'Товары автосервиса\2B609062.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (82, N'Evolution 900 SXR 10160501', 1, 1750, N'', N'', 0, 0, 0, 0, 48, N'Товары автосервиса\BD80E8D5.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (83, N'Zepro Touring 1845-004', 1, 2380, N'', N'', 0, 0, 0, 0, 33, N'Товары автосервиса\5180B90E.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (84, N'76 A000989PKW Motorenol0213BLER', 1, 2510, N'', N'', 0, 0, 0, 0, 17, N'Товары автосервиса\2E00E06C.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (85, N'QUARTZ 9000 ENERGY HKS 175392', 1, 1530, N'', N'', 0, 0, 0, 0, 26, N'Товары автосервиса\6DA0A012.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (86, N'Formula F 155D3A', 1, 1830, N'', N'', 0, 0, 0, 0, 43, N'Товары автосервиса\39D0C188.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (87, N'Mobil 1 FS 153692', 1, 3020, N'', N'', 0, 0, 0, 0, 40, N'Товары автосервиса\6080DCD5.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (88, N'Zepro Eco Medalist 3583-004', 1, 2520, N'', N'', 0, 0, 0, 0, 33, N'Товары автосервиса\3DA0B713.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (89, N'SN 08880-10706', 1, 1640, N'', N'', 0, 0, 0, 0, 9, N'Товары автосервиса\43C09176.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (90, N'Dexos 2 19 42 003', 1, 1490, N'', N'', 0, 0, 0, 0, 32, N'Товары автосервиса\8430842A.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (91, N'ENGINE OIL 08880-80365-GO', 1, 3580, N'', N'', 0, 0, 0, 0, 9, N'Товары автосервиса\CC10C869.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (92, N'EDGE LL Titanium FST 15669A', 1, 3000, N'', N'', 0, 0, 0, 0, 30, N'Товары автосервиса\8BC0C1A9.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (93, N'QUARTZ 9000 148597', 1, 1700, N'', N'', 0, 0, 0, 0, 26, N'Товары автосервиса\8F909ED7.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (94, N'ENGINE OIL MZ 320756', 1, 1600, N'', N'', 0, 0, 0, 0, 18, N'Товары автосервиса\5BE0C351.jpg', N'нет', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (95, N'Кредитница, Кожа B6 6 95 1349', 2, 6770, N'', N'', 0, 0, 0, 0, 17, N'Товары автосервиса\63C09E91.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (96, N'Zepro Touring 1845-001', 1, 1720, N'', N'', 0, 0, 0, 0, 33, N'Товары автосервиса\7B70B9C6.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (97, N'ENGINE OIL MZ 320757', 1, 2210, N'', N'', 0, 0, 0, 0, 18, N'Товары автосервиса\0D30C4EE.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (98, N'Zepro Eco Medalist 3583-001', 1, 1770, N'', N'', 0, 0, 0, 0, 33, N'Товары автосервиса\6800BB8A.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (99, N'Premium DPF Diesel 05200-00620', 1, 2470, N'', N'', 0, 0, 0, 0, 31, N'Товары автосервиса\9B3075EB.jpg', N'да', N'', N'')
INSERT [dbo].[товары] ([ID_Товара], [НаименованиеТовара], [Категория], [Стоимость], [Характеристики], [Описание], [Вес, г], [Ширина, мм], [Высота , мм], [Длина, мм], [Производитель], [ГлавноеИзображение], [Активен?], [ДополнительныеТовары], [ВторичныеИзображения]) VALUES (100, N'QUARTZ 9000 FUTURE NFC 10230501', 1, 1650, N'', N'', 0, 0, 0, 0, 26, N'Товары автосервиса\3970E753.jpg', N'нет', N'', N'')
GO
INSERT [dbo].[услуги] ([ID_Услуги], [ID_Сотрудника], [Наименование], [Описание], [Стоимость], [Скидка], [Продолжительность, мин], [Фото]) VALUES (1, 1, N'Замена масла', N'Меняют масло в двигателе', CAST(1000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(3, 2)), 20, N'')
GO
/****** Object:  Index [IX_история продаж]    Script Date: 10/27/2023 9:43:22 AM ******/
CREATE NONCLUSTERED INDEX [IX_история продаж] ON [dbo].[история продаж]
(
	[ID_Продажи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[история продаж]  WITH CHECK ADD  CONSTRAINT [FK_история продаж_клиенты] FOREIGN KEY([ID_Клиента])
REFERENCES [dbo].[клиенты] ([ID_клиента])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[история продаж] CHECK CONSTRAINT [FK_история продаж_клиенты]
GO
ALTER TABLE [dbo].[история продаж]  WITH CHECK ADD  CONSTRAINT [FK_история продаж_товары] FOREIGN KEY([ID_Товара])
REFERENCES [dbo].[товары] ([ID_Товара])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[история продаж] CHECK CONSTRAINT [FK_история продаж_товары]
GO
ALTER TABLE [dbo].[история продаж]  WITH CHECK ADD  CONSTRAINT [FK_история продаж_услуги] FOREIGN KEY([ID_Услуги])
REFERENCES [dbo].[услуги] ([ID_Услуги])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[история продаж] CHECK CONSTRAINT [FK_история продаж_услуги]
GO
ALTER TABLE [dbo].[клиенты]  WITH CHECK ADD  CONSTRAINT [FK_клиенты_теги] FOREIGN KEY([Тег])
REFERENCES [dbo].[теги] ([ID_Тега])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[клиенты] CHECK CONSTRAINT [FK_клиенты_теги]
GO
ALTER TABLE [dbo].[сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_сотрудники_категории специалистов] FOREIGN KEY([ID_Категории])
REFERENCES [dbo].[категории специалистов] ([ID_Категории])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[сотрудники] CHECK CONSTRAINT [FK_сотрудники_категории специалистов]
GO
ALTER TABLE [dbo].[товары]  WITH CHECK ADD  CONSTRAINT [FK_товары_категории товаров] FOREIGN KEY([Категория])
REFERENCES [dbo].[категории товаров] ([ID_Категории])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[товары] CHECK CONSTRAINT [FK_товары_категории товаров]
GO
ALTER TABLE [dbo].[товары]  WITH CHECK ADD  CONSTRAINT [FK_товары_производители] FOREIGN KEY([Производитель])
REFERENCES [dbo].[производители] ([ID_Производителя])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[товары] CHECK CONSTRAINT [FK_товары_производители]
GO
USE [master]
GO
ALTER DATABASE [isip41_nekrasov_samodelkin] SET  READ_WRITE 
GO
