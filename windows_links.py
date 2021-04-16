#!/usr/bin/env python3
#-------------------------------------------------------------------------------
# Author: Ethan Rietz
# Date: 04/16/2021
# Description: Symlink my dotfiles manually on Windows
#-------------------------------------------------------------------------------

import sys
import os
from pathlib import WindowsPath

if sys.argv[1] == 'for-real':
    DRY_RUN=False
else:
    DRY_RUN=True
    print('------------------------------DRY RUN------------------------------')

PATH_PAIRS = [
    {
        'git_file': 'C:/Users/ewrie/git/.ewr/config/nvim/',
        'win_file': 'C:/Users/ewrie/AppData/Local/nvim/',
    },
    {
        'git_file': 'C:/Users/ewrie/git/.ewr/config/alacritty/',
        'win_file': 'C:/Users/ewrie/AppData/Roaming/alacritty/',
    },
]

def sanitize_paths(path_pairs):
    new_pairs = []
    for pair in path_pairs:
        new_dict = {}
        for key,value in pair.items():
            new_dict[key] = WindowsPath(value)
        new_pairs.append(new_dict)
    return new_pairs

def create_links(path_pairs, dry_run=True):
    fail = '\033[91m'
    endc = '\033[0m'
    for pair in path_pairs:
        win_file = pair['win_file']
        git_file = pair['git_file']
        if not win_file.exists() and git_file.exists():
            if dry_run:
                print('Create link', win_file, '--->', git_file)
            else:
                os.symlink(git_file, win_file)
        else:
            print(f'{fail}Already exists...{win_file}...no link created{endc}')
    return None

if __name__ == '__main__':
    clean_path_pairs = sanitize_paths(PATH_PAIRS)
    create_links(clean_path_pairs, dry_run=DRY_RUN)
