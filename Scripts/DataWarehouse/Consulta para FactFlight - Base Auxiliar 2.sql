select cast(FlightDate as datetime) as Fecha, replace(Marketing_Airline_Network,'"','') as Aerolinea, Flight_Number_Marketing_Airline as NumeroVuelo,
concat_WS(', ', replace(OriginCityName,'"',''), replace(OriginStateName,'"','')) as Origen, 
concat_ws(', ', replace(DestCityName,'"',''), replace(DestStateName,'"','')) as Destino, 
case 
when CRSDepTime is null then 'Tiempo no definido'
when CRSDepTime='""' then 'Tiempo no definido'
else CRSDepTime end as CRSHoraSalida, 
case 
when DepTime is null then 'Tiempo no definido'
when DepTime='""' then 'Tiempo no definido'
else DepTime end as HoraSalidaReal, 
isnull(DepDelayMinutes,0) as MinutosRetrasoSalida, isnull(DepDel15,0) as QuinceMinutosRetrasoSalida, 
case 
when WheelsOff is null then 'Tiempo no definido'
when WheelsOff='""' then 'Tiempo no definido'
else WheelsOff end as TiempoDeApagadoRuedas, 
case 
when WheelsOn is null then 'Tiempo no definido'
when WheelsOn='""' then 'Tiempo no definido'
else WheelsOn end as TiempoDeEncendidoRuedas, 
case 
when CRSArrTime is null then 'Tiempo no definido'
when CRSArrTime='""' then 'Tiempo no definido'
else CRSArrTime end as CRSHoraLLegada, 
case 
when ArrTime is null then 'Tiempo no definido'
when ArrTime='""' then 'Tiempo no definido'
else ArrTime end as HoraLlegadaReal, 
isnull(ArrDelayMinutes, 0) as MinutosRetrasoLlegada, isnull(ArrDel15,0) as QuinceMinutosRetrasoLlegada,
case 
when Cancelled is null then 'No Especificado'
when try_cast(Cancelled as float)=1 then 'Si'
else 'No' end as Cancelado, 
case 
when Diverted is null then 'No Especificado'
when try_cast(Diverted as float)=1 then 'Si'
else 'No' end as Desviado, isnull(CarrierDelay,0) as MinutosRetrasoOperador, 
isnull(WeatherDelay,0) as MinutosRetrasoMeteorologico,isnull(NASDelay,0) as MinutosRetrasoNAS, 
isnull(SecurityDelay,0) as MinutosRetrasoSeguridad, isnull(LateAircraftDelay,0) as MinutosRetrasoTardioAviones
from Flights Where
DepDelayMinutes>0 or ArrDelayMinutes>0 or try_cast(Cancelled as float)>0 or 
try_cast(CarrierDelay as float)>0 or try_cast(WeatherDelay as float)>0 or 
try_cast(NASDelay as float)>0.00 or try_cast(SecurityDelay as float)>0.00 or 
try_cast(LateAircraftDelay as float)>0.00
