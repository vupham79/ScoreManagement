USE [master]
GO
/****** Object:  Database [StudentManagement]    Script Date: 10/24/2018 15:19:03 ******/
CREATE DATABASE [StudentManagement] ON  PRIMARY 
( NAME = N'StudentManagement', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\StudentManagement.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentManagement_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\StudentManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudentManagement] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentManagement] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [StudentManagement] SET ANSI_NULLS OFF
GO
ALTER DATABASE [StudentManagement] SET ANSI_PADDING OFF
GO
ALTER DATABASE [StudentManagement] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [StudentManagement] SET ARITHABORT OFF
GO
ALTER DATABASE [StudentManagement] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [StudentManagement] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [StudentManagement] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [StudentManagement] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [StudentManagement] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [StudentManagement] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [StudentManagement] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [StudentManagement] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [StudentManagement] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [StudentManagement] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [StudentManagement] SET  DISABLE_BROKER
GO
ALTER DATABASE [StudentManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [StudentManagement] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [StudentManagement] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [StudentManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [StudentManagement] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [StudentManagement] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [StudentManagement] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [StudentManagement] SET  READ_WRITE
GO
ALTER DATABASE [StudentManagement] SET RECOVERY SIMPLE
GO
ALTER DATABASE [StudentManagement] SET  MULTI_USER
GO
ALTER DATABASE [StudentManagement] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [StudentManagement] SET DB_CHAINING OFF
GO
USE [StudentManagement]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/24/2018 15:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[course_id] [nvarchar](10) NOT NULL,
	[course_name] [nvarchar](30) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'PRF102', N'Networking')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'PRO202', N'Java Core')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'PRO301', N'Java Swing')
INSERT [dbo].[Course] ([course_id], [course_name]) VALUES (N'PRO302', N'Java Web')
/****** Object:  Table [dbo].[Student]    Script Date: 10/24/2018 15:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[student_id] [nvarchar](10) NOT NULL,
	[firstname] [nvarchar](10) NOT NULL,
	[lastname] [nvarchar](30) NOT NULL,
	[birthday] [date] NULL,
	[sex] [char](1) NOT NULL,
	[major] [nvarchar](2) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Student] ([student_id], [firstname], [lastname], [birthday], [sex], [major]) VALUES (N'SE61234', N'Trinh', N'Thanh Tu', CAST(0xDD210B00 AS Date), N'F', N'SE')
INSERT [dbo].[Student] ([student_id], [firstname], [lastname], [birthday], [sex], [major]) VALUES (N'SE63200', N'Pham', N'Hoai Vu', CAST(0xBA210B00 AS Date), N'M', N'IA')
INSERT [dbo].[Student] ([student_id], [firstname], [lastname], [birthday], [sex], [major]) VALUES (N'SE64333', N'Nguyen', N'Cong Duc Anh', CAST(0x821E0B00 AS Date), N'M', N'SE')
INSERT [dbo].[Student] ([student_id], [firstname], [lastname], [birthday], [sex], [major]) VALUES (N'SE65441', N'Dang', N'Manh Tuong', CAST(0x0F210B00 AS Date), N'M', N'SE')
/****** Object:  Table [dbo].[Mark]    Script Date: 10/24/2018 15:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mark](
	[student_id] [nvarchar](10) NOT NULL,
	[course_id] [nvarchar](10) NOT NULL,
	[first_mark] [float] NULL,
	[second_mark] [float] NULL,
 CONSTRAINT [PK_Mark] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[course_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Mark] ([student_id], [course_id], [first_mark], [second_mark]) VALUES (N'SE61234', N'PRF102', 7.2, 6.9)
INSERT [dbo].[Mark] ([student_id], [course_id], [first_mark], [second_mark]) VALUES (N'SE63200', N'PRF102', 5.6, 7.3)
INSERT [dbo].[Mark] ([student_id], [course_id], [first_mark], [second_mark]) VALUES (N'SE63200', N'PRO202', 8.5, 4)
INSERT [dbo].[Mark] ([student_id], [course_id], [first_mark], [second_mark]) VALUES (N'SE64333', N'PRO202', 8.2, 9.9)
INSERT [dbo].[Mark] ([student_id], [course_id], [first_mark], [second_mark]) VALUES (N'SE65441', N'PRO301', 4.2, 5.9)
INSERT [dbo].[Mark] ([student_id], [course_id], [first_mark], [second_mark]) VALUES (N'SE65441', N'PRO302', 3.8, 9.3)
/****** Object:  ForeignKey [FK_Mark_Course]    Script Date: 10/24/2018 15:19:05 ******/
ALTER TABLE [dbo].[Mark]  WITH CHECK ADD  CONSTRAINT [FK_Mark_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Mark] CHECK CONSTRAINT [FK_Mark_Course]
GO
/****** Object:  ForeignKey [FK_Mark_Student]    Script Date: 10/24/2018 15:19:05 ******/
ALTER TABLE [dbo].[Mark]  WITH CHECK ADD  CONSTRAINT [FK_Mark_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[Mark] CHECK CONSTRAINT [FK_Mark_Student]
GO
