DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS bank_transaction;


-- CUSTOMER master data (one row per customer)
CREATE TABLE customer (
    customer_id      BIGINT AUTO_INCREMENT PRIMARY KEY,

    first_name       VARCHAR(100) NOT NULL,
    last_name        VARCHAR(100) NOT NULL,

    date_of_birth    DATE NOT NULL,

    email            VARCHAR(254),
    phone_e164       VARCHAR(20),

    status           VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT uq_customer_email UNIQUE (email),
    CONSTRAINT uq_customer_phone UNIQUE (phone_e164),

    CONSTRAINT chk_customer_status
        CHECK (status IN ('ACTIVE', 'SUSPENDED', 'CLOSED')),

    CONSTRAINT chk_customer_phone_format
        CHECK (phone_e164 IS NULL OR phone_e164 REGEXP '^\\+[1-9][0-9]{7,14}$')
);

CREATE INDEX idx_customer_last_name ON customer (last_name);


-- ACCOUNT master data (one row per account)

CREATE TABLE account (
    account_id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id  BIGINT NOT NULL,

    iban         VARCHAR(34) NOT NULL,
    account_type VARCHAR(20) NOT NULL,

    balance      DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    currency     CHAR(3) NOT NULL DEFAULT 'EUR',

    status       VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_account_customer
        FOREIGN KEY (customer_id) REFERENCES customer(customer_id),

    CONSTRAINT uq_account_iban UNIQUE (iban),

    CONSTRAINT chk_account_status
        CHECK (status IN ('ACTIVE', 'FROZEN', 'CLOSED')),

    CONSTRAINT chk_account_balance
        CHECK (balance >= 0)
);

CREATE INDEX idx_account_customer_id ON account (customer_id);



-- TRANSACTION ledger (one row per money movement)
CREATE TABLE bank_transaction (
    transaction_id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    account_id       BIGINT NOT NULL,

    amount           DECIMAL(15,2) NOT NULL,
    currency         CHAR(3) NOT NULL DEFAULT 'EUR',

    direction        VARCHAR(10) NOT NULL,  -- 'IN' or 'OUT'
    description      VARCHAR(255),

    booked_at        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_tx_account
        FOREIGN KEY (account_id) REFERENCES account(account_id),

    CONSTRAINT chk_tx_direction
        CHECK (direction IN ('IN', 'OUT')),

    CONSTRAINT chk_tx_amount
        CHECK (amount > 0)
);

CREATE INDEX idx_tx_account_id ON bank_transaction (account_id);
CREATE INDEX idx_tx_booked_at ON bank_transaction (booked_at);
