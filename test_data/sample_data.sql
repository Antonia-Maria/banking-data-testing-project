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

USE banking_testing;

-- Clean existing test data (allows re-running this script)
DELETE FROM account;
DELETE FROM customer;

-- Insert a valid customer (generic English name, NL phone number)
INSERT INTO customer (
    first_name,
    last_name,
    date_of_birth,
    email,
    phone_e164
)
VALUES (
    'John',
    'Smith',
    '1988-06-15',
    'john.smith@example.com',
    '+31612345678'
);

-- Insert a valid account linked to the existing customer
-- Using a subquery avoids hardcoding customer_id values
INSERT INTO account (
    customer_id,
    iban,
    account_type,
    balance
)
VALUES (
    (SELECT customer_id FROM customer WHERE email = 'john.smith@example.com'),
    'NL91ABNA0417164300',
    'CURRENT',
    250.00
);

INSERT INTO bank_transaction (
    account_id,
    amount,
    currency,
    direction,
    description
)
VALUES (
    (SELECT account_id FROM account LIMIT 1),
    25.00,
    'EUR',
    'IN',
    'Valid transaction test'
);

