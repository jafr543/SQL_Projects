# 🥋 Karate Club Database System

A robust, relational database design optimized for managing a Karate Club. This system is engineered to handle core operations including members tracking, instructor assignments, subscription periods, financial logs, and belt rank progression history.

---

## 📌 Project Overview

This project delivers a normalized database schema designed to eliminate data redundancy and enforce strong data integrity. By separating general personal data from business-specific roles, the design ensures scalability and clear separation of concerns.

### Key Architectural Features:
* Role Inheritance Model: Common personal attributes (Name, Address, ContactInfo) are centralized in a parent Persons table. Both Members and Instructors inherit from this table, reducing duplicate records.
* Subscription & Period Tracking: Decouples membership status from individual subscription periods, allowing historical tracking of renewals (StartDate, EndDate).
* Flexible Financial Management: Supports deferred or upfront payments by allowing nullable payment references in subscription periods and test records.
* Audit Trail for Progression: Every belt test attempt is logged independently (Result, Date, TestedByInstructorID), maintaining a complete history of a member's progression through ranks.

---

## 🗺️ Relational Schema & Table Structures

The database consists of the following key tables and relationships:

### 1. Core Entities
* **Persons**: The central repository for general identity data.
* **Members**: Represents the club's trainees. Holds member-specific data like EmergencyContactInfo, IsActive status, and a foreign key (LastBeltRank) pointing to their current belt.
* **Instructors**: Holds coaching staff records and their specific Qualification.

### 2. Operations &Payments**Payments**: A central ledger tracking all financial transactions (Amount, Date) tied directly to a MemberID.
* **SubscriptionPeriods**: Manages the duration and fees of training cycles. It references Payments (nullable) to accommodate pending balances.

### 3. ProgressioBeltRanks
* **BeltRanks**: A lookup table containing the 17 standard Karate belt levels (from White Belt up to 10th Dan Black Belt) along with their fixed standard TestFees.
* **BeltTests**: A historical log tracking every belt exam. It links the member, the target rank, the evaluating instructor, the result (Pass/Fail), and the associated payment.

### 4. Many-to-MMemberInstructors*MemberInstructors**: A junction table mapping which instructor is assigned to which member, utilizing a composite primary key (MemberID, InstructorID) to prevent duplicate assignments.

---

## Create the Database:eate the Database:** Execute your database creation script to initialize Karate_Club_DB.
2. **Seed Lookup Data:** Ensure you populate the BeltRanks table first with the standard 17 ranks and their respective fees, as it acts as a critical lookup for both Members and BeltTests.
3. **Establish Constraints:** Ensure all Foreign Keys and Composite Primary Keys are built exactly as mapped to guarantee data consistency across operations.

---
💡 *Designed with focus on relational database design principles, strict data integrity constraints, aAuthor:normalization.*

*GitHub:Jafar Jaber  
🔗 **GitHub:** [github.com/jafr543](https://github.com/jafr543)
