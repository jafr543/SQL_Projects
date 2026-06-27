create database Karate_Club_DB;

create table Persons(
PersonID int primary key identity(1,1),
Name nvarchar(100) not null,
Address nvarchar(100) not null,
EmergencyContact nvarchar(100) not null)

create table BeltRanks(
RankID int primary key identity(1,1),
RankName nvarchar(50) not null,
TestFees smallmoney not null)

create table Members(
MemberID int primary key identity(1,1),
PersonID int foreign key references Persons(PersonID),
ContactInfo nvarchar(100) not null,
BeltRank int foreign key references BeltRanks(RankID),
isActive bit not null)

create table Payments(
PaymentID int primary key identity(1,1),
Amount Money not null,
Date Datetime not null,
MemberID int foreign key references Members(MemberID)
)

create table subscriptions_Periods(
PeriodID int primary key identity(1,1),
StratDate Date not null,
EndDate Date not null,
Fees smallmoney not null,
MemberID int foreign key references Members(MemberID),
PaymentID int foreign key references Payments(PaymentID) null)


create table Instructors(
InstructorID int primary key identity(1,1),
PersonID int foreign key references Persons(PersonID),
Qualifications nvarchar(50) not null)

create table MemberInstructors(
MemberID int foreign key references Members(MemberID),
InstructorID int foreign key references Instructors(InstructorID),
AssignDate Datetime not null
Primary key(MemberID,InstructorID))


insert BeltRanks(RankName,TestFees)
values ('White Belt', 0.00),
('Yellow Belt', 15.00),
('Orange Belt', 20.00),
('Green Belt', 25.00),
('Blue Belt', 30.00),
('Purple Belt', 35.00),
('Brown Belt', 40.00),
('Black Belt (1st Dan)', 100.00),
('Black Belt (2nd Dan)', 150.00),
('Black Belt (3rd Dan)', 200.00),
('Black Belt (4th Dan)', 250.00),
('Black Belt (5th Dan)', 300.00),
('Black Belt (6th Dan)', 350.00),
('Black Belt (7th Dan)', 400.00),
('Black Belt (8th Dan)', 450.00),
('Black Belt (9th Dan)', 500.00),
('Black Belt (10th Dan)', 600.00);

create table BeltTests(
TestID int primary key identity(1,1),
MemberID int foreign key references Members(MemberID),
RankID int foreign key references BeltRanks(RankID),
Result bit not null,
Date date not null,
TestedByInstructorID int foreign key references Instructors(InstructorID),
PaymentID int foreign key references Payments(PaymentID) null
)
