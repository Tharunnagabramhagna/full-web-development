<div align="center">

# 🗄️ MySQL

*From `CREATE DATABASE` to grouped aggregate queries.*

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/status-in%20progress-yellow?style=for-the-badge)

</div>

---

## 📖 Overview

This folder documents my MySQL fundamentals as part of the [Full Web Development](../../README.md) repository — schema design and core querying are covered; joins and beyond are next.

---

## ✅ Topics Covered

**Database & Table Basics**
- Creating / dropping databases (`CREATE DATABASE`, `IF NOT EXISTS`, `DROP DATABASE`)
- Creating tables with data types
- Constraints: `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `DEFAULT`, `AUTO_INCREMENT`
- SQL command categories: DDL, DQL, DML, DCL, TCL

**CRUD & Querying**
- `INSERT`, `SELECT`, `UPDATE`, `DELETE`, `ALTER`
- Filtering with `WHERE` and comparison/logical operators
- Sorting with `ORDER BY` (ascending/descending)
- Limiting results with `LIMIT`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
- Grouping with `GROUP BY`
- Filtering groups with `HAVING`
- Foreign key relationships and viewing EER diagrams

---

## 📂 Folder Structure

```text
MYSQL/
├── README.md
├── 1-intro_table_creation.sql   # DB/table creation, constraints, CRUD
└── 2-types_of_clauses.sql       # WHERE, ORDER BY, LIMIT, aggregates, GROUP BY/HAVING
```

---

## 🗺️ Not Yet Covered

These are planned next, in order:

- [ ] Joins: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN` (concept)
- [ ] Subqueries
- [ ] Views
- [ ] Indexes
- [ ] Stored procedures
- [ ] Triggers
- [ ] Transactions

*(The main repository README previously listed joins and beyond as complete — that was inaccurate and has been corrected here to reflect the actual code.)*

---

⭐ Part of the [Full Web Development](../../README.md) learning repository.
