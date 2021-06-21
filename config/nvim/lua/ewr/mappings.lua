-- Changing Window splits
vim.api.nvim_set_keymap( 'n', '<c-h>', ':wincmd h<CR>', {
  noremap = true,
  silent = true
})
vim.api.nvim_set_keymap( 'n', '<c-j>', ':wincmd j<CR>', {
  noremap = true,
  silent = true
})
vim.api.nvim_set_keymap( 'n', '<c-k>', ':wincmd k<CR>', {
  noremap = true,
  silent = true
})
vim.api.nvim_set_keymap('n', '<c-l>', ':wincmd l<CR>', {
  noremap = true,
  silent = true
})

-- Toggle quickfix
vim.api.nvim_set_keymap('n', '<leader>q', ':copen<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>l', ':lopen<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>c', ':cclose<bar>lclose<CR>', {noremap = true})

--[[ TODO
" Yank to clipboard
vnoremap <leader>y "+y

" delete but don't yank
vnoremap <leader>d "_d

" paste without 
vnoremap <leader>p "_dP
--]]

-- Navigation
vim.api.nvim_set_keymap('n', ']q', ':cnext<CR>zz', {noremap = true})
vim.api.nvim_set_keymap('n', '[q', ':cprev<CR>zz', {noremap = true})
vim.api.nvim_set_keymap('n', ']l', ':lnext<CR>zz', {noremap = true})
vim.api.nvim_set_keymap('n', '[l', ':lprev<CR>zz', {noremap = true})
vim.api.nvim_set_keymap('n', ']b', ':bnext<CR>zz', {noremap = true})
vim.api.nvim_set_keymap('n', '[b', ':bprev<CR>zz', {noremap = true})
vim.api.nvim_set_keymap('n', ']t', ':tnext<CR>zz', {noremap = true})
vim.api.nvim_set_keymap('n', '[t', ':tprev<CR>zz', {noremap = true})

-- Resize windows
vim.api.nvim_set_keymap('n', '<Left>', ':vertical resize -2', {noremap = true})
vim.api.nvim_set_keymap('n', '<Right>', ':vertical resize +2', {noremap = true})
vim.api.nvim_set_keymap('n', '<Up>', ':resize -2', {noremap = true})
vim.api.nvim_set_keymap('n', '<Down>', ':resize +2', {noremap = true})

-- View current file and current directory
vim.api.nvim_set_keymap('n', '<leader>fv', ':Vex<bar> set winfixwidth', {
  noremap = true
})
vim.api.nvim_set_keymap('n', '<leader>dv', ':Lex<bar> set winfixwidth', {
  noremap = true
})

--[[ TODO
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
vim.api.nvim_set_keymap(
  'n',
  '<leader>ff',
  [[:lua require('telescope.builtin').find_files()<cr>]],
  {noremap = true}
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fg',
  [[:lua require('telescope.builtin').live_grep()<cr>]],
  {noremap = true}
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fb',
  [[:lua require('telescope.builtin').buffers()<cr>]],
  {noremap = true}
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fd',
  [[:lua require('telescope.builtin').file_browser()<cr>]],
  {noremap = true}
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fh',
  [[:lua require('telescope.builtin').help_tags()<cr>]],
  {noremap = true}
)
vim.api.nvim_set_keymap(
  'n',
  '<leader><CR>',
  [[:lua << EOF
    require('telescope.builtin').find_files({
      search_dirs = {
        "/home/ethan/.config/nvim",
        "/home/ethan/.config/i3",
        "/home/ethan/.config/i3status",
        "/home/ethan/.config/alacritty"
      }
    })
  EOF<cr>]],
  {noremap = true}
)
