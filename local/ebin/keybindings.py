#!/usr/bin/env python
#
# Author      : Ethan Rietz
# Date        : 2021-07-21
# Description : Nasty script to display my i3 keybindings as an html table

import pandas as pd
import tempfile
import webbrowser

bindings = []
with open('/home/ethan/.config/i3/config', 'r') as f:
    for line in f:
        if line.startswith('bindsym'):
            line = line.strip().split()
            key = line[1]
            binding = ' '.join(line[2:])
            bindings.append((key, binding))

df = pd.DataFrame(bindings)
df = df.sort_values(by=0).reset_index(drop=True)

outfile = tempfile.NamedTemporaryFile(suffix='.html', mode='wt', delete=False)
print(outfile.name)

css = '''
body {
    margin: 0;
    font-family: Helvetica;
    text-align: center;
    background-color: #323232;
}
table.dataframe {
    text-align: left;
    margin-left: auto;
    margin-right: auto;
    width: 80%;
    border-collapse: collapse;
    border: none;
}
table.dataframe tr {
    border: none;
}
table.dataframe td, table.dataframe th {
    margin: 0;
    border: 1px solid white;
    padding-left: 0.25em;
    padding-right: 0.25em;
}
table.dataframe th:not(:empty) {
    background-color: grey;
    text-align: left;
    font-weight: normal;
}
table.dataframe tr:nth-child(2) th:empty {
    border-left: none;
    border-right: 1px dashed lightgrey;
}
table.dataframe td {
    padding: 0.5em;
    border: 2px solid lightgrey;
    background-color: #323232;
    color: lightgrey;
}
'''

html = '''
<!DOCTYPE html>
<html>
  <head>
    <style>
      {css}
    </style>
  </head>
  <body>
    {table}
  </body>
</html>
'''.format(css=css, table=df.to_html())

outfile.write(html)
outfile.close()

webbrowser.open('file:///' + outfile.name)
