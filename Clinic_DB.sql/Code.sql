
create table contact_informations(
ID int Primary key,
Phone_Number1 nvarchar(20) not null,
Phone_Number2 nvarchar(20) null,
Email nchar(100) null)

create table Persons(
PersonID int Primary key,
Name nvarchar(50) not null,
Date_Of_Birth date not null,
Gender nvarchar(6) not null,
contact_information int foreign key References contact_informations(ID),
address nvarchar(100) not null
)

create table Patients(
PatientID int Primary key,
PersonID int foreign key references Persons(PersonID)
)


create table Doctors(
DoctorID int primary key,
PersonID int foreign key references Persons(PersonID),
Specialization nvarchar(75) not null,
)

create table Medical_Records(
Medical_RecordID int primary key identity(1,1),
Description_of_visit nvarchar(250) not null,
Diagnosis nvarchar(100) not null,
Prescribed_Medication nvarchar(100) not null,
Note nvarchar(100) null
)

create table Payments(
PaymentID int primary key identity(1,1),
Payment_Date datetime not null,
Payment_Method nvarchar(20) not null,
Amount_Paid int not null,
Notes nvarchar(50) null)

create table Appointment_Status(
AppointmentID tinyint primary key identity(1,1),
Status_Name nvarchar(20) not null,
)

insert Appointment_Status(Status_Name)
values('Pending'),('Confirmed'),('Completed'),('Canceled'),('Rescheduled'),('No Show');

create table Appointments(
Appointment_Number int Primary key,
Patient int foreign key references Patients(PatientID),
Doctor int Foreign key references Doctors(DoctorID),
appointment_date_time datetime not null,
appointment_status tinyint foreign key References Appointment_Status(AppointmentID),
Medical_RecordID int foreign key references Medical_Records(Medical_RecordID),
PaymentID int foreign key references Payments(PaymentID)
)

create table Prescription(
PrescriptionID int primary key identity(1,1),
Medical_Record int foreign key references Medical_Records(Medical_RecordID),
Medication_name nvarchar(75) not null,
Dosage nvarchar(20) not null,
frequency int not null,
Strat_Date datetime not null,
End_Date datetime not null,
special_instructions nvarchar(50) null)



