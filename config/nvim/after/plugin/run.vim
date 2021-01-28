" vim-run-----------------------------------------------------------------------
nnoremap <leader>r :Run<CR>
vnoremap <leader>r :Run<CR>

" vim-run
let g:vim_run_command_map = {
  \'javascript': 'node',
  \'typescript': 'node',
  \'php': 'php',
  \'python': 'python3',
  \'zsh': 'zsh',
  \'sh': 'sh',
  \'julia': 'julia',
  \'r': 'Rscript',
  \'ruby': 'ruby',
  \'swift': 'swift',
  \'lua': 'lua',
  \}
