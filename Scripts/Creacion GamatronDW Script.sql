create database GAMATRONDW
go

use GAMATRONDW
go

--Crear Dimensiones
create table DimAerolinea(
AerolineaKey int identity(1,1) not null,
AerolineaID varchar(10) not null,
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
   FlightNumber varchar(10) not null,
   Origin varchar(100) not null,
   Dest varchar(100) not null,
   CRSDepartureTime varchar(4) not null,
   DepartureTime varchar(4) not null,
   DepartureDelayMinutes float not null,
   DepartureDelayFifteen float not null,
   WheelsOffTime varchar(4) not null,
   WheelsOnTime varchar(4) not null,
   CRSArrivalTime varchar(4) not null,
   ArrivalTime varchar(4) not null,
   ArrivalDelayMinutes float not null,
   ArrivalDelayFifteen float not null,
   Cancelled varchar(10) not null,
   Diverted varchar(10) not null,
   CarrierDelayMinutes float not null,
   WeatherDelayMinutes float not null,
   NASDelayMinutes float not null,
   SecurityDelayMinutes float not null,
   LateAircraftDelayMinutes float not null,
   constraint PK_FactFlight primary key (FlightNumber, TiempoKey, AerolineaKey),
   constraint UQ_FactFlight unique (FlightNumber, TiempoKey, AerolineaKey),
   constraint FK_AerolineaKey foreign key (AerolineaKey) references DimAerolinea(AerolineaKey),
   constraint FK_TiempoKey foreign key (TiempoKey) references DimTiempo(TiempoKey))
   go