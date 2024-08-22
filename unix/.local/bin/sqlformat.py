#!/usr/bin/env python

import sys
import sqlparse

def format_sql(sql_code):
    return sqlparse.format(sql_code, reindent=True, keyword_case='upper')

def main():
    sql_code = sys.stdin.read()
    formatted_sql = format_sql(sql_code)
    print(formatted_sql)

if __name__ == '__main__':
    main()
