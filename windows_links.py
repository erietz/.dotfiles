#!/usr/bin/env python3

#-------------------------------------------------------------------------------
# Author: Ethan Rietz
# Date: Wed Apr 14 13:59:12 CDT 2021
# Description:
#   Create symlinks to Windows directories from WSL directories
#   Note: Must be run from command prompt as administrator
#-------------------------------------------------------------------------------

from pathlib import Path, WindowsPath
import subprocess

path_pairs = [
    (
        '/mnt/c/Users/ewrie/AppData/Local/nvim/',
        '/home/ethan/.ewr/config/nvim/'
    ),
    (
        '/mnt/c/Users/ewrie/AppData/Roaming/alacritty/',
        '/home/ethan/.ewr/config/alacritty/'
    ),
]

def sanitize_path_pairs(path_pairs):
    new_pairs = []
    for pair in path_pairs:
        dos_path = Path(pair[0])
        wsl_path = Path(pair[1])
        dos_path = Path(*dos_path.parts[3:])
        dos_path = WindowsPath('C:\\') / WindowsPath(dos_path)
        wsl_path = WindowsPath('\\\\wsl$\\Ubuntu') / WindowsPath(wsl_path)
        new_pairs.append([dos_path, wsl_path])
    return new_pairs

def create_links(cleansed_path_pairs):
    for pair in cleansed_path_pairs:
        if not pair[0].exists():
            if pair[1].is_dir():
                cmd = f'mklink /D {pair[0]} {pair[1]}'.split()
            else:
                cmd = f'mklink {pair[0]} {pair[1]}'.split()
            print('Running this command: ',  ' '.join(cmd))
            subprocess.run(['cmd.exe', '/c'] + cmd, shell=True)
        else:
            print(pair[0], 'already exists .... no link created')

cleansed_path_pairs = sanitize_path_pairs(path_pairs)

create_links(cleansed_path_pairs)

#for i in cleansed_path_pairs:
#    print(i)
