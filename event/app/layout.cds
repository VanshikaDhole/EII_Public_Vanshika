// using { EventsService } From '../srv/events-service';

// annotate EventsService.Organizers with @UI.LineItem:[
//     { Value: name},
//     { Value: email},
//     { Value: phone},
//     { Value: website},
//     { Value: (country.code) },
// ];
// annotate EventsService.Venues with @UI.LineItem:[
//     { Value: name},
//     { Value: city},
//     { Value: (country.code)},
//     { Value: address},
//     { Value: (halls.ID),Label:'{i18n>Halls}' },
// ];
// annotate EventsService.VenueHalls with @UI.LineItem:[
//     { Value: (venue.ID)},
//     { Value: hallName},
//     { Value: hallType},
//     { Value: capacity},
//     { Value: facilities },
// ];
// annotate EventsService.Events with @UI.LineItem:[
//     { Value: title},
//     { Value: (category.code)},
//     { Value: (organizer.ID)},
//     { Value: (venue.ID)},
//     { Value: startDate },
//     { Value: endDate },
//     { Value: (sessions.ID),Label:'{i18n>Session}' },
// ];
// annotate EventsService.EventCategories with @UI.LineItem:[
//     { Value: code},
//     { Value: name},
//     { Value: descr},
// ];
// annotate EventsService.EventSessions with @UI.LineItem:[
//     { Value: (event.ID)},
//     { Value: (hall.ID)},
//     { Value: sessionDate},
//     { Value: startTime},
//     { Value: endTime },
//     { Value: basePrice},
//     { Value: (currency.code) },
//     { Value: seatsSold },
//     { Value: (tickets.ID),Label:'{i18n>tickets}'},
// ];
// annotate EventsService.Tickets with @UI.LineItem:[
//     { Value: (session.ID)},
//     { Value: purchaserName},
//     { Value: seatsBooked},
//     { Value: bookingTime},
//     { Value: totalAmount },
//     { Value: (currency.code) },
// ];
// annotate EventsService.SupplementTypes with @UI.LineItem: [
//   { Value: code },
//   { Value: name },
//   { Value: descr }
// ];
// annotate EventsService.Supplements with @UI.LineItem: [
//   { Value: (type.code) },
//   { Value: descr },
//   { Value: price },
//   { Value: (currency.code) }
// ];

// annotate EventsService.Currencies with @UI.LineItem: [
//   { Value: code },
//   { Value: symbol },
//   { Value: minorUnit },
//   { Value: name},
//   { Value: descr}
// ];

// annotate EventsService.Countries with @UI.LineItem: [
//   { Value: code },
//   { Value: name},
//   { Value: descr}
// ];




