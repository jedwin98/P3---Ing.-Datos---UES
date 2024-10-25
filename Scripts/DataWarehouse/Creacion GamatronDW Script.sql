create database GAMATRONDW
go

use GAMATRONDW
go

--Crear Dimensiones
create table DimAerolinea(
AerolineaKey int identity(1,1) not null,
AerolineaID varchar(50) not null,
NombreAerolinea varchar(100) not null,
constraint PK_AerolineaKey primary key (AerolineaKey),
constraint UQ_AerolineaKey unique (AerolineaKey))
go

create table DimTiempo (
   TiempoKey             int    not null,
   FECHACOMPLETA        datetime             not null,
   DIADELASEMANA        int                  not null,
   NUMERODEDIADELMES    int                  not null,
   NUMERODEDIAENGENERAL int                  not null,
   NOMBREDELDIA         varchar(15)          not null,
   NOMBREDELDIAABREVIADO varchar(3)           not null,
   BANDERDIALUNESAVIERNRES varchar(25)          not null,
   NUMEROSEMANAENELANO  int                  not null,
   NUMERODESEMANAENGENERAL int                  not null,
   FECHADEINICIODESEMANA datetime             not null,
   CLAVEFECHAINICIODESEMANA int                  not null,
   NUMERODEMES          int                  not null,
   NUMERODEMESENGENERAL int                  not null,
   NOMBREDELMES         varchar(15)          not null,
   NOMBREDELMESABREVIADO varchar(3)           not null,
   CUARTO               int                  not null,
   NUMERODEANO          int                  not null,
   ANOMES               int                  not null,
   MESFISCAL            int                  not null,
   CUARTOFISCAL         int                  not null,
   ANOFISCAL            int                  not null,
   BANDERAFINDEMES      varchar(50)          not null,
   FECHADEMISMODIAHACEUNANO datetime             not null,
   constraint PK_TiempoKey primary key (TiempoKey),
   constraint UQ_TiempoKey unique (TiempoKey))
   go

   create table FactFlight(
   AerolineaKey int not null,
   TiempoKey int not null,
   NumeroVuelo varchar(50) not null,
   Origen varchar(100) not null,
   Destino varchar(100) not null,
   CRSHoraSalida varchar(50) not null,
   HoraSalidaReal varchar(50) not null,
   MinutosRetrasoSalida float not null,
   QuinceMinutosRetrasoSalida float not null,
   TiempoDeApagadoRuedas varchar(50) not null,
   TiempoDeEncendidoRuedas varchar(50) not null,
   CRSHoraLLegada varchar(50) not null,
   HoraLlegadaReal varchar(50) not null,
   MinutosRetrasoLlegada float not null,
   QuinceMinutosRetrasoLlegada float not null,
   Cancelado varchar(50) not null,
   Desviado varchar(50) not null,
   MinutosRetrasoOperador float not null,
   MinutosRetrasoMeteorologico float not null,
   MinutosRetrasoNAS float not null,
   MinutosRetrasoSeguridad float not null,
   MinutosRetrasoTardioAviones float not null,
   constraint FK_AerolineaKey foreign key (AerolineaKey) references DimAerolinea(AerolineaKey),
   constraint FK_TiempoKey foreign key (TiempoKey) references DimTiempo(TiempoKey))
   go