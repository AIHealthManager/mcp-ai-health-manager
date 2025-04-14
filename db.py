from typing import Any, Optional, Tuple, List

import psycopg2
from psycopg2.extensions import connection

from config import DB_USER, DB_PASSWORD, DB_HOST, DB_PORT, DB_NAME


class DatabaseConfig:
    def __init__(self, user: str, password: str, host: str, port: int, dbname: str):
        self.user = user
        self.password = password
        self.host = host
        self.port = port
        self.dbname = dbname

    def connect(self) -> connection:
        return psycopg2.connect(
            user=self.user,
            password=self.password,
            host=self.host,
            port=self.port,
            dbname=self.dbname,
        )

    def execute(
        self,
        query: str,
        params: Optional[Tuple[Any, ...]] = None,
        fetch: bool = False,
    ) -> Optional[List[Tuple[Any, ...]]]:
        conn = self.connect()
        try:
            with conn:
                with conn.cursor() as cur:
                    cur.execute(query, params)
                    if fetch:
                        return cur.fetchall()
        finally:
            conn.close()


db = DatabaseConfig(
    user=DB_USER, password=DB_PASSWORD, host=DB_HOST, port=DB_PORT, dbname=DB_NAME
)
