# SQL Practice
A personal repository for practicing SQL problems from various online platforms. Each top-level folder corresponds to a different practice website.
---
## Structure
```
sql-practice/
├── datalemur.com/               # Problems from datalemur.com
│   ├── easy/                    # Easy difficulty problems
│   ├── medium/                  # Medium difficulty problems
│   └── hard/                    # Hard difficulty problems
└── sql-practice.com/            # Problems from sql-practice.com
    └── hospital-db/             # Hospital database problems
        ├── schema.sql           # Database schema used on the platform
        ├── easy/                # Easy difficulty problems
        │   └── q1.sql
        ├── medium/              # Medium difficulty problems
        └── hard/                # Hard difficulty problems
```
---
## Platforms

### [datalemur.com](https://datalemur.com/)
A SQL and data science interview prep platform featuring real questions from top tech companies. Problems are organized into **easy**, **medium**, and **hard** difficulty levels.

### [sql-practice.com](https://www.sql-practice.com/)
An online SQL terminal for practicing queries against pre-built databases. Problems are organized into **easy**, **medium**, and **hard** difficulty levels. Currently practicing on the **hospital database**.

---
## Conventions
- Each solution lives in its own `.sql` file named by question number (e.g. `q1.sql`, `q2.sql`).
- `schema.sql` in each platform folder documents the database schema for reference.
- New platforms will be added as top-level folders following the same structure.
---
## Goals
- Build fluency with SQL across a range of difficulty levels.
- Cover core concepts: `JOIN`s, aggregations, subqueries, window functions, CTEs, and more.
- Track progress over time through version history.