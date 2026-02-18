using { Country,Currency,cuid,sap.common.CodeList  } from '@sap/cds/common';
namespace sap.capire.office;

entity Departments : cuid {
    name: String(100);
    manager: String(100);
    extension: String(10);
    descr:localized String(100);
}               
entity Employees : cuid {
    firstName:String(50);
    lastName:String(50);
    email:String(100);
    phone:String(20);
    designation:String(100);
    department:Association to Departments;
    country:Country;
    dateJoined:Date;
}
entity Buildings : cuid {
    name:String(100);
    city:String(50);
    country:Country;
    address:String(100);
    floor:Integer;
    rooms:Association to Rooms ;
}
entity Rooms : cuid {
    building:Association to Buildings;
    roomNumber:String(10);
    roomType:RoomType;
    capacity:Integer;
    area:Area;
    facilities:localized String(100);
}
type RoomType : String(20) enum{
    Meeting ='MEETING';
    Conference  = 'CONF';
    Training    = 'TRAIN';
    Executive   = 'EXEC';
    Cafeteria   = 'CAFE';
    Lounge      = 'LOUNGE';
}
entity Assets : cuid {
    assetTag:String(100);
    name:String(100);
    category:Association to AssetCategories;
    assignedTo:Association to Employees;
    purchaserDate:Date;
    cost:Cost;
    currency:Currency;
    status:AssetStatus;
}
type AssetStatus : String(20) enum {
    Available= 'AVAILABLE';
    InUse= 'IN_USE';
    UnderRepair= 'REPAIR';
    Retired= 'RETIRED';
}
entity AssetCategories : CodeList {
    key code : String(10) enum {
        Laptop = 'LPT';
        Desktop = 'DST';
        Printer = 'PRT';
        Projector = 'PJ';
        Furniture = 'FUR';
        Network = 'NET';
    };
}
entity RoomBookings : cuid {
    room:Association to Rooms;
    bookedBy:Association to Employees;
    date:Date;
    startTime:Time;
    endTime:Time;
    purpose:String(300);
    attendees:Integer;
}
entity MenuCategories : CodeList {
    key code :String(10) enum{
        Snacks = 'SNK' ;
        Meal = 'MEAL';
        Drink ='DRNK';
        Dessert ='DSRT';
    }
}
entity MenuItem : cuid {
    name:String(100);
    category:Association to MenuCategories;
    price:Cost;
    currency:Currency;
    descr:localized String(200);
}
type Area : Decimal(9,2);
type Cost : Decimal(9,2);
