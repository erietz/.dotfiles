vim.opt.termguicolors = true -- Better colors
vim.opt.background = "dark" -- Sets theme below
-- vim.g.set3_bg = "hard"

function SetColorScheme(color)
	color = color or "set3"
	vim.cmd.colorscheme(color)
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

require('rose-pine').setup {
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'main'
}


-- SetColorScheme('rose-pine')
SetColorScheme('kanagawa-wave')
