USE [Practica2]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 06/03/2020 08:19:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articulo](
	[Id] [uniqueidentifier] NOT NULL,
	[NombreArticulo] [varchar](50) NOT NULL,
	[Departamento] [varchar](50) NOT NULL,
	[DescripionArticulo]  AS (([NombreArticulo]+' ')+[Departamento]),
	[FechaDevencimiento] [datetime] NOT NULL,
	[Caducidad]  AS (datediff(year,[FechaDevencimiento],getdate())),
	[IdTienda] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 06/03/2020 08:19:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[PrimerApellido] [varchar](50) NOT NULL,
	[segundoApellido] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[NombreCompleto]  AS (((([Nombre]+' ')+[PrimerApellido])+' ')+[segundoApellido]),
	[FechaDeNacimiento] [datetime] NOT NULL,
	[Edad]  AS (datediff(year,[FechaDeNacimiento],getdate())),
	[idArticulos] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Client_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Distribuciones]    Script Date: 06/03/2020 08:19:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Distribuciones](
	[Id] [uniqueidentifier] NOT NULL,
	[NombreDistribuidora] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tienda]    Script Date: 06/03/2020 08:19:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tienda](
	[Id] [uniqueidentifier] NOT NULL,
	[NombreTienda] [varchar](50) NOT NULL,
	[IdUbicacion] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ubicaciones]    Script Date: 06/03/2020 08:19:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ubicaciones](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombreubic] [varchar](50) NOT NULL,
	[IdDistribucion] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Tiendas] FOREIGN KEY([IdTienda])
REFERENCES [dbo].[Tienda] ([Id])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Tiendas]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Articulo] FOREIGN KEY([idArticulos])
REFERENCES [dbo].[Articulo] ([Id])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Articulo]
GO
ALTER TABLE [dbo].[Tienda]  WITH CHECK ADD  CONSTRAINT [FK_Tiendas_Ubicaciones] FOREIGN KEY([IdUbicacion])
REFERENCES [dbo].[Ubicaciones] ([Id])
GO
ALTER TABLE [dbo].[Tienda] CHECK CONSTRAINT [FK_Tiendas_Ubicaciones]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [CHK_ColumnD_DocExe] CHECK  (([FechaDeNacimiento]<=dateadd(year,(-18),getdate())))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [CHK_ColumnD_DocExe]
GO
