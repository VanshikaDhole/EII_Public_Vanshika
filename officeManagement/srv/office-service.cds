using { sap.capire.office  as my} from '../db/schema';
service OfficeService {
    entity Departments as projection on my.Departments;
    entity Employees as projection on my.Employees;
    entity Buildings as projection on my.Buildings;
    entity Rooms as projection on my.Rooms;
    entity Assets as projection on my.Assets;
    entity AssetCategories as projection on my.AssetCategories;
    entity RoomBookings as projection on my.RoomBookings;
    entity MenuCategories as projection on my.MenuCategories;
    entity MenuItem as projection on my.MenuItem;
}
