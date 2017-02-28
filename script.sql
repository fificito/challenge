USE [Tarjetas]
GO
/****** Object:  Table [dbo].[tbl_Cuentas]    Script Date: 30/11/2016 10:06:49 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Cuentas](
	[ID_Emisor] [int] NOT NULL,
	[ID_Cuenta] [bigint] NOT NULL,
	[ID_Beneficio] [int] NOT NULL,
	[ID_Empleador] [int] NOT NULL,
	[ID_TipoCuenta] [int] NOT NULL,
	[ID_StatusCuenta] [int] NOT NULL,
	[ID_AccesoCuenta] [bigint] NOT NULL CONSTRAINT [DF_tbl_Cuentas_ID_AccesoCuenta]  DEFAULT ((0)),
	[Saldo] [money] NOT NULL,
	[SaldoInicial] [money] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[APaterno] [varchar](50) NULL,
	[AMaterno] [varchar](50) NULL,
	[FechaVigencia] [datetime] NULL,
	[FechaCambio] [datetime] NULL,
	[UsuarioCambio] [varchar](15) NOT NULL,
 CONSTRAINT [PK_tbl_Cuentas] PRIMARY KEY CLUSTERED 
(
	[ID_Emisor] ASC,
	[ID_Cuenta] ASC,
	[ID_Beneficio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Tarjetas]    Script Date: 30/11/2016 10:06:49 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Tarjetas](
	[ID_Tarjeta] [char](16) NOT NULL,
	[ID_Emisor] [int] NOT NULL,
	[ID_Grupo] [int] NOT NULL,
	[ID_TipoTarjeta] [int] NOT NULL,
	[ID_StatusTarjeta] [int] NOT NULL,
	[Intentos] [smallint] NOT NULL,
	[NIP] [varchar](50) NOT NULL,
	[CVV] [varchar](3) NULL,
	[EAN] [varchar](13) NULL,
	[FechaVigencia] [datetime] NOT NULL,
	[Track1] [varchar](150) NULL,
	[Track2] [varchar](100) NULL,
	[Nombre] [varchar](100) NULL,
	[APaterno] [varchar](100) NULL,
	[AMaterno] [varchar](100) NULL,
	[Embosado] [varchar](30) NULL,
	[NombreTrack] [varchar](30) NULL,
	[UnidadTerritorial] [varchar](20) NULL,
	[NumTarjeta] [int] NULL,
	[Delegacion] [int] NOT NULL CONSTRAINT [DF_tbl_Tarjetas_Delegacion]  DEFAULT ((0)),
	[Colonia] [varchar](120) NULL,
	[UsuarioCambio] [varchar](15) NOT NULL,
	[FechaCambio] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_Tarjetas] PRIMARY KEY NONCLUSTERED 
(
	[ID_Tarjeta] ASC,
	[ID_Emisor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_TarjetasCuentas]    Script Date: 30/11/2016 10:06:49 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_TarjetasCuentas](
	[ID_Tarjeta] [char](16) NOT NULL,
	[ID_Emisor] [int] NOT NULL,
	[ID_Cuenta] [bigint] NOT NULL,
	[ID_Beneficio] [int] NOT NULL CONSTRAINT [DF_tbl_TarjetasCuentas_ID_Beneficio]  DEFAULT ((1)),
 CONSTRAINT [PK_tbl_TarjetasCuentas] PRIMARY KEY CLUSTERED 
(
	[ID_Tarjeta] ASC,
	[ID_Emisor] ASC,
	[ID_Cuenta] ASC,
	[ID_Beneficio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tbl_TarjetasCuentas]  WITH NOCHECK ADD  CONSTRAINT [FK_tbl_TarjetasCuentas_tbl_Cuentas] FOREIGN KEY([ID_Emisor], [ID_Cuenta], [ID_Beneficio])
REFERENCES [dbo].[tbl_Cuentas] ([ID_Emisor], [ID_Cuenta], [ID_Beneficio])
GO
ALTER TABLE [dbo].[tbl_TarjetasCuentas] CHECK CONSTRAINT [FK_tbl_TarjetasCuentas_tbl_Cuentas]
GO
ALTER TABLE [dbo].[tbl_TarjetasCuentas]  WITH NOCHECK ADD  CONSTRAINT [FK_tbl_TarjetasCuentas_tbl_Tarjetas] FOREIGN KEY([ID_Tarjeta], [ID_Emisor])
REFERENCES [dbo].[tbl_Tarjetas] ([ID_Tarjeta], [ID_Emisor])
GO
ALTER TABLE [dbo].[tbl_TarjetasCuentas] CHECK CONSTRAINT [FK_tbl_TarjetasCuentas_tbl_Tarjetas]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave primaria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'ID_Emisor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave primaria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'ID_Cuenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Referencia a la tabla tbl_Beneficios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'ID_Beneficio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del Empleador asociado a la cuenta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'ID_Empleador'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Referencia a la tabla tbl_TiposCuentas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'ID_TipoCuenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del Status que guarde la cuenta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'ID_StatusCuenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador externo de la cuenta (en el caso del GDF, representa el IDP)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'ID_AccesoCuenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Saldo de la cuenta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'Saldo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Salfo inicial de la cuenta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'SaldoInicial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del Cuentahabiente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellido Paterno del Cuentahabiente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'APaterno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellido Materno del Cuentahabiente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'AMaterno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha hasta la que está vigente la cuenta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'FechaVigencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha del último cambio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'FechaCambio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del usuario que realizó el último cambio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas', @level2type=N'COLUMN',@level2name=N'UsuarioCambio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cuentas del Autorizador GDF' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_Cuentas'
GO
