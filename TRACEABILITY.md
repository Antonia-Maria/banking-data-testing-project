# TRACEABILITY – Requirements to Test Assets

## Purpose

This document provides traceability between the **Test Basis** (SPEC.md) and the existing or planned **test assets**.  
It supports ISTQB Test Analysis by making all in-scope requirements explicit and traceable.

## Test Basis
- SPEC.md
- Schema/schema.sql
- test_data/sample_data.sql

Legend:
- Coverage:
  - COVERED – verified by existing automated tests
  - PARTIALLY COVERED – implemented but not fully verified
  - NOT COVERED YET – identified during analysis, tests to be designed

---

## 1. Customer Requirements

| Req ID | Requirement | SPEC Reference | Test Asset | Coverage | Notes |
|------:|-------------|----------------|------------|----------|------|
| REQ-CUST-001 | Customer table exists | SPEC §4.1 | tests/test_customers_schema.py | COVERED | Table existence verified |
| REQ-CUST-002 | customer_id is primary key and auto-generated | SPEC §4.1 | tests/test_customers_schema.py | PARTIALLY COVERED | PK verified; auto-generation not explicitly tested |
| REQ-CUST-003 | first_name is mandatory | SPEC §4.1 | tests/test_customers_schema.py | NOT COVERED YET | NOT NULL constraint |
| REQ-CUST-004 | last_name is mandatory | SPEC §4.1 | tests/test_customers_schema.py | NOT COVERED YET | NOT NULL constraint |
| REQ-CUST-005 | date_of_birth is mandatory | SPEC §4.1 | tests/test_customers_schema.py | NOT COVERED YET | NOT NULL constraint |
| REQ-CUST-006 | email is optional and unique | SPEC §4.1 | tests/test_customers_schema.py | NOT COVERED YET | UNIQUE constraint |
| REQ-CUST-007 | phone_e164 is optional and unique | SPEC §4.1 | tests/test_customers_schema.py | NOT COVERED YET | UNIQUE constraint |
| REQ-CUST-008 | status has default value ACTIVE | SPEC §4.1 | tests/test_customers_schema.py | NOT COVERED YET | DEFAULT value |
| REQ-CUST-009 | status allowed values enforced | SPEC §4.1 | tests/test_customers_schema.py | NOT COVERED YET | CHECK constraint |
| REQ-CUST-010 | phone_e164 format enforced (E.164) | SPEC §4.1 | tests/test_customers_schema.py | NOT COVERED YET | CHECK / REGEXP |
| REQ-CUST-011 | created_at default timestamp | SPEC §4.1 | tests/test_customers_schema.py | NOT COVERED YET | DEFAULT CURRENT_TIMESTAMP |
| REQ-CUST-012 | updated_at auto-updated on change | SPEC §4.1 | tests/test_customers_schema.py | NOT COVERED YET | ON UPDATE behavior |
| REQ-CUST-013 | Index exists on last_name | SPEC §4.1 | tests/test_customers_schema.py | NOT COVERED YET | Index validation |

---

## 2. Account Requirements

| Req ID | Requirement | SPEC Reference | Test Asset | Coverage | Notes |
|------:|-------------|----------------|------------|----------|------|
| REQ-ACCT-001 | Account table exists | SPEC §4.2 | tests/test_accounts_schema.py | PARTIALLY COVERED | Basic structure only |
| REQ-ACCT-002 | account_id is primary key and auto-generated | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | PK + AUTO_INCREMENT |
| REQ-ACCT-003 | customer_id is mandatory | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | NOT NULL |
| REQ-ACCT-004 | FK: account.customer_id → customer.customer_id | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | Referential integrity |
| REQ-ACCT-005 | iban is mandatory and unique | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | NOT NULL + UNIQUE |
| REQ-ACCT-006 | account_type is mandatory | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | NOT NULL |
| REQ-ACCT-007 | balance default is 0.00 | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | DEFAULT value |
| REQ-ACCT-008 | balance must be >= 0 | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | CHECK constraint |
| REQ-ACCT-009 | currency default is EUR | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | DEFAULT value |
| REQ-ACCT-010 | status default is ACTIVE | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | DEFAULT value |
| REQ-ACCT-011 | status allowed values enforced | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | CHECK constraint |
| REQ-ACCT-012 | created_at default timestamp | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | DEFAULT CURRENT_TIMESTAMP |
| REQ-ACCT-013 | updated_at auto-updated on change | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | ON UPDATE behavior |
| REQ-ACCT-014 | Index exists on customer_id | SPEC §4.2 | tests/test_accounts_schema.py | NOT COVERED YET | Index validation |

---

## 3. Bank Transaction Requirements

| Req ID | Requirement | SPEC Reference | Test Asset | Coverage | Notes |
|------:|-------------|----------------|------------|----------|------|
| REQ-TX-001 | Bank transaction table exists | SPEC §4.3 | tests/test_transactions_schema.py | PARTIALLY COVERED | Table existence only |
| REQ-TX-002 | transaction_id is primary key and auto-generated | SPEC §4.3 | tests/test_transactions_schema.py | NOT COVERED YET | PK + AUTO_INCREMENT |
| REQ-TX-003 | account_id is mandatory | SPEC §4.3 | tests/test_transactions_schema.py | NOT COVERED YET | NOT NULL |
| REQ-TX-004 | FK: bank_transaction.account_id → account.account_id | SPEC §4.3 | tests/test_transactions_schema.py | NOT COVERED YET | Referential integrity |
| REQ-TX-005 | amount is mandatory | SPEC §4.3 | tests/test_transactions_schema.py | NOT COVERED YET | NOT NULL |
| REQ-TX-006 | amount must be greater than zero | SPEC §4.3 | tests/test_transactions_schema.py | NOT COVERED YET | CHECK constraint |
| REQ-TX-007 | currency default is EUR | SPEC §4.3 | tests/test_transactions_schema.py | NOT COVERED YET | DEFAULT value |
| REQ-TX-008 | direction is mandatory | SPEC §4.3 | tests/test_transactions_schema.py | NOT COVERED YET | NOT NULL |
| REQ-TX-009 | direction allowed values enforced | SPEC §4.3 | tests/test_transactions_schema.py | NOT COVERED YET | CHECK constraint |
| REQ-TX-010 | description is optional | SPEC §4.3 | tests/test_transactions_schema.py | NOT COVERED YET | Nullable column |
| REQ-TX-011 | booked_at default timestamp | SPEC §4.3 | tests/test_transactions_schema.py | NOT COVERED YET | DEFAULT CURRENT_TIMESTAMP |
| REQ-TX-012 | Index exists on account_id | SPEC §4.3 | tests/test_transactions_schema.py | NOT COVERED YET | Index validation |
| REQ-TX-013 | Index exists on booked_at | SPEC §4.3 | tests/test_transactions_schema.py | NOT COVERED YET | Index validation |

---

## 4. Data Integrity Requirements

| Req ID | Requirement | SPEC Reference | Test Asset | Coverage | Notes |
|------:|-------------|----------------|------------|----------|------|
| REQ-DATA-001 | Foreign key relationships must be respected | SPEC §5 | tests/*_schema.py | PARTIALLY COVERED | Presence of FK constraints |
| REQ-DATA-002 | Controlled sample data can be loaded | SPEC §3.1 | test_data/sample_data.sql | PARTIALLY COVERED | Not yet validated automatically |
| REQ-DATA-003 | Data load order respects FK dependencies | SPEC §5 | test_data/sample_data.sql | PARTIALLY COVERED | Manual verification |

---

## 5. Traceability Status

All requirements defined in SPEC.md have been identified and traced.  
Gaps marked as **NOT COVERED YET** will be addressed during **Test Design and Test Implementation** phases.
