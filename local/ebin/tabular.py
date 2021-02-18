#!/usr/bin/env python3

import pandas as pd
import sys

file = sys.argv[1]
prompt = '''What kind of delimiter does the file have? '''
delimeter = input(prompt)

df = pd.read_csv(file, delimiter=delimeter)
print('\n')
print(df.to_latex())