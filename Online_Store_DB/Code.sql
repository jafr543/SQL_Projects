

create database Online_Store_DB;

create table ProductCategories(
CategoryID int primary key identity(1,1),
CategoryName nvarchar(100) not null)


create table ProductCatalog(
ProductID int primary key identity(1,1),
ProductName nvarchar(100) not null,
Description nvarchar(500) not null,
Price smallmoney not null,
QuantityInStock int not null,
CategoryID int foreign key references ProductCategories(CategoryID))


create table ProductImages(
ImageID int primary key identity(1,1),
ImageURL nvarchar(400) not null,
ProductID int foreign key references ProductCatalog(ProductID),
ImageOrder smallint not null)


create table Customers(
CustomerID int primary key identity(1,1),
Name nvarchar(100) not null,
Email nvarchar(100) not null,
Phone nvarchar(20) not null,
Address nvarchar(200) not null,
Username nvarchar(100) not null unique,
Password nvarchar(255) not null)


create table Reviews(
ReviewID int primary key identity(1,1),
ProductID int foreign key references ProductCatalog(ProductID),
CustomerID int foreign key references Customers(CustomerID),
ReviewText nvarchar(500) null,
Rating decimal(3,2) not null,
ReviewDate datetime not null)


create table Orders(
OrderID int primary key identity(1,1),
CustomerID int foreign key references Customers(CustomerID),
OrderDate datetime not null,
TotalAmount smallmoney not null,
Status smallint not null)


create table OrderItems(
OrderID int foreign key references Orders(OrderID),
ProductID int foreign key references ProductCatalog(ProductID),
Quantity int not null,
Price smallmoney not null,
TotalItemsPrice As (Quantity * Price),
primary key(OrderID,ProductID)
)


create table Payments(
PaymentID int primary key identity(1,1),
OrderID int foreign key references Orders(OrderID),
Amount smallmoney not null,
PaymentMethod nvarchar(50) not null,
TransactionDate datetime not null)


create table Shippings(
ShippingID int primary key identity(1,1),
OrderID int foreign key references Orders(OrderID),
CarrierName nvarchar(100) not null,
TrackingNumber nvarchar(50) not null,
ShippingStatus smallint not null,
EstimatedDeliveryDate datetime not null,
ActualDeliveryDate datetime null)
