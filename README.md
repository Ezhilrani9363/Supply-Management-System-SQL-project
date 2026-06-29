# Supply Management System using SQL

## 📌 Project Overview

The **Supply Management System** is a SQL-based database project designed to manage suppliers, products, warehouses, inventory, shipments, and customer orders. It demonstrates the use of relational database concepts, table relationships, constraints, and SQL queries for efficient supply chain management.

This project is built using **MySQL** and covers database creation, data insertion, and database management operations.

---

## 🎯 Objectives

- Design a relational database for supply chain management.
- Manage supplier and product information.
- Track inventory across multiple warehouses.
- Record shipments from suppliers.
- Maintain customer order details.
- Practice SQL concepts such as joins, constraints, and relationships.

---

## 🛠️ Technologies Used

- MySQL
- SQL
- MySQL Workbench (or any SQL IDE)

---

## 📂 Database Structure

The project contains the following tables:

- **Suppliers**
- **Warehouse**
- **Products**
- **Inventory**
- **Shipments**
- **Orders**

These tables are connected using **Primary Keys** and **Foreign Keys** to maintain data integrity.

---

## 📋 Features

- Create and manage supplier records.
- Store warehouse information.
- Maintain product details.
- Track inventory quantities.
- Manage shipment records.
- Process customer orders.
- Implement constraints and relationships.

---

## 🗄️ Database Schema

### Suppliers
- Supplier ID
- Supplier Name
- Contact Name
- Phone
- Email
- Address
- Age

### Warehouse
- Warehouse ID
- Warehouse Name
- Location

### Products
- Product ID
- Product Name
- Supplier ID
- Unit Price

### Inventory
- Inventory ID
- Product ID
- Product Name
- Warehouse ID
- Quantity

### Shipments
- Shipment ID
- Supplier ID
- Warehouse ID
- Product ID
- Quantity
- Shipment Date
- Status

### Orders
- Order ID
- Product ID
- Warehouse ID
- Quantity
- Order Date
- Status

---

## 🔑 SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- AUTO_INCREMENT
- CHECK Constraint
- INSERT INTO
- SELECT
- Table Relationships

---

## 🚀 How to Run the Project

1. Install **MySQL** or **MySQL Workbench**.
2. Open the SQL file:
   ```
   Supply Management System SQL.sql
   ```
3. Execute the script.
4. The database and tables will be created automatically.
5. Sample data will be inserted into the tables.

---

## 📁 Project Structure

```
Supply-Management-System/
│
├── Supply Management System SQL.sql
└── README.md
```

---

## 📈 Future Enhancements

- Add stored procedures.
- Create SQL views.
- Implement triggers.
- Add user authentication.
- Build a front-end application using HTML, CSS, and Python or Java.

---

## 👩‍💻 Author

**Ezhilrani**

GitHub: https://github.com/Ezhilrani9363

LinkedIn: https://www.linkedin.com/in/ezhilnithya53


---

## ⭐ Conclusion

This project demonstrates practical knowledge of relational database design and SQL programming. It showcases database normalization, table relationships, constraints, and data management techniques used in real-world supply chain and inventory management systems.
