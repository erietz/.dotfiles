let mapleader=" "
let maplocalleader=","

" Yank to clipboard
vnoremap <leader>y "*y

" Easier to save 
inoremap ;w :w<Enter>
nnoremap ;w :w<Enter>
	
" Status line
set laststatus=2 			" Always show status line
set statusline=%F 			" Full path to file
"set statusline+=%= 			" Switch to right aligned
"set statusline+=line\ %l\ of\ %L 	" Current line / total lines

" Quickly edit/reload vimrc
nnoremap <silent> <leader>ev :vsplit ~/.config/nvim/init.vim <CR>
nnoremap <silent> <leader>sv :so ~/.config/nvim/init.vim <CR>

" Changing window splits
nnoremap <c-h> :wincmd h<CR>
nnoremap <c-j> :wincmd j<CR>
nnoremap <c-k> :wincmd k<CR>
nnoremap <c-l> :wincmd l<CR>
nnoremap <A-l> <C-w>>
nnoremap <A-h> <C-w><
nnoremap <leader>f <C-w>f<C-w>L

" Formatting paragraphs
nnoremap <leader>q gqap

" Moving of code blocks
vnoremap < <gv  
vnoremap > >gv  

" Adding comments until end of line
nnoremap <leader>- :set ri<cr>80A-<esc>81<bar>d$0:set nori<cr>

command! CommonFiles call fzf#run({'source': 'cat ~/.vim/rc_files/common_files.txt', 'sink': 'e'})
nnoremap <leader>e :CommonFiles<CR>

nnoremap <leader>r :Run<CR>
vnoremap <leader>r :Run<CR>

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
