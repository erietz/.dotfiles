#!/usr/bin/env python3

from pathlib import Path
import sys

dir1 = Path(sys.argv[1])
dir2 = Path(sys.argv[2])

if not (dir1.is_dir() and dir2.is_dir()):
    raise ValueError('Both arguments must be directories')

dir1_files = set(dir1.glob('**/*'))
dir2_files = set(dir2.glob('**/*'))

if dir1_files == dir2_files:
    print('The directries are the exact same!')
    sys.exit()
else:
    dir1_only_files = dir1_files.difference(dir2_files)
    dir2_only_files = dir2_files.difference(dir1_files)
    linewidth=80
    print('-'*linewidth, f'Files in {dir1} not in {dir2}', '-'*linewidth, *dir1_only_files, sep='\n')
    print('')
    print('-'*linewidth, f'Files in {dir2} not in {dir1}', '-'*linewidth, *dir2_only_files, sep='\n')
