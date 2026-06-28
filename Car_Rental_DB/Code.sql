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


create table Vehicle_Booking(
BookingID int primary key identity(1,1),
CustomerID int foreign key references Customers(CustomerID),
VehicleID int foreign key references Vehicles(VehicleID),
Start_Date datetime not null,
End_Date datetime not null,
Pickup_location nvarchar(100) not null,
Drop_location nvarchar(100) not null,
Due_amount money not null,
Notes nvarchar(max) null)

create table Rental_Payments(
PaymentID int primary key identity(1,1),
BookingID int foreign key references Vehicle_Booking(BookingID),
PaymentDetails nvarchar(100) not null,
Paid_amount money not null)

create table Vehicle_Returns(
ReturnID int primary key identity(1,1),
BookingID int foreign key references Vehicle_Booking(BookingID),
Actual_Rental_Days smallint not null,
Actual_Return_Date datetime not null,
Check_Notes nvarchar(max) null,
Additional_Charges money null default 0)

create table Settings(
OneDay_late_Charges smallmoney not null,
Damage_Charges smallmoney not null
)
