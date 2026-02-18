using { sap.capire.events as my } From '../db/schema';

service EventsService {
    entity Organizers as projection on my.Organizers;
    entity Venues as projection on my.Venues;
    entity VenueHalls as projection on my.VenueHalls;
    entity Events as projection on my.Events;
    entity EventSessions as projection on my.EventSessions;
    entity Tickets as projection on my.Tickets;
    entity Supplements as projection on my.Supplements; 
}


