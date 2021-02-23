@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Booking data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_VLNM_U_BOOKING
  as select from /dmo/booking
  
  association to parent ZI_VLNM_U_TRAVEL as _Travel on $projection.TravelId = _Travel.TravelId  
  
  association [1..1] to /DMO/I_Customer   as _Customer   on  $projection.CustomerId = _Customer.CustomerID

  association [1..1] to /DMO/I_Carrier    as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID

  association [1..1] to /DMO/I_Connection as _Connection on  $projection.ConnectionId = _Connection.ConnectionID
                                                         and $projection.CarrierId    = _Connection.AirlineID

  association [1..1] to /DMO/I_Flight     as _Flight     on  $projection.ConnectionId = _Flight.ConnectionID
                                                         and $projection.CarrierId    = _Flight.AirlineID
                                                         and $projection.FlightDate   = _Flight.FlightDate
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
        
        
      _Travel,  
      _Customer,
      _Carrier,
      _Connection,
      _Flight
}
