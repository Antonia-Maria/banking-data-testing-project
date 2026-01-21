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
* Financial transaction data integrity testing
* Data integrity testing
* Positive and negative test cases

### 3.2 Out of Scope

* Graphical user interface (UI)
* Integration with real external systems
* Performance and load testing (for now)

---

## 4. Data Model – In Scope (Implemented)

This section describes the relational data model that is currently implemented in the database schema.  
All attributes, constraints, and rules listed below are enforced at the database level and are considered **in scope for testing**.

---

### 4.1 Customer

The `customer` table represents a banking customer.  
Each row corresponds to exactly one customer.

#### Attributes
- **customer_id**  
  BIGINT, primary key, auto-generated.  
  Uniquely identifies a customer.

- **first_name**  
  VARCHAR(100), mandatory.  
  Customer first name.

- **last_name**  
  VARCHAR(100), mandatory.  
  Customer last name.

- **date_of_birth**  
  DATE, mandatory.  
  Customer date of birth.

- **email**  
  VARCHAR(254), optional.  
  Must be unique when provided.

- **phone_e164**  
  VARCHAR(20), optional.  
  Must be unique when provided and follow E.164 format.

- **status**  
  VARCHAR(20), mandatory, default value = `ACTIVE`.  
  Represents the current lifecycle status of the customer.

- **created_at**  
  DATETIME, mandatory.  
  Defaults to the timestamp when the record is created.

- **updated_at**  
  DATETIME, mandatory.  
  Automatically updated whenever the record is modified.

#### Constraints and Rules
- Primary key on `customer_id`
- Unique constraint on `email`
- Unique constraint on `phone_e164`
- Allowed values for `status`: `ACTIVE`, `SUSPENDED`, `CLOSED`
- `phone_e164` must be either NULL or match the E.164 format
- Index exists on `last_name` to support search and lookup use cases

---

### 4.2 Account

The `account` table represents a bank account owned by a customer.  
Each account belongs to exactly one customer.

#### Attributes
- **account_id**  
  BIGINT, primary key, auto-generated.  
  Uniquely identifies an account.

- **customer_id**  
  BIGINT, mandatory.  
  References the owning customer.

- **iban**  
  VARCHAR(34), mandatory.  
  International Bank Account Number.

- **account_type**  
  VARCHAR(20), mandatory.  
  Describes the type of account (e.g. current, savings).

- **balance**  
  DECIMAL(15,2), mandatory, default value = 0.00.  
  Represents the current account balance.

- **currency**  
  CHAR(3), mandatory, default value = `EUR`.  
  ISO currency code.

- **status**  
  VARCHAR(20), mandatory, default value = `ACTIVE`.  
  Represents the lifecycle state of the account.

- **created_at**  
  DATETIME, mandatory.  
  Defaults to the timestamp when the record is created.

- **updated_at**  
  DATETIME, mandatory.  
  Automatically updated whenever the record is modified.

#### Constraints and Rules
- Primary key on `account_id`
- Foreign key: `customer_id` references `customer(customer_id)`
- Unique constraint on `iban`
- `balance` must be greater than or equal to zero
- Allowed values for `status`: `ACTIVE`, `FROZEN`, `CLOSED`
- Index exists on `customer_id` to support customer-to-account lookups

---

### 4.3 Bank Transaction

The `bank_transaction` table represents a financial transaction executed on an account.  
Each transaction is linked to exactly one account.

#### Attributes
- **transaction_id**  
  BIGINT, primary key, auto-generated.  
  Uniquely identifies a transaction.

- **account_id**  
  BIGINT, mandatory.  
  References the account on which the transaction occurred.

- **amount**  
  DECIMAL(15,2), mandatory.  
  Transaction amount.

- **currency**  
  CHAR(3), mandatory, default value = `EUR`.  
  ISO currency code.

- **direction**  
  VARCHAR(10), mandatory.  
  Indicates whether funds are incoming or outgoing.

- **description**  
  VARCHAR(255), optional.  
  Free-text transaction description.

- **booked_at**  
  DATETIME, mandatory.  
  Defaults to the timestamp when the transaction is recorded.

#### Constraints and Rules
- Primary key on `transaction_id`
- Foreign key: `account_id` references `account(account_id)`
- `amount` must be greater than zero
- Allowed values for `direction`: `IN`, `OUT`
- Index exists on `account_id`
- Index exists on `booked_at` to support time-based queries


## 5. Data Integrity Rules

* Foreign key relationships must be respected
* Deleting a customer with existing accounts is restricted by foreign key constraints
* Deleting an account with existing transactions is restricted by foreign key constraints

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
