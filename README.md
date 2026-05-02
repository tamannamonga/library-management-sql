# 📚 Library Management System (SQL)

## 📌 Project Overview

This project is a **Library Management System** implemented using SQL.
It demonstrates how to design a relational database, establish relationships between tables, and perform queries to retrieve meaningful data.

---

## 🧩 Features

* 📖 Manage books, authors, publishers, and readers
* 🔗 Use of **Primary Keys** and **Foreign Keys**
* 📊 Insert realistic sample data
* 🔍 Perform queries including **JOIN operations**
* 🧠 Demonstrates database normalization and relationships

---

## 🛠️ Technologies Used

* MySQL
* SQL (Structured Query Language)
* MySQL Workbench

---

## 🗂️ Database Structure

### Tables Included:

* **author** – stores author details
* **publisher** – stores publisher information
* **books** – contains book details
* **readers** – stores library members
* **books_issue** – tracks issued books

---

## 🔗 Relationships

* Each book is linked to an **author** and a **publisher**
* Each issued book is linked to a **reader**
* Relationships are maintained using **foreign keys**

---

## 📊 Sample Query (JOIN)

```sql
SELECT r.first_name, b.book_name, bi.issued_on
FROM books_issue bi
JOIN readers r ON bi.issued_to = r.reader_id
JOIN books b ON bi.book_id = b.book_id;
```

👉 This query shows which reader issued which book and on what date.

---

## 🚀 How to Run the Project

1. Open MySQL Workbench
2. Create a new SQL tab
3. Copy and paste the SQL code from `library_management.sql`
4. Execute the script
5. Run SELECT queries to view results

---

## 🎯 Learning Outcomes

* Understanding relational database design
* Working with SQL queries (SELECT, JOIN)
* Using keys and constraints
* Simulating real-world database systems

---

## 👤 Author

**Tamanna Monga**

---

## ⭐ Note

This project is created for academic and learning purposes to demonstrate SQL concepts in a real-world scenario.
