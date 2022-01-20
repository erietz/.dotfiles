local dap = require('dap')
require("dapui").setup()

require('dap-python').setup('~/miniconda3/envs/debugpy/bin/python')

-- c, c++, rust {{{
local lldb_path
if vim.fn.executable("/usr/bin/lldb-vscode") then
    lldb_path = "/usr/bin/lldb-vscode"
elseif vim.fn.executable("~/miniconda3/envs/lldb/bin/lldb-vscode") then
    lldb_path = "~/miniconda3/envs/lldb/bin/lldb-vscode"
end

dap.adapters.lldb = {
  type = 'executable',
  command = lldb_path, -- adjust as needed
  name = "lldb"
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input(lldb_path, vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
}


-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- }}}
