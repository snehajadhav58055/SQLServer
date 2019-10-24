USE [master]
GO
/****** Object:  Database [BankingDB]    Script Date: 10/24/2019 5:25:46 PM ******/
CREATE DATABASE [BankingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BankingDB', FILENAME = N'D:\SnehaJadhav\SQL server\BankingDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BankingDB_log', FILENAME = N'D:\SnehaJadhav\SQL server\BankingDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BankingDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BankingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BankingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BankingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BankingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BankingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BankingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BankingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BankingDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BankingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BankingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BankingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BankingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BankingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BankingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BankingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BankingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BankingDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BankingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BankingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BankingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BankingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BankingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BankingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BankingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BankingDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BankingDB] SET  MULTI_USER 
GO
ALTER DATABASE [BankingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BankingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BankingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BankingDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BankingDB]
GO
/****** Object:  StoredProcedure [dbo].[DeleteBranch]    Script Date: 10/24/2019 5:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		sneha
-- Create date: 2019/10/24
-- Description:	Delete Branch
-- =============================================
CREATE PROCEDURE [dbo].[DeleteBranch] 
	-- Add the parameters for the stored procedure here
	@Branch_Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Branch where Branch_Id = @Branch_Id;
END

GO
/****** Object:  StoredProcedure [dbo].[SaveBranch]    Script Date: 10/24/2019 5:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sneha	
-- Create date: 2019/10/24	
-- Description:	Save Branch Details
-- =============================================
CREATE PROCEDURE [dbo].[SaveBranch]
	-- Add the parameters for the stored procedure here
	
	@Address Varchar(30),
	@City Varchar(30),
	@Name Varchar(30),
	@State varchar(30),
	@Zip_Code varchar(12)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Branch VALUES(@Address,@City,@Name,@State,@Zip_Code)
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateBranch]    Script Date: 10/24/2019 5:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		SNEHA
-- Create date: 2019/10/24
-- Description:	UPDATE BRANCH INFORMATION

-- =============================================
CREATE PROCEDURE [dbo].[UpdateBranch]
	-- Add the parameters for the stored procedure here
	@Branch_Id int,
	@Name varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Branch SET Name = @Name WHERE Branch_Id = @Branch_Id;
END

GO
/****** Object:  Table [dbo].[Acc_Transaction]    Script Date: 10/24/2019 5:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Acc_Transaction](
	[Txn_Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Amount] [float] NOT NULL,
	[Funds_Avail_Date] [datetime] NOT NULL,
	[Txn_Date] [datetime] NOT NULL,
	[Txn_Type_Cd] [varchar](10) NULL,
	[Account_Id] [int] NULL,
	[Execution_Branch_Id] [int] NULL,
	[Teller_Emp_Id] [int] NULL,
 CONSTRAINT [PK_Acc_Transaction] PRIMARY KEY CLUSTERED 
(
	[Txn_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/24/2019 5:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Account_Id] [int] NOT NULL,
	[Avail_Balance] [float] NULL,
	[Close_Date] [datetime] NULL,
	[Last_Activity_Date] [datetime] NULL,
	[Open_Date] [datetime] NOT NULL,
	[Pending_Balance] [float] NULL,
	[Status] [varchar](10) NULL,
	[Cust_Id] [int] NULL,
	[Open_Branch_id] [int] NOT NULL,
	[Open_Emp_Id] [nchar](10) NOT NULL,
	[Product_Cd] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Account_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 10/24/2019 5:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branch](
	[Branch_Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](30) NULL,
	[City] [varchar](30) NULL,
	[Name] [varchar](30) NOT NULL,
	[State] [varchar](30) NULL,
	[Zip_Code] [varchar](12) NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[Branch_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Business]    Script Date: 10/24/2019 5:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Business](
	[Incorp_Date] [datetime] NULL,
	[Name] [varchar](255) NOT NULL,
	[State_Id] [varchar](10) NOT NULL,
	[Cust_Id] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/24/2019 5:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Emp_Id] [int] NOT NULL,
	[End_Date] [datetime] NULL,
	[First_Name] [varchar](20) NOT NULL,
	[Last_Name] [varchar](20) NOT NULL,
	[Start_Date] [datetime] NOT NULL,
	[Title] [varchar](20) NULL,
	[Assigned_Branch_Id] [int] NULL,
	[Dept_Id] [int] NULL,
	[Superior_Emp_Id] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Emp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Individual]    Script Date: 10/24/2019 5:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Individual](
	[Birth_Date] [datetime] NULL,
	[First_Name] [varchar](30) NOT NULL,
	[Last_Name] [varchar](30) NOT NULL,
	[Cust_Id] [int] NOT NULL,
	[Full_Name]  AS ([First_Name ]+[Last_Name]),
	[Age]  AS (datediff(year,[Birth_Date],getdate())),
 CONSTRAINT [PK_Individual] PRIMARY KEY CLUSTERED 
(
	[Cust_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Officer]    Script Date: 10/24/2019 5:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Officer](
	[Officer_Id] [int] NOT NULL,
	[End_Date] [datetime] NULL,
	[First_Name] [varchar](30) NOT NULL,
	[Last_Name] [varchar](30) NOT NULL,
	[Start_Date] [datetime] NOT NULL,
	[Title] [varchar](20) NULL,
	[Cust_Id] [int] NULL,
 CONSTRAINT [PK_Officer] PRIMARY KEY CLUSTERED 
(
	[Officer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/24/2019 5:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Product_Cd] [varchar](10) NOT NULL,
	[Date_Offered] [datetime] NULL,
	[Date_Retired] [datetime] NULL,
	[Name] [varchar](50) NOT NULL,
	[Product_Type_Cd] [varchar](255) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_Cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 10/24/2019 5:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductType](
	[Product_Type_Cd] [varchar](255) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Product_Type_Cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Acc_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Acc_Transaction_Account] FOREIGN KEY([Account_Id])
REFERENCES [dbo].[Account] ([Account_Id])
GO
ALTER TABLE [dbo].[Acc_Transaction] CHECK CONSTRAINT [FK_Acc_Transaction_Account]
GO
ALTER TABLE [dbo].[Acc_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Acc_Transaction_Branch] FOREIGN KEY([Execution_Branch_Id])
REFERENCES [dbo].[Branch] ([Branch_Id])
GO
ALTER TABLE [dbo].[Acc_Transaction] CHECK CONSTRAINT [FK_Acc_Transaction_Branch]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Branch] FOREIGN KEY([Open_Branch_id])
REFERENCES [dbo].[Branch] ([Branch_Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Branch]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Individual] FOREIGN KEY([Cust_Id])
REFERENCES [dbo].[Individual] ([Cust_Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Individual]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Product] FOREIGN KEY([Product_Cd])
REFERENCES [dbo].[Product] ([Product_Cd])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Product]
GO
ALTER TABLE [dbo].[Business]  WITH CHECK ADD  CONSTRAINT [FK_Business_Individual] FOREIGN KEY([Cust_Id])
REFERENCES [dbo].[Individual] ([Cust_Id])
GO
ALTER TABLE [dbo].[Business] CHECK CONSTRAINT [FK_Business_Individual]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Branch] FOREIGN KEY([Assigned_Branch_Id])
REFERENCES [dbo].[Branch] ([Branch_Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Branch]
GO
ALTER TABLE [dbo].[Officer]  WITH CHECK ADD  CONSTRAINT [FK_Officer_Individual] FOREIGN KEY([Cust_Id])
REFERENCES [dbo].[Individual] ([Cust_Id])
GO
ALTER TABLE [dbo].[Officer] CHECK CONSTRAINT [FK_Officer_Individual]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([Product_Type_Cd])
REFERENCES [dbo].[ProductType] ([Product_Type_Cd])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType1] FOREIGN KEY([Product_Type_Cd])
REFERENCES [dbo].[ProductType] ([Product_Type_Cd])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType1]
GO
USE [master]
GO
ALTER DATABASE [BankingDB] SET  READ_WRITE 
GO
