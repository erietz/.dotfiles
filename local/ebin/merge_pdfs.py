#!/usr/bin/env python3

import sys
from PyPDF2 import PdfFileMerger

def colored(string, color):
    colors = dict(
        HEADER = '\033[95m',
        OKBLUE = '\033[94m',
        OKCYAN = '\033[96m',
        OKGREEN = '\033[92m',
        WARNING = '\033[93m',
        FAIL = '\033[91m',
        ENDC = '\033[0m',
        BOLD = '\033[1m',
        UNDERLINE = '\033[4m',
    )
    return f'{colors[color]}{string}{colors["ENDC"]}'

if len(sys.argv) < 3:
    raise ValueError('Usage: ' + colored(f"{sys.argv[0]} <file1.pdf> <file2.pdf> <output_file.pdf>", 'OKBLUE'))


print(f'You are about to ' + colored("CLOBBER", 'FAIL') + f' any files named {sys.argv[-1]}')
proceed = input('Do you want to continue? [y/n] ')
if proceed.lower() != 'y':
    sys.exit('Aborted by user')

pdfs = sys.argv[1:-1]
output_pdf = sys.argv[-1]

merger = PdfFileMerger()

for pdf in pdfs:
    merger.append(pdf)

merger.write(output_pdf)
merger.close()
