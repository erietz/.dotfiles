-- -- Use powershell rather than cmd (git bash is not a real shell)
-- vim.opt.shell = vim.fn.has('win32') and 'powershell' or 'pwsh' vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;' vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
-- vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
-- vim.opt.shellquote = ''
-- vim.opt.shellxquote = ''

vim.env.FZF_DEFAULT_COMMAND = 'fd --hidden'
