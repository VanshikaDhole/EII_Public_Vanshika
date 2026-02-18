using { sap.capire.incident as my} from '../db/schema';
service ProcessorService { 
    entity Incidents as projection on my.Incidents;
    @readonly
    entity Customers as projection on my.Customers;
}
service AdmineService {
    entity Incidents as projection on my.Incidents;
    entity Customers as projection on my.Customers;
}