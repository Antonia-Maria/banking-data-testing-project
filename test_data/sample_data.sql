-- =========================================================
-- Test Data: sample_data.sql
-- Purpose:
--   Controlled dataset for automated tests.
-- Notes:
--   Run only AFTER the schema has been created.
-- =========================================================

-- (Optional) Use a dedicated database for testing:
-- CREATE DATABASE banking_test;
-- USE banking_test;

-- -------------------------
-- Clean-up (optional)
-- -------------------------
-- IMPORTANT: These deletes assume tables already exist.
-- We will finalize cleanup strategy after schema is complete.
-- DELETE FROM transaction;
-- DELETE FROM account;
-- DELETE FROM customer;

-- -------------------------
-- Positive dataset (valid)
-- -------------------------
-- Customers (valid)
-- INSERT INTO customer (...) VALUES (...);

-- Accounts (valid)
-- INSERT INTO account (...) VALUES (...);

-- Transactions (valid)
-- INSERT INTO transaction (...) VALUES (...);

-- -------------------------
-- Negative dataset (invalid)
-- -------------------------
-- Duplicate email (should fail, UNIQUE constraint)
-- INSERT INTO customer (...) VALUES (...);

-- Transaction with non-existing account_id (should fail, FK constraint)
-- INSERT INTO transaction (...) VALUES (...);

-- Negative amount / invalid business rule (should fail either by CHECK or by test)
-- INSERT INTO transaction (...) VALUES (...);
