-- Foreign key test - Invalid account_id

INSERT INTO bank_transaction (
    account_id,
    amount,
    currency,
    direction,
    description
)
VALUES (
    999999,
    50.00,
    'EUR',
    'IN',
    'Test transaction with invalid account_id'
);


-- Description constraint test - invalid description

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
    'SIDEWAYS',
    'Invalid direction test'
);