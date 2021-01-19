nnoremap <leader>tf :call GotoBuffer(0)<CR>
nnoremap <leader>td :call GotoBuffer(1)<CR>
nnoremap <leader>ts :call GotoBuffer(2)<CR>
nnoremap <leader>ta :call GotoBuffer(3)<CR>

nnoremap <leader>tp :call GotoBuffer(0)<CR><c-\><c-n><bar>:sbuffer #<bar>:call SendTerminalCommand(0, "ipython --no-autoindent" . "\n")<CR>
vnoremap <c-c><c-c> "zy :call SendTerminalCommand(0, @z)<CR>
nnoremap <c-c><c-c> :update<bar>:call SendTerminalCommand(0, "%run " . expand("%") . "\n")<CR>

