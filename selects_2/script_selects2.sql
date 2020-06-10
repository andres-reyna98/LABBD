USE [master]
GO
/****** Object:  Database [EJERCICIO]    Script Date: 09/06/2020 08:26:40 p. m. ******/
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
/****** Object:  UserDefinedFunction [dbo].[VALIDAR_TEL]    Script Date: 09/06/2020 08:26:41 p. m. ******/
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
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 09/06/2020 08:26:41 p. m. ******/
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
/****** Object:  View [dbo].[CLIENTES_A]    Script Date: 09/06/2020 08:26:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[CLIENTES_A]
 AS
 SELECT NOM FROM CLIENTE GROUP BY NOM HAVING SUBSTRING(NOM,1,1)='A'
GO
/****** Object:  View [dbo].[CLIENTE_DIR]    Script Date: 09/06/2020 08:26:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[CLIENTE_DIR]
 AS 
 SELECT NOM , DIR FROM CLIENTE GROUP BY NOM , DIR 
GO
/****** Object:  View [dbo].[CLIENTE_TEL]    Script Date: 09/06/2020 08:26:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[CLIENTE_TEL]
 AS
 SELECT NOM , TEL FROM CLIENTE GROUP BY NOM , TEL
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 09/06/2020 08:26:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[CURP] [varchar](18) NOT NULL,
	[COD_P] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 09/06/2020 08:26:41 p. m. ******/
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
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 09/06/2020 08:26:41 p. m. ******/
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
/****** Object:  Table [dbo].[RESP]    Script Date: 09/06/2020 08:26:41 p. m. ******/
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
INSERT [dbo].[CLIENTE] ([NOM], [APES], [CURP], [DIR], [TEL]) VALUES (N'ANDREA', N'GONZALEZ', N'FDGH543232FTT433E', N'APODACA', 814195681)
INSERT [dbo].[CLIENTE] ([NOM], [APES], [CURP], [DIR], [TEL]) VALUES (N'ALEXIS', N'PALACIOS', N'GFH87421654567OIH', N'APODACA', 804195687)
INSERT [dbo].[CLIENTE] ([NOM], [APES], [CURP], [DIR], [TEL]) VALUES (N'DANIEL', N'GOMEZ', N'HJKIK57890IUU88E7', N'SAN PEDRO', 804195686)
INSERT [dbo].[CLIENTE] ([NOM], [APES], [CURP], [DIR], [TEL]) VALUES (N'MARTINA', N'SANCHEZ', N'KIEDW13456578GRER', N'SAN NICOLAS', 814195628)
INSERT [dbo].[CLIENTE] ([NOM], [APES], [CURP], [DIR], [TEL]) VALUES (N'ENRIQUE', N'MATTA', N'LAESD134354FDSF', N'GUADALUPE', 811041638)
INSERT [dbo].[CLIENTE] ([NOM], [APES], [CURP], [DIR], [TEL]) VALUES (N'JORGE', N'MARTINEZ', N'MARJ98113HQTRYR02', N'ESCOBEDO', 811095688)
INSERT [dbo].[CLIENTE] ([NOM], [APES], [CURP], [DIR], [TEL]) VALUES (N'JUAN', N'RODRIGUEZ', N'MHFES1234543242ED', N'SAN NICOLAS', 814195682)
INSERT [dbo].[CLIENTE] ([NOM], [APES], [CURP], [DIR], [TEL]) VALUES (N'JUDITH', N'SUAREZ', N'NEDFE0867865OYYIE', N'SAN NICOLAS', 804195684)
INSERT [dbo].[CLIENTE] ([NOM], [APES], [CURP], [DIR], [TEL]) VALUES (N'JEAN', N'REYNA', N'ÑKHY521643243FWSG', N'SAN PEDRO', 804195683)
INSERT [dbo].[CLIENTE] ([NOM], [APES], [CURP], [DIR], [TEL]) VALUES (N'ALAN', N'MALDONADO', N'POIUYDRD2D4532FRF', N'GUADALUPE', 804195685)
INSERT [dbo].[CLIENTE] ([NOM], [APES], [CURP], [DIR], [TEL]) VALUES (N'ISAI', N'GARCIA', N'UEEB8343489344WWF', N'APODACA', 81104118)
INSERT [dbo].[CLIENTE] ([NOM], [APES], [CURP], [DIR], [TEL]) VALUES (N'ORLANDO', N'CONTRERAS', N'ZASDW12347654GSFY', N'MONTERREY', 814195680)
GO
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'MARJ98113HQTRYR02', 1)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'FDGH543232FTT433E', 2)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'MHFES1234543242ED', 1)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'NEDFE0867865OYYIE', 11)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'POIUYDRD2D4532FRF', 3)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'HJKIK57890IUU88E7', 8)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'GFH87421654567OIH', 6)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'ZASDW12347654GSFY', 2)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'UEEB8343489344WWF', 7)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'KIEDW13456578GRER', 8)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'LAESD134354FDSF', 5)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'LAESD134354FDSF', 9)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'NEDFE0867865OYYIE', 7)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'POIUYDRD2D4532FRF', 8)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'MARJ98113HQTRYR02', 10)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'ÑKHY521643243FWSG', 11)
INSERT [dbo].[COMPRA] ([CURP], [COD_P]) VALUES (N'GFH87421654567OIH', 2)
GO
INSERT [dbo].[PRODUCTO] ([NOMP], [COD_P], [PRECIO], [RFC_PRO]) VALUES (N'GALLETA DE LIMON', 1, 10.6, N'GALTS092323DF')
INSERT [dbo].[PRODUCTO] ([NOMP], [COD_P], [PRECIO], [RFC_PRO]) VALUES (N'GALLETA DE AVENA', 2, 11.3, N'GALTS092323DF')
INSERT [dbo].[PRODUCTO] ([NOMP], [COD_P], [PRECIO], [RFC_PRO]) VALUES (N'GALLETA DE CHOCOLATE', 3, 11.2, N'GALTS092323DF')
INSERT [dbo].[PRODUCTO] ([NOMP], [COD_P], [PRECIO], [RFC_PRO]) VALUES (N'PAITAS CON SAL', 4, 14.6, N'PAPS1234337NL')
INSERT [dbo].[PRODUCTO] ([NOMP], [COD_P], [PRECIO], [RFC_PRO]) VALUES (N'PAPITAS DE LIMON', 5, 13.4, N'PAPS1234337NL')
INSERT [dbo].[PRODUCTO] ([NOMP], [COD_P], [PRECIO], [RFC_PRO]) VALUES (N'PAPITAS DE CHILE', 6, 16.5, N'PAPS1234337NL')
INSERT [dbo].[PRODUCTO] ([NOMP], [COD_P], [PRECIO], [RFC_PRO]) VALUES (N'PAPITAS DE QUESO', 7, 14.5, N'PAPS1234337NL')
INSERT [dbo].[PRODUCTO] ([NOMP], [COD_P], [PRECIO], [RFC_PRO]) VALUES (N'PAPITAS NORMALES', 8, 14.7, N'PAPS1234337NL')
INSERT [dbo].[PRODUCTO] ([NOMP], [COD_P], [PRECIO], [RFC_PRO]) VALUES (N'PALETAS DE CEREZA', 9, 1.34, N'PALTS786534GD')
INSERT [dbo].[PRODUCTO] ([NOMP], [COD_P], [PRECIO], [RFC_PRO]) VALUES (N'PALETAS DE CARAMELO', 10, 2.35, N'PALTS786534GD')
INSERT [dbo].[PRODUCTO] ([NOMP], [COD_P], [PRECIO], [RFC_PRO]) VALUES (N'PALETAS DE CAJETA', 11, 4.87, N'PALTS786534GD')
INSERT [dbo].[PRODUCTO] ([NOMP], [COD_P], [PRECIO], [RFC_PRO]) VALUES (N'CHICLES', 12, 0.5, N'CHCLS34R433NL')
GO
INSERT [dbo].[PROVEEDOR] ([RFC_PRO], [NOM_PRO], [DIR_PRO]) VALUES (N'CHCLS34R433NL', N'CHICLES NUEVO LEON', N'MONTERREY')
INSERT [dbo].[PROVEEDOR] ([RFC_PRO], [NOM_PRO], [DIR_PRO]) VALUES (N'GALTS092323DF', N'PALETITAS DF', N'ESTADO DE MEXICO')
INSERT [dbo].[PROVEEDOR] ([RFC_PRO], [NOM_PRO], [DIR_PRO]) VALUES (N'PALTS786534GD', N'PALETAS GUADALAJARA', N'ZAPOPAN')
INSERT [dbo].[PROVEEDOR] ([RFC_PRO], [NOM_PRO], [DIR_PRO]) VALUES (N'PAPS1234337NL', N'PAPITAS NUEVO LEON', N'SAN NICOLAS')
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
/****** Object:  StoredProcedure [dbo].[CLIENTE_DIRP]    Script Date: 09/06/2020 08:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CLIENTE_DIRP]  @NOM NVARCHAR(20) , @DIR NVARCHAR (20)
AS
SELECT NOM FROM CLIENTE_DIR WHERE NOM = @NOM AND DIR = @DIR
GO
/****** Object:  StoredProcedure [dbo].[CLIENTES_AP]    Script Date: 09/06/2020 08:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CLIENTES_AP] @NOM NVARCHAR(20)
AS
SELECT * FROM CLIENTES_A WHERE NOM = @NOM
GO
/****** Object:  Trigger [dbo].[CIENTESB]    Script Date: 09/06/2020 08:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[CIENTESB]
ON [dbo].[CLIENTE]
AFTER DELETE
AS
BEGIN 
	INSERT RESP
	SELECT *
	FROM deleted
END
GO
ALTER TABLE [dbo].[CLIENTE] ENABLE TRIGGER [CIENTESB]
GO
/****** Object:  Trigger [dbo].[PRODin]    Script Date: 09/06/2020 08:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[PRODin]
ON [dbo].[PRODUCTO]
INSTEAD of insert
AS
BEGIN 
	insert into PRODUCTO
     select*
     from inserted where PRECIO > 10 
END
GO
ALTER TABLE [dbo].[PRODUCTO] ENABLE TRIGGER [PRODin]
GO
USE [master]
GO
ALTER DATABASE [EJERCICIO] SET  READ_WRITE 
GO
SELECT * FROM CLIENTE 
INNER JOIN PROVEEDOR 
ON CLIENTE.DIR = PROVEEDOR.DIR_PRO;
SELECT NOM_PRO FROM PROVEEDOR
INNER JOIN PRODUCTO
ON PROVEEDOR.RFC_PRO != PRODUCTO.NOMP

SELECT * FROM CLIENTE 
LEFT JOIN PROVEEDOR 
ON CLIENTE.DIR = PROVEEDOR.DIR_PRO;
SELECT * FROM COMPRA 
LEFT JOIN CLIENTE
ON COMPRA.CURP = CLIENTE.CURP;

SELECT * FROM CLIENTE 
RIGHT JOIN PROVEEDOR 
ON CLIENTE.DIR = PROVEEDOR.DIR_PRO;
SELECT * FROM COMPRA 
RIGHT JOIN PRODUCTO
ON COMPRA.COD_P = PRODUCTO.COD_P;


SELECT * FROM CLIENTE 
CROSS JOIN PROVEEDOR
SELECT * FROM COMPRA 
CROSS JOIN PRODUCTO

SELECT * FROM COMPRA WHERE CURP = (SELECT CURP FROM CLIENTE where CURP = COMPRA.CURP)
