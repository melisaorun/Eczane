USE [master]
GO
/****** Object:  Database [Eczane]    Script Date: 28.03.2023 19:15:23 ******/
CREATE DATABASE [Eczane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Eczane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Eczane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Eczane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Eczane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Eczane] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Eczane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Eczane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Eczane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Eczane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Eczane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Eczane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Eczane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Eczane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Eczane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Eczane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Eczane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Eczane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Eczane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Eczane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Eczane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Eczane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Eczane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Eczane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Eczane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Eczane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Eczane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Eczane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Eczane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Eczane] SET RECOVERY FULL 
GO
ALTER DATABASE [Eczane] SET  MULTI_USER 
GO
ALTER DATABASE [Eczane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Eczane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Eczane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Eczane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Eczane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Eczane] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Eczane', N'ON'
GO
ALTER DATABASE [Eczane] SET QUERY_STORE = ON
GO
ALTER DATABASE [Eczane] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Eczane]
GO
/****** Object:  Table [dbo].[HastaBilgisi]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HastaBilgisi](
	[HastaBilgiNo] [int] IDENTITY(1,1) NOT NULL,
	[KimlikBilgisi] [int] NULL,
	[AdiSoyadi] [varchar](50) NULL,
	[SosyalGuvencesi] [varchar](50) NULL,
	[Adres] [varchar](50) NULL,
	[Telefon] [int] NULL,
	[İlacBarkod] [int] NULL,
	[İlacKullanim] [varchar](50) NULL,
 CONSTRAINT [PK_HastaBilgisi] PRIMARY KEY CLUSTERED 
(
	[HastaBilgiNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[İlacBilgileri]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[İlacBilgileri](
	[İlacNo] [int] IDENTITY(1,1) NOT NULL,
	[İlacBarkod] [int] NULL,
	[İlacinAdi] [varchar](50) NULL,
	[KutuSayisi] [int] NULL,
	[Fiyati] [money] NULL,
	[KullanimAmaci] [varchar](50) NULL,
	[YanEtkileri] [varchar](50) NULL,
 CONSTRAINT [PK_İlacBilgileri] PRIMARY KEY CLUSTERED 
(
	[İlacNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanıcılar]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanıcılar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[mail] [nvarchar](max) NULL,
	[telefon] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetHastaIlacBilgi]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetHastaIlacBilgi] @kimlik int
as
select İlacinAdi from İlacBilgileri ib
join HastaBilgisi hb on ib.İlacBarkod = hb.İlacBarkod
where hb.KimlikBilgisi =@kimlik
GO
/****** Object:  StoredProcedure [dbo].[HAra]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HAra]
@KimlikBilgisi int
as begin 
select*from HastaBilgisi where KimlikBilgisi=@KimlikBilgisi
end
GO
/****** Object:  StoredProcedure [dbo].[HAra1]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HAra1]
@İlacBarkod int
as begin 
select*from İlacBilgileri where İlacBarkod=@İlacBarkod
end
GO
/****** Object:  StoredProcedure [dbo].[HEkle]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HEkle]
@KimlikBilgisi int,
@AdiSoyadi varchar(50),
@SosyalGuvencesi varchar(50),
@Adres varchar(50),
@Telefon int,
@İlacBarkod int,
@İlacKullanim varchar(50)
as begin
insert into HastaBilgisi(KimlikBilgisi,AdiSoyadi,SosyalGuvencesi,Adres,Telefon,İlacBarkod,İlacKullanim)values (@KimlikBilgisi,@AdiSoyadi,@SosyalGuvencesi,@Adres,@Telefon,@İlacBarkod,@İlacKullanim)
end
GO
/****** Object:  StoredProcedure [dbo].[HEkle1]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HEkle1]
@İlacBarkod int,
@İlacinAdi varchar(50),
@KutuSayisi int,
@Fiyati money,
@KullanimAmaci varchar(50),
@YanEtkileri varchar(50)
as begin
insert into İlacBilgileri(İlacBarkod,İlacinAdi,KutuSayisi,Fiyati,KullanimAmaci,YanEtkileri)values (@İlacBarkod,@İlacinAdi,@KutuSayisi,@Fiyati,@KullanimAmaci,@YanEtkileri)
end
GO
/****** Object:  StoredProcedure [dbo].[HListele]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HListele]
as begin
select* from HastaBilgisi
end
GO
/****** Object:  StoredProcedure [dbo].[HListele1]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HListele1]
as begin
select* from İlacBilgileri
end
GO
/****** Object:  StoredProcedure [dbo].[HSil]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HSil]
@HastaBilgiNo int
as begin
delete from HastaBilgisi where HastaBilgiNo=@HastaBilgiNo
end
GO
/****** Object:  StoredProcedure [dbo].[HSil1]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[HSil1]
@İlacNo int
as begin
delete from İlacBilgileri where İlacNo=@İlacNo
end
GO
/****** Object:  StoredProcedure [dbo].[HYenile]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HYenile]
@HastaBilgiNo int,
@KimlikBilgisi int,
@AdiSoyadi varchar(50),
@SosyalGuvencesi varchar(50),
@Adres varchar(50),
@Telefon int,
@İlacBarkod int,
@İlacKullanim varchar(50)
as begin
update HastaBilgisi set KimlikBilgisi=@KimlikBilgisi,AdiSoyadi=@AdiSoyadi,SosyalGuvencesi=@SosyalGuvencesi,Adres=@Adres,Telefon=@Telefon,İlacBarkod=@İlacBarkod,İlacKullanim=@İlacKullanim
where HastaBilgiNo=@HastaBilgiNo
end
GO
/****** Object:  StoredProcedure [dbo].[HYenile1]    Script Date: 28.03.2023 19:15:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HYenile1]
@İlacNo int,
@İlacBarkod int,
@İlacinAdi varchar(50),
@KutuSayisi int,
@Fiyati money,
@KullanimAmaci varchar(50),
@YanEtkileri varchar(50)
as begin
update İlacBilgileri set İlacBarkod=@İlacBarkod,İlacinAdi=@İlacinAdi,KutuSayisi=@KutuSayisi,Fiyati=@Fiyati,KullanimAmaci=@KullanimAmaci,YanEtkileri=@YanEtkileri
where İlacNo=@İlacNo
end
GO
USE [master]
GO
ALTER DATABASE [Eczane] SET  READ_WRITE 
GO
