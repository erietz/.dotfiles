"neoterm
"function! Chomp(string)
"    return substitute(a:string, '\n\+$', '', '')
"endfunction
"let g:neoterm_repl_python = Chomp(system('which jupyter')) . ' console'

"let g:neoterm_default_mod = 'botright'
vnoremap <c-c><c-c> :TREPLSendSelection<CR>
nnoremap <c-c><c-d> ?#--wwVNbb:TREPLSendSelection<CR>
