# 🚗 Car Rental Database System (Car_Rental_DB)

A robust, relational database design for a Car Rental Management System. This schema is optimized to handle customers, vehicle fleets, bookings, payments, and returns efficiently, ensuring data integrity through proper normalization and constraint management.

---

## 📌 Project Overview

This project provides a production-ready SQL database schema designed to run the backend of a car rental business. It eliminates data redundancy by separating core entities (like fuel types and vehicle categories) into lookup tables and features complete tracking of the rental lifecycle—from initial booking to vehicle return and payment logging.

---

## 🛠️ Tech Stack & Tools

*   Database Management System: Microsoft SQL Server (T-SQL)
*   Design Concepts: 3NF Normalization, Referential Integrity (Foreign Keys), Primary Keys, Identity Columns, Default Constraints.

---

## 📐 Database Schema Architecture

The database consists of 8 interconnected tables designed to maintain a clean workflow:

### 👥 1. Customers Table
*   Stores essential customer data including name and contact info.
*   Uses a flexible string format for Driving License Numbers (DL_Number) to support various international license formats.

### ⛽ 2. Fuel Types Table (Lookup)
*   Pre-populated with modern fuel options: Gasoline(Petrol), Diesel, Electric, and Hybrid.

### 🗂️ 3. Vehicle Categories Table (Lookup)
*   Classifies vehicles into standard market segments: 4x4, Sedan, Hatchback, SUV, Pick-up, and Minivan.

### 🚘 4. Vehicles Table
*   Manages the car fleet detailing Make, Model, Manufacture Year, and Mileage tracking.
*   Tracks real-time availability via a boolean flag (IsAvailable) to prevent double-booking.

### 📅 5. Vehicle Booking Table
*   The core transactional table mapping a Customer to a specific Vehicle.
*   Tracks pick-up/drop-off locations, rental duration windows (Start_Date / End_Date), and the total due amount.

### 💳 6. Rental Payments Table
*   Handles transaction logs securely linked directly to specific bookings (BookingID).
*   Stores paid amounts and payment reference details.

### 🔄 7. Vehicle Returns Table
*   Manages the final phase of the rental process.
*   Logs actual return dates, calculates actual rental days, captures vehicle condition inspection notes (Check_Notes), and tracks any extra late or damage fees.

### ⚙️ 8. Settings Table
*   A centralized configuration utility table storing global business rules like daily late charges and standard damage fees.

---

## 🚀 Key Features Implemented

*   Data Integrity: Enforced strict relationships using FOREIGN KEY references across bookings, vehicles, payments, and returns.
*   Smart Data Types: Optimized memory allocations using precise types like smallint for manufacturing years/rental days and money / smallmoney for accurate financial records.
*   Crash Prevention: Configured mileage fields with int to handle high-mileage fleet operations without database overflows.
*   Business Logic Safety: Integrated DEFAULT constraints for automated system fields (e.g., auto-setting car availability and initializing additional return charges to 0).

---

## 🔮 Future Enhancements

- [ ] Implement Stored Procedures for automated rental cost and penalty calculations.
- [ ] Add a Users/Employees Table to track which staff member managed a specific booking or return.
- [ ] Add a Maintenance Log Table to track oil changes, mechanical checks, and temporarily set a vehicle's availability status to false.

---

## Author -- Jafr Jaber __ Github(github.com/jafr543)
## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
