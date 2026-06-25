
create database Library_DB;

create table Books(
BookID int primary key identity(1,1),
Title nvarchar(100) not null,
Author_s nvarchar(100) not null,
ISBN nvarchar(50) not null,
Publication_Date date not null,
Genre nvarchar(50) not null,
Additional_Details nvarchar(100) null,
)

create table Book_Copies(
CopyID int primary key identity(1,1),
BookID int foreign key references Books(BookID),
AvailabilityStatus bit not null)

create table Users_Management(
UserID int primary key identity(1,1),
library_Card_Number nvarchar(100) not null,
Name nvarchar(100) not null,
Phone nvarchar(20) not null)

create table Borrowing_Records(
Borrowing_RecordID int primary key identity(1,1),
Book_Copy int foreign key references Book_Copies(CopyID),
UserID int foreign key references Users_Management(UserID),
Borrowing_Date date not null,
Due_Date date not null,
ActualReturnDate date null
)

create table Fines(
FineID int primary key identity(1,1),
UserID int foreign key references Users_Management(UserID), 
Borrowing_Record int foreign key references Borrowing_Records(Borrowing_RecordID),
NumberOfLateDays smallint not null,
Fine_Type nvarchar(20) not null,
Fine_Amount decimal(18,2) not null,
Payment_Status bit not null)

create table Reservations(
ReservationID int primary key identity(1,1),
UserID int foreign key references Users_Management(UserID),
CopyID int foreign key references Book_Copies(CopyID),
ReservationDate date not null
)

create table Settings(
DefaultBorrrowDays tinyint not null,
DefaultFinePerDay tinyint not null,
DefaultFineforDamage tinyint not null)
