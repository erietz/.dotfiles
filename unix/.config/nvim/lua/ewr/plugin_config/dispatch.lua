vim.cmd([[ autocmd Filetype markdown let b:dispatch = 'pandoc % -o %:r' . '.pdf']])
vim.cmd([[ autocmd Filetype cs let b:dispatch = 'dotnet test']])
