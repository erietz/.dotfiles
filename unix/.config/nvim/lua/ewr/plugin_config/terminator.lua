vim.g.terminator_auto_shrink_output = 1
vim.g.terminator_repl_delimiter_regex = "--"

vim.g.terminator_runfile_map = {
    ['scheme'] = 'racket',
    ['cs'] = 'dotnet run',
    ['python'] = 'python3',
}

vim.g.terminator_repl_command = {
    ['sql'] = 'mysql -u ethan -p',
    ['typescript'] = 'ts-node',
}
