@EndUserText.label: 'Travel data'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_VLNM_U_TRAVEL
  as projection on ZI_VLNM_U_TRAVEL
{
  key TravelId,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element : 'AgencyID'} }]
      AgencyId,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element : 'CustomerID'} }]
      @Search.defaultSearchElement: true
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      @Consumption.valueHelpDefinition: [{entity: { name: 'I_Currency' , element : 'Currency'} }]
      CurrencyCode,
      Description,
      Status,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_VLNM_U_BOOKING,
      _Currency,
      _Customer
}
