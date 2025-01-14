USE [master]
GO
/****** Object:  Database [game]    Script Date: 2024/1/11 上午 08:43:57 ******/
CREATE DATABASE [game]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'game', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\game.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'game_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\game_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [game] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [game].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [game] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [game] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [game] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [game] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [game] SET ARITHABORT OFF 
GO
ALTER DATABASE [game] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [game] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [game] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [game] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [game] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [game] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [game] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [game] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [game] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [game] SET  DISABLE_BROKER 
GO
ALTER DATABASE [game] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [game] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [game] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [game] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [game] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [game] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [game] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [game] SET RECOVERY FULL 
GO
ALTER DATABASE [game] SET  MULTI_USER 
GO
ALTER DATABASE [game] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [game] SET DB_CHAINING OFF 
GO
ALTER DATABASE [game] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [game] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [game] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [game] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'game', N'ON'
GO
ALTER DATABASE [game] SET QUERY_STORE = ON
GO
ALTER DATABASE [game] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [game]
GO
/****** Object:  Table [dbo].[Boards]    Script Date: 2024/1/11 上午 08:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[Text] [nvarchar](1000) NOT NULL,
	[Time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 2024/1/11 上午 08:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[GameId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [int] NOT NULL,
	[Date] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 2024/1/11 上午 08:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Member1Id] [int] NOT NULL,
	[Member2Id] [int] NOT NULL,
	[Relationship] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 2024/1/11 上午 08:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[ProductId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2024/1/11 上午 08:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[AvatarURL] [nvarchar](200) NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[BanTime] [datetime] NULL,
	[Bonus] [int] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[Birthday] [datetime] NULL,
	[NickName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 2024/1/11 上午 08:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[BoardId] [int] NOT NULL,
	[Text] [nvarchar](1000) NOT NULL,
	[Time] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 2024/1/11 上午 08:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](200) NOT NULL,
	[MemberId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeasonDiscounts]    Script Date: 2024/1/11 上午 08:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeasonDiscounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Persent] [int] NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [game] SET  READ_WRITE 
GO
