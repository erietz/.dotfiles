"-------------------------------------------------------------------------------
" Author      : Ethan Rietz
" Date        : 02-07-2022
" Description : Setting for neovim-qt on Windows
"-------------------------------------------------------------------------------

" don't start in a rediculous directory
cd $HOME

GuiFont! JetBrainsMono NF:h13

" get rid of ugly gui for autocompletion  
GuiPopupmenu 0

" get rid of ugly gui for autocompletion  
GuiTabline 0

" make cursor always a block
set guicursor=i:block
