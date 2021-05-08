nnoremap <leader>ma :update<bar>TerminatorSendToTerminal make<CR>
nnoremap <leader>mt :update<bar>TerminatorSendToTerminal make test<CR>
nnoremap <leader>mc :update<bar>TerminatorSendToTerminal make clean<CR>
nnoremap <leader>mr :update<bar>TerminatorSendToTerminal make run<CR>

"let g:terminator_split_location = 'vertical botright'
"let g:terminator_repl_delimiter_regex = '--'
let g:terminator_auto_shrink_output = 1
let g:terminator_runfile_map = { 'python': 'python3' }

nnoremap <leader>rpf :call terminator#send_to_terminal("pytest " . expand("%") . " -k " . expand("<cword>") . "\n") <CR>
