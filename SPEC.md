# SPEC.md – Banking Data Testing Project

## 1. Document Purpose

This document (SPEC.md) defines the functional and data specifications for a **demonstration project focused on automated testing** applied to a simplified banking system.

This specification serves as the **single source of truth** for:

* what data exists,
* which business rules apply,
* what is tested (manually and automatically),
* how ISTQB concepts are applied in practice.

This is **not code**. It is the foundation on which all tests are built.

---

## 2. Project Context

The project simulates a minimal banking system that manages:

* customers
* bank accounts
* transactions

Testing will focus primarily on **data testing**, using:

* SQL (for data validation)
* Python + pytest (for automated testing)

---

## 3. Scope

### 3.1 In Scope

* Data structure validation
* Business rule validation
* Financial transaction testing
* Data integrity testing
* Positive and negative test cases

### 3.2 Out of Scope

* Graphical user interface (UI)
* Integration with real external systems
* Performance and load testing (for now)

---

## 4. Core Entities (Data Model)

### 4.1 Customer

A customer represents an individual who owns one or more bank accounts.

Fields:

* customer_id (unique identifier)
* first_name
* last_name
* national_id (unique, mandatory)
* date_of_birth
* created_at

Business Rules:

* A customer must have a unique national_id
* A customer must be at least 18 years old
* first_name and last_name cannot be null

---

### 4.2 Account

A bank account belongs to exactly one customer.

Fields:

* account_id (unique identifier)
* customer_id (foreign key → Customer)
* account_number (unique)
* account_type (CHECKING | SAVINGS)
* balance
* currency (e.g. EUR, USD)
* status (ACTIVE | BLOCKED | CLOSED)
* created_at

Business Rules:

* An account must belong to one customer
* Account balance cannot be negative
* Only ACTIVE accounts can process transactions

---

### 4.3 Transaction

A transaction represents a financial operation on an account.

Fields:

* transaction_id (unique identifier)
* account_id (foreign key → Account)
* transaction_type (DEPOSIT | WITHDRAWAL | TRANSFER)
* amount
* transaction_date
* description

Business Rules:

* Transaction amount must be greater than 0
* Withdrawals cannot exceed the current balance
* Transactions can only be executed on ACTIVE accounts

---

## 5. Data Integrity Rules

* Foreign key relationships must be respected
* Deleting a customer is not allowed if accounts exist
* Deleting an account is not allowed if transactions exist

---

## 6. Testing Objectives

The main testing objectives are:

* Verify data correctness
* Detect invalid or inconsistent data
* Validate business rules at database level
* Demonstrate structured test design using ISTQB principles

---

## 7. Test Levels Applied

* Static testing: specification and rule review
* Unit-level data testing (single tables)
* Integration-level data testing (relationships)

---

## 8. Risks

* Incorrect business rules implementation
* Data inconsistency across tables
* Missing validation constraints

---

## 9. Deliverables

* SPEC.md (this document)
* SQL schema
* Sample test data
* Automated tests (Python + pytest)
* Test execution reports

---

## 10. Change Management

Any change to business rules or data structures must be reflected in this document before updating tests.
