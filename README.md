# 📚 Library Management System | PostgreSQL SQL Project

## 📌 Project Overview

The **Library Management System** is a SQL-based database project built using **PostgreSQL**. It simulates the operations of a real-world library by managing books, members, employees, branches, book issuance, and returns.

The project focuses on solving practical business problems using SQL and demonstrates proficiency in relational database design, data manipulation, reporting, and analytical query writing.

---

## 🎯 Objectives

- Design a relational database for a library system.
- Perform CRUD operations on library data.
- Analyze book issuance and return records.
- Generate business reports using SQL.
- Practice SQL concepts used in real-world Data Analyst roles.

---

## 🛠️ Tech Stack

- **Database:** PostgreSQL
- **Language:** SQL
- **Tool:** pgAdmin 4

---

## 🗂️ Database Schema

The project consists of the following tables:

- **Branch**
- **Employees**
- **Members**
- **Books**
- **Issued_Status**
- **Return_Status**

### Entity Relationship

```
Branch
   │
   ├──────── Employees
   │              │
   │              │
   │         Issued_Status
   │          │         │
   │          │         │
 Books    Return_Status
   │
 Members
```

---

# 📚 SQL Concepts Covered

### ✅ CRUD Operations

- INSERT
- UPDATE
- DELETE
- SELECT

### ✅ Joins

- INNER JOIN
- LEFT JOIN
- SELF JOIN

### ✅ Aggregation

- COUNT()
- SUM()
- MIN()
- MAX()
- AVG()

### ✅ Filtering

- WHERE
- HAVING
- ORDER BY
- LIMIT
- GROUP BY

### ✅ Advanced SQL

- CREATE TABLE AS SELECT (CTAS)
- GROUP BY
- Date & Interval Functions
- NULL Handling
- Business Reporting Queries

---

# 📊 Business Problems Solved

This project includes **18 SQL queries** that solve practical business scenarios.

### CRUD Operations

- Add a new book
- Update member information
- Delete issued records

### Reporting & Analysis

- Retrieve books issued by employees
- Identify members issuing multiple books
- Find books by category
- Calculate rental income by category
- List recently registered members
- Employee & Branch Manager reporting
- Books not yet returned
- Identify overdue books
- Branch performance report
- Active members identification
- Top employees by books processed

---

# 📈 Key SQL Skills Demonstrated

- Writing optimized SQL queries
- Multi-table joins
- Business report generation
- Aggregate analysis
- CTAS implementation
- Date calculations
- Relational database querying
- Problem-solving using SQL

---

# 📁 Project Structure

📁 Library-Management-System-SQL
│
├── Dataset/
│   ├── books.csv
│   ├── members.csv
│   ├── employees.csv
│   ├── branch.csv
│   ├── issued_status.csv
│   └── return_status.csv
│
├── SQL Scripts/
│   ├── Tables Creatation.sql
│   └── Solution File.sql
│
├── Screenshots/
│   ├── ER_Diagram.png
│   ├── Query1.png
│   ├── Query2.png
│   └── QueryResults.png
│
└── README.md

---

# 🚀 Sample Business Insights

- Total rental revenue by book category
- Most active library members
- Books currently not returned
- Overdue book tracking
- Branch-wise performance analysis
- Employees processing the highest number of book issues

---

# 💡 Learning Outcomes

Through this project, I gained hands-on experience with:

- Relational Database Design
- PostgreSQL Query Writing
- SQL Data Analysis
- Business-Oriented Reporting
- Writing Production-Style SQL Queries

---

# 📷 Suggested Repository Screenshots

Consider adding screenshots of:

- Database Schema
- Table Relationships
- SQL Query Execution
- Query Results
- PostgreSQL Database

---

# 👨‍💻 Author

**Sanjay Chourasiya**

- 💼 Aspiring Data Analyst
- 🛠️ Skills: SQL, PostgreSQL, Excel, Power BI, Power Query, DAX

---

## ⭐ If you found this project helpful, feel free to give it a Star.
