USE [master]
GO
/****** Object:  Database [PRN211]    Script Date: 7/26/2021 10:49:12 AM ******/
CREATE DATABASE [PRN211]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRN211', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRN211.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRN211_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRN211_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRN211] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN211].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN211] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN211] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN211] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN211] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN211] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN211] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRN211] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN211] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN211] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN211] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN211] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN211] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN211] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN211] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN211] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRN211] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN211] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN211] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN211] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN211] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN211] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN211] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN211] SET RECOVERY FULL 
GO
ALTER DATABASE [PRN211] SET  MULTI_USER 
GO
ALTER DATABASE [PRN211] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN211] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN211] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN211] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN211] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN211] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRN211', N'ON'
GO
ALTER DATABASE [PRN211] SET QUERY_STORE = OFF
GO
USE [PRN211]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/26/2021 10:49:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[SubjectID] [nvarchar](50) NOT NULL,
	[TermID] [nvarchar](50) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mark]    Script Date: 7/26/2021 10:49:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mark](
	[MarkID] [nvarchar](50) NOT NULL,
	[MarkType] [nvarchar](50) NOT NULL,
	[MarkWeight] [nvarchar](50) NOT NULL,
	[CourseID] [int] NOT NULL,
	[MarkName] [nvarchar](50) NULL,
	[value] [float] NOT NULL,
 CONSTRAINT [PK_Mark] PRIMARY KEY CLUSTERED 
(
	[MarkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/26/2021 10:49:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[Birth] [date] NULL,
	[phone] [nvarchar](50) NULL,
	[Name] [nchar](10) NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Term]    Script Date: 7/26/2021 10:49:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Term](
	[TermID] [int] NOT NULL,
	[TermName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Term] PRIMARY KEY CLUSTERED 
(
	[TermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Term_Student]    Script Date: 7/26/2021 10:49:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Term_Student](
	[TermID] [int] NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Term_Student] PRIMARY KEY CLUSTERED 
(
	[TermID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transcript]    Script Date: 7/26/2021 10:49:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transcript](
	[termID] [int] NOT NULL,
	[StudentID] [nvarchar](50) NOT NULL,
	[subjectID] [nvarchar](50) NOT NULL,
	[subjectName] [nvarchar](50) NOT NULL,
	[subjectPreQuisite] [nvarchar](50) NULL,
	[credit] [int] NOT NULL,
	[grade] [float] NOT NULL,
	[status] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Course] ([CourseID], [StudentID], [SubjectID], [TermID], [SubjectName]) VALUES (1, N'HE151343', N'1', N'1', N'PRN211')
INSERT [dbo].[Course] ([CourseID], [StudentID], [SubjectID], [TermID], [SubjectName]) VALUES (2, N'HE151343', N'2', N'1', N'PRO192')
INSERT [dbo].[Course] ([CourseID], [StudentID], [SubjectID], [TermID], [SubjectName]) VALUES (3, N'HE151343', N'1', N'2', N'PRN211')
GO
INSERT [dbo].[Mark] ([MarkID], [MarkType], [MarkWeight], [CourseID], [MarkName], [value]) VALUES (N'1', N'Progress Test ', N'5', 1, N'Progress Test 1', 6)
INSERT [dbo].[Mark] ([MarkID], [MarkType], [MarkWeight], [CourseID], [MarkName], [value]) VALUES (N'10', N'Progress Test', N'5', 1, N'Progress Test 2', 9)
INSERT [dbo].[Mark] ([MarkID], [MarkType], [MarkWeight], [CourseID], [MarkName], [value]) VALUES (N'11', N'Assignment ', N'3.3', 1, N'Assignment 2', 9)
INSERT [dbo].[Mark] ([MarkID], [MarkType], [MarkWeight], [CourseID], [MarkName], [value]) VALUES (N'12', N'Assignment ', N'3.3', 1, N'Assignment 3', 9)
INSERT [dbo].[Mark] ([MarkID], [MarkType], [MarkWeight], [CourseID], [MarkName], [value]) VALUES (N'3', N'Assignment ', N'3.3', 1, N'Assignment 1', 6)
INSERT [dbo].[Mark] ([MarkID], [MarkType], [MarkWeight], [CourseID], [MarkName], [value]) VALUES (N'6', N'Project', N'25', 1, N'Project', 7)
INSERT [dbo].[Mark] ([MarkID], [MarkType], [MarkWeight], [CourseID], [MarkName], [value]) VALUES (N'7', N'Practical Exam', N'25', 1, N'Pratical Exam', 6)
INSERT [dbo].[Mark] ([MarkID], [MarkType], [MarkWeight], [CourseID], [MarkName], [value]) VALUES (N'8', N'Final Exam', N'30', 1, N'Final Exam', 3)
GO
INSERT [dbo].[Student] ([StudentID], [email], [password], [Birth], [phone], [Name], [Address]) VALUES (N'HE151343', N'Hoangdxhe151343@fpt.edu.vn', N'123456a', CAST(N'2001-10-05' AS Date), N'''0833515589', N'Hoàng     ', N'Hải Phòng')
GO
INSERT [dbo].[Term] ([TermID], [TermName]) VALUES (1, N'Sp20')
INSERT [dbo].[Term] ([TermID], [TermName]) VALUES (2, N'Su20')
GO
INSERT [dbo].[Term_Student] ([TermID], [StudentID]) VALUES (1, N'HE151343')
INSERT [dbo].[Term_Student] ([TermID], [StudentID]) VALUES (2, N'HE151343')
GO
INSERT [dbo].[Transcript] ([termID], [StudentID], [subjectID], [subjectName], [subjectPreQuisite], [credit], [grade], [status]) VALUES (1, N'HE151343', N'PRN211', N'.NET', N'null', 3, 10, N'PASSED')
INSERT [dbo].[Transcript] ([termID], [StudentID], [subjectID], [subjectName], [subjectPreQuisite], [credit], [grade], [status]) VALUES (1, N'HE151343', N'PRJ301', N'Java Web', N'PRO192', 3, 8, N'PASSED')
INSERT [dbo].[Transcript] ([termID], [StudentID], [subjectID], [subjectName], [subjectPreQuisite], [credit], [grade], [status]) VALUES (2, N'HE151343', N'SWT392', N'Software Testing', N'PRJ301', 3, 7, N'NOT PASSED')
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Student]
GO
ALTER TABLE [dbo].[Mark]  WITH CHECK ADD  CONSTRAINT [FK_Mark_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Mark] CHECK CONSTRAINT [FK_Mark_Course]
GO
ALTER TABLE [dbo].[Term_Student]  WITH CHECK ADD  CONSTRAINT [FK_Term_Student_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Term_Student] CHECK CONSTRAINT [FK_Term_Student_Student]
GO
ALTER TABLE [dbo].[Term_Student]  WITH CHECK ADD  CONSTRAINT [FK_Term_Student_Term] FOREIGN KEY([TermID])
REFERENCES [dbo].[Term] ([TermID])
GO
ALTER TABLE [dbo].[Term_Student] CHECK CONSTRAINT [FK_Term_Student_Term]
GO
ALTER TABLE [dbo].[Transcript]  WITH CHECK ADD  CONSTRAINT [FK_Transcript_Term] FOREIGN KEY([termID])
REFERENCES [dbo].[Term] ([TermID])
GO
ALTER TABLE [dbo].[Transcript] CHECK CONSTRAINT [FK_Transcript_Term]
GO
USE [master]
GO
ALTER DATABASE [PRN211] SET  READ_WRITE 
GO
