#!/bin/bash

# vim-anywhere was a good idea, so I stole some things from it.

TMPFILE_DIR=/tmp/vim-anywhere
TMPFILE=$TMPFILE_DIR/doc-$(date +"%y%m%d%H%M%S").md

mkdir -p $TMPFILE_DIR
touch $TMPFILE

vim $TMPFILE

pbcopy < $TMPFILE
