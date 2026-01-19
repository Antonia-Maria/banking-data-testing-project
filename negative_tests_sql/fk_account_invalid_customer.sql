USE banking_testing;

-- Expected result:
-- This INSERT must fail because customer_id does not exist in customer table
INSERT INTO account (
    customer_id,
    iban,
    account_type,
    balance
)
VALUES (
    999999,
    'RO49AAAA1B31007593840000',
    'CURRENT',
    100.00
);
