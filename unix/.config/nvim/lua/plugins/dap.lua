return {
	'mfussenegger/nvim-dap',
	{
		'rcarriga/nvim-dap-ui',
		dependencies = 'mfussenegger/nvim-dap'
	},
	{
		'mfussenegger/nvim-dap-python',
		dependencies = 'mfussenegger/nvim-dap'
	},
	{
		'leoluz/nvim-dap-go',
		dependencies = 'mfussenegger/nvim-dap'
	},
	{
		'mxsdev/nvim-dap-vscode-js',
		dependencies = 'mfussenegger/nvim-dap'
	},
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps && npm run compile",
		tag = 'v1.74.1'
	},
}
