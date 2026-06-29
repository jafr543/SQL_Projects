create database Car_Rental_DB;

create table Customers(
CustomerID int primary key identity(1,1),
Name nvarchar(100) not null,
Contact_Information nvarchar(100) not null,
DL_Number nvarchar(50) not null)

create table Fuel_types(
FuelID int primary key identity(1,1),
FuelName nvarchar(100) not null)


insert Fuel_types(FuelName)
values ('Gasoline(Petrol)'),('Diesel'),('Electric'),('Hybrid')

create table  Vehicle_Categorys(
CategoryID int primary key identity(1,1),
CategoryName nvarchar(100) not null)

insert Vehicle_Categorys(CategoryName)
values ('4x4'),('Sedan'),('Hatchback'),('SUV'),('Pick-up'),('Minivan')


create table Vehicles(
VehicleID int primary key identity(1,1),
Make nvarchar(100) not null,
Model nvarchar(50) not null,
Year smallint not null,
Mileage int null,
Rrental_Rates money not null,
Fuel int foreign key references Fuel_types(FuelID),
Plate_Number nvarchar(10) not null,
Category int foreign key references Vehicle_Categorys(CategoryID),
IsAvailable bit not null default 1)


create table Maintenance(
MaintenanceID int primary key identity(1,1),
VehicleID int foreign key references Vehicles(VehicleID),
Description nvarchar(300) not null,
MaintenanceDate date not null,
Cost decimal(18,2) not null)


create table Vehicle_Booking(
BookingID int primary key identity(1,1),
CustomerID int foreign key references Customers(CustomerID),
VehicleID int foreign key references Vehicles(VehicleID),
RentalStartDate date not null,
RentalEndDate date not null,
Pickup_location nvarchar(100) not null,
Drop_location nvarchar(100) not null,
InitialRentalDays tinyint not null,
RentalPricePerDay smallmoney not null,
InitialTotalDueAmount smallmoney not null,
InitialCheckNotes nvarchar(max) null)


create table Vehicle_Returns(
ReturnID int primary key identity(1,1),
BookingID int foreign key references Vehicle_Booking(BookingID),
Actual_Return_Date datetime not null,
Actual_Rental_Days tinyint not null,
Mileage int not null,
ConsumedMilaeage smallint not null,
Check_Notes nvarchar(max) null,
Additional_Charges smallmoney null default 0,
ActualTotalDueAmount smallmoney not null)


create table Rental_Payments(
TransactionID int primary key identity(1,1),
BookingID int foreign key references Vehicle_Booking(BookingID),
ReturnID int foreign key references Vehicle_Returns(ReturnID),
PaymentDetails nvarchar(100) not null,
PaidInitialTotalDueAmount smallmoney not null,
ActualTotalDueAmount smallmoney null,
TotalRemaining smallmoney null,
TotalRefundedAmount smallmoney null,
TransactionDate datetime not null,
UpdatedTransactionDate datetime null)


create table Settings(
OneDay_late_Charges smallmoney not null,
Damage_Charges smallmoney not null
)
