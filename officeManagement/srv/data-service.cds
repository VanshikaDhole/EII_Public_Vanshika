// // using { sap, sap.capire.office as my } from '../db/schema';

// // @hcql @rest @odata
// // service sap.capire.office.data {
// //     @readonly entity Rooms as projection on my.Rooms{
// //         key building.ID, building.{*} excluding {ID},
// //         key date,
// //         *, 
// //     };excluding{building};


    

// // }
// using { sap, sap.capire.office as my } from '../db/schema';

// // Service for data integration

// @hcql @rest @odata 
// service sap.capire.office.data {

//   // Serve Employees with department and country
//   @readonly entity Employees as projection on my.Employees {
//     key ID,
//     firstName,
//     lastName,
//     email,
//     phone,
//     designation,
//     dateJoined,
//     *, // include all fields
//     department.name as departmentName
//   } excluding { department };

//   // Serve Departments data as is
//   @readonly entity Departments as projection on my.Departments;

//   // Serve Buildings data as is
//   @readonly entity Buildings as projection on my.Buildings;

//   // Serve Rooms data as projection
//   @readonly entity Rooms as projection on my.Rooms {
//     key ID,
//     *, // include all fields
//     building.name as buildingName
//   } excluding { building };

//   // Serve RoomBookings with computed remaining_capacity
//   @readonly entity RoomBookings as projection on my.RoomBookings {
//     key ID,
//     key date, // preserve the date key exactly like Flights example
//     *, // include all data
//     room.capacity - attendees as remaining_capacity : Integer,
//   } excluding { room };

//   // Serve Assets with inline employee name
//   @readonly entity Assets as projection on my.Assets {
//     key ID,
//     *, // include all fields
//     assignedTo.firstName as assignedToFirstName,
//     assignedTo.lastName  as assignedToLastName
//   } excluding { assignedTo };

//   // Serve AssetCategories as is
//   @readonly entity AssetCategories as projection on my.AssetCategories;

//   // Serve MenuCategories as is
//   @readonly entity MenuCategories as projection on my.MenuCategories;

//   // Serve MenuItem with category name
//   @readonly entity MenuItems as projection on my.MenuItem {
//     key ID,
//     *, // include all fields
//     category.code as categoryCode,
//     category.name as categoryName
//   } excluding { category };
// }

// // temporary workaround for taming @cds.autoexpose
// annotate sap.common.Currencies with @cds.autoexpose:false;
// annotate sap.common.Countries  with @cds.autoexpose:false;
// annotate sap.common.Languages  with @cds.autoexpose:false;
