<div align="center">

# 🗄️ MySQL

*From `CREATE DATABASE` to joins, subqueries, and views.*

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/status-in%20progress-yellow?style=for-the-badge)

</div>

---

## 📖 Overview

This folder documents my MySQL fundamentals as part of the [Full Web Development](../../README.md) repository. Schema design, full CRUD, filtering/aggregation, schema alteration, all four join types, subqueries, and views are now covered — indexes, stored procedures, triggers, and transactions are next.

---

## ✅ Topics Covered

**Database & Table Basics**
- Creating / dropping databases (`CREATE DATABASE`, `IF NOT EXISTS`, `DROP DATABASE`)
- Creating tables with data types
- Constraints: `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `DEFAULT`, `AUTO_INCREMENT`
- SQL command categories: DDL, DQL, DML, DCL, TCL

**CRUD & Querying**
- `INSERT`, `SELECT`, `UPDATE`, `DELETE`
- Filtering with `WHERE` and comparison/logical operators
- Sorting with `ORDER BY` (ascending/descending)
- Limiting results with `LIMIT`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
- Grouping with `GROUP BY`
- Filtering groups with `HAVING`
- Foreign key relationships and viewing EER diagrams

**Schema Alteration & Table Maintenance**
- Adding, dropping, renaming, and modifying columns with `ALTER TABLE` (`ADD COLUMN`, `DROP COLUMN`, `CHANGE COLUMN`, `MODIFY COLUMN`)
- Renaming tables with `ALTER TABLE ... RENAME TO`
- Clearing table data with `TRUNCATE TABLE`
- Working with `SQL_SAFE_UPDATES` when running unkeyed `DELETE`/`UPDATE` statements

**Joins**
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- Full (outer) join, simulated in MySQL via `LEFT JOIN UNION RIGHT JOIN`
- Left-exclusive and right-exclusive joins (`WHERE ... IS NULL` pattern)
- Exclusive full outer join (`UNION ALL` of both exclusive sides)
- Self joins (e.g. an employee/manager hierarchy on one table)
- Table aliasing in multi-table queries
- `UNION` vs. `UNION ALL`

**Subqueries & Views**
- Subqueries in `WHERE` (e.g. filtering by a computed average or an `IN` list)
- Subqueries in `FROM` (querying a derived/temporary result set)
- Subqueries in `SELECT` (adding a computed column per row)
- Creating and querying views with `CREATE VIEW`

---

## 📂 Folder Structure

```text
MYSQL/
├── README.md
├── 1-intro_table_creation.sql     # DB/table creation, constraints, CRUD
├── 2-types_of_clauses.sql         # WHERE, ORDER BY, LIMIT, aggregates, GROUP BY/HAVING
├── 3-table_related_queries.sql    # ALTER TABLE variants, TRUNCATE, safe updates
└── 4-joins_in_sql.sql             # All join types, self joins, UNION, subqueries, views
```

---

## 🗺️ Not Yet Covered

These are planned next, in order:

- [ ] Indexes
- [ ] Stored procedures
- [ ] Triggers
- [ ] Transactions (`COMMIT`, `ROLLBACK`, `SAVEPOINT`)

---

⭐ Part of the [Full Web Development](../../README.md) learning repository.