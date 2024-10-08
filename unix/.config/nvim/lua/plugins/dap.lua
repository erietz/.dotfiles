return {
	{
		"mfussenegger/nvim-dap",
		tag = "0.7.0",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = "mfussenegger/nvim-dap",
	},
	{
		"leoluz/nvim-dap-go",
		dependencies = "mfussenegger/nvim-dap",
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = "mfussenegger/nvim-dap",
		-- opts = {
		-- 	debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"
		-- }
	},
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps && npm run compile",
		tag = "v1.74.1",
	},
}
