--[[
           / /_/ /_  ___     _   __(_)___ ___     ____  ____ ______
          / __/ __ \/ _ \   | | / / / __ `__ \   / __ \/ __ `/ ___/
         / /_/ / / /  __/   | |/ / / / / / / /  / /_/ / /_/ (__  )
         \__/_/ /_/\___/    |___/_/_/ /_/ /_/   \____/\__, /____/
                                                     /____/
--]]

return {
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"tpope/vim-abolish",
	{
		"junegunn/vim-easy-align",
		config = function()
			local keymap = require("ewr.keymap")

			keymap.nnoremap("ga", "<Plug>(EasyAlign)")
			keymap.xnoremap("ga", "<Plug>(EasyAlign)")
		end,
	},
	"github/copilot.vim",
}
