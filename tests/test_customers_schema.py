def test_customers_table_exists(db_cursor):
    db_cursor.execute("""
        SELECT COUNT(*)
        FROM information_schema.tables
        WHERE table_schema = 'banking_testing'
          AND table_name = 'customer';
    """)
    result = db_cursor.fetchone()
    assert result[0] == 1


def test_customers_has_email_column(db_cursor):
    db_cursor.execute("""
        SELECT COUNT(*)
        FROM information_schema.columns
        WHERE table_schema = 'banking_testing'
          AND table_name = 'customer'
          AND column_name = 'email';
    """)
    result = db_cursor.fetchone()
    assert result[0] == 1