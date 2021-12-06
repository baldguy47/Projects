USE [master]
GO

/****** Object:  Database [PRN292_Project]    Script Date: 7/22/2021 4:27:22 PM ******/
CREATE DATABASE [PRN292_Project]
 CONTAINMENT = NONE
 GO

ALTER DATABASE [PRN292_Project] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN292_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [PRN292_Project] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [PRN292_Project] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [PRN292_Project] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [PRN292_Project] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [PRN292_Project] SET ARITHABORT OFF 
GO

ALTER DATABASE [PRN292_Project] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [PRN292_Project] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [PRN292_Project] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [PRN292_Project] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [PRN292_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [PRN292_Project] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [PRN292_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [PRN292_Project] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [PRN292_Project] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [PRN292_Project] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [PRN292_Project] SET  DISABLE_BROKER 
GO

ALTER DATABASE [PRN292_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [PRN292_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [PRN292_Project] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [PRN292_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [PRN292_Project] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [PRN292_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [PRN292_Project] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [PRN292_Project] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [PRN292_Project] SET  MULTI_USER 
GO

ALTER DATABASE [PRN292_Project] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [PRN292_Project] SET DB_CHAINING OFF 
GO

ALTER DATABASE [PRN292_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [PRN292_Project] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [PRN292_Project] SET  READ_WRITE 
GO

USE [PRN292_Project]
GO

/****** Object:  Table [dbo].[Student]    Script Date: 7/22/2021 4:27:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Student](
	[StudentId] [nvarchar](50) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[Mark] [float] NOT NULL,
	[PaperMark] [float] NOT NULL,
	[PaperNo] [int] NOT NULL,
	[Note] [nvarchar](250) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO