import os
import mysql.connector
import pytest
from dotenv import load_dotenv

load_dotenv()

@pytest.fixture
def db_cursor():
    conn = mysql.connector.connect(
        host=os.getenv("DB_HOST", ""),
        user=os.getenv("DB_USER", ""),
        password=os.getenv("DB_PASSWORD", ""),
        database=os.getenv("DB_NAME", ""),
        port=int(os.getenv("DB_PORT", "")),
    )
    cursor = conn.cursor()
    yield cursor
    cursor.close()
    conn.close()
