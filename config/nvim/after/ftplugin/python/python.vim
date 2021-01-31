"setlocal tabstop=4
"setlocal softtabstop=4
"setlocal shiftwidth=4
""setlocal textwidth=80
"setlocal smarttab
"setlocal expandtab
"set autoindent
"set fileformat=unix

nnoremap <leader>c :w<CR>:!clear<CR>:!python3 %<CR>


" Additions to Vim's filetype plugin for Python, to set up PyUnit as
" the 'compiler' for Python files.

" Set the errorformat.
"compiler pyunit

" Set 'makeprg': this allows you to call :make on any .py file and
" run all of the unit tests in the current working directory.
" Ensure you have this file.
"
"setlocal makeprg=${HOME}/.ewr/local/ebin/alltests.py



if !exists("current_compiler")
  compiler python
endif
