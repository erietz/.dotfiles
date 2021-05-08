" Custom configurations for markdown files """"""""""""""""""""

"set textwidth=80 	" force text to new line after 80 characters

" Compile markdown into pdf
"map <leader>c :w<CR>:!pandoc % -o <c-r>%<backspace><backspace>pdf<CR><CR>
<<<<<<< HEAD
=======

let b:dispatch = 'pandoc % -o %<.pdf'
>>>>>>> 35e1f9a67e33085e8d7185d3a20a9786c949649c

" Open Markdown file in browser
map <leader>v :!open -a "$BROWSER" %<CR><CR>

set spell
set tabstop=2 softtabstop=2 shiftwidth=2 smartindent expandtab smarttab
