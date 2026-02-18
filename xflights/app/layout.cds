using { FlightsService } from '../srv/flights-service';

annotate FlightsService.Connections with @UI.LineItem: [ //@UI.LineItem :: which columns appear in the table
  { Value: ID },
  { Value: (airline.name) },
  { Value: (origin.ID) },
  { Value: (destination.ID) },
  { Value: departure },
  { Value: arrival },
  { Value: distance }
];

annotate FlightsService.Flights with @UI.LineItem: [
  { Value: (flight.ID) },
  { Value: date },
  { Value: aircraft },
  { Value: price },
  { Value: (currency.code) },
  { Value: maximum_seats },
  { Value: occupied_seats }
];

annotate FlightsService.Airlines with @UI.LineItem: [
  { Value: name },
  { Value: icon },
  { Value: (currency.code) }
];

annotate FlightsService.Airports with @UI.LineItem: [
  { Value: name },
  { Value: city },
  { Value: (country.code) }
];

annotate FlightsService.Supplements with @UI.LineItem: [
  { Value: (type.code) },
  { Value: descr },
  { Value: price },
  { Value: (currency.code) }
];

annotate FlightsService.SupplementTypes with @UI.LineItem: [
  { Value: code },
  { Value: name },
  { Value: descr }
];

annotate FlightsService.Currencies with @UI.LineItem: [
  { Value: code },
  { Value: symbol },
  { Value: minorUnit },
  { Value: name},
  { Value: descr}
];

annotate FlightsService.Countries with @UI.LineItem: [
  { Value: code },
  { Value: name},
  { Value: descr}
];