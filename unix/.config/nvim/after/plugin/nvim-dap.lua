local keymap = require("ewr.keymap")
local dap = require("dap")
local dapui = require("dapui")

--[[

TODO:

- figure out how to clear the dap ui once you have stepped through all the
breakpoints

- auto open dapui when initially starting debugger with F5

- show in status bar when debugger is running

- auto switch windows when postman makes a request and land on breakpoint like
vscode

--]]

dapui.setup({})
-- dapui.setup({
-- 	layouts = {
-- 		{
-- 			elements = {
-- 				{
-- 					id = "repl",
-- 					size = 0.25
-- 				},
-- 				{
-- 					id = "breakpoints",
-- 					size = 0.25
-- 				},
-- 				{
-- 					id = "stacks",
-- 					size = 0.25
-- 				},
-- 				{
-- 					id = "watches",
-- 					size = 0.25
-- 				}
-- 			},
-- 			position = "left",
-- 			size = 40
-- 		},
-- 		{
-- 			elements = {
-- 				{
-- 					id = "scopes",
-- 					size = 1.0
-- 				},
-- 				-- {
-- 				-- 	id = "console",
-- 				-- 	size = 0.5
-- 				-- },
-- 			},
-- 			position = "bottom",
-- 			size = 10
-- 		}
-- 	}
-- })

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- node {{{

require("dap-vscode-js").setup({
	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
	debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
	-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
	-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
	-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			resolveSourceMapLocations = {
				"${workspaceFolder}/**",
				"!**/node_modules/**",
			},
			skipFiles = {
				"**/node_modules/**",
				"!**/node_modules/my-module/**",
				"<node_internals>/**",
			},
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
			skipFiles = {
				"**/node_modules/**",
				"!**/node_modules/my-module/**",
				"<node_internals>/**",
			},
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"--experimental-vm-modules",
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
			skipFiles = {
				"<node_internals>/**",
			},
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Specific Jest Test",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = function()
				local testName = vim.fn.input("Test name: ")
				return {
					"--experimental-vm-modules",
					"./node_modules/jest/bin/jest.js",
					"--runInBand",
					testName,
				}
			end,
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
			skipFiles = {
				"<node_internals>/**",
			},
		},
	}
end

-- }}}
-- python {{{

require("dap-python").setup("~/miniconda/envs/debugpy/bin/python")
require("dap-python").test_runner = "pytest"

-- }}}
-- go {{{

require("dap-go").setup()

-- }}}
-- c, c++, rust {{{

local lldb_path
if vim.fn.executable("/usr/bin/lldb-vscode") then
	lldb_path = "/usr/bin/lldb-vscode"
elseif vim.fn.executable("~/miniconda3/envs/lldb/bin/lldb-vscode") then
	lldb_path = "~/miniconda3/envs/lldb/bin/lldb-vscode"
end

dap.adapters.lldb = {
	type = "executable",
	command = lldb_path, -- adjust as needed
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input(lldb_path, vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
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
-- c# dotnet {{{

dap.adapters.coreclr = {
	type = "executable",
	command = [[/Users/erietz/Documents/netcoredbg/netcoredbg.exe]],
	args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
		end,
	},
}

-- }}}
-- key mappings {{{

keymap.nnoremap("<F5>", function()
	require("dap").continue()
end, { silent = true, desc = "Debugger: continue to next break point" })

keymap.nnoremap("<F9>", function()
	require("dap").toggle_breakpoint()
end, { silent = true, desc = "Debugger: toggle break point" })

keymap.nnoremap("<F10>", function()
	require("dap").step_over()
end, { silent = true, desc = "Debugger: step over" })

keymap.nnoremap("<F11>", function()
	require("dap").step_into()
end, { silent = true, desc = "Debugger: step into" })

keymap.nnoremap("<F12>", function()
	require("dap").step_out()
end, { silent = true, desc = "Debugger: step out" })

keymap.nnoremap("<F2>", function()
	require("dap").list_breakpoints()
end, { silent = true, desc = "Debugger: list breakpoints" })

keymap.nnoremap("<F3>", function()
	require("dap").clear_breakpoints()
end, { silent = true, desc = "Debugger: list breakpoints" })

-- UI
keymap.nnoremap("<F8>", function()
	require("dapui").toggle()
end, { silent = true, desc = "Debugger: toggle ui" })

keymap.nnoremap("<leader>dl", function()
	require("dap").run_last()
end, { silent = true, desc = "Debugger: run last" })
