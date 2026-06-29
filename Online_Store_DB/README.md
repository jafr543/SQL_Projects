# 🛒 Online Store Database System

A robust, normalized, and production-ready relational database schema designed for E-commerce platforms. Built with MS SQL Server, this database handles everything from product catalogs and customer management to orders, dynamic pricing, automated tracking, payments, and shipping.

---

## 🚀 Key Features

* 📦 Advanced Product Management: Supports multi-category organization and a dedicated system for handling multiple product images with customizable display orders.
* 👥 Secure Customer Profiles: Structured to store customer identities, unique credentials (Email & Username), and contact records.
* 📐 Computed Pricing Engine: Automatically calculates total prices for line items (TotalItemsPrice) directly at the database level to prevent data inconsistency.
* ⭐ Interactive Feedback System: A dedicated review system that accommodates precise decimal ratings (e.g., 4.5/5) and user text reviews.
* 💳 Secure Payment Tracking: Logs successful transactions, order financial values using exact monetary types (smallmoney), and methods used.
* 🚚 End-to-End Shipping Pipeline: Tracks shipping carrier names, unique tracking numbers, and distinguishes between estimated and actual delivery timestamps.

---

## 🗺️ Database Architecture (Schema Overview)

The database consists of 9 strictly structured tables organized into specific operational domains:

### 1. Catalog Domain
* ProductCategories: Manages clean item clustering and store taxonomy.
* ProductCatalog: Houses the core inventory items, including stock counts, pricing, and category mapping.
* ProductImages: Allows deep structural support for attaching multiple visual assets per product with order sorting.

### 2. User & Feedback Domain
* Customers: Restricts duplicate accounts and logs secure user profiles and locations.
* Reviews: Connects customers to products to generate historical feedback with exact decimal scaling.

### 3. Sales & Fulfillment Domain
* Orders: Captures overall purchase receipts, tracking states, and purchase timelines.
* OrderItems: Acts as the composite join-table mapping orders to items, relying on database-level expressions for pricing.
* Payments: Manages post-checkout details and transactional methods.
* Shippings: Handles product dispatching, dynamic status flags, and final fulfillment tracking.

---

## 💻 Tech Stack & Requirements

* Database Management System: Microsoft SQL Server (2019 / 2022 recommended)
* Management Tool: SQL Server Management Studio (SSMS) or Azure Data Studio
* SQL Dialect: T-SQL

---

## 🛠️ How to Get Started

1. Open SQL Server Management Studio (SSMS) and connect to your database instance.
2. Create a new query window.
3. Copy the database schema script from Code.sql into the window.
4. Execute the script (F5) to completely assemble the database structure and relational constraints.
5. Ready to integrate with your backend system (C#, Node.js, Python, etc.)!

---
💡 *Developed with precision to maintain top-tier referential integrity, automated default triggers, and optimal indexing layouts.*

---

##Author Jafr Jaber
##Github Account(github.com/jafr543)
