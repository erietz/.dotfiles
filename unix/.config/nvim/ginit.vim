"-------------------------------------------------------------------------------
" Author      : Ethan Rietz
" Date        : 02-07-2022
" Description : Setting for neovim-qt on Windows
"-------------------------------------------------------------------------------

GuiFont JetBrains Mono:h13

" Use powershell rather than cmd
let &shell = has('win32') ? 'powershell' : 'pwsh'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=

" When in rome
set mouse=a
