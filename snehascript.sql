USE [master]
GO
/****** Object:  Database [LibraryApplication]    Script Date: 11/6/2019 6:16:22 PM ******/
CREATE DATABASE [LibraryApplication]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryApplication', FILENAME = N'D:\Ayushi.net\AYUSHI SQL SERVER\EF\LibraryApplication.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryApplication_log', FILENAME = N'D:\Ayushi.net\AYUSHI SQL SERVER\EF\LibraryApplication_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibraryApplication] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryApplication].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryApplication] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryApplication] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryApplication] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryApplication] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryApplication] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryApplication] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryApplication] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryApplication] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryApplication] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryApplication] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryApplication] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryApplication] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryApplication] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryApplication] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryApplication] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryApplication] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryApplication] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryApplication] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryApplication] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryApplication] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryApplication] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryApplication] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryApplication] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryApplication] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryApplication] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryApplication] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryApplication] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryApplication] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryApplication] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LibraryApplication]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/6/2019 6:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] NOT NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[PhoneNo] [numeric](18, 0) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[LibrarianId] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Author]    Script Date: 11/6/2019 6:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorId] [int] NOT NULL,
	[AuthorName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNo] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book]    Script Date: 11/6/2019 6:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] NOT NULL,
	[BookName] [nvarchar](50) NOT NULL,
	[AuthorId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Publisher] [nvarchar](50) NOT NULL,
	[MRP] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/6/2019 6:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IssuedBooks]    Script Date: 11/6/2019 6:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssuedBooks](
	[IssuedTransId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[BookIssuedDate] [datetime] NOT NULL,
	[BookReturnedDate] [datetime] NOT NULL,
	[LibCardId] [int] NOT NULL,
 CONSTRAINT [PK_IssuedBooks] PRIMARY KEY CLUSTERED 
(
	[IssuedTransId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Librarian]    Script Date: 11/6/2019 6:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Librarian](
	[LibrarianId] [int] NOT NULL,
	[LibrarianName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[PhoneNo] [numeric](18, 0) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[StudentId] [int] NOT NULL,
 CONSTRAINT [PK_Librarian] PRIMARY KEY CLUSTERED 
(
	[LibrarianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LibraryCard]    Script Date: 11/6/2019 6:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibraryCard](
	[LibCardId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LibraryCard] PRIMARY KEY CLUSTERED 
(
	[LibCardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PenaltyInfo]    Script Date: 11/6/2019 6:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PenaltyInfo](
	[PenaltyType] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PenaltySummary]    Script Date: 11/6/2019 6:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PenaltySummary](
	[Trans_id] [int] IDENTITY(1,1) NOT NULL,
	[Penalty_Charges] [int] NOT NULL,
	[DateOfPenalty] [datetime] NOT NULL,
 CONSTRAINT [PK_PenaltySummary] PRIMARY KEY CLUSTERED 
(
	[Trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReturnedBooks]    Script Date: 11/6/2019 6:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnedBooks](
	[ReturnedTransId] [int] IDENTITY(1,1) NOT NULL,
	[BookReturnedDate] [datetime] NOT NULL,
	[StudentId] [int] NOT NULL,
	[LibCardId] [int] NOT NULL,
 CONSTRAINT [PK_ReturnedBooks] PRIMARY KEY CLUSTERED 
(
	[ReturnedTransId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock]    Script Date: 11/6/2019 6:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[BookName] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/6/2019 6:16:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[PhoneNo] [numeric](18, 0) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Eamil] [nvarchar](50) NOT NULL,
	[Branch] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Librarian] FOREIGN KEY([LibrarianId])
REFERENCES [dbo].[Librarian] ([LibrarianId])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Librarian]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Categories]
GO
ALTER TABLE [dbo].[IssuedBooks]  WITH CHECK ADD  CONSTRAINT [FK_IssuedBooks_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[IssuedBooks] CHECK CONSTRAINT [FK_IssuedBooks_Book]
GO
ALTER TABLE [dbo].[IssuedBooks]  WITH CHECK ADD  CONSTRAINT [FK_IssuedBooks_LibraryCard] FOREIGN KEY([LibCardId])
REFERENCES [dbo].[LibraryCard] ([LibCardId])
GO
ALTER TABLE [dbo].[IssuedBooks] CHECK CONSTRAINT [FK_IssuedBooks_LibraryCard]
GO
ALTER TABLE [dbo].[IssuedBooks]  WITH CHECK ADD  CONSTRAINT [FK_IssuedBooks_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[IssuedBooks] CHECK CONSTRAINT [FK_IssuedBooks_Student]
GO
ALTER TABLE [dbo].[Librarian]  WITH CHECK ADD  CONSTRAINT [FK_Librarian_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Librarian] CHECK CONSTRAINT [FK_Librarian_Student]
GO
ALTER TABLE [dbo].[LibraryCard]  WITH CHECK ADD  CONSTRAINT [FK_LibraryCard_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[LibraryCard] CHECK CONSTRAINT [FK_LibraryCard_Student]
GO
ALTER TABLE [dbo].[ReturnedBooks]  WITH CHECK ADD  CONSTRAINT [FK_ReturnedBooks_LibraryCard] FOREIGN KEY([LibCardId])
REFERENCES [dbo].[LibraryCard] ([LibCardId])
GO
ALTER TABLE [dbo].[ReturnedBooks] CHECK CONSTRAINT [FK_ReturnedBooks_LibraryCard]
GO
ALTER TABLE [dbo].[ReturnedBooks]  WITH CHECK ADD  CONSTRAINT [FK_ReturnedBooks_PenaltySummary] FOREIGN KEY([ReturnedTransId])
REFERENCES [dbo].[PenaltySummary] ([Trans_id])
GO
ALTER TABLE [dbo].[ReturnedBooks] CHECK CONSTRAINT [FK_ReturnedBooks_PenaltySummary]
GO
ALTER TABLE [dbo].[ReturnedBooks]  WITH CHECK ADD  CONSTRAINT [FK_ReturnedBooks_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[ReturnedBooks] CHECK CONSTRAINT [FK_ReturnedBooks_Student]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Author]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Book]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Categories]
GO
USE [master]
GO
ALTER DATABASE [LibraryApplication] SET  READ_WRITE 
GO
