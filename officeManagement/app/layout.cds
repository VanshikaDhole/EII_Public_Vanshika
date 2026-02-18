using { OfficeService } from '../srv/office-service';

annotate OfficeService.Departments with @UI.LineItem:[
    {Value : name},
    {Value: manager },
    {Value:extension},
    {Value:descr}
];
annotate OfficeService.Employees with @UI.LineItem:[
  { Value:ID },
  { Value:firstName },
  { Value:lastName },
  { Value:email },
  { Value:phone },
  { Value:designation },
  { Value:(department.ID) },
  { Value:(country.code) },
  { Value:dateJoined }
] ;
annotate OfficeService.Buildings with @UI.LineItem:[
    {Value:name},
    {Value:city},
    {Value:(country.code)},
    {Value:address},
    {Value:floor},
    {Value:rooms.ID} 
];
annotate OfficeService.Rooms with @UI.LineItem:[
  {Value:(building.ID) },
  {Value:roomNumber },
  {Value:roomType },
  {Value:capacity },
  {Value:area },
  {Value:facilities }
] ;

annotate OfficeService.Assets with @UI.LineItem:[
    {Value:assetTag},
    {Value:name},
    {Value:(category.code)},
    {Value:(assignedTo.ID)},
    {Value:purchaserDate},
    {Value:cost},
    {Value:(currency.code)},
    {Value:status}
];
annotate OfficeService.AssetCategories with @UI.LineItem:[
    {Value:code},
    {Value:name},
    {Value:descr}
];
annotate OfficeService.RoomBookings with @UI.LineItem:[
    {Value:(room.ID)},
    {Value:(bookedBy.ID)},
    {Value:date},
    {Value:startTime},
    {Value:purpose},
    {Value:attendees}
];
annotate OfficeService.MenuCategories with @UI.LineItem:[
    {Value:code},
    {Value:name},
    {Value:descr}    
];
annotate OfficeService.MenuItem with @UI.LineItem:[
    {Value:name},
    {Value:(category.code)},
    {Value:price},
    {Value:(currency.code)},
    {Value:descr}
];
annotate OfficeService.Currencies with @UI.LineItem: [
  { Value: code },
  { Value: symbol },
  { Value: minorUnit },
  { Value: name},
  { Value: descr}
];

annotate OfficeService.Countries with @UI.LineItem: [
  { Value: code },
  { Value: name},
  { Value: descr}
];




