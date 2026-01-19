# Banking Data Testing Project

## Overview

This project is a **beginner-friendly, step-by-step learning project** focused on **automated testing using SQL and Python**, aligned with **ISTQB testing principles**. The domain used is **banking data** (customers, accounts, transactions), because it is realistic, structured, and well-suited for data validation and automation.

The goal is not to build a full banking application, but to **learn how to test data correctly**: schemas, constraints, business rules, and data quality, using industry best practices.

---

## Learning Objectives

By completing this project, you will learn how to:

* Design and understand SQL schemas (tables, constraints, indexes)
* Apply ISTQB testing concepts to data testing
* Validate data integrity and business rules in databases
* Write automated tests in Python for SQL databases
* Structure a testing project from scratch in a professional way

---

## Technologies Used

* **Database:** MySQL
* **Programming Language:** Python, SQL
* **Testing Framework:** pytest
* **Database Tool:** DBeaver (for manual inspection)
* **Version Control:** Git (optional but recommended)

### Optional (Phase 2): API Layer + API Testing

* **API Framework:** FastAPI (Python)
* **API Testing:** pytest + `requests`

---

## Project Structure

```
banking-data-testing-project/
│
├── README.md              # Project overview and instructions
├── SPEC.md                # Project specifications and rules
│
├── schema/                # SQL schema definitions
│   └── banking_schema.sql
│
├── tests/                 # Automated tests
│   ├── db/                # Database-level tests (constraints, business rules)
│   │   ├── test_customers.py
│   │   ├── test_accounts.py
│   │   └── test_transactions.py
│   └── api/               # API tests (Phase 2)
│       ├── test_customers_api.py
│       └── test_transactions_api.py
│
├── api/                   # Minimal API service (Phase 2)
│   └── app.py
│
├── data/                  # Sample or test data (optional)
│   └── sample_data.sql
│
└── requirements.txt       # Python dependencies
```

banking-data-testing-project/
│
├── README.md              # Project overview and instructions
├── SPEC.md                # Project specifications and rules
│
├── schema/                # SQL schema definitions
│   └── banking_schema.sql
│
├── tests/                 # Automated test cases
│   ├── test_customers.py
│   ├── test_accounts.py
│   └── test_transactions.py
│
├── data/                  # Sample or test data (optional)
│   └── sample_data.sql
│
└── requirements.txt       # Python dependencies

```

---

## Scope of Testing

### Phase 1: Data Testing (Primary Focus)

We will test:

- **Schema correctness** (data types, nullability)
- **Constraints** (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK)
- **Default values** (e.g. CURRENT_TIMESTAMP)
- **Indexes and performance-related design choices**
- **Business rules**, such as:
  - Account balance cannot be negative
  - Transactions must reference valid accounts
  - Email addresses must be unique

### Phase 2 (Optional): API Testing

Once the database rules are stable, we add a minimal API layer and test:

- **HTTP contract** (status codes, schemas, validation)
- **Positive and negative cases** (invalid payloads, missing fields)
- **Data consistency** (API results match the database state)

---

## ISTQB Concepts Applied

This project applies the following ISTQB concepts:

- Test basis (SPEC.md)
- Test conditions derived from requirements
- Positive and negative testing
- Boundary value analysis (e.g. balances = 0)
- Test levels: component-level (table-level) testing
- Defect prevention through constraints

---

## How to Use This Project

1. Read **SPEC.md** to understand the rules and requirements
2. Create the database schema using the SQL files in `/schema`
3. Inspect the database manually using DBeaver
4. Write and run automated tests using pytest
5. Improve the schema and tests iteratively

---

## Target Audience

This project is designed for:

- Beginners in SQL and testing
- Junior test engineers
- Manual testers transitioning to automation
- Anyone learning data testing fundamentals

---

## Important Notes

- The project is intentionally incremental
- Each concept is introduced only when needed
- Explanations prioritize **why**, not just **how**

This is a **learning project**, not a production system.

---

## Next Step

The next step in this project is:

➡️ **Designing and documenting the SQL schema**, starting with the `Customer` table.

We will proceed step by step.

```
