vim.cmd([[ autocmd Filetype markdown let b:dispatch = 'pandoc % -o %:r' . '.pdf']])
