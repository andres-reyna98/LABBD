USE [master]
GO
/****** Object:  Database [EJERCICIO]    Script Date: 11/06/2020 04:01:18 p. m. ******/
CREATE DATABASE [EJERCICIO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EJERCICIO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\EJERCICIO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EJERCICIO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS01\MSSQL\DATA\EJERCICIO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EJERCICIO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EJERCICIO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EJERCICIO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EJERCICIO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EJERCICIO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EJERCICIO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EJERCICIO] SET ARITHABORT OFF 
GO
ALTER DATABASE [EJERCICIO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EJERCICIO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EJERCICIO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EJERCICIO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EJERCICIO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EJERCICIO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EJERCICIO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EJERCICIO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EJERCICIO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EJERCICIO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EJERCICIO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EJERCICIO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EJERCICIO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EJERCICIO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EJERCICIO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EJERCICIO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EJERCICIO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EJERCICIO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EJERCICIO] SET  MULTI_USER 
GO
ALTER DATABASE [EJERCICIO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EJERCICIO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EJERCICIO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EJERCICIO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EJERCICIO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EJERCICIO] SET QUERY_STORE = OFF
GO
USE [EJERCICIO]
GO
/****** Object:  UserDefinedFunction [dbo].[VALIDAR_TEL]    Script Date: 11/06/2020 04:01:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[VALIDAR_TEL]( @TEL AS INT )
RETURNS VARCHAR (10)
AS
BEGIN
	RETURN CAST(@TEL AS VARCHAR(10)) 
END
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 11/06/2020 04:01:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[NOM] [varchar](30) NOT NULL,
	[APES] [varchar](30) NOT NULL,
	[CURP] [varchar](18) NOT NULL,
	[DIR] [varchar](30) NOT NULL,
	[TEL] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CURP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CLIENTES_A]    Script Date: 11/06/2020 04:01:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[CLIENTES_A]
 AS
 SELECT NOM FROM CLIENTE GROUP BY NOM HAVING SUBSTRING(NOM,1,1)='A'
GO
/****** Object:  View [dbo].[CLIENTE_DIR]    Script Date: 11/06/2020 04:01:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[CLIENTE_DIR]
 AS 
 SELECT NOM , DIR FROM CLIENTE GROUP BY NOM , DIR 
GO
/****** Object:  View [dbo].[CLIENTE_TEL]    Script Date: 11/06/2020 04:01:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[CLIENTE_TEL]
 AS
 SELECT NOM , TEL FROM CLIENTE GROUP BY NOM , TEL
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 11/06/2020 04:01:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[CURP] [varchar](18) NOT NULL,
	[COD_P] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 11/06/2020 04:01:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[NOMP] [varchar](30) NOT NULL,
	[COD_P] [int] NOT NULL,
	[PRECIO] [float] NULL,
	[RFC_PRO] [varchar](13) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_P] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 11/06/2020 04:01:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDOR](
	[RFC_PRO] [varchar](13) NOT NULL,
	[NOM_PRO] [varchar](30) NOT NULL,
	[DIR_PRO] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RFC_PRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESP]    Script Date: 11/06/2020 04:01:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESP](
	[NOM] [varchar](30) NOT NULL,
	[APES] [varchar](30) NOT NULL,
	[CURP] [varchar](18) NOT NULL,
	[DIR] [varchar](30) NOT NULL,
	[TEL] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CURP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([COD_P])
REFERENCES [dbo].[PRODUCTO] ([COD_P])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([CURP])
REFERENCES [dbo].[CLIENTE] ([CURP])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([RFC_PRO])
REFERENCES [dbo].[PROVEEDOR] ([RFC_PRO])
GO
/****** Object:  StoredProcedure [dbo].[CLIENTE_DIRP]    Script Date: 11/06/2020 04:01:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CLIENTE_DIRP]  @NOM NVARCHAR(20) , @DIR NVARCHAR (20)
AS
SELECT NOM FROM CLIENTE_DIR WHERE NOM = @NOM AND DIR = @DIR
GO
/****** Object:  StoredProcedure [dbo].[CLIENTES_AP]    Script Date: 11/06/2020 04:01:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CLIENTES_AP] @NOM NVARCHAR(20)
AS
SELECT * FROM CLIENTES_A WHERE NOM = @NOM
GO
USE [master]
GO
ALTER DATABASE [EJERCICIO] SET  READ_WRITE 
GO
