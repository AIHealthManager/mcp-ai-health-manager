from os import environ
from dotenv import load_dotenv

load_dotenv()

DB_USER = environ["DB_USER"]
DB_PASSWORD = environ["DB_PASSWORD"]
DB_HOST = environ["DB_HOST"]
DB_PORT = environ["DB_PORT"]
DB_NAME = environ["DB_NAME"]
