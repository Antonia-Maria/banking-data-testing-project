USE banking_testing;

DROP TABLE IF EXISTS customer;

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
