using { Currency, Country, cuid, sap.common.CodeList } from '@sap/cds/common';

namespace sap.capire.events;
type Price: Decimal(9,4);

entity Organizers : cuid {
    name : String(100);
    email : String(200);
    phone : String(100);
    website : String(300);
    country : Country; 
}

entity Venues : cuid {
    name: String(100);
    city: String(100);
    country:Country;
    address:String(200);
    halls:Composition of many VenueHalls on halls.venue =$self;
}

entity VenueHalls : cuid {
    venue:Association to Venues;
    hallName:String(100);
    hallType:HallType;
    capacity:String(50);
    facilities:localized String(2000);
}

type HallType : String(20) enum{
  Indoor       = 'Indoor';
  Outdoor      = 'Outdoor';
  Amphitheatre = 'Amphitheatre';
  Stadium      = 'Stadium';
  Multipurpose = 'Multipurpose';
}

entity Events : cuid {
    title:String(50);
    category:Association to EventCategories;
    organizer: Association to Organizers;
    venue:Association to Venues;
    startDate:Date;
    endDate:Date;
    sessions : Composition of many EventSessions on sessions.event = $self;
}

entity EventCategories: CodeList{
    key code:String(20) enum{
    Concert    = 'CO';
    Sports     = 'SP';
    Standup    = 'ST';
    Conference = 'CF';
    Exhibition = 'EX';
    Workshop   = 'WS';
    };
}
entity EventSessions : cuid {
    event:Association to Events;
    hall :Association to VenueHalls;
    sessionDate:Date;
    startTime:Time;
    endTime:Time;
    basePrice: Price;
    currency:Currency;
    seatsSold:Integer default 0;
    tickets:Composition of many Tickets on tickets.session = $self;
}
entity Tickets : cuid {
    session:Association to EventSessions;
    purchaserName: String(100);
    seatsBooked: Integer;
    bookingTime: DateTime;
    totalAmount: Price;
    currency: Currency;  
}
entity SupplementTypes : CodeList {
    key code : String(3) enum {
        FoodPass    = 'FP';
        VIPLounge   = 'VL';
        Merchandise = 'MD';
        Parking     = 'PK';
        Extra       = 'EX';
  };   
}
entity Supplements : cuid {
  type     : Association to SupplementTypes;
  descr    : localized String(1111);
  price    : Price;
  currency : Currency;
}