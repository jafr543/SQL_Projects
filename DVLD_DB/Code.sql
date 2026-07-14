create Database DVLD_DB;


create Table People(
PersonID int primary key identity(1,1),
NationalNumber nvarchar(75) Unique not null,
FullName nvarchar(150) not null,
DateofBirth date not null,
Address nvarchar(100) not null,
PhoneNumber nvarchar(20) not null,
Email nvarchar(50) not null,
Nationality nvarchar(50) not null,
ProfilePicture nvarchar(255) null)


create table Users(
UserID int primary key identity(1,1),
PersonID int foreign key references People(PersonID),
UserName nvarchar(30) Unique not null,
Password nvarchar(255) not null)


create table Application_Types(
ApplicationTypeID int primary key identity(1,1),
ApplicationTypeName nvarchar(50) not null)


create table Application(
ApplicationID int primary key identity(1,1),
ApplicationType int foreign key references Application_Types(ApplicationTypeID),
ApplicationPersonID int foreign key references People(PersonID),
CreatedByUserID int foreign key references Users(UserID))


create table Test_Types(
TestTypeID int primary key identity(1,1),
TestName nvarchar(100) not null)


create table TestAppointments(
TestID int primary key identity(1,1),
UserID int foreign key references Users(UserID),
ApplicationID int foreign key references Application(ApplicationID),
TestType int foreign key references Test_Types(TestTypeID),
DateTime datetime not null,
Result bit null,
PidFees bit null)


create table Drivers(
DriverID int primary key identity(1,1),
PersonID int foreign key references People(PersonID))


create table Licenses_Categories(
LicenseClassID int primary key identity(1,1),
ClassName nvarchar(75) not null,
ClassDescription nvarchar(750) not null,
MinimumAllowedAge tinyint not null,
ValidityLength tinyint not null,
ClassFees  smallmoney)



create table Licenses(
LicenseID int primary key identity(1,1),
LicenseNumber nvarchar(20) Unique not null,
DriverID int foreign key references Drivers(DriverID),
LicenseClassID int foreign key references Licenses_Categories(LicenseClassID),
PublicationDate date not null,
ExpiryDate date not null,
Notes nvarchar(250) null,
LicenseIssuanceStatus nvarchar(50) not null)



create table Detained_Licenses(
DetainedID int primary key identity(1,1),
LicenseID int foreign key references Licenses(LicenseID),
ReasonforDetained nvarchar(100) not null,
DateDetained datetime not null,
ReleaseDate datetime null,
ReleaseByUserID int foreign key references Users(UserID) null,
IsDetained bit not null default 1)
