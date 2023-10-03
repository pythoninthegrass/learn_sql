#!/usr/bin/env python3

import pandas as pd
import psycopg2 as pg
import sys
from decouple import config
from mysql.connector import connect, Error
from pathlib import Path
from sqlalchemy import create_engine

db_engine = "mysql"

db_name = config("DB")
db_host = config("DB_URL")
db_user = config("DB_USER")
db_pass = config("DB_PASSWORD")

# TODO: test postgres

if db_engine == "mysql":
    db_port = config("MYSQL_PORT")
    try:
        with connect(
            host=config('DB_URL'),
            user=config('DB_USER'),
            password=config('DB_PASSWORD'),
            database=config('DB')
        ) as conn:
            print(conn)
    except Error as e:
        print(e)
elif db_engine == "postgres":
    db_port = config("POSTGRES_PORT")
    try:
        with pg.connect(
            database=db_name,
            host=db_host,
            user=db_user,
            password=db_pass,
            port=db_port
        ) as conn:
            print(conn)
    # TODO: remove bare except
    except Exception as e:
        print(e)


def read_csv(filename):
    """Reads a csv file and returns a dataframe"""
    try:
        df = pd.read_csv(filename)
        return df
    except FileNotFoundError:
        print("File not found")


def import_csv(filename, table_name):
    """Imports a csv file into a database table"""
    df = read_csv(filename)
    if df is not None:
        try:
            if db_engine == "mysql":
                engine = create_engine(
                    f"mysql+pymysql://{db_user}:{db_pass}@{db_host}:{db_port}/{db_name}")
            elif db_engine == "postgres":
                engine = create_engine(
                    f"postgresql://{db_user}:{db_pass}@{db_host}:{db_port}/{db_name}")
            df.to_sql(
                table_name,
                engine,
                if_exists='replace',
                index=False)
            print("Data imported successfully")
        except Exception as e:
            print(e)


def main():
    """Main function"""
    if len(sys.argv) == 3:
        filename = sys.argv[1]
        table_name = sys.argv[2]
        import_csv(filename, table_name)
    else:
        print("Usage: python3 import_data.py <csv_file> <table_name>")


if __name__ == "__main__":
    main()
