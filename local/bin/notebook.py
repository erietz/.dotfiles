#!/usr/bin/env python

import datetime
import os
import sys

today = str(datetime.date.today())

cwd = os.getcwd()
directory = '/Users/ethan/Dropbox/notebook/'
entries = directory + 'content'
formatting = directory + 'inputs/formatting.md'
combinedFile = directory + 'notebook.md'
combinedPDF = directory + 'notebook.pdf'

def compiler():
    os.chdir(directory)
    combined = open(combinedFile, 'w')
    with open(formatting, 'r') as f:
        for line in f:
            combined.write(line)
    for file in sorted(os.listdir(entries)):
        if file.endswith('.md'):
            temp = os.path.join(entries, file)
            temp = open(temp, 'r')
            for line in temp:
                combined.write(line)
            combined.write('\n')
            temp.close()
    combined.close()
    os.system('pandoc %s -o %s' %(combinedFile, combinedPDF))
    os.chdir(cwd)

def file_namer():
    tag = input('Name for file: ')
    tag = tag.replace(' ','') # Get rid of spaces
    filename = today + '_' + tag + '.md'
    global longFileName
    longFileName = os.path.join(entries, filename)

# Creates a file using the variable name created by "file_namer", and opens the
# file with vim

def file_creator(filePath):
    theFile = open(longFileName, 'w')
    theFile.write('# %s <++>' %today)
    theFile.close()
    os.system('vim %s' %longFileName)
    #os.system('open -a MacVim %s' %longFileName)

#------------------------------------------------------------------------------- 
# The main script
#------------------------------------------------------------------------------- 

if len(sys.argv) > 1:
    if "-c" in sys.argv:
        compiler()
        sys.exit()
    #sys.argv[1] == "-c":
    #compiler()
    #sys.exit()

# Creates a name for the file
file_namer()

# Check to see if the file name already exists
exists = os.path.isfile(longFileName)

if exists:
    print('File already exists, pick a new name for file')
    # Create a new filename
    file_namer()
    # Creat file with the new filename
    file_creator(longFileName)
    #compiler()
else:
    # If there isn't already a file, make one and open it up
    file_creator(longFileName)
    #compiler()


