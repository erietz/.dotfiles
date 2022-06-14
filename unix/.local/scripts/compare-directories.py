#!/usr/bin/env python3

import sys
from pathlib import Path

dir1 = Path(sys.argv[1]).resolve()
dir2 = Path(sys.argv[2]).resolve()

if not (dir1.is_dir() and dir2.is_dir()):
    raise ValueError("Both arguments must be directories")

dir1_files = set([f.relative_to(dir1) for f in dir1.glob("**/*")])
dir2_files = set([f.relative_to(dir2) for f in dir2.glob("**/*")])

if dir1_files == dir2_files:
    print('The directries are the exact same!')
else:
    dir1_only_files = dir1_files.difference(dir2_files)
    dir2_only_files = dir2_files.difference(dir1_files)

    linewidth=80
    print('='*linewidth)
    print(f'Files in {dir1} not in {dir2}')
    print('='*linewidth)
    print(*dir1_only_files, sep='\n')

    print()

    print('='*linewidth)
    print(f'Files in {dir2} not in {dir1}')
    print('='*linewidth)
    print(*dir2_only_files, sep='\n')
