#!/usr/bin/env python3
#-------------------------------------------------------------------------------
# Author: Ethan Rietz
# Date: 04/16/2021
# Description: Symlink my dotfiles manually on Windows
#-------------------------------------------------------------------------------

import sys
import os
from pathlib import WindowsPath

PATH_PAIRS = [
    {
        'git_file': 'C:/Users/ewrie/.ewr/config/nvim/',
        'win_file': 'C:/Users/ewrie/AppData/Local/nvim/',
    },
    {
        'git_file': 'C:/Users/ewrie/.ewr/vim/',
        'win_file': 'C:/Users/ewrie/vimfiles/',
    },
    {
        'git_file': 'C:/Users/ewrie/.ewr/vim/',
        'win_file': 'C:/Users/ewrie/.vim/',
    },
    {
        'git_file': 'C:/Users/ewrie/.ewr/config/alacritty/',
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
    for pair in path_pairs:
        win_file = pair['win_file']
        git_file = pair['git_file']
        if not win_file.exists() and git_file.exists():
            if dry_run:
                print(f'Create link {win_file} ---> {git_file}')
            else:
                os.symlink(git_file, win_file)
                print(f'Link Created{win_file} ---> {git_file}')
        else:
            if not git_file.exists():
                print(f'File does not exists...{git_file}...no link created')
            elif win_file.exists():
                print(f'Already exists...{win_file}...no link created')
            else:
                print(f'YOU ARE COMPLETELY STUPID')
    return None

def clean():
    clean_path_pairs = sanitize_paths(PATH_PAIRS)
    for pair in clean_path_pairs:
        try:
            the_file = pair['win_file'] 
            the_file.unlink()
            print(f'Unlinking {the_file}')
        except FileNotFoundError:
            print(f'Error {the_file} does not exist')

def main(dry_run=True):
    clean_path_pairs = sanitize_paths(PATH_PAIRS)
    create_links(clean_path_pairs, dry_run=dry_run)

if __name__ == '__main__':
    if len(sys.argv) > 1:
        if sys.argv[1] == '--for-realz':
            main(dry_run=False)
        elif sys.argv[1] == '--clean':
            clean()
    else:
        print('------------------------------DRY RUN------------------------------')
        main()
