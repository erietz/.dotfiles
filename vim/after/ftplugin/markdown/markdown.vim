" Custom configurations for markdown files """"""""""""""""""""

"set textwidth=80 	" force text to new line after 80 characters

" Compile markdown into pdf
map <leader>c :w<CR>:!pandoc % -o <c-r>%<backspace><backspace>pdf<CR><CR>

" Open Markdown file in Chrome
map <leader>v :!open -a "Brave Browser" %<CR><CR>

set spell
let g:table_mode_corner='|'
