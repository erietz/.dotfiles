nnoremap <leader>tt :call GotoBuffer(0)<CR><c-\><c-n><bar>:sbuffer #<CR>
nnoremap <leader>tf :call GotoBuffer(0)<CR>
nnoremap <leader>td :call GotoBuffer(1)<CR>
nnoremap <leader>ts :call GotoBuffer(2)<CR>
nnoremap <leader>ta :call GotoBuffer(3)<CR>

nnoremap <leader>tp :call GotoBuffer(0)<CR><c-\><c-n><bar>:sbuffer #<bar>:call SendTerminalCommand(0, "ipython --no-autoindent" . "\n")<CR>
vnoremap <c-c><c-c> "zy :call SendTerminalCommand(0, @z)<CR>
"nnoremap <c-c><c-c> :update<bar>:call SendTerminalCommand(0, "%run " . expand("%") . "\n")<CR>
nnoremap <c-c><c-d> mz/\(# In\[.*\]:\)\\|\(\%$\)<CR>NjVnk:w! ~/.tmp_please_delete<CR>:call SendTerminalCommand(0, "%run " . "~/.tmp_please_delete" . "\n")<CR>`z

autocmd FileType c nnoremap <c-c><c-c> :update<bar>:call SendTerminalCommand(0, "gcc " . expand("%") . " && ./a.out" . "\n")<CR>



function GetInDelimeter()
    " TODO: pass in the delimeter as an argument so different delimeters can
    " be used

    " save original cursor position cuz search command moves cursor
    let save_pos = getpos(".")
    " get line number of delimeter before cursor
    let last_delim = search('# In\[.*\]:', 'b')
    " return cursor to original position
    call setpos('.', save_pos)
    " get line number of delimeter after cursor (or end of file)
    let next_delim = search('\(# In\[.*\]:\|\%$\)')
    " return cursor to original position
    call setpos('.', save_pos)
    " cell is a list of all the lines between the delimeters
    let cell = nvim_buf_get_lines(0, last_delim + 1, next_delim - 1, v:false)
    " remove all of the blank lines to not clog up the repl feed as much
    let cell = filter(cell, '!empty(v:val)')
    " if last line is indented, add a new line so the repl enters text
    " correctly 
    if cell[-1][0] == " "
        let cell = cell + [" "]
    endif
    " returns a string separated by new line characters
    return join(cell, "\n") . "\n"
endfunction

nnoremap <c-c><c-d> :update <bar> call SendTerminalCommand(0, GetInDelimeter())<CR>
