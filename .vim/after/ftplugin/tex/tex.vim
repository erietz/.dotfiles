""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufWinLeave *.tex !latexmk -c
"autocmd VimLeave !latexmk -c

set textwidth=105 	" force text to new line after 80 characters

autocmd BufNewFile,BufRead *.cls set syntax=tex
map <leader>c :w<CR><space>:!latexmk -pdf %<CR>
"map  :w<CR><space>:!latexmk -pdf %<CR>
"<CR>

set spell

" Environment commands
inoremap <leader>tab \begin{tabular}{}<Enter><++><Enter>
	\ <Esc>hxi\end{tabular}<CR><CR><++><Esc>4kA<Esc>i
inoremap <leader>fig \begin{figure}<CR>\centering<CR>
	\ \includegraphics[width=\textwidth]{}<CR>\caption{<++>}<CR>\label{<++>}
	\ <CR>\end{figure}<ESC>3kf}i
inoremap <leader>sec \section{}<Enter><Enter><++><Esc>2k0f}i
inoremap <leader>ssec \subsection{}<Enter><Enter><++><Esc>2k0f}i
inoremap <leader>sssec \subsubsection{}<Enter><Enter><++><Esc>2k0f}i
inoremap <leader>beg \begin{}<Enter><++><Enter>\end{<++>}<Enter><Enter><++><Esc>4k0f}i
inoremap <leader>com <Esc>I%<space><Esc>O<Esc>80i%<Esc>yyjp
inoremap <leader>bf \textbf{}<Esc>i
inoremap <leader>it \textit{}<Esc>i
inoremap <leader>tt \texttt{}<Esc>i
inoremap <leader>sc \textsc{}<Esc>i
inoremap <leader>em \emph{}<Esc>i

