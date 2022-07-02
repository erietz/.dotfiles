local keymap = require("ewr.keymap")
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
    args = function()
        return vim.fn.split(vim.fn.input("Program arguments: "), " ", true)
    end,

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

-- key mappings {{{

keymap.nnoremap('<F5>',  function()
    require('dap').continue()
end,
    { silent = true, desc = "Debugger: continue to next break point" })

keymap.nnoremap('<F9>',  function()
    require('dap').toggle_breakpoint()
end,
    { silent = true, desc = "Debugger: toggle break point" })

keymap.nnoremap('<F10>', function()
    require('dap').step_over()
end,
    { silent = true, desc = "Debugger: step over" })

keymap.nnoremap('<F11>', function()
    require('dap').step_into()
end,
    { silent = true, desc = "Debugger: step into" })

keymap.nnoremap('<F12>', function()
    require('dap').step_out()
end,
    { silent = true, desc = "Debugger: step out" })

-- UI
keymap.nnoremap('<F8>', function()
    require("dapui").toggle()
end,
    { silent = true, desc = "Debugger: toggle ui" })

-- Python
keymap.nnoremap('<leader>dc', function()
    require("dap-python").test_class()
end,
    { silent = true, desc = "Debugger: debug python test class" })

keymap.nnoremap('<leader>dm', function()
    require("dap-python").test_method()
end,
    { silent = true, desc = "Debugger: debug python test method" })

keymap.vnoremap('<leader>ds', function()
    require("dap-python").debug_selection()
end,
    { silent = true, desc = "Debugger: debug python selection" })
