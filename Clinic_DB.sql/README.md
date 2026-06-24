# Clinic Database Management System (Clinic_DB)

A robust and fully normalized SQL Server database schema designed for a clinic management system. This project implements a complete relational model based on an Entity-Relationship Diagram (ERD), ensuring data integrity, optimized data types, and proper relational constraints.

---

## 📌 Project Overview
This database is architected to handle core clinic operations seamlessly. It manages everything from general personal information to specialized roles (Patients/Doctors), tracking appointments, medical history, prescriptions, and billing/payments.

## 🗂️ Database Schema & Architecture
The design follows best practices in database normalization and sub-typing (IS-A relationships). The schema consists of the following core tables:

* Persons: Stores base information for anyone interacting with the clinic (Name, Date of Birth, Gender, Contact Info, Address).
* Patients & Doctors: Specialized tables that inherit from the Persons table using Foreign Keys as Primary Keys.
* Appointment_Status: A dedicated lookup table handling predefined appointment states (Pending, Confirmed, Completed, Canceled, Rescheduled, No Show) to enhance scalability and reduce text redundancy.
* Appointments: The central transactional table linking patients, doctors, schedule, status, medical records, and payments.
* MedicalRecords: Stores diagnostic details and visit descriptions.
* Prescriptions: Contains medication data linked directly to specific medical records (allowing multiple prescriptions per visit).
* Payments: Manages billing transactions, capturing payment dates, methods, and precise financial figures.

---

## 🛠️ Key Design Practices Applied
* Referential Integrity: Strict enforcement of PRIMARY KEY and FOREIGN KEY constraints.
* Performance Optimization: Choosing correct data types (e.g., decimal(18,2) for financial records to prevent rounding errors, and tinyint for lookup status IDs).
* Scalability: Using a lookup table for appointment statuses instead of hardcoded constraints, making future status additions effortless.

---

## 🚀 How to Run the Script
1. Open SQL Server Management Studio (SSMS) or any compatible SQL client.
2. Create a new database:
   `sql
   CREATE DATABASE Clinic_DB;
   USE Clinic_DB;
3. Copy the SQL script provided in the .sql file of this repository and execute it.   
