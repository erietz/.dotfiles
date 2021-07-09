local map = vim.api.nvim_set_keymap
local noremap = {noremap = true}
local silent_noremap = {noremap = true, silent = true}

-- Changing Window splits
map('n', '<c-h>', ':wincmd h<CR>', silent_noremap)
map('n', '<c-j>', ':wincmd j<CR>', silent_noremap)
map('n', '<c-k>', ':wincmd k<CR>', silent_noremap)
map('n', '<c-l>', ':wincmd l<CR>', silent_noremap)

-- Toggle quickfix
map('n', '<leader>q', ':copen<CR>', noremap)
map('n', '<leader>l', ':lopen<CR>', noremap)
map('n', '<leader>c', ':cclose<bar>lclose<CR>', noremap)

-- Yank to clipboard
if vim.fn.has('mac') == 1 then
  map('v', '<leader>y', '"*y', noremap)
  map('v', '<leader>p', '"*p', noremap)
else
  map('v', '<leader>y', '"+y', noremap)
  map('v', '<leader>p', '"+p', noremap)
end

-- Delete without fudging registers
map('v', '<leader>d', '"_d', noremap)
map('n', '<leader>d', '"_d', noremap)

-- Navigation
map('n', ']q', ':cnext<CR>zz', noremap)
map('n', '[q', ':cprev<CR>zz', noremap)
map('n', ']l', ':lnext<CR>zz', noremap)
map('n', '[l', ':lprev<CR>zz', noremap)
map('n', ']b', ':bnext<CR>zz', noremap)
map('n', '[b', ':bprev<CR>zz', noremap)
map('n', ']t', ':tnext<CR>zz', noremap)
map('n', '[t', ':tprev<CR>zz', noremap)

-- Resize windows
map('n', '<Left>', ':vertical resize -2', noremap)
map('n', '<Right>', ':vertical resize +2', noremap)
map('n', '<Up>', ':resize -2', noremap)
map('n', '<Down>', ':resize +2', noremap)

-- View current file and current directory
map('n', '<leader>fv', ':Vex<bar> set winfixwidth<CR>', noremap)
map('n', '<leader>dv', ':Lex<bar> set winfixwidth<CR>', noremap)

--[[ todo
" Adding comments until end of line---------------------------------------------
nnoremap <leader>- 80A-<esc>81<bar>d$_<cr>
nnoremap <leader>_ 50A-<esc>51<bar>d$_<cr>

" Terminal mappings
tnoremap <leader><Esc> <c-\><c-n>
tnoremap <Esc><Esc> <c-\><c-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Clean up whitespace
function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction

command! TrimWhitespace call TrimWhitespace()

function Cheat(query)
  let query = 'cheat.sh/' . a:query
  execute 'split | term curl ' . query
  execute 'resize ' . string(&lines/3)
endfunction

command! -nargs=1 CheatSh call Cheat(<q-args>)
nnoremap <leader>h :CheatSh <C-R>=&filetype<CR>/

function Retab()
  " change all four spases to a tab
  set ts=4 sts=4 noet
  retab!
  " change all tabs to two spaces
  set ts=2 sts=2 et
  retab
endfunction
--]]

-- Telescope
map('n', '<leader>ff', [[:lua require('telescope.builtin').find_files()<cr>]], noremap)
map('n', '<leader><leader>', [[:lua require('telescope.builtin').git_files()<cr>]], noremap)
map('n', '<leader>fg', [[:lua require('telescope.builtin').live_grep()<cr>]], noremap)
map('n', '<leader>fb', [[:lua require('telescope.builtin').buffers()<cr>]], noremap)
map('n', '<leader>fd', [[:lua require('telescope.builtin').file_browser()<cr>]], noremap)
map('n', '<leader>fh', [[:lua require('telescope.builtin').help_tags()<cr>]], noremap)
map('n', '<leader><CR>', ':lua dotfiles()<cr>', noremap)

function dotfiles()
  require('telescope.builtin').find_files({
    follow = true,
    hidden = true,
    search_dirs = {
      "$HOME/.ewr/",
    }
  })
end

-- vim-test
map('n', '<leader>tn', ':TestNearest<cr>', noremap)
map('n', '<leader>ts', ':TestSuite<cr>', noremap)
map('n', '<leader>tf', ':TestFile<cr>', noremap)
map('n', '<leader>tl', ':TestLast<cr>', noremap)
map('n', '<leader>tv', ':TestVisit<cr>', noremap)
