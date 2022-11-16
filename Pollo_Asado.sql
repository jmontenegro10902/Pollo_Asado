USE [master]
GO

CREATE DATABASE Pollo_Asado2
GO

USE Pollo_Asado2
GO

/****** Object:  Table [dbo].[Carrito]    Script Date: 16/11/2022 12:35:42:a. m. ******/

CREATE TABLE [dbo].[Carrito](
	[Id_Carrito] [varchar](15) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Id_Orden_Compra] [varchar](15) NOT NULL,
 CONSTRAINT [pk_Id_Carrito] PRIMARY KEY CLUSTERED 
(
	[Id_Carrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 16/11/2022 12:35:42:a. m. ******/

CREATE TABLE [dbo].[Categoria](
	[Id_Categoria] [varchar](15) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [pk_Id_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Detalle_Compra]    Script Date: 16/11/2022 12:35:42:a. m. ******/



GO
CREATE TABLE [dbo].[Detalle_Compra](
	[Id_Detalle_Compra] [varchar](15) NOT NULL,
	[Id_Orden_Compra] [varchar](15) NOT NULL,
	[Id_Producto] [varchar](15) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
 CONSTRAINT [pk_Id_Detalle_Compra] PRIMARY KEY CLUSTERED 
(
	[Id_Detalle_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Error]    Script Date: 16/11/2022 12:35:42:a. m. ******/


CREATE TABLE [dbo].[Error](
	[IdError] [bigint] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Codigo] [bigint] NOT NULL,
	[Mensaje] [varchar](MAX) NOT NULL,
	[Accion] [varchar](MAX) NOT NULL,
 CONSTRAINT [pk_IdError] PRIMARY KEY CLUSTERED 
(
	[IdError] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 16/11/2022 12:35:42:a. m. ******/


CREATE TABLE [dbo].[Marca](
	[Id_Marca] [varchar](15) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [pk_Id_Marca] PRIMARY KEY CLUSTERED 
(
	[Id_Marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Metodo_Pago]    Script Date: 16/11/2022 12:35:42:a. m. ******/


CREATE TABLE [dbo].[Metodo_Pago](
	[Id_Metodo_Pago] [varchar](15) NOT NULL,
	[nombre_Pago] [varchar](45) NOT NULL,
 CONSTRAINT [pk_Id_Metodo_Pago] PRIMARY KEY CLUSTERED 
(
	[Id_Metodo_Pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden_Compra]    Script Date: 16/11/2022 12:35:42:a. m. ******/


CREATE TABLE [dbo].[Orden_Compra](
	[Id_Orden_Compra] [varchar](15) NOT NULL,
	[Id_Usuario] [varchar](20) NOT NULL,
	[Id_Metodo_Pago] [varchar](15) NOT NULL,
	[Impuesto] [int] NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
 CONSTRAINT [pk_Id_Orden_Compra] PRIMARY KEY CLUSTERED 
(
	[Id_Orden_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 16/11/2022 12:35:42:a. m. ******/


CREATE TABLE [dbo].[Producto](
	[Id_Producto] [varchar](15) NOT NULL,
	[Id_Marca] [varchar](15) NOT NULL,
	[Id_Categoria] [varchar](15) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Existencia] [int] NOT NULL,
	[RutaImagen] [varchar](100) NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [pk_Id_Producto] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 16/11/2022 12:35:42:a. m. ******/


CREATE TABLE [dbo].[Rol](
	[idRol] [varchar](15) NOT NULL,
	[descripcionRol] [varchar](30) NOT NULL,
 CONSTRAINT [pk_idRol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/11/2022 12:35:42:a. m. ******/


CREATE TABLE [dbo].[Usuario](
	[Usuario] [varchar](20) NOT NULL,
	[Contrasena] [varchar](255) NOT NULL,
	[Nombre] [varchar](35) NOT NULL,
	[Cedula] [varchar](35) NOT NULL,
	[Activo] [bit] NULL,
	[CambioContrasenna] [bit] NULL,
	[idRol] [varchar](15) NOT NULL,
	[Apellidos] [varchar](35) NULL,
	[Correo] [varchar](30) NULL,
 CONSTRAINT [pk_Usuario] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Carrito] ([Id_Carrito], [Usuario], [Id_Orden_Compra]) VALUES (N'car-01', N'usuario03', N'ord-02')
GO
INSERT [dbo].[Carrito] ([Id_Carrito], [Usuario], [Id_Orden_Compra]) VALUES (N'car-04', N'usuario03', N'ord-03')
GO
INSERT [dbo].[Categoria] ([Id_Categoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'cat-1', N'Combos', 1, CAST(N'1900-01-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Categoria] ([Id_Categoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'cat-2', N'ffffffff', 0, CAST(N'1900-01-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Categoria] ([Id_Categoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'cat-3', N'Snaks', 1, CAST(N'1900-01-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Categoria] ([Id_Categoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'cat-4', N'Postres', 1, CAST(N'1900-01-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Categoria] ([Id_Categoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'cat-5', N'Acompañamietos', 1, CAST(N'1900-01-12T00:00:00.000' AS DateTime))
GO

INSERT [dbo].[Detalle_Compra] ([Id_Detalle_Compra], [Id_Orden_Compra], [Id_Producto], [Cantidad], [Monto]) VALUES (N'detalle-01', N'ord-01', N'pro-07', 1, CAST(6.85 AS Decimal(10, 2)))
GO
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_Compra], [Id_Orden_Compra], [Id_Producto], [Cantidad], [Monto]) VALUES (N'detalle-02', N'ord-02', N'pro-16', 1, CAST(1500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_Compra], [Id_Orden_Compra], [Id_Producto], [Cantidad], [Monto]) VALUES (N'detalle-03', N'ord-03', N'pro-02', 1, CAST(2500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_Compra], [Id_Orden_Compra], [Id_Producto], [Cantidad], [Monto]) VALUES (N'detalle-04', N'ord-04', N'pro-18', 1, CAST(1000.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Error] ON 
GO
INSERT [dbo].[Error] ([IdError], [Usuario], [Fecha], [Codigo], [Mensaje], [Accion]) VALUES (1, N'Carlos', CAST(N'2022-11-11T14:52:27.120' AS DateTime), 1, N'Error 151', N'Controller')
GO
INSERT [dbo].[Error] ([IdError], [Usuario], [Fecha], [Codigo], [Mensaje], [Accion]) VALUES (2, N'Carlos', CAST(N'2022-11-11T15:02:07.947' AS DateTime), 1, N'Error 1ddddddddddddddddddddddddddddddddddddddddddd', N'Controdddddddddddddddddddddddddddddddddddller')
GO
INSERT [dbo].[Error] ([IdError], [Usuario], [Fecha], [Codigo], [Mensaje], [Accion]) VALUES (3, N'Carlos', CAST(N'2022-11-11T15:05:37.533' AS DateTime), -33, N'Error 1ddddddddddddddddddddddddddddddddddddddddddd', N'Controdddddddddddddddddddddddddddddddddddller')
GO
INSERT [dbo].[Error] ([IdError], [Usuario], [Fecha], [Codigo], [Mensaje], [Accion]) VALUES (4, N'Carlos', CAST(N'2022-11-11T15:06:45.983' AS DateTime), -1111, N'Error 1ddddddddddddddddddddddddddddddddddddddddddd', N'Controdddddddddddddddddddddddddddddddddddller')
GO
SET IDENTITY_INSERT [dbo].[Error] OFF
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-1', N'Coca Cola', 1, CAST(N'1900-01-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-10', N'Santa Cruz', 1, CAST(N'1900-01-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-11', N'Bioland', 1, CAST(N'1900-01-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-12', N'Richly', 1, CAST(N'1900-01-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-13', N'De la casa', 1, CAST(N'1900-01-11T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-2', N'Tropical', 1, CAST(N'1900-01-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-3', N'Pipasa', 1, CAST(N'1900-01-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-4', N'Tortillas del Fogon', 1, CAST(N'1900-01-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-5', N'Rumba', 1, CAST(N'1900-01-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-6', N'Tosty', 1, CAST(N'1900-01-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-7', N'Rumba', 1, CAST(N'1900-01-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-8', N'Kraft', 1, CAST(N'1900-01-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Marca] ([Id_Marca], [Descripcion], [Activo], [FechaRegistro]) VALUES (N'mar-9', N'Bioland', 1, CAST(N'1900-01-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Metodo_Pago] ([Id_Metodo_Pago], [nombre_Pago]) VALUES (N'met-pag-01', N'De contado')
GO
INSERT [dbo].[Metodo_Pago] ([Id_Metodo_Pago], [nombre_Pago]) VALUES (N'met-pag-02', N'Tarjeta')
GO
INSERT [dbo].[Metodo_Pago] ([Id_Metodo_Pago], [nombre_Pago]) VALUES (N'met-pag-03', N'Sinpe Movil ')
GO
INSERT [dbo].[Orden_Compra] ([Id_Orden_Compra], [Id_Usuario], [Id_Metodo_Pago], [Impuesto], [FechaCompra]) VALUES (N'ord-01', N'usuario03', N'met-pag-01', 13, CAST(N'1900-01-09T00:00:00.000' AS DateTime))
GO												
INSERT [dbo].[Orden_Compra] ([Id_Orden_Compra], [Id_Usuario], [Id_Metodo_Pago], [Impuesto], [FechaCompra]) VALUES (N'ord-02', N'usuario03', N'met-pag-02', 13, CAST(N'1900-01-09T00:00:00.000' AS DateTime))
GO												
INSERT [dbo].[Orden_Compra] ([Id_Orden_Compra], [Id_Usuario], [Id_Metodo_Pago], [Impuesto], [FechaCompra]) VALUES (N'ord-03', N'usuario03', N'met-pag-01', 13, CAST(N'1900-01-09T00:00:00.000' AS DateTime))
GO												
INSERT [dbo].[Orden_Compra] ([Id_Orden_Compra], [Id_Usuario], [Id_Metodo_Pago], [Impuesto], [FechaCompra]) VALUES (N'ord-04', N'usuario03', N'met-pag-03', 13, CAST(N'1900-01-09T00:00:00.000' AS DateTime))
GO												
INSERT [dbo].[Orden_Compra] ([Id_Orden_Compra], [Id_Usuario], [Id_Metodo_Pago], [Impuesto], [FechaCompra]) VALUES (N'ord-05', N'usuario02', N'met-pag-01', 13, CAST(N'2022-05-04T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-01', N'mar-1', N'cat-2', N'Coca Cola desechable 600 ml', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(1.00 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-01.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-02', N'mar-1', N'cat-2', N'Coca Cola desechable 2 litos', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(2.50 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-02.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-03', N'mar-2', N'cat-2', N'Tropical desechable 500 ml', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(1.00 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-03.jpg', 0)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-04', N'mar-2', N'cat-2', N'Tropical desechable 2 litros', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(2.50 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-04.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-05', N'mar-10', N'cat-5', N'Frijolitos molidos', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(1.00 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-01.png', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-06', N'mar-3', N'cat-1', N'Combo de Medio pollo', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(3.50 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-06.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-07', N'mar-3', N'cat-1', N'Combo de cuarto de pollo', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(2.00 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-07.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-08', N'mar-3', N'cat-1', N'Combo de pollo entero', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(6.30 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-08.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-09', N'mar-4', N'cat-5', N'Paquete de tortillas', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(500.00 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-09.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-10', N'mar-6', N'cat-3', N'Nachos grandes', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(1.80 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-10.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-11', N'mar-7', N'cat-3', N'Tortillas tostadas grandes', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(1.80 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-11.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-12', N'mar-6', N'cat-3', N'Papas tostadas grandes', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(1.80 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-12.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-13', N'mar-6', N'cat-3', N'Papas tostadas grandes', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(1.80 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-12.png', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-14', N'mar-7', N'cat-3', N'Patacones grandes', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(1.80 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-13.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-15', N'mar-7', N'cat-3', N'Chicharrones grandes', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(1.80 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-14.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-16', N'mar-13', N'cat-5', N'Ensalada pequeña', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(1.00 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-16.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-17', N'mar-13', N'cat-5', N'Ensalada mediana', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(1.00 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-17.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'pro-18', N'mar-12', N'cat-5', N'Pure de papa', CAST(N'1900-01-09T00:00:00.000' AS DateTime), CAST(1.00 AS Decimal(10, 2)), 50, N'~/escritorio/image/pro-18.jpg', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'prueba', N'mar-7', N'cat-5', N'string', CAST(N'2022-10-25T22:20:22.693' AS DateTime), CAST(0.00 AS Decimal(10, 2)), 0, N'sin-imagen', 1)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Id_Marca], [Id_Categoria], [Nombre], [FechaRegistro], [Precio], [Existencia], [RutaImagen], [Activo]) VALUES (N'string', N'mar-4', N'cat-4', N'put4', CAST(N'2022-10-25T21:23:40.383' AS DateTime), CAST(904.00 AS Decimal(10, 2)), 1004, N'put4', 1)
GO
INSERT [dbo].[Rol] ([idRol], [descripcionRol]) VALUES (N'r01', N'Administrador')
GO
INSERT [dbo].[Rol] ([idRol], [descripcionRol]) VALUES (N'r02', N'Supervisor')
GO
INSERT [dbo].[Rol] ([idRol], [descripcionRol]) VALUES (N'r03', N'Cajero')
GO
INSERT [dbo].[Rol] ([idRol], [descripcionRol]) VALUES (N'r04', N'Dependiente')
GO
INSERT [dbo].[Rol] ([idRol], [descripcionRol]) VALUES (N'r05', N'Cliente')
GO
INSERT [dbo].[Usuario] ([Usuario], [Contrasena], [Nombre], [Cedula], [Activo], [CambioContrasenna], [idRol], [Apellidos], [Correo]) VALUES (N'carlos', N'uhcU319dRkB5SzpVCfrgpOMPYKCvKPpV0rMFByiJ8jLlD4SPPpbDXt1XHP677yL1b69FnYrG/v5l/8dovICAFg==', N'carlos', N'carlos', 1, 0, N'r02', N'carlos', N'carlos')
GO
INSERT [dbo].[Usuario] ([Usuario], [Contrasena], [Nombre], [Cedula], [Activo], [CambioContrasenna], [idRol], [Apellidos], [Correo]) VALUES (N'string', N'J1fLPK/DmvRRq7Jpe+ebSrYdY9dNhbBBhinejCaBG1KfPzeA0BUAY/9Vor7udMTsECoqJzGh8ffxDUc60Ypqhw==', N'string', N'string', 1, 0, N'r03', N'string', N'string')
GO
INSERT [dbo].[Usuario] ([Usuario], [Contrasena], [Nombre], [Cedula], [Activo], [CambioContrasenna], [idRol], [Apellidos], [Correo]) VALUES (N'usuario01', N'oney*123', N'Oney', N'On123456', 1, 0, N'r01', N'Montenegro Cerdas', NULL)
GO
INSERT [dbo].[Usuario] ([Usuario], [Contrasena], [Nombre], [Cedula], [Activo], [CambioContrasenna], [idRol], [Apellidos], [Correo]) VALUES (N'usuario02', N'jose*123', N'Jose', N'Jo123456', 1, 0, N'r02', N'Montenegro Castro', NULL)
GO
INSERT [dbo].[Usuario] ([Usuario], [Contrasena], [Nombre], [Cedula], [Activo], [CambioContrasenna], [idRol], [Apellidos], [Correo]) VALUES (N'usuario03', N'fatima*123', N'Fatima', N'Fa123456', 1, 0, N'r03', N'Munoz Narvaez', NULL)
GO
INSERT [dbo].[Usuario] ([Usuario], [Contrasena], [Nombre], [Cedula], [Activo], [CambioContrasenna], [idRol], [Apellidos], [Correo]) VALUES (N'usuario04', N'Prueba', N'Jose Daniel', N'Da123456', 1, 0, N'r04', N'Gómez Jiménez', NULL)
GO
INSERT [dbo].[Usuario] ([Usuario], [Contrasena], [Nombre], [Cedula], [Activo], [CambioContrasenna], [idRol], [Apellidos], [Correo]) VALUES (N'Invitado', N'Invitado', N'Invitado', N'Invitado', 1, 0, N'r02', N'Invitado', NULL)
GO

ALTER TABLE [dbo].[Categoria] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Marca] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [df_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [df_CambioContrasenna]  DEFAULT ((0)) FOR [CambioContrasenna]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [fk_Rol_Usuario] FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD  CONSTRAINT [fk_Id_Orden_Compra_Carrito] FOREIGN KEY([Id_Orden_Compra])
REFERENCES [dbo].[Orden_Compra] ([Id_Orden_Compra])
GO
ALTER TABLE [dbo].[Carrito] CHECK CONSTRAINT [fk_Id_Orden_Compra_Carrito]
GO
ALTER TABLE [dbo].[Carrito]  WITH CHECK ADD  CONSTRAINT [fk_Usuario_Carrito] FOREIGN KEY([Usuario])
REFERENCES [dbo].[Usuario] ([Usuario])
GO
ALTER TABLE [dbo].[Carrito] CHECK CONSTRAINT [fk_Usuario_Carrito]
GO
ALTER TABLE [dbo].[Detalle_Compra]  WITH CHECK ADD  CONSTRAINT [fk_Id_Orden_Compra_Detalle_Compra] FOREIGN KEY([Id_Orden_Compra])
REFERENCES [dbo].[Orden_Compra] ([Id_Orden_Compra])
GO
ALTER TABLE [dbo].[Detalle_Compra] CHECK CONSTRAINT [fk_Id_Orden_Compra_Detalle_Compra]
GO
ALTER TABLE [dbo].[Detalle_Compra]  WITH CHECK ADD  CONSTRAINT [fk_Id_Producto_Detalle_Compra] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Producto] ([Id_Producto])
GO
ALTER TABLE [dbo].[Detalle_Compra] CHECK CONSTRAINT [fk_Id_Producto_Detalle_Compra]
GO
ALTER TABLE [dbo].[Error]  WITH CHECK ADD  CONSTRAINT [fk_Usuario_Error] FOREIGN KEY([Usuario])
REFERENCES [dbo].[Usuario] ([Usuario])
GO
ALTER TABLE [dbo].[Error] CHECK CONSTRAINT [fk_Usuario_Error]
GO
ALTER TABLE [dbo].[Orden_Compra]  WITH CHECK ADD  CONSTRAINT [fk_Id_Metodo_Pago_Orden_Compra] FOREIGN KEY([Id_Metodo_Pago])
REFERENCES [dbo].[Metodo_Pago] ([Id_Metodo_Pago])
GO
ALTER TABLE [dbo].[Orden_Compra] CHECK CONSTRAINT [fk_Id_Metodo_Pago_Orden_Compra]
GO
ALTER TABLE [dbo].[Orden_Compra]  WITH CHECK ADD  CONSTRAINT [fk_Usuario_Orden_Compra] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Usuario])
GO
ALTER TABLE [dbo].[Orden_Compra] CHECK CONSTRAINT [fk_Usuario_Orden_Compra]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [fk_Id_Categoria_Producto] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[Categoria] ([Id_Categoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [fk_Id_Categoria_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [fk_Id_Marca_Producto] FOREIGN KEY([Id_Marca])
REFERENCES [dbo].[Marca] ([Id_Marca])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [fk_Id_Marca_Producto]
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Categoria]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE  [dbo].[Actualizar_Categoria]
    @Id_Categoria      varchar(15),   
    @Descripcion   varchar(35),
	@Activo        bit
AS
BEGIN
	UPDATE Categoria SET Descripcion = @Descripcion, Activo = @Activo 
	                WHERE  Id_Categoria = @Id_Categoria
END
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Contrasena]    Script Date: 16/11/2022 12:35:43:a. m. ******/


--Actualiza contrasena
CREATE   PROCEDURE [dbo].[Actualizar_Contrasena]
     @Usuario      varchar(15),
     @Contrasena   varchar(15)
AS
BEGIN
    UPDATE Usuario SET   Contrasena   = @Contrasena
                   WHERE Usuario      = @Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Marca]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE     PROCEDURE  [dbo].[Actualizar_Marca]
    @Id_Marca      varchar(15),   
    @Descripcion   varchar(35),
	@Activo        bit
AS
BEGIN
	UPDATE Marca SET Descripcion = @Descripcion, Activo = @Activo 
	                WHERE  Id_Marca  = @Id_Marca
END
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Metodo_Pago]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE  [dbo].[Actualizar_Metodo_Pago]
     @Id_Metodo_Pago   varchar(15),
     @nombre_Pago      varchar(45)  
  
AS	
BEGIN
	UPDATE Metodo_Pago SET nombre_Pago     = @nombre_Pago     WHERE  Id_Metodo_Pago     = @Id_Metodo_Pago
END
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Producto]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE  [dbo].[Actualizar_Producto]
    @Id_Producto   varchar(20),
    @Id_Marca      varchar(35),   
    @Id_Categoria  varchar(35),
	@Nombre        varchar(35),
	@Precio        varchar(35),
	@Existencia    varchar(35),
	@RutaImagen    varchar(35)
AS
BEGIN
	UPDATE Producto SET Id_Marca = @Id_Marca, Id_Categoria = @Id_Categoria, Nombre = @Nombre, Precio  = @Precio, 
	       Existencia  = @Existencia, RutaImagen  = @RutaImagen   WHERE  Id_Producto  = @Id_Producto
END
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Usuario]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   Procedure [dbo].[Actualizar_Usuario]
    @Usuario            varchar(35),
    @Contrasena         varchar(35), 
	@Correo             varchar(30),
    @Nombre             varchar(35),
	@Apellidos          varchar(35),
	@Cedula             varchar(35),
	@Activo             varchar(35),
	@CambioContrasenna  varchar(35)
AS
BEGIN
	UPDATE USUARIO SET 	Contrasena= @Contrasena,         
						Correo = @Correo,             
						Nombre = @Nombre,             
						Apellidos = @Apellidos,             
						Cedula = @Cedula,             
						Activo = @Activo,             
						CambioContrasenna   = @CambioContrasenna   
						WHERE  Usuario = @Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Agregar_Categoria]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Agregar_Categoria]
	@Id_Categoria   varchar(15),
    @Descripcion      varchar(100)
AS   
BEGIN
    INSERT INTO Categoria(Id_Categoria,Descripcion,Activo,FechaRegistro) 
	values(@Id_Categoria,@Descripcion,1,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[Agregar_Marca]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Agregar_Marca]
	@Id_Marca   varchar(15),
    @Descripcion      varchar(100)
AS  
BEGIN
    INSERT INTO Marca(Id_Marca,Descripcion,Activo,FechaRegistro) 
	values(@Id_Marca,@Descripcion,1,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[Agregar_Metodo_Pago]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Agregar_Metodo_Pago]
	 @Id_Metodo_Pago   varchar(15),
     @nombre_Pago      varchar(45)  
   
AS   
BEGIN
    INSERT INTO Metodo_Pago(Id_Metodo_Pago,nombre_Pago) 
	values( @Id_Metodo_Pago,@nombre_Pago)
END
GO
/****** Object:  StoredProcedure [dbo].[Agregar_Producto]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Agregar_Producto]
	@Id_Producto   varchar(20),
    @Id_Marca      varchar(35),   
    @Id_Categoria  varchar(35),
	@Nombre        varchar(35),
	@Precio        varchar(35),
	@Existencia    varchar(35),
	@RutaImagen    varchar(35)
AS   
BEGIN
    INSERT INTO Producto(Id_Producto,Id_Marca,Id_Categoria,Nombre,FechaRegistro,Precio,Existencia,RutaImagen,Activo) 
	values(@Id_Producto,@Id_Marca,@Id_Categoria,@Nombre,GETDATE(),@Precio,@Existencia,@RutaImagen,1)
END
GO
/****** Object:  StoredProcedure [dbo].[Agregar_Usuario]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   Procedure [dbo].[Agregar_Usuario]
	@Usuario            varchar(15),
    @Contrasena         varchar(255),  
	@Correo             varchar(30),
    @Nombre             varchar(35),
	@Apellidos          varchar(35),
	@Cedula             varchar(35),
	@idRol            varchar(35)
AS   
BEGIN
	DECLARE @HashContrasena NVARCHAR(255);  
	SET @HashContrasena = CONVERT(NVARCHAR(255),@Contrasena);  
    INSERT INTO USUARIO (Usuario,Correo,Contrasena,Nombre,Apellidos,Cedula,idRol) 
	values(@Usuario,@Correo,@HashContrasena,@Nombre,@Apellidos,@Cedula,@idRol)
END
GO
/****** Object:  StoredProcedure [dbo].[Consultar_Categoria]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE     Procedure [dbo].[Consultar_Categoria]
     @Id_Categoria varchar(15)
 AS
 BEGIN
     SELECT Id_Categoria,Descripcion,Activo,FechaRegistro
     FROM dbo.Categoria
     WHERE Id_Categoria = @Id_Categoria
END
GO
/****** Object:  StoredProcedure [dbo].[Consultar_Categorias]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Consultar_Categorias]
 AS
 BEGIN
     SELECT Id_Categoria,Descripcion,Activo,FechaRegistro
     FROM dbo.Categoria
END
GO
/****** Object:  StoredProcedure [dbo].[Consultar_Marca]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Consultar_Marca]
     @Id_Marca varchar(15)
 AS
 BEGIN
     SELECT Id_Marca,Descripcion,Activo,FechaRegistro
     FROM dbo.Marca
     WHERE Id_Marca = @Id_Marca
END
GO
/****** Object:  StoredProcedure [dbo].[Consultar_Marcas]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Consultar_Marcas]
 AS
 BEGIN
     SELECT Id_Marca,Descripcion,Activo,FechaRegistro
     FROM dbo.Marca
END
GO
/****** Object:  StoredProcedure [dbo].[Consultar_Metodo_Pago]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE    PROCEDURE [dbo].[Consultar_Metodo_Pago]
    @Id_Metodo_Pago varchar(15)
 AS
 BEGIN
    SELECT Id_Metodo_Pago,nombre_Pago
    FROM dbo.Metodo_Pago
    WHERE Id_Metodo_Pago = @Id_Metodo_Pago

END
GO
/****** Object:  StoredProcedure [dbo].[Consultar_Producto]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Consultar_Producto]
    @Id_Producto varchar(50)
 AS
 BEGIN
    SELECT Id_Producto,Id_Marca,Id_Categoria,Nombre,FechaRegistro,Precio,Existencia,RutaImagen,Activo
    FROM dbo.Producto
    WHERE Id_Producto = @Id_Producto
END
GO
/****** Object:  StoredProcedure [dbo].[Consultar_Productos]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Consultar_Productos]
AS
BEGIN
    SELECT Id_Producto,Id_Marca,Id_Categoria,Nombre,FechaRegistro,Precio,Existencia,RutaImagen,Activo
    FROM dbo.Producto
END
GO



/****** Object:  StoredProcedure [dbo].[Consultar_Usuario]    Script Date: 16/11/2022 12:35:43:a. m. ******/

/*          ****    PROCEDIMIENTOS     ALMACENADOS  TABLA USUARIO   *****        */


 --Consultar un Usuario
CREATE   PROCEDURE [dbo].[Consultar_Usuario]
     @Usuario varchar(15)
 AS
 BEGIN
     SELECT Usuario,Correo,Nombre,Apellidos,Cedula,Activo,idRol,CambioContrasenna
     FROM dbo.Usuario
     WHERE Usuario = @Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Consultar_Usuarios]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Consultar_Usuarios]
 AS
 BEGIN
     SELECT Usuario,Correo,Nombre,Apellidos,Cedula,Activo,idRol,CambioContrasenna
     FROM dbo.Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Categoria]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Eliminar_Categoria]
    @Id_Categoria varchar(35)
AS
BEGIN
	DELETE FROM Categoria WHERE Id_Categoria = @Id_Categoria
END
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Marca]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Eliminar_Marca]
    @Id_Marca varchar(35)
AS
BEGIN
	DELETE FROM Marca WHERE Id_Marca = @Id_Marca
END
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Metodo_Pago]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Eliminar_Metodo_Pago]
    @Id_Metodo_Pago   varchar(15)
AS
BEGIN
	DELETE FROM Metodo_Pago WHERE Id_Metodo_Pago = @Id_Metodo_Pago
END
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Producto]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Eliminar_Producto]
    @Id_Producto varchar(35)
AS
BEGIN
	DELETE FROM Producto WHERE Id_Producto = @Id_Producto
END
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Usuario]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Eliminar_Usuario]
    @Usuario varchar(35)
AS
BEGIN
	DELETE FROM Usuario WHERE Usuario = @Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[Registrar_Errores]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE PROCEDURE [dbo].[Registrar_Errores]
	@Usuario	VARCHAR(20),
	@Codigo		BIGINT,
	@Mensaje	VARCHAR(MAX),
	@Accion		VARCHAR(MAX)
AS
BEGIN
	--SE REGISTRAN LAS EXCEPCIONES DE LOS USUARIOS DEL SISTEMA
	IF EXISTS(SELECT 1 FROM Usuario WHERE Usuario = @Usuario)
	BEGIN
		INSERT INTO dbo.Error(Usuario,Fecha,Codigo,Mensaje,Accion)
		VALUES (@Usuario,GETDATE(),@Codigo,@Mensaje,@Accion)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Validar_Credenciales]    Script Date: 16/11/2022 12:35:43:a. m. ******/


CREATE   PROCEDURE [dbo].[Validar_Credenciales]
	@Usuario VARCHAR(20),
	@Contrasena VARCHAR(255)
AS
BEGIN
SELECT [Usuario],[Nombre],[Cedula],[Activo]
      ,[CambioContrasenna],[idRol],[Apellidos],[Correo]
  FROM [dbo].[Usuario]
  WHERE [Usuario] = @Usuario
  AND [Contrasena] = @Contrasena
  AND Activo = 1
END
GO
USE [master]
GO
ALTER DATABASE [Pollo_Asado] SET  READ_WRITE 
GO
