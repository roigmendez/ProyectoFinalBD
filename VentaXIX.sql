USE [master]
GO
/****** Roig Mendez Hinojosa 17-MIIN-1-154 Secc 0541 ******/
CREATE DATABASE [VentaXIX]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VentaXIX', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SLQ2019CORE\MSSQL\DATA\VentaXIX.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VentaXIX_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SLQ2019CORE\MSSQL\DATA\VentaXIX_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VentaXIX] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VentaXIX].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VentaXIX] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VentaXIX] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VentaXIX] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VentaXIX] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VentaXIX] SET ARITHABORT OFF 
GO
ALTER DATABASE [VentaXIX] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VentaXIX] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VentaXIX] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VentaXIX] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VentaXIX] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VentaXIX] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VentaXIX] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VentaXIX] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VentaXIX] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VentaXIX] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VentaXIX] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VentaXIX] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VentaXIX] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VentaXIX] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VentaXIX] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VentaXIX] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VentaXIX] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VentaXIX] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VentaXIX] SET  MULTI_USER 
GO
ALTER DATABASE [VentaXIX] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VentaXIX] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VentaXIX] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VentaXIX] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VentaXIX] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VentaXIX] SET QUERY_STORE = OFF
GO
USE [VentaXIX]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 3/9/2020 9:53:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[CodCategoria] [char](4) NOT NULL,
	[DescripcionCategoria] [char](50) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[CodCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 3/9/2020 9:53:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[CodCliente] [char](4) NOT NULL,
	[NombreCliente] [char](40) NULL,
	[ApellidoCliente] [char](40) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[CodCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle]    Script Date: 3/9/2020 9:53:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle](
	[NoFactura] [int] NULL,
	[CodProducto] [char](4) NULL,
	[Canntidad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 3/9/2020 9:53:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[CodEmpleado] [char](4) NOT NULL,
	[NombreEmpleado] [char](50) NULL,
	[ApellidoEmpleado] [char](50) NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[CodEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 3/9/2020 9:53:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[NoFactura] [int] NOT NULL,
	[Fecha] [smalldatetime] NULL,
	[Total] [numeric](18, 0) NULL,
	[CodCliente] [char](4) NULL,
	[CodEmpleado] [char](4) NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[NoFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 3/9/2020 9:53:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[CodProducto] [char](4) NOT NULL,
	[NombreProducto] [char](50) NULL,
	[PrecioProducto] [numeric](18, 0) NULL,
	[CodCategoria] [char](4) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[CodProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'1   ', N'Electrodomesticos                                 ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'10  ', N'Ferreteria                                        ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'11  ', N'Deporte                                           ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'12  ', N'Vestimenta                                        ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'13  ', N'Calzados                                          ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'14  ', N'Higiene                                           ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'15  ', N'Cosmeticos                                        ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'16  ', N'Carniceria                                        ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'17  ', N'Vegetales                                         ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'2   ', N'Comestible                                        ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'3   ', N'Desechables                                       ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'4   ', N'Mascotas                                          ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'5   ', N'Refrigerio                                        ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'6   ', N'Picaderas                                         ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'7   ', N'Panaderia                                         ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'8   ', N'Jugueteria                                        ')
INSERT [dbo].[Categoria] ([CodCategoria], [DescripcionCategoria]) VALUES (N'9   ', N'Hogar                                             ')
GO
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0001', N'Angelica                                ', N'Mendoza                                 ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0002', N'Yubel                                   ', N'Guzman                                  ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0003', N'Jose                                    ', N'Pineda                                  ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0004', N'Juan                                    ', N'Molina                                  ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0005', N'Margot                                  ', N'Perez                                   ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0006', N'Aristides                               ', N'Jimenez                                 ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0007', N'Frey                                    ', N'Nognis                                  ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0008', N'Gregory                                 ', N'Nognis                                  ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0009', N'Marilyn                                 ', N'Hinojosa                                ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0010', N'Nicole                                  ', N'Marie                                   ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0011', N'Freddy                                  ', N'Sosa                                    ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0012', N'Angel                                   ', N'Correa                                  ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0013', N'Debora                                  ', N'Aybar                                   ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0014', N'David                                   ', N'Hernandez                               ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0015', N'Ruth                                    ', N'Noemi                                   ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0016', N'Joel                                    ', N'Almonte                                 ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0017', N'Fabio                                   ', N'Beato                                   ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0018', N'Yojanser                                ', N'Ventura                                 ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0019', N'Tony                                    ', N'Gomez                                   ')
INSERT [dbo].[Cliente] ([CodCliente], [NombreCliente], [ApellidoCliente]) VALUES (N'0020', N'Braulio                                 ', N'Santos                                  ')
GO
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (1, N'1222', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (4, N'1234', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (8, N'1223', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (2, N'1236', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (2, N'1239', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (3, N'1221', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (9, N'1211', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (5, N'1219', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (1, N'1212', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (11, N'1215', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (10, N'1213', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (6, N'1219', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (3, N'1238', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (9, N'1216', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (11, N'1239', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (2, N'1235', 1)
INSERT [dbo].[Detalle] ([NoFactura], [CodProducto], [Canntidad]) VALUES (1, N'1237', 1)
GO
INSERT [dbo].[Empleado] ([CodEmpleado], [NombreEmpleado], [ApellidoEmpleado]) VALUES (N'1110', N'Belkis                                            ', N'Debare                                            ')
INSERT [dbo].[Empleado] ([CodEmpleado], [NombreEmpleado], [ApellidoEmpleado]) VALUES (N'1111', N'Kiko                                              ', N'Mendez                                            ')
INSERT [dbo].[Empleado] ([CodEmpleado], [NombreEmpleado], [ApellidoEmpleado]) VALUES (N'1112', N'Marie                                             ', N'Nunez                                             ')
INSERT [dbo].[Empleado] ([CodEmpleado], [NombreEmpleado], [ApellidoEmpleado]) VALUES (N'1113', N'Katherine                                         ', N'Hernandez                                         ')
INSERT [dbo].[Empleado] ([CodEmpleado], [NombreEmpleado], [ApellidoEmpleado]) VALUES (N'1114', N'Jose                                              ', N'Beltre                                            ')
INSERT [dbo].[Empleado] ([CodEmpleado], [NombreEmpleado], [ApellidoEmpleado]) VALUES (N'1115', N'Rafael                                            ', N'Pineda                                            ')
INSERT [dbo].[Empleado] ([CodEmpleado], [NombreEmpleado], [ApellidoEmpleado]) VALUES (N'1116', N'Noel                                              ', N'Contreras                                         ')
INSERT [dbo].[Empleado] ([CodEmpleado], [NombreEmpleado], [ApellidoEmpleado]) VALUES (N'1117', N'Daniel                                            ', N'Abreu                                             ')
INSERT [dbo].[Empleado] ([CodEmpleado], [NombreEmpleado], [ApellidoEmpleado]) VALUES (N'1118', N'Leonel                                            ', N'Fernandez                                         ')
INSERT [dbo].[Empleado] ([CodEmpleado], [NombreEmpleado], [ApellidoEmpleado]) VALUES (N'1119', N'Junior                                            ', N'Gonzalez                                          ')
GO
INSERT [dbo].[Factura] ([NoFactura], [Fecha], [Total], [CodCliente], [CodEmpleado]) VALUES (1, CAST(N'2020-01-10T12:23:00' AS SmallDateTime), CAST(1232 AS Numeric(18, 0)), N'0004', N'1111')
INSERT [dbo].[Factura] ([NoFactura], [Fecha], [Total], [CodCliente], [CodEmpleado]) VALUES (2, CAST(N'2020-03-09T08:01:00' AS SmallDateTime), CAST(4354 AS Numeric(18, 0)), N'0009', N'1119')
INSERT [dbo].[Factura] ([NoFactura], [Fecha], [Total], [CodCliente], [CodEmpleado]) VALUES (3, CAST(N'2020-04-08T11:03:00' AS SmallDateTime), CAST(213 AS Numeric(18, 0)), N'0012', N'1118')
INSERT [dbo].[Factura] ([NoFactura], [Fecha], [Total], [CodCliente], [CodEmpleado]) VALUES (4, CAST(N'2020-05-05T22:23:00' AS SmallDateTime), CAST(234345 AS Numeric(18, 0)), N'0001', N'1112')
INSERT [dbo].[Factura] ([NoFactura], [Fecha], [Total], [CodCliente], [CodEmpleado]) VALUES (5, CAST(N'2020-01-01T13:35:00' AS SmallDateTime), CAST(9787 AS Numeric(18, 0)), N'0019', N'1112')
INSERT [dbo].[Factura] ([NoFactura], [Fecha], [Total], [CodCliente], [CodEmpleado]) VALUES (6, CAST(N'2020-03-12T18:24:00' AS SmallDateTime), CAST(65434 AS Numeric(18, 0)), N'0010', N'1115')
INSERT [dbo].[Factura] ([NoFactura], [Fecha], [Total], [CodCliente], [CodEmpleado]) VALUES (8, CAST(N'2020-04-04T00:00:00' AS SmallDateTime), CAST(9878 AS Numeric(18, 0)), N'0011', N'1117')
INSERT [dbo].[Factura] ([NoFactura], [Fecha], [Total], [CodCliente], [CodEmpleado]) VALUES (9, CAST(N'2020-06-17T12:24:00' AS SmallDateTime), CAST(3465 AS Numeric(18, 0)), N'0002', N'1114')
INSERT [dbo].[Factura] ([NoFactura], [Fecha], [Total], [CodCliente], [CodEmpleado]) VALUES (10, CAST(N'2020-07-30T13:45:00' AS SmallDateTime), CAST(123 AS Numeric(18, 0)), N'0008', N'1116')
INSERT [dbo].[Factura] ([NoFactura], [Fecha], [Total], [CodCliente], [CodEmpleado]) VALUES (11, CAST(N'2020-01-12T17:35:00' AS SmallDateTime), CAST(23434 AS Numeric(18, 0)), N'0019', N'1113')
GO
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1210', N'Coca Cola                                         ', CAST(25 AS Numeric(18, 0)), N'5   ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1211', N'Bizcocho                                          ', CAST(800 AS Numeric(18, 0)), N'7   ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1212', N'Desodorante                                       ', CAST(200 AS Numeric(18, 0)), N'14  ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1213', N'Papel Higienico                                   ', CAST(20 AS Numeric(18, 0)), N'14  ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1214', N'Servilletas                                       ', CAST(10 AS Numeric(18, 0)), N'14  ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1215', N'Guandules                                         ', CAST(50 AS Numeric(18, 0)), N'14  ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1216', N'Queso                                             ', CAST(200 AS Numeric(18, 0)), N'6   ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1217', N'Televisor                                         ', CAST(20000 AS Numeric(18, 0)), N'1   ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1218', N'Martillo                                          ', CAST(300 AS Numeric(18, 0)), N'10  ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1219', N'Muneco                                            ', CAST(500 AS Numeric(18, 0)), N'8   ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1220', N'Carro a control remoto                            ', CAST(200 AS Numeric(18, 0)), N'8   ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1221', N'Gelatina para el pelo                             ', CAST(100 AS Numeric(18, 0)), N'15  ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1222', N'Cepillo dental                                    ', CAST(100 AS Numeric(18, 0)), N'14  ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1223', N'Correa                                            ', CAST(300 AS Numeric(18, 0)), N'12  ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1234', N'Pan de Agua                                       ', CAST(5 AS Numeric(18, 0)), N'7   ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1235', N'Tenis Blancos                                     ', CAST(2000 AS Numeric(18, 0)), N'13  ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1236', N'Maiz                                              ', CAST(25 AS Numeric(18, 0)), N'17  ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1237', N'Arroz                                             ', CAST(30 AS Numeric(18, 0)), N'2   ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1238', N'Pelota                                            ', CAST(100 AS Numeric(18, 0)), N'8   ')
INSERT [dbo].[Producto] ([CodProducto], [NombreProducto], [PrecioProducto], [CodCategoria]) VALUES (N'1239', N'Pantalon azul                                     ', CAST(1600 AS Numeric(18, 0)), N'12  ')
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Factura] FOREIGN KEY([NoFactura])
REFERENCES [dbo].[Factura] ([NoFactura])
GO
ALTER TABLE [dbo].[Detalle] CHECK CONSTRAINT [FK_Detalle_Factura]
GO
ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Producto] FOREIGN KEY([CodProducto])
REFERENCES [dbo].[Producto] ([CodProducto])
GO
ALTER TABLE [dbo].[Detalle] CHECK CONSTRAINT [FK_Detalle_Producto]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([CodCliente])
REFERENCES [dbo].[Cliente] ([CodCliente])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Empleado] FOREIGN KEY([CodEmpleado])
REFERENCES [dbo].[Empleado] ([CodEmpleado])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Empleado]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([CodCategoria])
REFERENCES [dbo].[Categoria] ([CodCategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
USE [master]
GO
ALTER DATABASE [VentaXIX] SET  READ_WRITE 
GO
		