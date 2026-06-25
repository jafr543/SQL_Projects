# 📚 Library Management Database System (Library_DB)

A robust and relational database schema designed to manage library operations, including book tracking, member registration, circulation (borrowing/returns), fine assessments, and reservation queues.

---

## 🏗️ Database Architecture Overview

The system is built around 7 core tables linked through strict foreign key constraints to enforce relational integrity and business rules.

### 🔗 Entity Relationship Structure

1. 📖 Books: The central repository for title metadata (Title, Authors, ISBN, Publication Date, Genre).
2. 🆔 Book_Copies: Tracks individual physical copies of each book and monitors their current availability via a boolean status flag.
3. 👥 Users_Management: Maintains registry records of registered library members, including contact details and unique library card numbers.
4. 📝 Borrowing_Records: Maps user transactions to specific physical book copies, establishing borrowing timelines (Issue Date, Due Date, Actual Return Date).
5. ⏳ Reservations: Holds queue allocations when users request to reserve specific physical copies of books.
6. 💸 Fines: Automatically links to specific borrowing records and users to handle financial penalties for late returns or damaged inventory.
7. ⚙️ Settings: Configures global operational thresholds such as standard loan periods and default penalty matrices.

---

## 📊 Detailed Schema & Fields Breakdown

### 1. 📖 Books Table
Stores master catalog entries. Each unique book title is registered once, regardless of how many physical copies the library owns.
* 🔑 BookID: Primary Key, auto-incremented integer.
* 📌 Tital: Title of the book *(Required)*.
* ✍️ Author_s: Name(s) of the author(s) *(Required)*.
* 🔢 ISBN: International Standard Book Number for structural cataloging *(Required)*.
* 📅 Publication_Date: Release date of the publication.
* 🎭 Genre: Category classification (e.g., Fiction, Sci-Fi, Biography).
* 📝 Additional_Details: Optional open text field for extra notes.

### 2. 🆔 Book_Copies Table
Handles physical assets. If a library owns 5 copies of a single book title, there will be 1 entry in the Books table and 5 corresponding entries here.
* 🔑 CopyID: Primary Key, auto-incremented identifier for each individual item.
* 🔗 BookID: Foreign Key mapping directly back to the master Books table.
* 🚦 AvailabilityStatus: Boolean indicator (True/1 for available, False/0 for checked out or restricted).

### 3. 👥 Users_Management Table
Contains administrative records of all individuals authorized to borrow materials or place holds.
* 🔑 UserID: Primary Key, auto-incremented internal identifier.
* 🪪 library_Card_Number: Unique outward-facing membership identifier.
* 👤 Name: Full name of the user.
* 📞 Phone: Contact phone number for notifications and collection alerts.

### 4. 📝 Borrowing_Records Table
Acts as the active transaction log tracking the circulation lifecycle of physical items.
* 🔑 Borrowing_RecordID: Primary Key.
* 🔗 Book_Copy: Foreign Key linking to the unique physical asset in Book_Copies.
* 🔗 UserID: Foreign Key identifying the borrower from Users_Management.
* 📅 Borrowing_Date: The exact calendar day the item was checked out.
* ⏳ Due_Date: The target deadline for returning the book.
* ↩️ ActualReturnDate: The actual calendar day the item was received back.

### 5. 💸 Fines Table
Manages monetary accounts penalizing policy infractions.
* 🔑 FineID: Primary Key.
* 🔗 UserID: Foreign Key linking to the responsible user account.
* 🔗 Fine_Record: Foreign Key pointing to the underlying transaction causing the fine.
* 🏷️ Fine_Type: Structural tag categorizing the fine reason (e.g., Overdue, Damaged).
* 💰 Fine_Amount: Precise monetary value calculated based on global policy.
* ✅ Paid_Status: Boolean flag indicating settled (1) vs outstanding (0) dues.

  ### 6. ⏳ Reservations Table
Manages waitlists for high-demand materials by locking copies for specific users.
* 🔑 ReservationID: Primary Key.
* 🔗 UserID: Foreign Key indicating who requested the hold.
* 🔗 CopyID: Foreign Key identifying the targeted physical inventory unit.
* 📅 ReservationDate: Timestamp indicating when the request was officially placed.

### 7. ⚙️ Settings Table
A single-row configuration registry containing global parameters utilized by backend logic or application layers to uniformly calculate rules.
* 📅 DefualtBorrrowDays: Standard permitted duration for loans (stored as tinyint).
* 💵 DefaultFinePerDay: Base daily charge accumulated when a book passes its Due_Date.
* 🛠️ DefaultFineforDamge: Flat rate fine evaluated if an item is returned in poor condition.

---

## 🔄 Core Operational Workflow

1. 📥 Cataloging: A book metadata profile is appended to Books, and individual assets are generated under Book_Copies with AvailabilityStatus set to active.
2. 📤 Circulation: When a user requests an asset, Book_Copies.AvailabilityStatus is flagged inactive, and a new transaction is appended to Borrowing_Records computing Due_Date using variables configured in Settings.
3. 🔄 Return & Evaluation: Upon asset return, ActualReturnDate is populated and status reverts to available. If ActualReturnDate is greater than Due_Date, a conditional link triggers a routine inserting an automated invoice under Fines utilizing the DefaultFinePerDay metric.

4. ## Author Jafr Jaber - Github Account(github.com/jafr543)
