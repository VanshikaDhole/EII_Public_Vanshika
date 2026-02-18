using { sap.capire.flights } from './schema';

annotate flights.Connections with {
  ID          @title: '{i18n>Flight}';
  airline     @title: '{i18n>Airline}';
  origin      @title: '{i18n>Origin}';
  destination @title: '{i18n>Destination}';
  departure   @title: '{i18n>Departure}';
  arrival     @title: '{i18n>Arrival}';
  distance    @title: '{i18n>Distance}';
}

annotate flights.Flights with {
  flight         @title: '{i18n>Flight}';
  date           @title: '{i18n>FlightDate}';
  aircraft       @title: '{i18n>PlaneType}';
  price          @title: '{i18n>FlightPrice}';
  maximum_seats  @title: '{i18n>MaximumSeats}';
  occupied_seats @title: '{i18n>OccupiedSeats}';
}

annotate flights.Airlines with {
  name     @title: '{i18n>AirlineName}';
  icon     @title: '{i18n>AirlineIcon}';
  currency @title: '{i18n>Currency}';
}

annotate flights.Airports with {
  name    @title: '{i18n>AirportName}';
  city    @title: '{i18n>City}';
  country @title: '{i18n>Country}';
}

annotate flights.Supplements with {
  type     @title: '{i18n>SupplementType}';
  descr    @title: '{i18n>Description}';
  price    @title: '{i18n>Price}';
  currency @title: '{i18n>Currency}';
}

annotate flights.SupplementTypes with {
  code @title: '{i18n>Code}';
  name @title: '{i18n>Name}';
  descr @title: '{i18n>Description}';
}
