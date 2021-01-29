let g:firenvim_config = {
      \ 'localSettings': {
        \ '.*': {
          \ 'cmdline': 'neovim',
          \ 'takeover': 'never',
        \ }
      \ }
    \ }


if exists("g:started_by_firenvim")
  setlocal laststatus=0
  setlocal nonumber
  setlocal norelativenumber
  setlocal noruler
  setlocal noshowcmd
  setlocal guifont=monospace:h25

  "inoremap <tab> <c-n>
  "inoremap <s-tab> <c-p>
endif
