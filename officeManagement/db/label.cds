using { OfficeService } from '../srv/office-service';
annotate OfficeService.Departments with {
  ID @title: '{i18n>Dept_ID}';
  name @title: '{i18n>Dept_Name}';
  manager @title: '{i18n>Dept_Manager}';
  extension @title: '{i18n>Dept_Extension}';
  descr @title: '{i18n>Dept_Descr}';
};
annotate OfficeService.Employees with {
  ID  @title: '{i18n>Emp_ID}';
  firstName @title: '{i18n>Emp_FirstName}';
  lastName @title: '{i18n>Emp_LastName}';
  email @title: '{i18n>Emp_Email}';
  phone @title: '{i18n>Emp_Phone}';
  designation @title: '{i18n>Emp_Designation}';
  department @title: '{i18n>Emp_Department}';
  country @title: '{i18n>Emp_Country}';
  dateJoined  @title: '{i18n>Emp_DateJoined}';
};
annotate OfficeService.Buildings with {
  name @title: '{i18n>Building_Name}';
  city  @title: '{i18n>Building_City}';
  country @title: '{i18n>Building_Country}';
  address @title: '{i18n>Building_Address}';
  floor @title: '{i18n>Building_Floor}';
  rooms @title: '{i18n>Building_Rooms}';
};
annotate OfficeService.Rooms with {
  building @title: '{i18n>Room_BuildingID}';
  roomNumber @title: '{i18n>Room_Number}';
  roomType @title: '{i18n>Room_Type}';
  capacity @title: '{i18n>Room_Capacity}';
  area @title: '{i18n>Room_Area}';
  facilities  @title: '{i18n>Room_Facilities}';
};
annotate OfficeService.Assets with {
  assetTag  @title: '{i18n>Asset_Tag}';
  name  @title: '{i18n>Asset_Name}';
  category @title: '{i18n>Asset_Category}';
  assignedTo @title: '{i18n>Asset_AssignedTo}';
  purchaserDate  @title: '{i18n>Asset_PurchaseDate}';
  cost @title: '{i18n>Asset_Cost}';
  currency @title: '{i18n>Asset_Currency}';
  status @title: '{i18n>Asset_Status}';
};
annotate OfficeService.AssetCategories with {
  code  @title: '{i18n>AssetCat_Code}';
  name  @title: '{i18n>AssetCat_Name}';
  descr @title: '{i18n>AssetCat_Descr}';
};
annotate OfficeService.RoomBookings with {
  room @title: '{i18n>RoomBooking_Room}';
  bookedBy @title: '{i18n>RoomBooking_BookedBy}';
  date  @title: '{i18n>RoomBooking_Date}';
  startTime  @title: '{i18n>RoomBooking_StartTime}';
  endTime @title: '{i18n>RoomBooking_EndTime}';
  purpose @title: '{i18n>RoomBooking_Purpose}';
  attendees @title: '{i18n>RoomBooking_Attendees}';
};
annotate OfficeService.MenuCategories with {
  code  @title: '{i18n>MenuCat_Code}';
  name  @title: '{i18n>MenuCat_Name}';
  descr @title: '{i18n>MenuCat_Descr}';
};
annotate OfficeService.MenuItem with {
  name @title: '{i18n>MenuItem_Name}';
  category @title: '{i18n>MenuItem_Category}';
  price  @title: '{i18n>MenuItem_Price}';
  currency @title: '{i18n>MenuItem_Currency}';
  descr  @title: '{i18n>MenuItem_Descr}';
};

